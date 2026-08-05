# Baixa do Google Fonts os woff2 das faces realmente usadas e escreve o
# assets/fonts.css local. Auto-hospedar tira duas conexoes do caminho
# critico (fonts.googleapis e fonts.gstatic), cada uma com DNS e TLS.
#
# So entram as 9 faces que a auditoria encontrou em uso. O <link> antigo
# pedia IBM Plex Sans 600, que nao aparece em lugar nenhum.

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$raiz    = "E:\portfolio"
$destino = "$raiz\assets\fonts"
New-Item -ItemType Directory -Force $destino | Out-Null

$css2 = 'https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;500;600&family=IBM+Plex+Sans:wght@400;500&family=Spectral:ital,wght@0,400;0,600;0,700;1,400&display=swap'

# UA moderno para o Google devolver woff2 em vez de ttf
$ua = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0 Safari/537.36'
$css = (Invoke-WebRequest -Uri $css2 -Headers @{ 'User-Agent' = $ua } -UseBasicParsing).Content

# quebra em blocos @font-face, cada um precedido do comentario do subset
$blocos = [regex]::Matches($css, '/\*\s*([a-z\-]+)\s*\*/\s*@font-face\s*\{([^}]+)\}')
"blocos encontrados: $($blocos.Count)"

# 1a passada: baixa tudo em arquivo temporario e coleta os metadados
$itens = @()
foreach ($b in $blocos) {
  $subset = $b.Groups[1].Value
  if ($subset -notin @('latin', 'latin-ext')) { continue }
  $corpo = $b.Groups[2].Value

  $fam   = [regex]::Match($corpo, "font-family:\s*'([^']+)'").Groups[1].Value
  $estilo= [regex]::Match($corpo, 'font-style:\s*([a-z]+)').Groups[1].Value
  $peso  = [int][regex]::Match($corpo, 'font-weight:\s*(\d+)').Groups[1].Value
  $url   = [regex]::Match($corpo, 'src:\s*url\(([^)]+)\)').Groups[1].Value
  $range = [regex]::Match($corpo, 'unicode-range:\s*([^;]+);').Groups[1].Value

  $tmp = Join-Path $env:TEMP ("fonte-" + [guid]::NewGuid().ToString('N') + ".woff2")
  Invoke-WebRequest -Uri $url -OutFile $tmp -UseBasicParsing
  $itens += [pscustomobject]@{
    fam = $fam; estilo = $estilo; peso = $peso; subset = $subset; range = $range
    tmp = $tmp; hash = (Get-FileHash $tmp -Algorithm SHA256).Hash
  }
}

# 2a passada: o Google serve fonte variavel, entao o mesmo arquivo pode
# atender varios pesos. Agrupa por hash e declara faixa em vez de copiar.
$saida = New-Object System.Text.StringBuilder
[void]$saida.AppendLine('/* Fontes auto-hospedadas. Gerado por scripts/baixar-fontes.ps1, nao editar a mao. */')
[void]$saida.AppendLine('/* Subsets latin e latin-ext, que cobrem portugues e ingles. */')
[void]$saida.AppendLine('/* Onde o mesmo arquivo atende varios pesos, a face declara faixa. */')
[void]$saida.AppendLine('')

$total = 0
foreach ($g in ($itens | Group-Object hash)) {
  $r = $g.Group[0]
  $pesos = ($g.Group | ForEach-Object { $_.peso } | Sort-Object -Unique)
  $decl = if ($pesos.Count -gt 1) { "$($pesos[0]) $($pesos[-1])" } else { "$($pesos[0])" }
  $marca = if ($pesos.Count -gt 1) { "$($pesos -join '+')" } else { "$($pesos[0])" }

  $slug = ($r.fam -replace '\s', '-').ToLower()
  $nome = "$slug-$marca-$($r.estilo)-$($r.subset).woff2"
  Move-Item $r.tmp "$destino\$nome" -Force
  $g.Group | Select-Object -Skip 1 | ForEach-Object { Remove-Item $_.tmp -Force -ErrorAction SilentlyContinue }

  $tam = (Get-Item "$destino\$nome").Length
  $total += $tam
  "  {0,-46} {1,7:N0} bytes  peso {2}" -f $nome, $tam, $decl

  [void]$saida.AppendLine('@font-face {')
  [void]$saida.AppendLine("  font-family: '$($r.fam)';")
  [void]$saida.AppendLine("  font-style: $($r.estilo);")
  [void]$saida.AppendLine("  font-weight: $decl;")
  [void]$saida.AppendLine('  font-display: swap;')
  [void]$saida.AppendLine("  src: url('fonts/$nome') format('woff2');")
  [void]$saida.AppendLine("  unicode-range: $($r.range);")
  [void]$saida.AppendLine('}')
  [void]$saida.AppendLine('')
}

[System.IO.File]::WriteAllText("$raiz\assets\fonts.css", $saida.ToString(), (New-Object System.Text.UTF8Encoding($false)))
""
"total das fontes: {0:N0} bytes em {1} arquivos" -f $total, (Get-ChildItem $destino).Count
"escrito: assets/fonts.css"

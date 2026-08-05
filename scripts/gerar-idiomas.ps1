# Gera as paginas em portugues e em ingles a partir da fonte bilingue de src/.
#
# Por que existe: os dois idiomas viviam na mesma URL, escondidos por CSS.
# O Google indexava texto misturado, o DOM tinha o dobro do necessario e nao
# havia link em ingles para mandar a um recrutador de fora. Agora cada idioma
# tem URL, canonical, hreflang e Open Graph proprios.
#
# A fonte continua sendo UM arquivo por pagina, em src/. Editar la e rodar isto.
# O site publicado segue estatico: a geracao e um passo local, como os scripts
# de imagem e de fonte.
#
#   pt  ->  /index.html            /projetos/<nome>.html
#   en  ->  /en/index.html         /en/projetos/<nome>.html

$raiz = "E:\portfolio"
$enc  = New-Object System.Text.UTF8Encoding($false)

$paginas = @(
  @{ src = "src\index.html";               pt = "index.html";               en = "en\index.html";               rota = "";                        prof = 0 },
  @{ src = "src\projetos\didata.html";     pt = "projetos\didata.html";     en = "en\projetos\didata.html";     rota = "projetos/didata";         prof = 1 },
  @{ src = "src\projetos\kyber-crm.html";  pt = "projetos\kyber-crm.html";  en = "en\projetos\kyber-crm.html";  rota = "projetos/kyber-crm";      prof = 1 },
  @{ src = "src\projetos\brava.html";      pt = "projetos\brava.html";      en = "en\projetos\brava.html";      rota = "projetos/brava";          prof = 1 }
)

# rotulos acessiveis: o seletor de idioma nao trocava atributo, entao ficavam em portugues no ingles
$aria = @{
  'Principal'                          = 'Primary'
  'Seções'                             = 'Sections'
  'Idioma / Language'                  = 'Idioma / Language'
  'LinkedIn de Pedro Lourençoni Lima'  = "Pedro Lourençoni Lima's LinkedIn"
  'GitHub de Pedro Lourençoni Lima'    = "Pedro Lourençoni Lima's GitHub"
}

$dominio = 'https://www.pedrolou.dev'

function Gerar($origem, $lang) {
  $s = $origem

  # 1. mantem o idioma pedido e descarta o outro
  if ($lang -eq 'pt') {
    $s = [regex]::Replace($s, '<span data-i18n="en"[^>]*>.*?</span>', '', 'Singleline')
    $s = [regex]::Replace($s, '<span data-i18n="pt"[^>]*>(.*?)</span>', '$1', 'Singleline')
  } else {
    $s = [regex]::Replace($s, '<span data-i18n="pt"[^>]*>.*?</span>', '', 'Singleline')
    $s = [regex]::Replace($s, '<span data-i18n="en"[^>]*>(.*?)</span>', '$1', 'Singleline')
  }

  # 2. atributo lang e limpeza dos data-title, que eram do seletor por JS
  $htmlLang = if ($lang -eq 'pt') { 'pt-BR' } else { 'en' }
  $s = [regex]::Replace($s, '<html lang="[^"]*"[^>]*>', "<html lang=""$htmlLang"">")

  # 3. rotulos acessiveis
  if ($lang -eq 'en') {
    foreach ($k in $aria.Keys) { $s = $s.Replace("aria-label=""$k""", "aria-label=""$($aria[$k])""") }
  }

  return $s
}

$script:prefixoUp = ''

function AjustarCaminhos($s, $lang, $prof) {
  # profundidade de assets: raiz=0, /projetos=1, /en=1, /en/projetos=2
  $nivel = $prof + $(if ($lang -eq 'en') { 1 } else { 0 })
  $prefixo = if ($nivel -eq 0) { '' } else { ('../' * $nivel) }
  $script:prefixoUp = $prefixo
  $script:prefixoAtual = $prefixo

  # normaliza qualquer prefixo relativo existente para o correto
  $s = [regex]::Replace($s, '(href|src)="(\.\./)*((assets|uploads|favicon)[^"]*)"', "`$1=""$prefixo`$3""")

  # srcset tem varias URLs separadas por virgula: o regex acima nao pega
  $s = [regex]::Replace($s, 'srcset="([^"]*)"', {
    param($m)
    $lista = ($m.Groups[1].Value -split ',') | ForEach-Object {
      $item = $_.Trim()
      if (-not $item) { return }
      $partes = $item -split '\s+', 2
      $url = [regex]::Replace($partes[0], '^(\.\./)*', '')
      $desc = if ($partes.Count -gt 1) { ' ' + $partes[1] } else { '' }
      "$script:prefixoAtual$url$desc"
    }
    return 'srcset="' + ($lista -join ', ') + '"'
  })

  # links internos entre paginas: raiz-relativos, com o /en na frente quando for o caso
  $base = if ($lang -eq 'en') { '/en' } else { '' }
  $s = $s.Replace('href="/projetos/', "href=""$base/projetos/")
  $s = $s.Replace('href="/#', "href=""$base/#")
  return $s
}

$total = 0
foreach ($p in $paginas) {
  $origem = [System.IO.File]::ReadAllText((Join-Path $raiz $p.src), [System.Text.Encoding]::UTF8)

  # titulos e descricoes por idioma, declarados na fonte
  $tPt = [regex]::Match($origem, 'data-title-pt="([^"]*)"').Groups[1].Value
  $tEn = [regex]::Match($origem, 'data-title-en="([^"]*)"').Groups[1].Value
  $dPt = [regex]::Match($origem, 'data-desc-pt="([^"]*)"').Groups[1].Value
  $dEn = [regex]::Match($origem, 'data-desc-en="([^"]*)"').Groups[1].Value
  if (-not $dPt) { $dPt = [regex]::Match($origem, '<meta name="description" content="([^"]*)"').Groups[1].Value }
  if (-not $dEn) { $dEn = $dPt }
  $aPt = [regex]::Match($origem, 'data-ogalt-pt="([^"]*)"').Groups[1].Value
  $aEn = [regex]::Match($origem, 'data-ogalt-en="([^"]*)"').Groups[1].Value

  foreach ($lang in @('pt','en')) {
    $s = Gerar $origem $lang
    $s = AjustarCaminhos $s $lang $p.prof

    $titulo = if ($lang -eq 'pt') { $tPt } else { $tEn }
    $desc   = if ($lang -eq 'pt') { $dPt } else { $dEn }
    $urlPt  = "$dominio/" + $p.rota
    $urlEn  = "$dominio/en/" + $p.rota
    $url    = if ($lang -eq 'pt') { $urlPt } else { $urlEn }
    $locale = if ($lang -eq 'pt') { 'pt_BR' } else { 'en_US' }
    $altLoc = if ($lang -eq 'pt') { 'en_US' } else { 'pt_BR' }
    $htmlLangJson = if ($lang -eq 'pt') { 'pt-BR' } else { 'en' }

    if ($titulo) {
      $s = [regex]::Replace($s, '<title>.*?</title>', "<title>$titulo</title>", 'Singleline')
      $s = [regex]::Replace($s, '<meta name="description" content="[^"]*"', "<meta name=""description"" content=""$desc""")
      $s = [regex]::Replace($s, '<meta property="og:title" content="[^"]*"', "<meta property=""og:title"" content=""$titulo""")
      $s = [regex]::Replace($s, '<meta property="og:description" content="[^"]*"', "<meta property=""og:description"" content=""$desc""")
    }
    $s = [regex]::Replace($s, '<link rel="canonical" href="[^"]*"', "<link rel=""canonical"" href=""$url""")
    $s = [regex]::Replace($s, '<meta property="og:url" content="[^"]*"', "<meta property=""og:url"" content=""$url""")
    $s = [regex]::Replace($s, '<meta property="og:locale" content="[^"]*"', "<meta property=""og:locale"" content=""$locale"" />`r`n<meta property=""og:locale:alternate"" content=""$altLoc""")

    # texto alternativo da imagem social, por idioma
    $alt = if ($lang -eq 'pt') { $aPt } else { $aEn }
    if ($alt) { $s = [regex]::Replace($s, '<meta property="og:image:alt" content="[^"]*"', "<meta property=""og:image:alt"" content=""$alt""") }

    # dados estruturados: idioma e URLs seguem a pagina, menos o caminho das imagens
    $s = [regex]::Replace($s, '(?s)(<script type="application/ld\+json">)(.*?)(</script>)', {
      param($m)
      $bloco = $m.Groups[2].Value
      $bloco = [regex]::Replace($bloco, '"inLanguage":\s*(\[[^\]]*\]|"[^"]*")', """inLanguage"": ""$htmlLangJson""")
      if ($lang -eq 'en') {
        $bloco = [regex]::Replace($bloco, 'https://www\.pedrolou\.dev/(?!uploads/|en/)', 'https://www.pedrolou.dev/en/')
      }
      return $m.Groups[1].Value + $bloco + $m.Groups[3].Value
    })

    # hreflang cruzado, logo depois do canonical
    $hreflang = "<link rel=""alternate"" hreflang=""pt-BR"" href=""$urlPt"" />`r`n" +
                "<link rel=""alternate"" hreflang=""en"" href=""$urlEn"" />`r`n" +
                "<link rel=""alternate"" hreflang=""x-default"" href=""$urlPt"" />"
    $s = [regex]::Replace($s, '(<link rel="canonical" href="[^"]*" />)', "`$1`r`n$hreflang")

    # o seletor deixa de ser botao e vira link entre as duas URLs
    $seletor = if ($lang -eq 'pt') {
      "<a class=""langswitch__btn"" href=""$($(if($p.rota){"/$($p.rota)"}else{"/"}))"" aria-current=""true"">PT</a>`r`n        " +
      "<a class=""langswitch__btn"" href=""/en/$($p.rota)"">EN</a>"
    } else {
      "<a class=""langswitch__btn"" href=""$($(if($p.rota){"/$($p.rota)"}else{"/"}))"">PT</a>`r`n        " +
      "<a class=""langswitch__btn"" href=""/en/$($p.rota)"" aria-current=""true"">EN</a>"
    }
    $s = [regex]::Replace($s,
      '<button type="button" class="langswitch__btn" data-setlang="pt"[^>]*>PT</button>\s*<button type="button" class="langswitch__btn" data-setlang="en"[^>]*>EN</button>',
      $seletor, 'Singleline')

    # o curriculo segue o idioma da pagina: o JS nao troca mais o href
    if ($lang -eq 'en') {
      $s = $s.Replace('id="cv-link" href="' + $prefixoUp + 'uploads/curriculo-pt.pdf"',
                      'id="cv-link" href="' + $prefixoUp + 'uploads/curriculo-en.pdf"')
    }

    # limpa os data-title, que so serviam ao seletor por JS
    $s = [regex]::Replace($s, '\s+data-title-(pt|en)="[^"]*"', '')
    $s = [regex]::Replace($s, '\s+data-desc-(pt|en)="[^"]*"', '')
    $s = [regex]::Replace($s, '\s+data-ogalt-(pt|en)="[^"]*"', '')
    # colapsa espaco em branco deixado pelos spans removidos
    $s = [regex]::Replace($s, '[ \t]+\r?\n', "`r`n")
    $s = [regex]::Replace($s, '(\r?\n){3,}', "`r`n`r`n")

    $destino = Join-Path $raiz $(if ($lang -eq 'pt') { $p.pt } else { $p.en })
    New-Item -ItemType Directory -Force (Split-Path $destino) | Out-Null
    [System.IO.File]::WriteAllText($destino, $s, $enc)
    $total++
    "{0,-30} {1,7:N0} bytes" -f $(if ($lang -eq 'pt') { $p.pt } else { $p.en }), (Get-Item $destino).Length
  }
}
""
"geradas: $total paginas"

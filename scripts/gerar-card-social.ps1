# Gera o card social 1200x630 na identidade do site.
#
# JPG de proposito: WebP em Open Graph e irregular fora do navegador, e
# o retrato quadrado que estava no og:image renderiza mal em faixa larga.
#
# As fontes da marca nao costumam estar instaladas, entao sao carregadas
# do arquivo. Baixe os TTF antes, ver README na secao de imagens.

Add-Type -AssemblyName System.Drawing

$fontDir = $args[0]
if (-not $fontDir) { $fontDir = "C:\Users\pedro\AppData\Local\Temp\claude\E--portfolio\cdcf56a0-772b-4593-ab2f-e26cb7f8030e\scratchpad\fonts" }
$out = "E:\portfolio\uploads\og-card.jpg"

$W = 1200; $H = 630

# --- paleta do site ---
$paper   = [System.Drawing.Color]::FromArgb(242, 234, 220)
$grain   = [System.Drawing.Color]::FromArgb(9, 18, 58, 140)    # 3.5% de tinta
$hair    = [System.Drawing.Color]::FromArgb(72, 18, 58, 140)   # 28%
$blue    = [System.Drawing.Color]::FromArgb(18, 58, 140)
$body    = [System.Drawing.Color]::FromArgb(61, 65, 87)
$meta    = [System.Drawing.Color]::FromArgb(92, 96, 112)

# --- fontes ---
$fc = New-Object System.Drawing.Text.PrivateFontCollection
foreach ($f in @('IBMPlexMono-Medium.ttf','IBMPlexMono-Regular.ttf','Spectral-Regular.ttf')) {
  $p = Join-Path $fontDir $f
  if (-not (Test-Path $p)) { throw "fonte ausente: $p" }
  $fc.AddFontFile($p)
}
$famMono   = $fc.Families | Where-Object { $_.Name -like 'IBM Plex Mono*' } | Select-Object -First 1
$famSerif  = $fc.Families | Where-Object { $_.Name -like 'Spectral*' } | Select-Object -First 1

$fName   = New-Object System.Drawing.Font($famMono, 62, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
$fSub    = New-Object System.Drawing.Font($famSerif, 30, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
$fDomain = New-Object System.Drawing.Font($famMono, 17, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)

$bmp = New-Object System.Drawing.Bitmap($W, $H, [System.Drawing.Imaging.PixelFormat]::Format24bppRgb)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode     = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAlias

# --- papel e trama de gravura ---
$g.Clear($paper)
$penGrain = New-Object System.Drawing.Pen($grain, 1)
for ($y = 0; $y -lt $H; $y += 4) { $g.DrawLine($penGrain, 0, $y, $W, $y) }

# --- moldura de chapa ---
$penHair = New-Object System.Drawing.Pen($hair, 1)
$g.DrawRectangle($penHair, 40, 40, ($W - 81), ($H - 81))

# --- nome, monoespacado com tracking positivo como no site ---
# O cedilha vem por codigo: o PowerShell 5.1 le .ps1 como ANSI sem BOM e
# corromperia o caractere no arquivo.
$name = "PEDRO LOUREN" + [char]0x00C7 + "ONI LIMA"
# MeasureString de um caractere so vem inflado de padding. Mede uma
# tira longa e divide, que em monoespacada da o avanco real.
$fmtT = [System.Drawing.StringFormat]::GenericTypographic
$adv = $g.MeasureString(("M" * 20), $fName, 10000, $fmtT).Width / 20
$track = 62 * 0.02
$total = ($name.Length * $adv) + (($name.Length - 1) * $track)
$x = ($W - $total) / 2
$brBlue = New-Object System.Drawing.SolidBrush($blue)
$fmt = [System.Drawing.StringFormat]::GenericTypographic
foreach ($ch in $name.ToCharArray()) {
  $g.DrawString([string]$ch, $fName, $brBlue, $x, 190, $fmt)
  $x += $adv + $track
}

# --- subtitulo ---
$sub = "Desenvolvedor Full Stack, SaaS e IA aplicada"
$sw = $g.MeasureString($sub, $fSub).Width
$brBody = New-Object System.Drawing.SolidBrush($body)
$g.DrawString($sub, $fSub, $brBody, (($W - $sw) / 2), 294)

# --- fio com losango, o mesmo device do rodape ---
$cy = 410
$g.DrawLine($penHair, 300, $cy, 578, $cy)
$g.DrawLine($penHair, 622, $cy, 900, $cy)
$st = $g.Save()
$g.TranslateTransform(600, $cy)
$g.RotateTransform(45)
$g.FillRectangle($brBlue, -5, -5, 10, 10)
$g.Restore($st)

# --- dominio ---
$dom = "P E D R O L O U . D E V"
$dw = $g.MeasureString($dom, $fDomain).Width
$brMeta = New-Object System.Drawing.SolidBrush($meta)
$g.DrawString($dom, $fDomain, $brMeta, (($W - $dw) / 2), 458)

# --- salva em JPG com qualidade alta ---
$enc = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq 'image/jpeg' }
$pars = New-Object System.Drawing.Imaging.EncoderParameters(1)
$pars.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, 92L)
$bmp.Save($out, $enc, $pars)

$g.Dispose(); $bmp.Dispose()
"gerado: {0}  {1:N0} bytes  {2}x{3}" -f $out, (Get-Item $out).Length, $W, $H

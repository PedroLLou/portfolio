Add-Type -AssemblyName System.Drawing

$inPath  = "E:\portfolio\imagens\crm.png"
$outPath = "E:\portfolio\uploads\kyber-crm.png"

$src = [System.Drawing.Bitmap]::FromFile($inPath)
$W = $src.Width
$cropH = 790                       # corta a linha de baixo, que estava cortada ao meio

$canvas = New-Object System.Drawing.Bitmap($W, $cropH, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
$g = [System.Drawing.Graphics]::FromImage($canvas)
$g.DrawImage($src, (New-Object System.Drawing.Rectangle(0, 0, $W, $cropH)),
                   (New-Object System.Drawing.Rectangle(0, 0, $W, $cropH)),
                   [System.Drawing.GraphicsUnit]::Pixel)
$src.Dispose()

# Retangulos em pixels, medidos na imagem, com folga.
# Titulos de painel e navegacao ficam legiveis de proposito.
$regions = @(
  @{ n = 'valores dos KPIs';      x = 472; y = 176; w = 1228; h = 72 },
  @{ n = 'fila, linha 1';         x = 478; y = 384; w = 848; h = 80 },
  @{ n = 'fila, linha 2';         x = 478; y = 572; w = 848; h = 80 },
  @{ n = 'leitura do dia';        x = 1378; y = 336; w = 320; h = 372 }
)

$g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::NearestNeighbor
$g.PixelOffsetMode   = [System.Drawing.Drawing2D.PixelOffsetMode]::Half

foreach ($r in $regions) {
  $rect = New-Object System.Drawing.Rectangle($r.x, $r.y, $r.w, $r.h)
  $slice = $canvas.Clone($rect, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)

  # blocos de ~14px: destroi o glifo, mantem a cor da area
  $sw = [Math]::Max(1, [int][Math]::Floor($r.w / 14))
  $sh = [Math]::Max(1, [int][Math]::Floor($r.h / 14))

  $small = New-Object System.Drawing.Bitmap($sw, $sh, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
  $gs = [System.Drawing.Graphics]::FromImage($small)
  $gs.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
  $gs.PixelOffsetMode   = [System.Drawing.Drawing2D.PixelOffsetMode]::Half
  $gs.DrawImage($slice, (New-Object System.Drawing.Rectangle(0, 0, $sw, $sh)),
                        (New-Object System.Drawing.Rectangle(0, 0, $r.w, $r.h)),
                        [System.Drawing.GraphicsUnit]::Pixel)
  $gs.Dispose()

  # sobe de volta em blocos duros, dentro do retangulo exato
  $g.DrawImage($small, $rect, (New-Object System.Drawing.Rectangle(0, 0, $sw, $sh)),
               [System.Drawing.GraphicsUnit]::Pixel)

  $small.Dispose(); $slice.Dispose()
  "mosaico: {0,-20} ({1},{2}) {3}x{4} -> {5}x{6} blocos" -f $r.n, $r.x, $r.y, $r.w, $r.h, $sw, $sh
}

$g.Dispose()
$canvas.Save($outPath, [System.Drawing.Imaging.ImageFormat]::Png)
$canvas.Dispose()

$fi = Get-Item $outPath
"salvo: {0} bytes, {1}x{2}" -f $fi.Length, $W, $cropH

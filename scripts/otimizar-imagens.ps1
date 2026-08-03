# Converte as imagens publicadas para WebP e corrige o tamanho de origem.
#
# A largura alvo e o dobro do maior tamanho que a imagem ocupa na tela, para
# atender telas 2x sem carregar pixel que ninguem ve. Onde o arquivo ja era
# menor que o alvo, a largura original e mantida.
#
# Requer ffmpeg com libwebp. Rode da raiz do projeto.

$ff = "C:\Users\pedro\AppData\Local\Microsoft\WinGet\Packages\Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-8.1.1-full_build\bin\ffmpeg.exe"
if (-not (Test-Path $ff)) { $ff = "ffmpeg" }

$out = "E:\portfolio\uploads"

# origem, destino, largura alvo (0 = manter), qualidade
# Capturas de tela levam qualidade mais alta: texto sofre antes de foto.
$jobs = @(
  @{ src = "E:\portfolio\imagens\hero.jpeg";        dst = "hero.webp";      w = 0;    q = 80; nota = "fundo do hero, tela cheia" },
  @{ src = "E:\portfolio\imagens\didata.png";       dst = "didata.webp";    w = 1080; q = 88; nota = "captura, exibida a 522px" },
  @{ src = "E:\portfolio\uploads\kyber-crm.png";    dst = "kyber-crm.webp"; w = 0;    q = 88; nota = "captura, exibida a 1040px" },
  @{ src = "E:\portfolio\uploads\pedro.jpg";        dst = "pedro.webp";     w = 640;  q = 82; nota = "retrato, exibido a 280px" },
  @{ src = "E:\portfolio\uploads\brava-dashboard.jfif"; dst = "brava-dashboard.webp"; w = 950; q = 82; nota = "captura, exibida a 451px" }
)

$antes = 0; $depois = 0

foreach ($j in $jobs) {
  if (-not (Test-Path $j.src)) { "FALTA: $($j.src)"; continue }
  $target = Join-Path $out $j.dst
  $scale = if ($j.w -gt 0) { "-vf", "scale='min($($j.w),iw)':-2:flags=lanczos" } else { @() }

  & $ff -hide_banner -loglevel error -y -i $j.src @scale -c:v libwebp -quality $j.q -compression_level 6 -preset picture $target

  $a = (Get-Item $j.src).Length
  $b = (Get-Item $target).Length
  $antes += $a; $depois += $b
  "{0,-24} {1,9:N0} -> {2,8:N0} bytes  ({3,3:N0}% menor)  {4}" -f $j.dst, $a, $b, ((1 - $b / $a) * 100), $j.nota
}

""
"total: {0:N0} -> {1:N0} bytes  ({2:N0}% menor)" -f $antes, $depois, ((1 - $depois / $antes) * 100)

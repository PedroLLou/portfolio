# pedrolou.dev - portfólio

Site estático bilíngue (PT/EN), sem build e sem dependências.
Implementado a partir do design `Portfolio Pedro.dc.html` (Claude Design)
e depois reconstruído sobre um sistema de design próprio.

## Estrutura

```
src/                        FONTE bilíngue, é aqui que se edita
  index.html
  projetos/index.html
  projetos/didata.html
  projetos/kyber-crm.html
  projetos/brava.html

index.html                  gerado, português
projetos/*.html             gerado, português
en/index.html               gerado, inglês
en/projetos/*.html          gerado, inglês

assets/styles.css           tokens, layout, motion, breakpoints
assets/main.js              nav fixa, e só
assets/fonts/               woff2 auto-hospedados
uploads/                    imagens e currículos em PDF
imagens/                    originais em alta, fora do que é publicado
scripts/                    geração de idiomas, imagens, fontes e card social
```

## Como editar

**Edite `src/`, nunca os arquivos gerados.** Depois rode:

```powershell
.\scripts\gerar-idiomas.ps1
```

Ele produz as seis páginas. Um arquivo gerado que você editar à mão é
sobrescrito na próxima execução.

Cada fonte declara título, descrição e texto alternativo social nos dois
idiomas, em atributos do `<html>`:

```html
<html lang="pt" data-title-pt="…" data-title-en="…"
      data-desc-pt="…" data-desc-en="…"
      data-ogalt-pt="…" data-ogalt-en="…">
```

E cada trecho bilíngue vive em pares:

```html
<span data-i18n="pt">Texto</span><span data-i18n="en" lang="en">Text</span>
```

O gerador mantém um e descarta o outro, ajusta a profundidade dos caminhos
relativos (inclusive dentro de `srcset`), reescreve canonical, `hreflang`,
Open Graph e o idioma do JSON-LD, troca o seletor de idioma por links entre
as duas URLs e aponta o currículo para o PDF do idioma certo.

`src/` está em `Disallow` no `robots.txt`: é fonte, não página.

## Rodar localmente

```bash
npx serve -l 4321 .
```

## Sistema de design

**Direção: "prova de gravura".** Papel creme, tinta azul, Spectral para
títulos, IBM Plex Sans para texto, IBM Plex Mono para metadados. Fios de
1px em três pesos, nada de sombra pesada, nada de canto arredondado
exceto onde já existia.

**Escala tipográfica.** Oito degraus (`--t-micro` a `--t-hero`), e nada
fora deles. A versão anterior usava 24 combinações de tamanho/peso/família
ajustadas à mão, com passos imperceptíveis (14 e 14.5, 10.5 e 11).

**Espaçamento.** Base 4px, de `--s-1` a `--s-10`. Sem valores avulsos.

**Cor.** Todo token de texto passa WCAG AA no tamanho em que é usado.
Os dois cinzas mais claros do design original (`#6A6B7A` em 4.40:1 e
`#9A9AA8` em 2.32:1) foram removidos.

## Decisões que valem explicação

**Os algarismos romanos saíram do topo das seções.** Antes eram uma
etiqueta pequena repetida acima de cada título, cinco vezes, que é
exatamente o ritmo de template que este projeto não quer. Agora são
fólios: algarismo grande em Spectral itálico pendurado na margem
esquerda, alinhado à primeira linha do título. Cada seção ganhou um
`<h2>` de verdade, o que também conserta a hierarquia de headings, que
antes pulava de `h1` para `h3`.

**Véu de papel no hero.** A `hero.jpeg` é clara só no terço central
(luminância medida: 0.76 no centro contra 0.14-0.23 nas bordas). Sem
tratamento, o texto tinta ficava refém de onde a viewport corta a foto.
Um gradiente radial creme atrás do bloco do título resolve isso e deixa
o nome legível em qualquer recorte.

**A home mostra quatro projetos, não todos.** Ela tinha doze telas de
rolagem em mobile, e os dois blocos que menos pesavam na primeira
impressão eram a carteira de clientes e o índice dos projetos menores.
Os dois foram para `/projetos/`, que ainda ganha o que a home não
comportava: as três chamadas de estudo de caso lado a lado, e o motivo
de o `gerador-curriculo` e o TCC não estarem na home, que é não terem
usuário além de mim. A home caiu para dez telas e sete.

**Três famílias de layout em Projetos.** Antes eram três grades de
células iguais em sequência (5 serviços, 3 cards, 3 minis), o que achata
tudo. Agora: placa em destaque para o Didata, faixa invertida de largura
total para o Kyber CRM com os números em display, dupla assimétrica para
Premium e Brava, e índice em linhas para os três menores. Serviços virou
lista editorial com nota à direita, em vez de células vazias.

**Listas de stack sem pontinho.** Os separadores `·` viraram fios de 1px
gerados em CSS. Uma linha com nove pontos do meio lê como ruído.

## Idioma

Cada idioma tem a própria URL, o próprio `canonical` e o próprio Open
Graph. `hreflang` cruzado entre os dois, com `x-default` no português.

| | português | inglês |
|---|---|---|
| home | `/` | `/en/` |
| projetos | `/projetos/` | `/en/projetos/` |
| Didata | `/projetos/didata` | `/en/projetos/didata` |
| Kyber CRM | `/projetos/kyber-crm` | `/en/projetos/kyber-crm` |
| Brava | `/projetos/brava` | `/en/projetos/brava` |

Antes os dois idiomas viviam na mesma URL, escondidos por CSS. O Google
indexava texto misturado, o DOM tinha o dobro do necessário e não havia
link em inglês para mandar a um recrutador de fora. Cada página perdeu
cerca de 30% do peso na separação.

O seletor virou dois links, com `aria-current` no idioma ativo. Não
depende de JavaScript.

## Motion

As entradas por scroll usam `animation-timeline: view()` nativo, dentro
de um `@supports`. Não há listener de scroll, observer nem trabalho na
main thread, e só `transform` e `opacity` são animados. O fio de cada
seção se desenha num pseudo-elemento, não no container, senão o título
seria esticado junto.

A única coisa que ainda depende de JavaScript é a nav fixa: aparece
quando a rolagem passa 75% da altura do hero, com a altura medida uma vez
e recalculada no `resize`, então o handler não toca no layout.

`prefers-reduced-motion` desliga tudo.

## Acessibilidade

- 182 elementos com texto auditados, zero reprovações de contraste AA.
- Hierarquia `h1` a `h3` sem saltos.
- Skip link, `:focus-visible` visível, landmarks, `aria-pressed` no
  seletor de idioma (PT/EN em texto, sem imagem externa).
- Sem overflow horizontal em 320, 375, 768, 1024, 1280 e 1440px.

## Deploy

Qualquer host estático. Na Vercel, basta apontar para a raiz, sem comando
de build e sem diretório de saída.

## Estudos de caso

`projetos/kyber-crm.html` segue a estrutura que a pesquisa de portfólio
recomenda: problema, abordagem, como foi resolvido, a decisão de projeto
que vale contar, e os números. A seção IV (não enviar mensagem
automaticamente) ganha a placa invertida de propósito: é o trecho que
mostra critério, não habilidade, e é o mais forte da página.

O layout reaproveita as classes da home (`head`, `svc`, `figures`,
`stack`, `btn`), então um segundo estudo de caso é só marcação nova.

`projetos/brava.html` é o terceiro. O servidor Brava foi feito por um time
de três, então o case declara o recorte logo na primeira seção: cobre o
painel, a API e a integração, e diz explicitamente que os scripts de jogo
em Lua não são meus. Sem esse recorte, o case leria como se o servidor
inteiro fosse.

A placa invertida dele é a decisão de renderizar `—` onde o dado não
existe, em vez de cair no dado de exemplo. Três indicadores do produto
continuam assim, e o case diz quais e por quê.

Os três cases têm data de atualização no rodapé. Case sem data envelhece
em silêncio: o status do Didata ficou meses dizendo "cobrança em
implementação" com o produto já vendendo plano, e nada no site indicava
que aquele texto era velho.

## Conteúdo que falta

Itens identificados na análise que dependem de dado real e por isso não
foram inventados:

- **Números do Didata.** O Kyber CRM tem oito figuras em display; o
  Didata não tem nenhuma. Professores ativos, materiais gerados ou
  escolas. Ainda não existem, e o próprio `PRODUCT.md` do Didata proíbe
  prova social fabricada, então o card fica sem figuras até haver dado.
## Screenshot do CRM

`uploads/kyber-crm.png` é a Central do dia com os dados sensíveis
destruídos por mosaico, não por desfoque: o desfoque leve deixava texto
grande e em negrito ainda legível.

O que foi coberto, e por quê:

| Região | Expunha |
|---|---|
| Valores dos 5 indicadores | MRR, caixa, a receber, a pagar |
| Fila do dia, duas faixas | Nomes de cliente, CNPJ, telefone, um CPF citado |
| Leitura do dia | Nomes de cliente e valores |

O que ficou legível de propósito: a navegação com os treze módulos, os
títulos dos painéis e a estrutura da tela. É o que comunica a amplitude
do sistema sem entregar nada de cliente.

A base cortada ao meio foi removida no recorte (944px para 790px), então
o quadro fecha numa borda limpa.

O script está em `scripts/blur-crm.ps1` caso precise refazer com uma
captura nova.
## A carteira de clientes

Quatro sites de negócio local listados soltos leriam como bico. O que os
torna dignos de aparecer é que saem todos de um padrão escrito, então o
padrão ganha peso igual ao registro, lado a lado.

O padrão foi extraído dos READMEs dos próprios repositórios: HTML
estático sem build, fontes self-hospedadas, WebP otimizado, SEO completo
(canonical, Open Graph, JSON-LD, sitemap), contraste AA, foco visível,
teste a 375px, e o domínio registrado no nome do cliente. Esse último é
o item que quase nenhuma agência pequena faz.

Os quatro domínios foram conferidos e respondem 200:

| Cliente | Domínio |
|---|---|
| Ela Bela | elabelaestetica.com.br |
| Infinita Saúde | infinitafisio.com.br |
| Jordanna Santos | jordannasantostecnica.com.br |
| Encanto Gourmet | encantogourmetbuffet.com.br |

O README do `infinitasaude` ainda diz que o site vive em
`infinitasaude.vercel.app`. Ele já migrou para `infinitafisio.com.br`,
vale corrigir lá.

## Números verificados

As figuras do estudo de caso não são estimativa:

- **70 ferramentas MCP**: contadas no servidor MCP do Kyber CRM ao vivo.
- **32 migrations**: `supabase/migrations`, de `0001_schema.sql` a
  `0032_prospeccao_instagram.sql`.

O texto do card do Didata vem do `PRODUCT.md` do próprio repositório
(currículo BR verificável, correção por foto, memória da turma, e a
regra de que a IA sugere e o professor confirma), não de paráfrase.

## Imagens

Tudo que é exibido está em WebP, redimensionado para o dobro do maior
tamanho que ocupa na tela. Carregar 1440px numa imagem que renderiza a
522px é pagar quatro vezes por pixel que ninguém vê.

| Arquivo | Antes | Depois | |
|---|---|---|---|
| `hero.webp` | 760 KB | 326 KB | 57% |
| `didata.webp` | 1,4 MB | 96 KB | 93% |
| `kyber-crm.webp` | 159 KB | 57 KB | 64% |
| `pedro.webp` | 126 KB | 31 KB | 76% |
| `brava-dashboard.webp` | 159 KB | 28 KB | 83% |

**2,6 MB para 537 KB, 79% menor.** Conferido ampliando as capturas 2x
antes de trocar: o texto da barra lateral do CRM, que é pequeno, claro e
sobre fundo escuro, saiu sem artefato.

`pedro.jpg` continua no repositório porque é o `og:image`, e o suporte a
WebP em cartão social ainda é irregular fora do navegador. Ela não é
carregada pela página.

Para refazer com capturas novas: `scripts/otimizar-imagens.ps1`.

## Pendências

- As fontes vêm do Google Fonts por `<link>`. Auto-hospedar com
  `font-display: swap` tiraria uma conexão do caminho crítico.
- O `og:image` é o retrato quadrado. Cartão social pede 1200x630, então
  uma imagem própria renderizaria melhor no LinkedIn e no WhatsApp.

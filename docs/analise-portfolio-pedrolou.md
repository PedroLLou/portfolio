# Análise do portfólio — pedrolou.dev

**Analisado em:** 04/08/2026
**Escopo:** home (`pedrolou.vercel.app`), estudo de caso do Kyber CRM (`/projetos/kyber-crm.html`) e perfil do GitHub (`github.com/PedroLLou`)

O texto e a arquitetura da informação estão acima da média. Os problemas estão em **execução técnica de distribuição** (o site pode não estar sendo encontrado nem compartilhado direito) e em **prova de resultado** (o conteúdo mostra esforço, não impacto).

---

## 🔴 P0 — coisas que estão custando visitas agora

### 1. Dois sites no ar, e os links brigam entre si

O `canonical` aponta pra `pedrolou.dev`, mas todos os links internos absolutos apontam pra `pedrolou.vercel.app`:

- botão "Ver todos os projetos" → `pedrolou.vercel.app/index.html#projetos`
- currículo PDF (PT e EN) → `pedrolou.vercel.app/uploads/...`
- imagens → `pedrolou.vercel.app/uploads/...`

Ou seja: você diz pro Google que o original é o `.dev` enquanto empurra o visitante pro `.vercel.app`.

**O que fazer**
- [ ] Escolher `pedrolou.dev` como domínio oficial
- [ ] Redirecionar (301) `pedrolou.vercel.app` → `pedrolou.dev`
- [ ] Trocar links internos absolutos por relativos (`/projetos/kyber-crm`)

### 2. O `.dev` pode estar bloqueando robôs

Ao tentar acessar `pedrolou.dev` diretamente, veio bloqueio por robots. E uma busca por "pedrolou.dev Pedro Lourençoni desenvolvedor" não retorna o site em lugar nenhum. Pode ser proteção da Vercel, pode ser `robots.txt` fechado — mas precisa ser verificado.

**O que fazer**
- [ ] Cadastrar a propriedade no Google Search Console
- [ ] Rodar o teste de URL ao vivo (mostra se o Google consegue rastrear)
- [ ] Conferir o conteúdo do `robots.txt`
- [ ] Enviar o `sitemap.xml`

> Item de maior impacto da lista inteira e leva ~10 minutos.

### 3. A imagem de preview provavelmente está quebrada

| Campo | Valor atual |
|---|---|
| `og:image` | `https://pedrolou.dev/uploads/pedro.jpg` |
| Imagem que existe na página | `pedro.webp` |

Se o `.jpg` não existir no domínio, todo link seu no LinkedIn e no WhatsApp sai sem imagem — e é exatamente por link no LinkedIn que o portfólio circula.

**O que fazer**
- [ ] Testar no LinkedIn Post Inspector e no Facebook Sharing Debugger
- [ ] Trocar o retrato por um card **1200×630 em JPG ou PNG** (WebP não é confiável em OG) com nome + "Full Stack · Kyber Tech"
- [ ] Garantir que a URL do `og:image` está no mesmo domínio que você compartilha

### 4. PT e EN vivem no mesmo HTML

Os dois idiomas estão no código da página e o botão apenas esconde um. Custos:

- o Google lê os dois textos misturados e dilui as palavras-chave
- o HTML tem quase o dobro do tamanho necessário
- não dá pra mandar um link já em inglês pra um recrutador de fora
- se o "esconder" for por opacidade/visibilidade em vez de `display: none`, leitor de tela lê tudo duplicado
- copiar texto da página traz os dois idiomas colados

**O que fazer**
- [ ] Separar em duas URLs: `/` (PT) e `/en/` (EN)
- [ ] `hreflang` cruzado entre as duas + `x-default`
- [ ] Atributo `lang` correto em cada página
- [ ] Salvar a escolha do idioma (localStorage) e detectar `navigator.language` na primeira visita

---

## 🟡 P1 — conteúdo, onde está a maior sobra

### 5. O Didata não tem estudo de caso

O carro-chefe, público, em produção, com usuários reais aparece em **um parágrafo**. O Kyber CRM, que é privado e ninguém pode abrir, tem case completo. Está invertido.

Um case do Didata deveria cobrir:

- o problema real do professor (tempo gasto corrigindo, preparando aula)
- por que citar o código da habilidade da BNCC muda o jogo
- como funciona a correção por foto e **como você mede se ela acertou**
- por que "a IA sugere, o professor confirma" é uma decisão de produto, não uma limitação
- o que quebrou no caminho e o que você faria diferente

> Vale mais que todos os ajustes técnicos acima somados.

### 6. As métricas do case são de esforço, não de resultado

| Métrica atual | Problema |
|---|---|
| 21.133 linhas de TypeScript | Pra dev sênior avaliando você, pode contar **contra**: "por que precisou de 21 mil linhas?" |
| 103 arquivos | Não diz nada sobre qualidade |
| 32 migrations | Idem |

| Métrica que vale manter | Por quê |
|---|---|
| 70 ferramentas MCP | Descreve arquitetura e escopo |
| 133 policies de RLS · 29 tabelas | Mostra decisão técnica (autorização no banco) |
| 10 dependências de produção | Excelente: mostra disciplina, não volume |

**Substituir por resultado:** tempo pra montar a fila do dia antes vs. depois, cobranças que deixaram de ser esquecidas, leads processados por semana, tempo de resposta a cliente.

### 7. Falta data e falta cicatriz

Nenhum projeto informa quando foi feito nem quanto tempo levou. E a seção **"Automatizar tudo, menos a última milha"** é a melhor coisa do site inteiro, justamente porque mostra um trade-off pensado.

- [ ] Adicionar período em cada projeto
- [ ] Replicar o padrão: um bloco "o que eu faria diferente" em cada case

### 8. Dois públicos numa página só

Recrutador de vaga e cliente da Kyber querem coisas opostas, e os dois caem no mesmo herói. A bifurcação só aparece no fim ("Tem uma vaga ou um projeto?").

- [ ] Subir a bifurcação pro topo: dois caminhos explícitos já no primeiro bloco

---

## 🟢 P2 — acabamento

- [ ] **E-mail e telefone em texto puro** viram alvo de scraping. Ofuscar ou usar formulário.
- [ ] **URLs com `.html`**: `"cleanUrls": true` no `vercel.json`.
- [ ] **Sem JSON-LD** (`Person`, `WebSite`, `BreadcrumbList` no case). Você vende exatamente isso pros clientes na seção de padrão da Kyber — o próprio site precisa ter.
- [ ] **Sem analytics visível.** Sem medir, você não sabe se alguém chega no contato.
- [ ] **Sem escrita.** Dois posts técnicos ("RLS como fronteira de segurança", "servidor MCP num CRM real") alimentam direto o build in public e trazem gente de fora.
- [ ] **Depoimento anônimo** ("Cidade Brava RP, Cliente") — nome e cargo dobram o peso.
- [ ] **Status de disponibilidade** ausente: aberto a vaga? a projeto? aos dois?

---

## GitHub — 4 achados rápidos

1. **Número inconsistente.** O README do perfil diz "MCP server (**39** tools)"; o portfólio diz **70**. Quem confere, desconfia dos dois.
2. **Nenhum repositório fixado.** O que aparece é "Popular repositories" — ou seja, `rep1`, `CRUD-Agenda` e `lab-git-colaborativo-cmp2304` estão na sua vitrine. Fixar `gerador-curriculo`, `tcc20261` e `ecossistema-kyber`; arquivar o resto.
3. **O README não linka o portfólio.** Tem badge de Kyber, Didata, LinkedIn, e-mail e Instagram — e não tem `pedrolou.dev`.
4. **Bio, site e localização do perfil estão vazios.** É o primeiro bloco que o recrutador vê.

Extra: `ecossistema-kyber` está público e sem descrição.

---

## Ordem sugerida

| Quando | O quê |
|---|---|
| Hoje (~2h) | Search Console · domínio único · `og:image` · `cleanUrls` · os 4 itens do GitHub |
| Esta semana | Case do Didata · trocar métricas de volume por resultado |
| Depois | Separar o EN em `/en/` com `hreflang` |
| Contínuo | Dois posts técnicos por mês |

---

## Checklist de verificação rápida

- [ ] `pedrolou.dev` abre e o `.vercel.app` redireciona pra ele
- [ ] Search Console sem erro de rastreamento
- [ ] Link do site no LinkedIn mostra imagem
- [ ] Busca por "Pedro Lourençoni Lima desenvolvedor" retorna o portfólio
- [ ] README do GitHub linka o portfólio e os números batem

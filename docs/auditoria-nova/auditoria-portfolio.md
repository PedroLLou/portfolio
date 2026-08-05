# Auditoria — pedrolou.dev
Data: 05/08/2026 | Nota geral: 7,5

## Veredito

O conteúdo é o ponto forte e está muito acima da média: os dois estudos de caso (Didata e Kyber CRM) mostram problema, decisão, trade-off e o que **não** funciona, com números de sistema reais e uma seção de falhas em três atos. Isso é raro e é o seu maior ativo.

O que está segurando o site é a camada de distribuição e coerência, não o texto: todas as páginas do domínio próprio declaram `canonical` e `og:url` apontando para `pedrolou.vercel.app`, e esse espelho continua no ar servindo uma **versão antiga e diferente** do site. Some a isso um currículo em PDF que contradiz o próprio site, o inglês sem URL própria e um status desatualizado no case do Didata.

Nota 7,5: escrita e profundidade técnica de 9; execução de SEO, coerência entre peças e conversão de 6.

---

## O que eu não consegui medir (declarado)

Trabalhei por fetch de HTML. O ambiente bloqueia requisições diretas ao domínio (`x-deny-reason: host_not_allowed`), então **não** consegui:

- Medir Core Web Vitals reais (LCP, CLS, INP) nem TTFB. Nenhum número de performance abaixo é medido — onde comento performance, é leitura estrutural, não medição.
- Pesar imagens (`pedro.webp`, `didata.webp`, `kyber-crm.webp`, `brava-dashboard.webp`) ou ver se há `width`/`height`/`loading`/`fetchpriority` nas tags.
- Ler `robots.txt`, `sitemap.xml`, favicon, JSON-LD ou o CSS/JS — o extrator devolve o texto renderizado, não o HTML bruto.
- Renderizar em mobile, testar navegação por teclado, foco visível, contraste real ou fluidez de animação.
- Verificar dois dos cinco links de cliente: `premiumconstrutora.com.br` e `encantogourmetbuffet.com.br`.

**O que eu verifiquei de fato:** home e as duas páginas de case em `www.pedrolou.dev`; o espelho `pedrolou.vercel.app`; os dois PDFs de currículo (PT e EN); `usedidata.com.br`; o repositório `github.com/PedroLLou/tcc20261`; e três dos cinco sites de cliente (`elabelaestetica.com.br`, `infinitafisio.com.br`, `jordannasantostecnica.com.br` — os três respondem e estão bem-feitos).

---

## Problemas encontrados

| # | Problema | Onde | Por que importa | Impacto | Esforço |
|---|----------|------|-----------------|---------|---------|
| 1 | `canonical` e `og:url` apontam para `https://pedrolou.vercel.app/` em todas as páginas servidas no domínio próprio | `/`, `/projetos/didata`, `/projetos/kyber-crm` | Você está dizendo ao Google que a versão oficial é a do Vercel. Quem compartilha o link vê o preview com URL de subdomínio grátis — em um portfólio de dev, isso lê como descuido | Alto | 15 min |
| 2 | `pedrolou.vercel.app` está no ar, público, com uma versão **antiga** do site (hero diferente, seções "O que eu construo para empresas" e processo em 4 etapas, sem case do Didata, link para `/projetos/kyber-crm.html`) | Deploy Vercel | Duas versões suas concorrendo. O canonical do espelho aponta para `.dev` e o do `.dev` aponta para o espelho: os dois se anulam e o Google escolhe sozinho | Alto | 20 min |
| 3 | `og:image` do espelho aponta para `/uploads/pedro.jpg` enquanto a imagem real do site é `pedro.webp` | `pedrolou.vercel.app` | Preview quebrado em quem compartilhar o espelho | Médio | junto com #2 |
| 4 | PT e EN convivem no mesmo texto, sem URL própria, sem `hreflang`, com `og:locale: pt_BR` e meta description só em português | Site inteiro | Um recrutador de fora não tem link em inglês para receber, e o Google indexa a página com o texto duplicado nos dois idiomas | Alto | 2-4 h |
| 5 | Currículo PDF contradiz o site: no PDF a experiência é "Fundador e Desenvolvedor Full Stack, **Didata**"; no site é "Fundador e Desenvolvedor Full Stack, **Kyber Tech**". Kyber Tech não aparece no PDF | `/uploads/curriculo-pt.pdf` e `-en.pdf` | É o documento que vai para o RH. Duas histórias diferentes sobre a mesma empresa é a coisa mais fácil de um recrutador notar | Alto | 40 min |
| 6 | O PDF lista EduPlay como projeto; o site não. O site tem Kyber CRM e Brava.gg; o PDF não | PDFs vs site | O melhor trabalho (Kyber CRM) fica de fora justo da peça que circula sozinha | Alto | junto com #5 |
| 7 | PDF diz "Validei o MVP com os primeiros usuários"; o case do Didata diz que não há pesquisa de campo, entrevista nem questionário, e que o beta foi desativado | PDF vs `/projetos/didata` | A honestidade é o diferencial do case. Uma linha inflada no PDF derruba a credibilidade das outras 40 | Alto | 10 min |
| 8 | Case do Didata diz "em produção, cobrança em implementação" e "ainda sem lançamento divulgado"; `usedidata.com.br` está com planos públicos (Grátis, Pro R$ 29,90/mês, Escolas a partir de R$ 19,90/professor), 49 exemplos, páginas de ferramentas e CTA de assinatura | `/projetos/didata` | Quem clica em "Ver o Didata ao vivo" vê um produto lançado logo depois de ler que ele não foi lançado | Alto | 20 min |
| 9 | Brava.gg não tem estudo de caso, link, nem números — só descrição e uma imagem | Home, seção Projetos | É o único projeto com trabalho em equipe (três pessoas) e o único com escopo de jogo + 13 telas. Hoje é o item mais fraco entre os quatro "em produção" | Médio | 3-4 h |
| 10 | O README do `tcc20261` é só "como rodar": estrutura de pastas e comandos npm. Sem problema, sem print, sem demo, 28 commits, 0 stars | `github.com/PedroLLou/tcc20261` | Está linkado como projeto no site e no currículo. Recrutador clica, e o que vê não sustenta o que o site promete | Médio | 45 min |
| 11 | O CTA principal do contato é `mailto:` ("Vamos conversar") | Seção IV | Em desktop com webmail, `mailto:` costuma não abrir nada. O caminho que funciona (WhatsApp) está como link secundário de texto | Médio | 15 min |
| 12 | Contato só existe no fim da página e no menu. Não há CTA persistente nem convite ao fim dos cases além de dois links de texto | Site inteiro | Quem lê 4.000 palavras do case do Didata está no pico de interesse e recebe o menor empurrão | Médio | 1 h |
| 13 | O caminho de cliente é uma linha no rodapé ("Precisa contratar um projeto? Conheça a Kyber Tech"). As seções de serviço e processo, que existiam no espelho, sumiram no `.dev` | Rodapé | Você pediu que o site sirva a duas audiências. Hoje ele serve bem a uma | Médio | 2 h |
| 14 | Os cinco clientes aparecem como lista de texto, sem thumbnail e sem resultado | Home, "Clientes atendidos" | Os três sites que abri são bons (nota do Google, seguidores, agendamento por WhatsApp na dobra). O portfólio vende esse trabalho pior do que o trabalho se vende sozinho | Médio | 2 h |
| 15 | `og:image` do case do Didata usa o card genérico (`og-card.jpg`), sem `og:image:alt`; o do Kyber CRM usa imagem própria e tem alt | `/projetos/didata` | Os dois cases são a peça mais compartilhável do site, e um deles compartilha errado | Baixo | 30 min |
| 16 | Nos números do card do Kyber CRM na home aparece "Toques por dia, teto por canal: 55" | Home | Fora do contexto do case, esse número não significa nada para quem está lendo 8 segundos | Baixo | 5 min |
| 17 | A barra de credenciais diz "Escrevendo software desde 2023" | Home, faixa de destaques | É honesto, mas é a única métrica de tempo visível e trabalha contra você. Os números fortes (1.595 testes, 70 ferramentas MCP, 133 policies) estão enterrados | Médio | 20 min |
| 18 | O site não menciona nenhuma experiência com sistemas corporativos, que é o que você descreveu como o seu trabalho principal | Seção III, "Por onde passei" | Se existe um emprego CLT/corporativo em curso, o site apresenta um perfil de fundador solo — e some justo a experiência que responde "ele aguenta um time e um legado?" | Alto | 30 min |
| 19 | Alt das imagens é irregular: "Central do dia do Kyber CRM: navegação com treze módulos, cinco indicadores..." (ótimo) convive com "Interface do Didata" (genérico) | Home e cases | Detalhe barato, e o site inteiro é vendido no detalhe | Baixo | 15 min |
| 20 | O site declara o padrão da Kyber ("Contraste AA, foco visível, testado a 375px, JSON-LD e sitemap") para os sites de cliente, mas não afirma nada sobre o próprio | Home | Se o padrão vale, ele deveria estar provado no seu site — e dito | Baixo | 30 min |

---

## Top 5 — correções prontas

### 1. Domínio único: canonical, OG e o espelho do Vercel

**O que mudar:** todas as ocorrências de `pedrolou.vercel.app` no `<head>` viram `www.pedrolou.dev`, e o espelho passa a redirecionar 301.

No `<head>` de cada página (home, `/projetos/didata`, `/projetos/kyber-crm`):

```html
<link rel="canonical" href="https://www.pedrolou.dev/">
<meta property="og:url" content="https://www.pedrolou.dev/">
<meta property="og:image" content="https://www.pedrolou.dev/uploads/og-card.jpg">
<meta property="og:site_name" content="Pedro Lourençoni Lima">
```

Nos cases, o mesmo com o caminho da página e a imagem própria:

```html
<!-- /projetos/didata -->
<link rel="canonical" href="https://www.pedrolou.dev/projetos/didata">
<meta property="og:url" content="https://www.pedrolou.dev/projetos/didata">
<meta property="og:image" content="https://www.pedrolou.dev/uploads/og-didata.jpg">
<meta property="og:image:alt" content="Tela do Didata com uma prova corrigida por foto e a leitura marcada como sugerida">
```

E, no `vercel.json`, o 301 do espelho para o domínio (confira o comportamento depois do deploy, porque redirect por host depende da configuração de domínios do projeto):

```json
{
  "redirects": [
    {
      "source": "/:path*",
      "has": [{ "type": "host", "value": "pedrolou.vercel.app" }],
      "destination": "https://www.pedrolou.dev/:path*",
      "permanent": true
    }
  ]
}
```

Decida também qual é o host oficial, `pedrolou.dev` ou `www.pedrolou.dev`, e mantenha um só nos links internos — hoje o `canonical` do espelho aponta para a versão sem `www` e o conteúdo do site usa `www`.

---

### 2. Hero: trocar adjetivo por evidência

**O que mudar:** hoje o hero diz "especializado em SaaS e IA aplicada... do banco e das APIs ao deploy e à operação". É melhor que a média, mas é uma descrição de categoria — qualquer pessoa pode escrever. O que só você pode escrever são os dois produtos rodando.

**Texto reescrito (PT):**

> # Pedro Lourençoni Lima
>
> Desenvolvedor full stack. Construo e **opero** SaaS com IA em produção, sozinho, do modelo de dados ao deploy.
>
> **Didata** — plataforma de IA para professores, no ar com plano pago e correção de prova por foto.
> **Kyber CRM** — 4 superfícies sobre um modelo só, 70 ferramentas MCP e 133 policies de RLS, usado todo dia.
>
> Next.js · TypeScript · Node.js · PostgreSQL · LLMs em produção
>
> Aberto a vagas full stack · Goiânia ou remoto

**Texto reescrito (EN):**

> Full-stack developer. I build **and run** AI SaaS in production, on my own, from the data model to deploy.
>
> **Didata** — AI platform for Brazilian teachers, live with a paid plan and photo-based exam grading.
> **Kyber CRM** — 4 surfaces over one model, 70 MCP tools and 133 RLS policies, used every day.
>
> Open to full-stack roles · Goiânia, Brazil, or remote

E troque, na faixa de credenciais, "Escrevendo software desde 2023" por algo que some em vez de subtrair:

> Dois produtos próprios em produção · Cinco clientes entregues · 1.595 testes unitários no Didata · Inglês avançado

---

### 3. Inglês com URL própria

**O que mudar:** hoje os dois idiomas dividem a mesma URL, então não existe link em inglês para mandar. Sirva o inglês em `/en/` (e `/en/projetos/didata`, `/en/projetos/kyber-crm`), mantendo o toggle — só que navegando em vez de alternar classe.

No `<head>` da versão PT:

```html
<link rel="alternate" hreflang="pt-BR" href="https://www.pedrolou.dev/">
<link rel="alternate" hreflang="en"    href="https://www.pedrolou.dev/en/">
<link rel="alternate" hreflang="x-default" href="https://www.pedrolou.dev/">
```

Na versão EN, o mesmo bloco mais o `<html lang="en">`, `og:locale` e a descrição traduzida:

```html
<html lang="en">
<meta name="description" content="Full-stack developer and founder of Kyber Tech. React, Node.js, TypeScript and applied AI. From the problem to a product in production.">
<meta property="og:locale" content="en_US">
<meta property="og:locale:alternate" content="pt_BR">
```

Se der para gerar as duas páginas no build, melhor: some o texto duplicado do HTML, cai o peso da página e o Google passa a indexar duas páginas limpas em vez de uma bilíngue.

---

### 4. Currículo PDF alinhado ao site

**O que mudar:** o PDF fala em "Fundador, Didata" e omite Kyber Tech e Kyber CRM; o site fala em "Fundador, Kyber Tech" e não cita EduPlay. Escolha a versão do site (empresa como guarda-chuva, produto como entrega) e reescreva o bloco de experiência dos dois PDFs.

**Bloco reescrito (PT):**

> **Fundador e Desenvolvedor Full Stack, Kyber Tech** · mar/2026 a atual · remoto
> Empresa própria de software: produtos, sistemas e automação com IA.
> • **Didata** (usedidata.com.br), SaaS com IA para professores, em produção com plano pago: Next.js, TypeScript, PostgreSQL/Prisma e Vision para correção de prova por foto. 1.595 testes unitários e CI que barra rota de IA sem reserva de cota.
> • **Kyber CRM**, sistema interno em uso diário: um app Next.js servindo painel, servidor MCP de 70 ferramentas, páginas públicas por token e crons, com 133 policies de RLS sobre 29 tabelas.
> • Cinco sites de cliente entregues em padrão próprio (HTML estático, WebP, canonical, OG, JSON-LD e sitemap).

**E corrija esta linha:** "Validei o MVP com os primeiros usuários e priorizei o roadmap pelo feedback" → o seu próprio case diz o contrário. Troque por algo verificável:

> Instrumentei divergência professor × IA por questão e por faixa de confiança para medir acerto em uso, em vez de publicar acurácia sem conjunto de teste rotulado.

Se existe emprego atual com sistemas corporativos, ele entra aqui como primeiro item da lista, no site e no PDF. Hoje o site não tem uma linha sobre isso — para uma vaga pleno, essa é a experiência que mais pesa, e é a única que está faltando.

---

### 5. Status do Didata: parar de contradizer o produto no ar

**O que mudar:** o case diz "cobrança em implementação" e "ainda sem lançamento divulgado". O site do Didata está com três planos, preço, FAQ, 49 exemplos e botão de assinatura.

**Cabeçalho do case, reescrito:**

> **Situação** — Em produção em usedidata.com.br, com plano gratuito e Didata Pro a R$ 29,90/mês. Sem números de tração publicados: o produto não teve lançamento divulgado e este case não publica métrica de uso que eu não meça.

E na seção VI, ajuste a frase "O produto está em produção mas nunca foi divulgado, e a cobrança ainda não fecha" para o estado real. A regra que você escreveu no case ("prefiro escrever isso do que apresentar posicionamento como pesquisa") é ótima — mas ela só funciona enquanto o texto acompanha o produto. Coloque uma data no rodapé de cada case ("Atualizado em ago/2026") e revise a cada release.

---

## Benchmark

Inspecionei ao vivo o de Brittany Chiang; os outros quatro eu confirmei por busca e conheço o formato, mas não abri página por página nesta sessão — trate as observações deles como referência de padrão, não como auditoria.

| Portfólio | Link | O que ele faz melhor que o seu |
|---|---|---|
| Brittany Chiang | https://brittanychiang.com | Âncora de credibilidade explícita: <cite index="36-1">apresenta-se como engenheira frontend sênior na Klaviyo, trabalhando em design system e acessibilidade, e lista Apple, Starry e Upstatement como passagens anteriores</cite>, cada empresa com link. Cada projeto carrega prova externa (curso publicado, tema de VS Code com mais de 100 mil instalações, versão antiga do próprio site com 6 mil stars). Tem `/archive` e seção de escrita. Um idioma só, um `og`, zero ambiguidade de domínio. Você tem casos mais profundos e provas mais fracas: nenhum número seu é auditável por terceiro |
| Lee Robinson | https://leerob.com | Uma linha de posicionamento que resolve o teste dos 5 segundos: <cite index="45-1">engenheiro e escritor, trabalhando com ML na Cursor, antes na Vercel, 15 anos programando e metade deles ensinando</cite>. Site escrito-primeiro: o corpo é o arquivo de posts, não a grade de projetos. Você tem material de escrita melhor que a maioria (os dois cases), mas ele está escondido atrás do rótulo "Projetos" |
| Josh W. Comeau | https://www.joshwcomeau.com | <cite index="40-1">Artigos e tutoriais para devs front-end</cite> com demonstração interativa dentro do texto: o leitor mexe no exemplo. Os seus cases explicam mecanismos que pedem isso — a fila de correção por confiança, a resolução da faixa BNCC — e hoje são só prosa |
| Emil Kowalski | https://emilkowal.ski | Foco estreito e defensável (animação e craft de interface) mais um produto próprio, o curso. <cite index="34-1">Ele publica os bastidores da própria plataforma: stack, processo de design e por que trocou de provedor de vídeo</cite>. É exatamente o que você já faz nos cases — mas ele transforma isso em audiência recorrente, e você não tem lista, RSS nem newsletter |
| Rauno Freiberg | https://rauno.me | Seção de "craft": notas curtas sobre detalhes de interação, publicadas continuamente. Baixa fricção para publicar e vira prova de gosto. O seu site só tem duas peças longas: publicar não custa 4.000 palavras toda vez |

**O padrão que os cinco compartilham e o seu não tem:** publicação contínua com data. Todos têm um lugar onde algo novo aparece sem redesenhar o site. O seu conteúdo é bom demais para viver em duas páginas estáticas.

**O que você faz melhor que os cinco:** os seus cases assumem o que não sabe. "Números de acurácia não existem", "não há validação determinística do código citado", "o contorno continua sendo dívida, não desenho". Nenhum dos cinco escreve isso. Para um tech lead lendo, esse é o sinal mais forte do site inteiro — e ele está na sexta seção de uma página que o visitante talvez nunca abra. Suba isso.

---

## Plano de ação

### Hoje (até 1h)
1. Trocar `canonical`, `og:url` e `og:image` para `www.pedrolou.dev` nas três páginas (#1).
2. Colocar o 301 de `pedrolou.vercel.app` para o domínio, ou tirar o deploy antigo do ar (#2, #3).
3. Corrigir a linha de status do case do Didata e a frase da seção VI (#8).
4. Trocar "Escrevendo software desde 2023" por uma métrica que soma, e tirar "Toques por dia, teto por canal" do card da home (#16, #17).
5. Trocar o CTA principal de `mailto:` para WhatsApp, mantendo o e-mail como secundário (#11):

```html
<a class="btn-primary" href="https://wa.me/5562999369087?text=Ol%C3%A1%20Pedro!%20Vim%20pelo%20seu%20site.">Falar no WhatsApp</a>
<a class="btn-secondary" href="mailto:pedroloulima@gmail.com">Enviar e-mail</a>
```

### Esta semana
6. Reescrever o hero com os dois produtos e os números (#2 do Top 5).
7. Alinhar os dois PDFs ao site: Kyber Tech como empresa, Kyber CRM na lista de projetos, corrigir a linha de validação do MVP (#5, #6, #7).
8. Decidir sobre a experiência corporativa: se existe, ela entra na seção III e no topo do PDF (#18).
9. Reescrever o README do `tcc20261` com problema, arquitetura, print e como rodar — nessa ordem (#10).
10. Padronizar `alt` das imagens no nível do melhor que você já escreveu (#19).
11. Rodar Lighthouse e PageSpeed Insights de verdade em mobile nas três páginas: eu não consegui medir, e você precisa dos números antes de mexer em imagem (o que dá para dizer sem medir é que a home carrega ao menos quatro `.webp` grandes e o texto dos dois idiomas de uma vez).

### Este mês
12. Inglês em `/en/` com `hreflang` e metadados próprios (#4 e Top 5 #3).
13. Case do Brava.gg, ou tirar da grade de destaque: hoje ele ocupa espaço de produto principal com conteúdo de item secundário (#9).
14. Transformar a lista de clientes em cinco cards com thumbnail e uma linha de resultado cada — os sites são bons, mostre-os (#14).
15. Abrir uma seção de publicação contínua (`/notas`) com posts curtos: o pooler do Supabase travando o `migrate deploy`, o limite de 1MB da Server Action, a escolha de RLS no CRM e app-layer no Didata. Cada um já está escrito dentro dos cases — é recortar, datar e publicar.
16. Adicionar CTA ao fim de cada case, com destaque visual, e um botão de contato persistente no mobile (#12).
17. Decidir a política de audiência dupla (#13): ou volta um bloco curto "Precisa contratar um projeto?" com três serviços e link para a Kyber logo depois dos projetos, ou o site assume que é só para contratação e o rodapé vira o único caminho de cliente. Hoje está no meio do caminho.

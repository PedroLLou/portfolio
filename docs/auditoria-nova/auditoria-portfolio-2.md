# Auditoria — pedrolou.dev
Data: 5 de agosto de 2026 | Nota geral: **7,2/10**

## Veredito
O site já prova capacidade técnica melhor que a maioria dos portfólios: há produtos reais, dois estudos de caso profundos, links funcionais e decisões de engenharia verificáveis.  
O que segura o resultado é posicionamento dividido, prova de negócio fraca e duas inconsistências públicas que reduzem credibilidade: o Didata aparece com cobrança “em implementação”, embora o produto publique planos, e o Kyber CRM aparece com 39 e 70 ferramentas MCP em lugares diferentes.  
**Nota: 7,2/10.** É um bom portfólio técnico, mas ainda não é uma apresentação comercial e profissional totalmente confiável para as duas audiências propostas.

### Escopo e limitações da auditoria

Auditei as três páginas públicas encontradas:

- [Homepage](https://www.pedrolou.dev/)
- [Estudo de caso — Didata](https://www.pedrolou.dev/projetos/didata)
- [Estudo de caso — Kyber CRM](https://www.pedrolou.dev/projetos/kyber-crm)

Também abri os cinco sites de clientes, Didata, Kyber Tech, repositórios públicos, LinkedIn, GitHub e os dois currículos vinculados. Não encontrei link quebrado entre os principais destinos testados.

A inspeção técnica foi feita no HTML publicado e no [repositório público do portfólio](https://github.com/PedroLLou/portfolio), cuja estrutura corresponde ao conteúdo acessado no domínio.

**O que não consegui medir de forma confiável neste ambiente:**

- Não consegui executar Lighthouse/PageSpeed nem obter dados CrUX para o domínio. Portanto, **não atribuo números inventados a LCP, CLS ou INP**.
- Não consegui realizar uma sessão visual real em navegadores desktop e mobile nem uma travessia manual completa por teclado. A avaliação responsiva e de acessibilidade abaixo é baseada no HTML, CSS e JavaScript publicados.
- `robots.txt` e `sitemap.xml` foram confirmados no repositório que publica o site, mas não consegui validar diretamente os cabeçalhos HTTP desses arquivos no domínio.

Essas limitações estão separadas das conclusões verificadas; não entram como “aprovação” dos itens não testados.

## Teste dos 5 segundos

| Pergunta | Resultado | Evidência |
|---|---|---|
| Quem é você? | **Sim** | O nome é o H1 e aparece no centro do hero. |
| O que você faz? | **Sim** | “Desenvolvedor Full Stack especializado em SaaS e IA aplicada” é específico. |
| Por que vale a pena falar com você? | **Parcial** | Os melhores argumentos — produtos próprios, cinco clientes e profundidade dos cases — aparecem abaixo do hero. |
| Para qual audiência a página fala primeiro? | **Recrutadores** | “Aberto a oportunidades full stack” e “Baixar currículo” dominam o primeiro bloco. |
| Um potencial cliente entende onde contratar? | **Não em 5 segundos** | A Kyber Tech e o caminho comercial só ficam claros mais abaixo. |

**Resultado:** o hero passa em identidade e área de atuação, mas falha na diferenciação e na dupla audiência. Ele diz o que você faz; ainda não mostra, acima da dobra, por que um tech lead deveria entrevistar você ou por que uma empresa deveria confiar um sistema a você.

## Problemas encontrados

| # | Problema | Onde | Por que importa | Impacto | Esforço |
|---|----------|------|-----------------|---------|---------|
| 1 | O hero prioriza contratação e não oferece um caminho equivalente para clientes | Hero | Uma das duas audiências recebe um CTA claro; a outra precisa descobrir a Kyber ao rolar a página | Alto | Baixo |
| 2 | A proposta de valor forte fica abaixo da dobra | Hero e barra de evidências | “SaaS e IA aplicada” é promessa; produtos, clientes e números são a prova e deveriam aparecer junto dela | Alto | Baixo |
| 3 | “Escrevendo software desde 2023” enfraquece o posicionamento de pleno | Barra de evidências | O dado destaca tempo curto de carreira em vez de escopo, autonomia e complexidade já demonstrados | Alto | Baixo |
| 4 | A homepage mistura currículo, agência, produto próprio, TCC e projeto de jogo sem uma tese de seleção explícita | Projetos | O visitante vê quantidade, mas precisa inferir qual trabalho representa melhor seu nível atual | Médio | Médio |
| 5 | O status do Didata está publicamente desalinhado | Case Didata versus usedidata.com.br | O case diz “cobrança em implementação”; o produto publica plano gratuito, Didata Pro e CTA de assinatura a R$ 29,90/mês | Alto | Baixo |
| 6 | O número de ferramentas MCP do Kyber CRM é inconsistente | Portfólio versus README do perfil GitHub | O portfólio mostra 70; o GitHub mostra 39. Um recrutador que verifica a prova encontra números conflitantes | Alto | Baixo |
| 7 | Os cases medem volume de implementação, não resultado de negócio | Didata e Kyber CRM | Testes, páginas, tabelas e commits provam esforço; não provam adoção, economia de tempo, conversão ou confiabilidade operacional | Alto | Alto |
| 8 | O case do Didata demora para entregar a síntese | Topo e corpo do case | Um tech lead pode gostar da profundidade; recrutadores e clientes raramente lerão tudo antes de entender problema, decisão e resultado | Alto | Médio |
| 9 | O Kyber CRM não mostra impacto operacional mensurável | Case Kyber CRM | “Usado todo dia” é insuficiente sem antes/depois: tempo poupado, follow-ups recuperados, cobranças geradas ou erros evitados | Alto | Médio |
| 10 | O inglês não possui URL própria, `hreflang` ou metadados próprios | Todas as páginas | O HTML entrega PT e EN na mesma URL; título muda via JavaScript, mas description, Open Graph e dados estruturados continuam em português | Médio | Médio |
| 11 | Alguns rótulos acessíveis permanecem em português no modo inglês | Navegações e ícones sociais | `aria-label="Principal"`, `aria-label="Seções"` e “LinkedIn de Pedro…” não são atualizados pelo seletor de idioma | Médio | Baixo |
| 12 | O GitHub reduz a percepção criada pelo portfólio | Perfil GitHub | O visitante encontra baixa prova externa e repositórios de baixo sinal, como `rep1`, atividade de laboratório e CRUD, perto dos projetos principais | Médio | Baixo |
| 13 | Os depoimentos não são verificáveis externamente | Seção de prova social | Há nome e texto, mas faltam cargo, empresa, projeto, data e link para a pessoa ou empresa | Médio | Baixo |
| 14 | A rota comercial está enterrada | Hero, projetos e contato | O cliente só encontra Kyber Tech no texto “Sobre”, na lista de experiência e no fim da página | Alto | Baixo |
| 15 | A linha de tecnologias no hero é genérica | Hero | React, Next.js e Node.js não diferenciam um pleno; decisões de arquitetura, operação e resultados diferenciam | Médio | Baixo |
| 16 | A imagem de fundo principal pesa 318 KB no desktop | Hero | Ela é carregada acima da dobra e pode se tornar o LCP; há versão mobile de 113 KB, mas o desktop ainda merece otimização | Médio | Baixo |
| 17 | Não há versão responsiva da foto de perfil | Seção Sobre | `pedro.webp` pesa 30 KB, então o impacto é pequeno, mas a implementação é inconsistente com o cuidado aplicado às imagens dos projetos | Baixo | Baixo |
| 18 | Open Graph não oferece variante inglesa | `<head>` das três páginas | Compartilhar a versão inglesa continua produzindo título, descrição e locale em português | Médio | Médio |
| 19 | Os CTAs dos cases terminam em “ver mais” ou “falar comigo”, sem intenção específica | Final dos cases | Não há distinção entre “avaliar para vaga”, “pedir arquitetura”, “contratar projeto” e “ver código” | Médio | Baixo |
| 20 | A frase “quatro deles rodam hoje, com usuários de verdade e conta para pagar” é ampla demais | Abertura de Projetos | Não fica claro quais quatro, quantos usuários e qual evidência sustenta “usuários de verdade” | Médio | Baixo |

## O que foi verificado no site

### Posicionamento e copy

A copy não cai no clichê “apaixonado por tecnologia”. Os trechos principais são concretos: “SaaS e IA aplicada”, “do banco e das APIs ao deploy e à operação”, “servidor MCP próprio”, “correção por foto” e “RLS”. Isso é melhor que uma apresentação baseada apenas em adjetivos.

O problema é a hierarquia. A especificidade aumenta conforme o visitante rola; deveria acontecer o contrário. O hero entrega cargo e stack, enquanto os fatos raros ficam escondidos:

- autor único de um SaaS de IA;
- produto com 1.595 testes unitários;
- CRM interno com 70 ferramentas MCP e 133 policies de RLS;
- cinco clientes entregues;
- responsabilidade por arquitetura, deploy e operação.

A frase “Escrevendo software desde 2023” é especialmente ruim para a tese de pleno. Não é falsa, mas direciona o olhar para anos de experiência quando seu melhor argumento é amplitude de responsabilidade.

### Estudos de caso

#### Didata

O case do Didata tem estrutura de verdade: contexto, problema, restrições, decisões técnicas, falhas de deploy, trade-offs, métricas de implementação e o que você faria diferente. Não é uma lista de tecnologias.

Pontos fortes observados:

- explica por que a IA não fecha nota sozinha;
- mostra ancoragem na BNCC;
- documenta fallback entre providers de visão;
- admite ausência de pesquisa de campo e de métricas de uso;
- narra um incidente de migração/deploy sem transformar dívida técnica em vitória;
- apresenta números verificáveis do repositório.

O que falta é resultado de produto. O case prova que você construiu muito; ainda não prova que professores usam, completam tarefas, economizam tempo ou preferem o fluxo à alternativa.

Há também um desalinhamento atual: o case exibe “Em produção, cobrança em implementação”, enquanto a [landing do Didata](https://usedidata.com.br/) publica plano gratuito, Didata Pro e CTA de assinatura. Mesmo que o checkout ainda tenha alguma etapa assistida, as duas páginas precisam contar a mesma história.

#### Kyber CRM

O case do CRM também é tecnicamente forte. Ele explica quatro superfícies sobre o mesmo modelo de dados, autorização com RLS, servidor MCP, páginas por token, cron, limites de canal e decisões legais/operacionais.

O ponto cego é o resultado. “Usado todo dia” deveria virar uma comparação mensurável:

- quanto tempo a rotina diária levava antes e depois;
- quantos follow-ups são executados por semana;
- quantas cobranças, propostas ou páginas públicas foram geradas;
- quantas ações o MCP executou sem intervenção manual;
- quantos erros de autorização foram evitados ou cobertos por teste.

Também existe uma inconsistência objetiva: [a homepage e o case mostram 70 ferramentas MCP](https://www.pedrolou.dev/projetos/kyber-crm), mas o [README do perfil GitHub](https://github.com/PedroLLou) ainda mostra 39.

### Prova social e credibilidade

Verificado:

- cinco sites de clientes listados abriram;
- Didata e Kyber Tech abriram;
- os dois cases abriram;
- os repositórios públicos vinculados abriram;
- email, WhatsApp, LinkedIn, GitHub e currículos estão vinculados;
- não encontrei link quebrado entre os destinos principais testados.

A prova social ainda é mais fraca que a prova técnica. Os depoimentos não trazem cargo, empresa, projeto, data ou link externo. Os números mais fortes são contagens internas de código. O GitHub público também não confirma a mesma força: o perfil mostra pouca tração externa e mistura projetos atuais com repositórios acadêmicos de baixo sinal.

### Design e hierarquia

A inspeção do CSS mostra um sistema de design deliberado, não uma coleção de ajustes avulsos:

- escala tipográfica definida;
- espaçamento em base de 4 px;
- paleta única;
- três pesos de divisórias;
- layouts diferentes para projeto principal, faixa, card e índice;
- breakpoints em 1100, 960, 768, 520 e 400 px;
- versão menor da imagem do hero abaixo de 768 px.

Isso sustenta consistência. O risco é densidade editorial: a identidade visual ajuda a diferenciar, mas os cases longos e a matriz extensa de skills exigem leitura demais antes da conclusão. Para recrutador, a página precisa continuar “editorial”, mas com camadas: síntese primeiro, profundidade depois.

Não afirmo que não existam estouros, cortes ou problemas visuais em um viewport real, porque não consegui executar a renderização desktop/mobile neste ambiente. O CSS contém tratamentos específicos para os elementos mais propensos a quebrar, inclusive nome longo, links de domínio, grids, barra fixa e CTAs.

### Acessibilidade

Confirmado no código:

- um H1 por página;
- sequência coerente de H2 e H3;
- link “Pular para o conteúdo”;
- `:focus-visible` com outline de 2 px;
- `prefers-reduced-motion`;
- imagens com `width`, `height` e textos alternativos;
- SVGs decorativos ocultos de leitores de tela;
- botões de idioma com `aria-pressed`;
- `lang="en"` nos fragmentos ingleses;
- conteúdo não depende de JavaScript para existir no HTML.

Problema confirmado: o JavaScript troca `html.lang`, título e currículo, mas não troca os `aria-label` que foram escritos apenas em português. Portanto, a versão inglesa ainda contém rótulos acessíveis em português.

Não consegui validar manualmente ordem de tabulação, foco em todos os elementos, leitura por NVDA/VoiceOver nem contraste visual renderizado. O CSS declara razões de contraste AA, mas isso não substitui teste automatizado e manual em página renderizada.

### Conversão

Existem quatro canais diretos de contato:

1. email;
2. WhatsApp;
3. LinkedIn;
4. GitHub.

Há ainda currículo em PT/EN e link para a Kyber Tech. A quantidade de caminhos não é o problema. A falha é semântica: todos convergem para um contato genérico.

Para recrutadores, o site deveria oferecer: “Avaliar experiência”, “Baixar currículo” e “Falar sobre uma vaga”.  
Para clientes, deveria oferecer: “Ver entregas para clientes”, “Solicitar diagnóstico” e “Contratar pela Kyber Tech”.

### SEO e HTML

| Item | Estado verificado | Avaliação |
|---|---|---|
| `<title>` | Presente e específico na home e nos cases | Bom |
| Meta description | Presente e específica | Bom |
| Canonical | Presente | Bom |
| Open Graph | type, URL, title, description, image, dimensões e locale | Bom em PT; incompleto em EN |
| Twitter Card | `summary_large_image` | Bom |
| Favicon | SVG presente e vinculado | Bom |
| JSON-LD | ProfilePage/Person na home; TechArticle e BreadcrumbList no Didata | Bom |
| H1/H2/H3 | Hierarquia coerente | Bom |
| Alt de imagens | Descritivos e presentes | Bom |
| Dimensões das imagens | `width` e `height` presentes | Bom para CLS |
| `robots.txt` | `Allow: /` e sitemap declarados no repositório | Bom; HTTP live não validado |
| `sitemap.xml` | Home, Didata e Kyber CRM | Bom para as páginas existentes |
| `hreflang` | Ausente | Problema |
| URL inglesa | Ausente | Problema |
| Metadados ingleses | Ausentes na resposta HTML inicial | Problema |
| `og:locale:alternate` | Ausente | Problema |

### Performance

#### Arquivos principais observados

| Recurso | Peso |
|---|---:|
| `index.html` | 32 KB |
| `styles.css` | 44,1 KB |
| `main.js` | 2,88 KB |
| `hero.webp` desktop | 318 KB |
| `hero-900.webp` mobile | 113 KB |
| `didata.webp` | 93,4 KB |
| `didata-560.webp` | 33,1 KB |
| `kyber-crm.webp` | 55,3 KB |
| `kyber-crm-1000.webp` | 22 KB |
| `kyber-crm-640.webp` | 11,3 KB |
| `brava-dashboard.webp` | 27,2 KB |
| `pedro.webp` | 30 KB |
| `og-card.jpg` | 123 KB; não entra no carregamento normal da página |
| `og-kyber-crm.jpg` | 71,7 KB; não entra no carregamento normal da página |

O site é estático, não possui framework no cliente, e o JavaScript deferido tem menos de 3 KB. O conteúdo principal já vem no HTML e não espera hidratação. Essa arquitetura reduz risco de INP ruim e acelera a aparição do texto.

As imagens de projetos usam `srcset`, `sizes`, dimensões explícitas e `loading="lazy"`. A imagem principal do hero é pré-carregada e possui versão mobile. O maior custo visível é o hero desktop de 318 KB, candidato provável a LCP por ser o fundo do primeiro viewport.

#### Core Web Vitals

| Métrica | Resultado |
|---|---|
| LCP | **Não medido**; sem Lighthouse/CrUX disponível. O provável elemento relevante é o hero de fundo. |
| CLS | **Não medido**; o código reduz risco com dimensões explícitas nas imagens e layout estático. |
| INP | **Não medido**; o JS é pequeno e só controla idioma/nav, mas isso não substitui medição real. |
| Tempo até conteúdo | **Sem número medido**; o texto vem no HTML estático e não depende de hidratação. |

A próxima medição correta deve ser feita em produção, em mobile e desktop, registrando Lighthouse lab e CrUX field quando houver amostra. Até isso acontecer, não use uma nota de performance no portfólio.

## Top 5 — correções prontas

### 1. Reescrever o hero e separar as duas audiências

**O que mudar:** substituir a stack genérica e o CTA único por uma frase de prova e dois caminhos explícitos.

**Correção literal em português:**

```html
<p class="hero__tagline">
  Desenvolvedor full stack pleno focado em sistemas corporativos,
  SaaS e IA aplicada. Construo do banco e das APIs à interface,
  ao deploy e à operação — hoje mantenho dois produtos próprios
  e já entreguei software para cinco clientes.
</p>

<p class="hero__open">
  Aberto a posições full stack remotas e a projetos selecionados pela Kyber Tech.
</p>

<div class="hero__cta">
  <a class="btn btn--solid" href="#experiencia">Estou avaliando uma contratação</a>
  <a class="btn btn--ghost" href="#contato-cliente">Preciso de um sistema</a>
</div>
```

**Correção literal em inglês:**

```html
<p class="hero__tagline">
  Mid-level full-stack developer focused on business systems,
  SaaS and applied AI. I work from database and APIs to interface,
  deployment and operations — currently maintaining two products
  of my own and software delivered to five clients.
</p>

<p class="hero__open">
  Open to remote full-stack roles and selected projects through Kyber Tech.
</p>

<div class="hero__cta">
  <a class="btn btn--solid" href="#experiencia">I am evaluating a candidate</a>
  <a class="btn btn--ghost" href="#contato-cliente">I need a software project</a>
</div>
```

### 2. Trocar a barra de evidências por números que sustentam senioridade

**O que mudar:** remover “Escrevendo software desde 2023” e “Inglês avançado” da faixa principal. Esses dados pertencem ao currículo, não à prova central.

**Correção literal:**

```html
<ul class="evidence">
  <li><strong>2</strong> produtos próprios em produção</li>
  <li><strong>5</strong> clientes atendidos</li>
  <li><strong>1.595</strong> testes unitários no Didata</li>
  <li><strong>70</strong> ferramentas MCP no Kyber CRM</li>
</ul>
```

Versão inglesa:

```html
<ul class="evidence">
  <li><strong>2</strong> products of my own in production</li>
  <li><strong>5</strong> clients served</li>
  <li><strong>1,595</strong> unit tests in Didata</li>
  <li><strong>70</strong> MCP tools in Kyber CRM</li>
</ul>
```

### 3. Colocar um resumo executivo no topo de cada case

**O que mudar:** antes do primeiro capítulo, adicionar um bloco que responda problema, papel, decisões, prova e situação em menos de 30 segundos.

**Correção literal para o Didata:**

```html
<section class="case-summary" aria-labelledby="didata-summary">
  <h2 id="didata-summary">Em 30 segundos</h2>
  <dl>
    <div>
      <dt>Problema</dt>
      <dd>Professores repetem contexto e trabalho operacional para criar, adaptar e corrigir materiais.</dd>
    </div>
    <div>
      <dt>Meu papel</dt>
      <dd>Autor único: produto, UX, arquitetura, back-end, IA, testes, deploy e operação.</dd>
    </div>
    <div>
      <dt>Decisões centrais</dt>
      <dd>Conteúdo ancorado na BNCC, professor no loop e fallback entre providers na correção por foto.</dd>
    </div>
    <div>
      <dt>Prova técnica</dt>
      <dd>1.595 testes unitários, 111 páginas, 86 migrações e 798 commits.</dd>
    </div>
    <div>
      <dt>Situação atual</dt>
      <dd>Em produção, com plano gratuito e oferta Pro publicada em usedidata.com.br.</dd>
    </div>
  </dl>
</section>
```

No Kyber CRM, use a mesma estrutura e substitua a última linha por um resultado operacional real. Não publique “economiza tempo” sem medir. Exemplo de campo a preencher:

```html
<div>
  <dt>Resultado operacional</dt>
  <dd>
    [X] follow-ups executados por semana, [Y] minutos economizados por dia
    e [Z] ações concluídas pelo agente sem abrir o painel.
  </dd>
</div>
```

### 4. Dar ao inglês uma URL e metadados próprios

**O que mudar:** criar `/en/`, `/en/projects/didata/` e `/en/projects/kyber-crm/` com apenas conteúdo inglês. O seletor deve navegar entre URLs, não apenas ocultar spans.

**Correção literal no `<head>` da página em português:**

```html
<link rel="canonical" href="https://www.pedrolou.dev/" />
<link rel="alternate" hreflang="pt-BR" href="https://www.pedrolou.dev/" />
<link rel="alternate" hreflang="en" href="https://www.pedrolou.dev/en/" />
<link rel="alternate" hreflang="x-default" href="https://www.pedrolou.dev/" />
<meta property="og:locale" content="pt_BR" />
<meta property="og:locale:alternate" content="en_US" />
```

**Correção literal na versão inglesa:**

```html
<html lang="en">
<head>
  <title>Pedro Lourençoni Lima · Full-Stack Developer</title>
  <meta name="description"
        content="Mid-level full-stack developer building business systems, SaaS products and applied AI from architecture to production." />
  <link rel="canonical" href="https://www.pedrolou.dev/en/" />
  <link rel="alternate" hreflang="pt-BR" href="https://www.pedrolou.dev/" />
  <link rel="alternate" hreflang="en" href="https://www.pedrolou.dev/en/" />
  <meta property="og:title" content="Pedro Lourençoni Lima · Full-Stack Developer" />
  <meta property="og:description"
        content="Business systems, SaaS and applied AI — from architecture to production." />
  <meta property="og:locale" content="en_US" />
</head>
```

Até a migração, corrija os rótulos acessíveis que permanecem em português:

```html
<nav aria-label="Principal" data-label-pt="Principal" data-label-en="Primary">
```

```js
document.querySelectorAll('[data-label-pt][data-label-en]').forEach(function (el) {
  el.setAttribute('aria-label', el.getAttribute('data-label-' + lang));
});
```

### 5. Sincronizar números públicos e curar o GitHub

**O que mudar:** escolher uma fonte de verdade para todas as métricas e atualizar portfólio, case, README do perfil e README dos projetos no mesmo commit.

**Correção literal do trecho atual do README do GitHub:**

```md
### Kyber CRM
Plataforma interna usada diariamente para operação, CRM, propostas,
cobranças, follow-ups e automações da Kyber Tech.

- 70 ferramentas MCP
- 133 policies de RLS
- 29 tabelas
- painel, páginas públicas por token, servidor MCP e rotinas em cron
```

**Correção literal do status do Didata:**

```md
### Didata
Em produção em usedidata.com.br, com plano gratuito e oferta Pro publicada.
A IA gera materiais ancorados na BNCC e corrige provas por foto,
mas nenhuma nota é fechada sem confirmação do professor.
```

No GitHub, fixe apenas seis repositórios que sustentem a tese atual:

1. `portfolio`
2. `gerador-curriculo`
3. `tcc20261`
4. um repositório demonstrável de arquitetura/back-end;
5. um projeto com testes e CI;
6. um projeto open source pequeno, mas utilizável por terceiros.

Arquive, torne privados ou retire da vitrine repositórios como `rep1`, atividades isoladas e CRUDs básicos. Eles não anulam sua evolução, mas disputam atenção com o trabalho que você quer vender hoje.

## Benchmark

Os benchmarks abaixo foram avaliados pelo que está público em 5 de agosto de 2026. O objetivo não é copiar estética; é comparar clareza, prova e conversão.

### 1. [Rauno Freiberg](https://rauno.me/)

**O que faz melhor:**

- posicionamento singular em uma frase;
- o próprio site demonstra a especialidade em interação;
- praticamente não há inventário de tecnologias;
- cada elemento reforça uma única identidade profissional.

**O que falta no pedrolou.dev em comparação:** uma tese memorável. Seu site diz “full stack + SaaS + IA + agência + produto + sistemas”; Rauno faz o visitante lembrar de uma especialidade.

### 2. [Emil Kowalski](https://emilkowal.ski/)

**O que faz melhor:**

- cargo e empresas de referência aparecem imediatamente;
- projetos selecionados são demonstrações interativas, não apenas descrições;
- conteúdo e experimentos reforçam a mesma competência;
- a navegação reduz tempo até a prova.

**O que falta no pedrolou.dev em comparação:** demonstração dentro do próprio portfólio. Você explica muito bem o que construiu, mas quase tudo exige sair para outro domínio ou ler um case longo.

### 3. [Brittany Chiang](https://brittanychiang.com/)

**O que faz melhor:**

- proposta direta: cargo, qualidade de execução e acessibilidade;
- experiência em empresas reconhecíveis;
- prova externa quantificada, como instalações e estrelas;
- seleção rigorosa de projetos, sem deixar trabalhos fracos competir com os fortes.

**O que falta no pedrolou.dev em comparação:** validação externa. Seus números são testes, páginas, tabelas e commits. Faltam usuários, adoção, resultado e referências verificáveis.

### 4. [Ahmad Shadeed](https://ishadeed.com/)

**O que faz melhor:**

- frase de serviço extremamente clara;
- CTA comercial direto para agendar conversa;
- autoridade acumulada por artigos, curso, livro e newsletter;
- conteúdo técnico transforma competência em canal de aquisição.

**O que falta no pedrolou.dev em comparação:** um caminho comercial explícito. O cliente potencial só encontra a Kyber depois de percorrer uma página construída principalmente para contratação.

### 5. [Josh W. Comeau](https://www.joshwcomeau.com/)

**O que faz melhor:**

- transforma conhecimento em experiências interativas;
- possui um arquivo público de explicações profundas;
- produtos, artigos e demos apontam para a mesma reputação;
- a autoridade não depende de o visitante acreditar em uma bio.

**O que falta no pedrolou.dev em comparação:** prova recorrente e pública de raciocínio técnico. Seus dois cases são bons, mas isolados. Um pequeno conjunto de notas técnicas sobre RLS, MCP, fallback de providers e incidentes de deploy criaria uma trilha verificável.

### Síntese do benchmark

Os cinco sites fazem pelo menos uma destas coisas melhor:

1. escolhem uma tese profissional mais estreita;
2. colocam prova de terceiros acima de métricas internas;
3. deixam o trabalho demonstrar a competência;
4. oferecem um CTA alinhado a uma audiência específica;
5. constroem autoridade contínua fora da página “Sobre”.

Seu portfólio já supera muitos deles em transparência sobre decisões e falhas. O ganho agora não está em adicionar mais conteúdo, animações ou tecnologias. Está em **editar, hierarquizar e validar**.

## Plano de ação

- **Hoje (até 1h):**
  - Corrigir “39” para “70” no GitHub ou ajustar o portfólio ao número real.
  - Alinhar o status público de cobrança do Didata entre case e landing.
  - Remover “Escrevendo software desde 2023” da barra de evidências.
  - Trocar o texto do hero pela versão proposta e criar dois CTAs.
  - Corrigir `aria-label` em inglês.
  - Acrescentar cargo, empresa/projeto e link aos dois depoimentos.

- **Esta semana:**
  - Criar o resumo “Em 30 segundos” nos dois cases.
  - Separar no contato os blocos “Vagas” e “Projetos pela Kyber”.
  - Medir uma linha de base real: Lighthouse mobile/desktop, WebPageTest e CrUX quando disponível.
  - Converter `hero.webp` para AVIF, testar qualidade visual e tentar ficar abaixo de 200 KB no desktop.
  - Curar os seis repositórios fixados no GitHub e remover projetos de baixo sinal da vitrine.
  - Definir e começar a registrar métricas reais do Didata e do CRM.

- **Este mês:**
  - Publicar rotas inglesas próprias com `hreflang`, canonical e Open Graph em inglês.
  - Coletar dois depoimentos verificáveis com nome, cargo, empresa, projeto e resultado.
  - Atualizar cada case com pelo menos uma métrica de resultado, não de volume de código.
  - Adicionar uma demonstração curta do Didata e do Kyber CRM no próprio portfólio: vídeo de 30–45 segundos, fluxo interativo ou sequência de telas comentada.
  - Publicar de três a cinco notas técnicas ligadas aos cases, por exemplo: autorização com RLS, design de ferramentas MCP, fallback de visão e incidente de migração.
  - Repetir a auditoria após 30 dias e comparar conversão: cliques em currículo, LinkedIn, WhatsApp, email, Kyber e cases.

## Prioridade final

A ordem correta não é redesenhar. É:

1. eliminar inconsistências;
2. separar recrutador de cliente;
3. colocar a melhor prova no primeiro viewport;
4. transformar contagens técnicas em resultados;
5. só então otimizar SEO internacional e performance medida.

O site não precisa de mais seções. Precisa de menos ambiguidade e mais prova externa.

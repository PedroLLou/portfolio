# Auditoria final — pedrolou.dev
Data: 05/08/2026 | Nota geral: 6,5

Consolida as três auditorias de `docs/auditoria-nova/` e incorpora as decisões tomadas. Onde elas divergiam, a divergência foi resolvida. Onde uma delas estava desatualizada ou errada, está marcado.

---

## Veredito

Os dois estudos de caso são mais honestos que os de qualquer portfólio do benchmark: eles declaram o que não sabem ("números de acurácia não existem", "não há validação determinística do código citado", "o contorno continua sendo dívida, não desenho"). Nenhum dos cinco sites de referência escreve uma linha assim, e é o ativo central deste site.

O que segura é que **duas peças que o site serve contradizem o que ele afirma**: o currículo em PDF, destino do CTA principal do hero, diz que você fundou o *Didata*, nunca cita a Kyber e afirma que validou o MVP com usuários, o que o seu próprio case desmente; e o case do Didata diz "cobrança em implementação" enquanto o produto vende três planos. Quando o diferencial é honestidade verificável, contradição custa mais do que custaria em outro portfólio.

Nota 6,5: conteúdo e profundidade valem 9, execução técnica vale 8, coerência entre as peças vale 4. É a coerência que puxa a média, e ela é a mais barata de consertar.

---

## Decisões tomadas

| Assunto | Decisão | Consequência |
|---|---|---|
| Posicionamento | **Tese estreita, foco em vaga.** Kyber como link discreto | A proposta da auditoria #2, de dois CTAs no hero, está descartada. Ela contradizia o próprio benchmark dela |
| Sistemas corporativos | **É a Premium**, que já está no site | A entrada precisa ser reescrita: hoje lê como site de construtora, não como sistema interno |
| Nível | **Não declarar** | Sai a sugestão de escrever "pleno" no hero |
| Currículo PDF | **Eu escrevo o texto**, você regenera | Bloco pronto na seção de correções |
| Inglês | **Separar em `/en/`** com hreflang | Revertida a decisão anterior de manter tudo num HTML |
| Brava | **Case próprio**, a partir do repositório | Prompt de levantamento na seção de plano |
| Demonstração em vídeo | **Não por enquanto** | O roteiro que você já tem fica guardado |
| Depoimentos | **Sem cargo e link**, como você decidiu antes | Duas auditorias pedem; fica registrado como escolha, não como pendência |

---

## O que estava errado ou obsoleto nas três auditorias

Verifiquei antes de consolidar. Não faz sentido você trabalhar em cima de achado morto.

**Resolvido desde a auditoria anterior:**
- `canonical` e `og:url` apontando para `pedrolou.vercel.app` (itens 1 e 3 da anterior). **Corrigido.** As três páginas apontam para `www.pedrolou.dev`.
- O espelho `pedrolou.vercel.app` servindo versão antiga (item 2 da anterior). **Resolvido.** Ele agora responde 308 e redireciona para o domínio. Confirmei navegando: cai em `www.pedrolou.dev`, com o hero novo e o case do Didata presentes.

**Impreciso na auditoria #2:**
- "`robots.txt` e `sitemap.xml` confirmados no repositório, mas HTTP live não validado". **Validei:** os dois respondem 200 no domínio.
- "Não há versão responsiva da foto de perfil" (item 17). A `pedro.webp` tem 640px e renderiza a 280px no máximo, ou seja, já está no dobro do tamanho de exibição. `srcset` ali não traria ganho.
- A auditoria #2 se contradiz: propõe dois CTAs no hero para servir duas audiências e, no benchmark, diz que o problema do site é querer ser "full stack + SaaS + IA + agência + produto". Você escolheu a segunda leitura.

**O que nenhuma das três notou:**
- **Os dois depoimentos ficam em português na versão em inglês.** Nenhum dos blocos `.quote` tem par `data-i18n`. Um recrutador estrangeiro encontra dois parágrafos em português no meio da página.
- O botão "Currículo PT (PDF)" também não é traduzido, ao lado de "Resume EN (PDF)", que é.

---

## Onde as três concordam

Consenso é sinal forte. Estes entram sem discussão:

1. Status do Didata contradiz o produto no ar.
2. "Escrevendo software desde 2023" enfraquece o posicionamento.
3. Números conflitantes: 70 ferramentas MCP no site, 39 no README do GitHub.
4. Inglês sem URL própria nem `hreflang`.
5. Os cases medem volume de implementação, não resultado.
6. O caminho de cliente está enterrado.
7. Depoimentos sem verificação externa.
8. O perfil do GitHub enfraquece o que o portfólio constrói (`rep1`, `CRUD-Agenda`, laboratório na vitrine).
9. Não há publicação contínua.
10. `hero.webp` é pesada demais para uma imagem decorativa.

---

## Problemas consolidados

Ordenados por impacto. "Fonte" indica qual auditoria levantou; "verificado" indica o que eu confirmei diretamente.

| # | Problema | Fonte | Verificado por mim | Impacto | Esforço |
|---|---|---|---|---|---|
| 1 | Currículo diz "Fundador, **Didata**". "Kyber" aparece **zero vezes**. Lista **EduPlay**, não lista Kyber CRM nem Brava | anterior, minha | Sim, extraí o texto do PDF | Alto | 40 min |
| 2 | Currículo afirma "**Validei o MVP com os primeiros usuários**". O case do Didata diz que não há entrevista, questionário nem pesquisa de campo | anterior, minha | Sim | Alto | 10 min |
| 3 | Case do Didata diz "cobrança em implementação, sem lançamento divulgado". O produto vende **Explorar grátis, Pro R$ 29,90/mês e Institucional a partir de R$ 19,90/professor** | as três | Sim, li a página de planos | Alto | 20 min |
| 4 | Os dois depoimentos ficam em **português** no modo inglês | nenhuma | Sim | Alto | 20 min |
| 5 | README do GitHub diz **39 ferramentas MCP**, o site diz 70 | anterior, #2 | Sim, contei 70 no servidor MCP ao vivo | Alto | 5 min |
| 6 | A Premium aparece como "site, dashboard, bot e IA de notas fiscais", sem deixar claro que é **sistema corporativo interno** | as três, por ausência | Sim | Alto | 20 min |
| 7 | Inglês sem URL própria, sem `hreflang`, com `og:locale` e description só em português | as três | Sim | Alto | 4 h |
| 8 | Case do Didata **sem nenhuma captura**. O único visual do produto é a landing | minha, #2 | Sim | Alto | depende de você |
| 9 | `hero.webp` pesa **319 KB de 542 KB**: 59% da página numa imagem decorativa | minha, #2 | Sim, medido em rede | Médio | 30 min |
| 10 | Brava sem case, sem link, sem número. Único dos quatro sem verificação externa | anterior, minha | Sim | Médio | 3 h |
| 11 | "Escrevendo software desde 2023" na barra de evidências | minha, #2 | Sim | Médio | 15 min |
| 12 | "Toques por dia, teto por canal: 55" no card do CRM não significa nada fora do case | minha | Sim | Baixo | 5 min |
| 13 | **11,4 telas de rolagem** em 390px | minha | Sim, medido | Médio | 2 h |
| 14 | `aria-label` fica em português no modo inglês ("Principal", "Seções", "LinkedIn de Pedro...") | #2 | Sim | Médio | 20 min |
| 15 | Perfil do GitHub: sem link do portfólio, bio e localização vazias, `rep1` e `CRUD-Agenda` na vitrine | anterior, #2 | Sim | Médio | 20 min |
| 16 | Sem publicação contínua. Nada muda sem redesenhar o site | minha, #2 | Sim | Médio | 4 h |
| 17 | Nenhum projeto tem data | minha | Sim | Baixo | 30 min |
| 18 | `alt` irregular: "Interface do Didata" ao lado de um alt de 20 palavras no CRM | minha, anterior | Sim | Baixo | 10 min |
| 19 | `og:image` do case do Didata usa o card genérico, sem `og:image:alt` | anterior, minha | Sim | Baixo | 20 min |
| 20 | Botão "Currículo PT (PDF)" não traduzido | nenhuma | Sim | Baixo | 5 min |

**Verificado e correto, para não gerar retrabalho:** CLS medido em **0,0000**. Todas as imagens com `width`, `height` e `alt`. Hierarquia de headings sem salto nas três páginas. Um `h1` por página. `:focus-visible` com outline de 2px. Skip link. JSON-LD válido nas três. **Zero link quebrado** entre 16 destinos testados. Zero overflow horizontal em 390px e 1425px, nos dois idiomas. `robots.txt` e `sitemap.xml` em 200. Espelho da Vercel redirecionando.

**Não medi:** LCP, FCP e INP. O painel desta sessão não compõe frames e as métricas de pintura não disparam. TTFB 605 ms, DOMContentLoaded 1020 ms, load 1163 ms, 542 KB em 13 requisições. Rode PageSpeed em mobile antes de mexer em imagem.

---

## Números: o que existe e o que não existe

Você pediu para eu procurar nos repositórios e no CRM. Procurei.

**Existe e é publicável:**

- **"Do primeiro contato ao site no ar em 4 dias"** — registro do portfólio da Kyber para a Infinita Saúde. É o único **resultado** que encontrei em qualquer lugar: não é volume, é velocidade de entrega, e é exatamente o que as três auditorias pediram.
- **Didata em produção com plano pago.** Verifiquei a página de planos. Isso muda "cobrança em implementação" de promessa para fato.
- **70 ferramentas MCP**, contadas no servidor ao vivo. **133 policies, 29 tabelas, 32 migrations**, conferidas no repositório.
- **1.595 testes unitários em 152 arquivos** no Didata, do levantamento do próprio repositório.

**Não existe, e o arquivo final não inventa:**

- **Nenhum número de uso do Didata.** Não há contagem de professores ativos, materiais gerados, escolas ou assinantes no repositório, e o banco de produção não é acessível daqui. O `docs/custos-didata.md` é **estimativa de planejamento**, não medição: o próprio documento diz "estimativa de ordem de grandeza" e que os números de IA "têm a maior incerteza". Não serve como prova.
- **Nenhum resultado operacional do CRM digno de publicar.** Consultei o MCP: 213 leads, 190 ativos, 5 clientes, 7 etapas de funil. As propostas cadastradas estão **todas em rascunho, nenhuma aceita pelo sistema**, e não há chamados. Publicar "8 propostas" sugeriria um fluxo que ainda não fechou pelo sistema.
- **Não publique** MRR de R$ 956, ticket médio de R$ 191 nem conversão de 2%. São dados comerciais sensíveis e, isolados e sem o contexto de que a empresa tem meses de vida, jogam contra.

**Detalhe que vale virar frase no case:** o Didata **já tem o medidor de custo de Vision implementado** em `/admin/metricas`, e o CRM tem a instrumentação de divergência. Ou seja, a ausência de número não é descuido, é uma escolha de medir em uso em vez de publicar estimativa. Diga isso: é mais forte que qualquer número pequeno.

---

## Correções prontas

### 1. Currículo em PDF

Você regenera com o `gerador-curriculo`. Este é o conteúdo.

**Substitua o bloco de experiência atual** ("Fundador e Desenvolvedor Full Stack, Didata · mar/2026 a atual") **por:**

> **Fundador e Desenvolvedor Full Stack, Kyber Tech** · mar/2026 a atual · remoto
> Empresa própria de software: produtos próprios e entrega para cliente.
> • **Didata** (usedidata.com.br), SaaS com IA para professores, em produção com plano pago. Next.js, TypeScript, PostgreSQL/Prisma e Vision para correção de prova por foto. 1.595 testes unitários e CI que barra rota de IA sem reserva de cota.
> • **Kyber CRM**, sistema interno em uso diário. Um app Next.js servindo painel, servidor MCP de 70 ferramentas, páginas públicas por token e rotinas em cron, com 133 policies de RLS sobre 29 tabelas.
> • Cinco sites de cliente entregues em padrão próprio: HTML estático, WebP, canonical, Open Graph, JSON-LD e sitemap, com o domínio registrado no nome do cliente. Um deles do primeiro contato ao ar em quatro dias.

**Reescreva a entrada da Premium** para deixar explícito que é sistema corporativo, não site:

> **Desenvolvedor, Premium Construções e Serviços** · ago/2025 a atual · Goiânia, PJ
> Sistemas internos de uma construtora de obras públicas.
> • Dashboard administrativo usado pela equipe, em React e Node.js com TypeScript.
> • Sistema com IA que lê notas fiscais e processa cerca de 120 por mês, integrando APIs.
> • Bot de WhatsApp para processos internos, e o site institucional da concepção ao deploy.

**Troque a linha que o seu próprio case desmente:**

> ~~Validei o MVP com os primeiros usuários e priorizei o roadmap pelo feedback.~~

> Instrumentei a divergência entre professor e IA por questão e por faixa de confiança, para medir acerto em uso, em vez de publicar acurácia sem conjunto de teste rotulado.

**E ainda:** trocar EduPlay por Kyber CRM na seção de projetos, e incluir as certificações da Anthropic (Claude Code e MCP) ao lado da Microsoft.

---

### 2. Status do Didata

Em `projetos/didata.html`, no `<dd>` de Situação:

```html
<dd>
  <span data-i18n="pt">Em produção, com plano gratuito e pago</span>
  <span data-i18n="en" lang="en">In production, with a free and a paid plan</span>
</dd>
```

E na seção VI, substitua a ressalva por:

> Números de uso não existem, e este case não publica nenhum. O produto está no ar com plano gratuito e Pro, mas não teve lançamento divulgado, e não há no repositório contagem de professores ativos, materiais gerados ou receita. O medidor de custo de Vision e a instrumentação de divergência já estão implementados: a escolha é medir em uso, não publicar estimativa.

Coloque **data de atualização** no rodapé dos dois cases. Case sem data envelhece em silêncio, e foi exatamente o que aconteceu aqui.

---

### 3. Depoimentos e rótulos em inglês

Os dois blocos `.quote` não têm par de idioma:

```html
<blockquote>
  <p>
    <span data-i18n="pt">“O Pedro, da Kyber Tech, entendeu na primeira conversa o que a gente precisava passar, seriedade e confiança, e entregou um site limpo, rápido e profissional, que hoje é nossa referência ao falar com órgãos públicos e parceiros. O melhor foi tratar tudo direto com quem desenvolve, sem intermediário e dentro do prazo.”</span>
    <span data-i18n="en" lang="en">“Pedro, from Kyber Tech, understood in the first conversation what we needed to convey, seriousness and trust, and delivered a clean, fast, professional site that is now our reference when talking to public bodies and partners. The best part was dealing directly with the person who builds it, with no middleman and on schedule.”</span>
  </p>
</blockquote>
```

O mesmo para o do Brava, e para o botão do currículo:

```html
<span data-i18n="pt">Currículo PT (PDF)</span><span data-i18n="en" lang="en">Resume PT (PDF)</span>
```

Os `aria-label` também ficam em português no modo inglês. Como o site vai para `/en/`, isso se resolve sozinho na migração: cada página passa a ter o rótulo no seu idioma, sem JavaScript trocando atributo.

---

### 4. Barra de evidências e figura do CRM

"Escrevendo software desde 2023" é o único indicador de tempo visível e é o que menos ajuda.

```html
<ul class="evidence">
  <li>Dois produtos próprios em produção</li>
  <li>Cinco clientes entregues</li>
  <li>1.595 testes unitários no Didata</li>
  <li>Do primeiro contato ao site no ar em 4 dias</li>
</ul>
```

O quarto item é o único **resultado** que você tem documentado. Ele vale mais que "inglês avançado", que pertence ao currículo.

E no card do CRM, troque a quarta figura de "55 toques por dia" para:

```html
<dt class="figure__label">Leads geridos</dt>
<dd class="figure__value">213</dd>
```

---

### 5. Peso do hero

319 KB de 542 KB, para fundo decorativo. Provável elemento de LCP.

```powershell
ffmpeg -i imagens\hero.jpeg -vf "scale=1536:-2:flags=lanczos" `
  -c:v libwebp -quality 60 -compression_level 6 uploads\hero.webp
```

Fundo desfocado atrás de texto tolera q=60 sem diferença perceptível. Deve cair para uns 120 KB. Meça no PageSpeed antes e depois: eu não consegui medir LCP, então afirmo o peso, não o ganho.

---

## Benchmark

Abri e li os cinco. Onde a observação vem de leitura direta, está afirmada.

| Portfólio | Link | O que faz melhor |
|---|---|---|
| **Brittany Chiang** | https://brittanychiang.com | Prova externa em cada projeto. O tema Halcyon exibe "100k+ Installs" do marketplace do VS Code: número que um terceiro confere. Todos os seus números são auditáveis só por você. Ela também separa **Writing** de **Projects** |
| **Lee Robinson** | https://leerob.com | Resolve o teste dos cinco segundos numa frase: *"I'm an engineer and writer. I work on ML at Cursor, helping improve model behavior."* Empresa, função e especialidade em quinze palavras. A home dele abre com escrita, não com grade de projetos |
| **Josh W. Comeau** | https://www.joshwcomeau.com | Demonstração interativa dentro do artigo ("An Interactive Guide to Flexbox"). Vende três cursos a partir do mesmo conteúdo. Os seus cases explicam mecanismos que pediriam isso, mas você optou por não fazer demo agora |
| **Emil Kowalski** | https://emilkowal.ski | Escopo estreito ("Design Engineer", time Web da Linear) e produtos que servem de prova: Sonner e Vaul são componentes que outras pessoas instalam. Tem newsletter |
| **Rauno Freiberg** | https://rauno.me | Seções **Craft** e **Field Notes**, com arquivo por ano. Publicar não custa quatro mil palavras: são notas curtas e contínuas |

**O padrão que os cinco têm e você não:** um lugar onde algo novo aparece sem redesenhar o site.

**O que você faz melhor que os cinco, sem exceção:** admitir limite. Nenhum deles escreve "números de acurácia não existem" ou "o contorno continua sendo dívida, não desenho". Para um tech lead avaliando contratação, é o sinal mais forte do site. E hoje ele está na seção VI de uma página que o visitante talvez nunca abra.

---

## Plano de ação

### Hoje (até 1h)
1. Linha do MVP no currículo (#2). Uma frase, e é a que mais custa.
2. Status do Didata, cabeçalho e seção VI (#3).
3. Traduzir os dois depoimentos e o botão do currículo (#4, #20).
4. Barra de evidências e figura do CRM (#11, #12).
5. `39` para `70` no README do GitHub, mais link do portfólio, bio e localização (#5, #15).
6. `alt` do Didata no nível do que você já escreveu para o CRM (#18).

### Esta semana
7. Regenerar os dois PDFs com o bloco da seção de correções (#1, #6).
8. Reescrever a entrada da Premium no site para ler como sistema corporativo (#6). É a mudança de maior impacto para vaga, porque é a única experiência de sistema interno de terceiro que você tem.
9. Recomprimir a `hero.webp` e medir no PageSpeed em mobile (#9).
10. Datas em cada projeto (#17).
11. Capturas do Didata por dentro: a tela de correção e a de divergência resolvem o case sozinhas (#8).

### Este mês
12. **Inglês em `/en/`** com `hreflang`, canonical e Open Graph próprios (#7). Decisão tomada. Isso também resolve os `aria-label` (#14) e o `og` em inglês.
13. **Case do Brava**, a partir do repositório (#10). O `brava-dashboard` tem `README.md`, `PLANO.md`, `decisoes.md`, `dashboard.md`, `CHECKLIST.md` e `PROXIMOS_PASSOS.md`: material suficiente. O `brava_rewards` está vazio, então a parte de Lua terá que sair de `brava-server`. Use o mesmo formato do prompt do Didata, e peça explicitamente **o que foi seu**, já que foi time de três: essa é a única pergunta que o case precisa responder e que nenhum outro projeto seu responde.
14. Encurtar a home. Onze telas em mobile é demais. Mova a carteira e o índice para `/projetos`, deixando três projetos na home (#13).
15. Abrir `/notas`, publicação curta e datada (#16). Quatro assuntos já estão escritos dentro dos cases: o pooler do Supabase travando o `migrate deploy`, o limite de 1 MB da Server Action, RLS no CRM contra autorização na aplicação no Didata, e por que a IA sugere mas não confirma.
16. Curar o GitHub: fixar `portfolio`, `gerador-curriculo` e `tcc20261`; arquivar `rep1`, `CRUD-Agenda` e `lab-git-colaborativo-cmp2304` (#15).

### Deliberadamente fora
- **Declarar nível no site.** Sua decisão.
- **Dois CTAs no hero.** A tese estreita venceu.
- **Demonstração em vídeo.** O roteiro fica guardado no repositório do Didata.
- **Cargo e link nos depoimentos.** Duas auditorias pedem; você decidiu manter como está.

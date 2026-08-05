# Auditoria — pedrolou.dev
Data: 05/08/2026 | Nota geral: 6,5

## Veredito

Os dois estudos de caso são melhores que os de qualquer portfólio da lista de benchmark: eles admitem o que não sabem ("números de acurácia não existem", "não há validação determinística do código citado", "o contorno continua sendo dívida, não desenho"). Isso é raro e é o ativo central do site.

O que segura o site é que **duas peças que ele mesmo serve contradizem o que ele afirma**: o currículo em PDF, que é o destino do CTA principal do hero, diz que você fundou o *Didata* e nunca cita a Kyber; e o case do Didata diz "cobrança em implementação, sem lançamento divulgado" enquanto o produto está com três planos públicos e botão de assinar. Quando o diferencial do site é honestidade verificável, contradição custa mais do que custaria em outro portfólio.

Nota 6,5: conteúdo e profundidade técnica valem 9; execução técnica (CLS zero, contraste AA, semântica limpa) vale 8; coerência entre as peças vale 4, e é ela que puxa a média.

---

## O que eu não consegui medir

Sou obrigado a declarar isto porque metade das auditorias de performance por aí reporta número que não mediu.

- **LCP, FCP e INP: não medi.** O painel de navegador desta sessão não compõe frames, então as métricas de pintura nunca disparam. `first-contentful-paint` e `largest-contentful-paint` voltaram `0`. Todo número de performance abaixo é de rede e de layout, que são medíveis sem pintura.
- **Não vi o site renderizado.** Screenshot falha pelo mesmo motivo. Julguei layout por geometria medida (posição, largura, sobreposição, contraste calculado), não a olho.
- **LinkedIn:** o link retornou `0` na verificação porque o LinkedIn bloqueia requisição fora de navegador. O formato da URL está correto, mas não confirmei que o perfil abre.

**O que eu verifiquei de fato:** as três páginas em `www.pedrolou.dev` em 1425px e 390px, nos dois idiomas; `robots.txt`, `sitemap.xml`, os dois PDFs de currículo (extraí o texto), `usedidata.com.br`, os cinco sites de cliente, os três repositórios linkados, o espelho `pedrolou.vercel.app`, e cinco portfólios de referência.

---

## Problemas encontrados

| # | Problema | Onde | Por que importa | Impacto | Esforço |
|---|----------|------|-----------------|---------|---------|
| 1 | O currículo em PDF diz "Fundador e Desenvolvedor Full Stack, **Didata**". A palavra "Kyber" aparece **zero vezes** no PDF; o site diz "Fundador, Kyber Tech" | `uploads/curriculo-pt.pdf`, destino do CTA principal do hero | O recrutador baixa o PDF pelo botão mais destacado da página e lê outra história sobre a mesma empresa. É a contradição mais fácil de notar e a mais cara | Alto | 40 min |
| 2 | O PDF diz "**Validei o MVP com os primeiros usuários e priorizei o roadmap pelo feedback**". O seu case do Didata diz que não há pesquisa de campo, entrevista nem questionário, e que o beta foi desativado | PDF vs `/projetos/didata` seção I | O site inteiro é vendido na honestidade. Uma linha inflada no PDF derruba a credibilidade das outras quarenta | Alto | 10 min |
| 3 | O case do Didata diz "cobrança em implementação" e "nunca foi divulgado". O `usedidata.com.br` está com **Explorar (grátis), Didata Pro R$ 29,90/mês e Institucional a partir de R$ 19,90/professor**, com botão "Assinar por R$ 29,90/mês" | `/projetos/didata`, cabeçalho e seção VI | Quem clica em "Ver o Didata ao vivo" logo depois de ler que o produto não foi lançado encontra um produto vendendo | Alto | 20 min |
| 4 | O PDF lista **EduPlay** (que você tirou do site) e **não** lista Kyber CRM nem Brava. "CRM" e "Brava" aparecem zero vezes | PDF vs site | O seu trabalho mais forte fica de fora justo da peça que circula sozinha por e-mail | Alto | junto com #1 |
| 5 | Os **dois depoimentos ficam em português** na versão em inglês. Nenhum dos dois tem par `data-i18n` | Home, seção II, blocos `.quote` | Um recrutador de fora lê a página em inglês e encontra dois parágrafos em português. É o tipo de descuido que anula o esforço de ser bilíngue | Alto | 20 min |
| 6 | O site não menciona **nenhuma experiência com sistemas corporativos**, que é como você descreve o seu trabalho principal. A seção III tem Kyber (fundador), Premium (PJ), freelance de FiveM e voluntariado | `/#experiencia` | Para uma vaga pleno, essa é a experiência que mais pesa e é a única ausente. Hoje o site apresenta um perfil de fundador solo | Alto | 30 min |
| 7 | A `hero.webp` pesa **319 KB de um total de 542 KB**: 59% do peso da página em uma única imagem decorativa de fundo | Home | É o maior arquivo do site e não carrega informação nenhuma. Provavelmente é o seu elemento de LCP | Médio | 30 min |
| 8 | As **oito fontes** baixam na primeira visita, cerca de 190 KB | Todas as páginas | Auto-hospedar tirou duas conexões do caminho crítico, mas trouxe o peso para a origem. Nove faces é muita variação para um site de quatro seções | Médio | 1 h |
| 9 | **11,4 telas de rolagem** em 390px na home | Home, mobile | A carteira de clientes, os depoimentos e o índice ficam depois da oitava tela. Quase ninguém chega lá | Médio | 2 h |
| 10 | **Brava.gg não tem case, link nem número.** É o único dos quatro projetos "em produção" sem nenhuma verificação externa | Home, seção II | Ocupa espaço de projeto principal com conteúdo de item secundário. E é o único com trabalho em equipe, que é justo o que falta provar | Médio | 3 h |
| 11 | O card do Kyber CRM mostra "**Toques por dia, teto por canal: 55**" | Home, faixa do CRM | Fora do contexto do case, o número não significa nada para quem lê oito segundos. Perde para "213 leads geridos", que eu tinha recomendado | Baixo | 5 min |
| 12 | A barra de evidências diz "**Escrevendo software desde 2023**" | Home, abaixo do hero | É o único indicador de tempo visível e trabalha contra um posicionamento pleno. Três anos lido isoladamente sugere júnior | Médio | 15 min |
| 13 | O **case do Didata não tem nenhuma captura**. O único visual do produto na home é a landing page | `/projetos/didata` | Landing prova que você sabe fazer landing. O que prova o SaaS é a tela de correção com os chips de confiança | Alto | depende de você |
| 14 | O botão "**Currículo PT (PDF)**" continua em português na versão em inglês | Home, seção IV | Detalhe, mas está ao lado de "Resume EN (PDF)", que foi traduzido. A inconsistência fica óbvia | Baixo | 5 min |
| 15 | `alt` irregular: "Central do dia do Kyber CRM: navegação com treze módulos, cinco indicadores no topo..." convive com "**Interface do Didata**" | Home | O site é vendido no detalhe. Esse é barato de acertar | Baixo | 10 min |
| 16 | **Nenhum projeto tem data.** Não há como saber se o Brava é de 2024 ou de ontem | Home, seção II | Recrutador calcula ritmo por data. Sem elas, o portfólio parece uma foto sem eixo do tempo | Baixo | 30 min |
| 17 | O caminho de cliente é **uma linha no fim da seção de contato** | `/#contato` | Você pediu que o site sirva duas audiências. Hoje ele serve bem a uma e menciona a outra | Médio | 2 h |
| 18 | **Não há publicação contínua.** Nenhuma data, nenhum feed, nada que mude sem redesenhar o site | Site inteiro | Os cinco portfólios do benchmark têm. É o que separa portfólio de página estática | Médio | 4 h |
| 19 | O `og:image` do case do Didata usa o **card genérico**, sem `og:image:alt`; o do Kyber CRM tem imagem própria e alt | `/projetos/didata` | Os cases são a peça mais compartilhável do site e um deles compartilha genérico | Baixo | 20 min |

**Verificado e correto, para não gerar retrabalho:** `canonical`, `og:url` e sitemap apontam para `www.pedrolou.dev` nas três páginas. O espelho `pedrolou.vercel.app` **já redireciona** para o domínio. `robots.txt` e `sitemap.xml` respondem 200. **CLS medido: 0,0000.** Todas as imagens têm `width`, `height` e `alt`. Hierarquia de headings sem salto nas três páginas. `:focus-visible` com outline de 2px. Skip link presente. Um `h1` por página. JSON-LD válido nas três. Nenhum link quebrado entre os 16 externos testados. Zero overflow horizontal em 390px e 1425px, nos dois idiomas.

---

## Top 5 — correções prontas

### 1. Currículo em PDF alinhado ao site

O PDF é o destino do botão mais destacado do hero e conta outra história. Reescreva o bloco de experiência.

**Substitua o bloco atual** ("Fundador e Desenvolvedor Full Stack, Didata · mar/2026 a atual") **por:**

> **Fundador e Desenvolvedor Full Stack, Kyber Tech** · mar/2026 a atual · remoto
> Empresa própria de software. Produtos próprios e entrega para cliente.
> • **Didata** (usedidata.com.br), SaaS com IA para professores, em produção com plano pago. Next.js, TypeScript, PostgreSQL/Prisma e Vision para correção de prova por foto. 1.595 testes unitários e CI que barra rota de IA sem reserva de cota.
> • **Kyber CRM**, sistema interno em uso diário. Um app Next.js servindo painel, servidor MCP de 70 ferramentas, páginas públicas por token e rotinas em cron, com 133 policies de RLS sobre 29 tabelas.
> • Cinco sites de cliente entregues em padrão próprio: HTML estático, WebP, canonical, Open Graph, JSON-LD e sitemap, com o domínio no nome do cliente.

**E troque esta linha, que o seu próprio case desmente:**

> ~~Validei o MVP com os primeiros usuários e priorizei o roadmap pelo feedback.~~

> Instrumentei a divergência entre professor e IA por questão e por faixa de confiança, para medir acerto em uso, em vez de publicar acurácia sem conjunto de teste rotulado.

**Troque EduPlay por Kyber CRM** na seção de projetos, e inclua as certificações da Anthropic ao lado da Microsoft.

---

### 2. Status do Didata: parar de contradizer o produto no ar

O cabeçalho do case diz que a cobrança está em implementação. O produto tem três planos e botão de assinar.

**No `<dd>` de Situação, em `projetos/didata.html`:**

```html
<dd>
  <span data-i18n="pt">Em produção, com plano pago</span>
  <span data-i18n="en" lang="en">In production, with a paid plan</span>
</dd>
```

**E na seção VI, substitua a ressalva atual por:**

> Números de uso não existem, e este case não publica nenhum. O produto está no ar com plano gratuito e pago, mas não teve lançamento divulgado, e não há no repositório contagem de professores ativos, materiais gerados ou receita. O documento de produto do Didata proíbe prova social fabricada, e a mesma regra vale aqui.

Coloque **data de atualização** no rodapé dos dois cases. Case sem data envelhece em silêncio, e foi exatamente isso que aconteceu aqui.

---

### 3. Depoimentos em inglês

Os dois blocos `.quote` não têm par de idioma. Envolva o texto e acrescente a tradução:

```html
<blockquote>
  <p>
    <span data-i18n="pt">“O Pedro, da Kyber Tech, entendeu na primeira conversa o que a gente precisava passar, seriedade e confiança, e entregou um site limpo, rápido e profissional, que hoje é nossa referência ao falar com órgãos públicos e parceiros. O melhor foi tratar tudo direto com quem desenvolve, sem intermediário e dentro do prazo.”</span>
    <span data-i18n="en" lang="en">“Pedro, from Kyber Tech, understood in the first conversation what we needed to convey, seriousness and trust, and delivered a clean, fast, professional site that is now our reference when talking to public bodies and partners. The best part was dealing directly with the person who builds it, with no middleman and on schedule.”</span>
  </p>
</blockquote>
```

O mesmo para o do Brava. Mantenha o original em português visível na versão PT: traduzir depoimento é normal, apagar o original não.

E o botão do currículo:

```html
<a class="btn btn--outline" href="uploads/curriculo-pt.pdf" download>
  <span data-i18n="pt">Currículo PT (PDF)</span><span data-i18n="en" lang="en">Resume PT (PDF)</span>
</a>
```

---

### 4. Barra de evidências: trocar tempo por volume

"Escrevendo software desde 2023" é o único número de tempo visível e é o que menos ajuda num posicionamento pleno.

**Substitua os quatro itens por:**

> Dois produtos próprios em produção · Cinco clientes entregues · 1.595 testes unitários no Didata · Inglês avançado

E no card do Kyber CRM, troque a quarta figura:

```html
<div class="figure">
  <dt class="figure__label"><span data-i18n="pt">Leads geridos</span><span data-i18n="en" lang="en">Leads managed</span></dt>
  <dd class="figure__value">213</dd>
</div>
```

"213 leads geridos" comunica escala em oito segundos. "55 toques por dia, teto por canal" precisa de um parágrafo para fazer sentido, e esse parágrafo só existe dentro do case.

---

### 5. Peso do hero

`hero.webp` são 319 KB de 542 KB da página, para uma imagem de fundo decorativa. Provavelmente é o seu LCP.

Três opções, da mais barata para a melhor:

1. **Baixar a qualidade.** Fundo desfocado atrás de texto tolera q=60 sem diferença perceptível. Deve cair para uns 120 KB.
2. **Gerar uma variante de 1280px** e servir a de 1536px só acima disso. Hoje só existe o corte em 900px para mobile.
3. **Trocar por gradiente ou textura em CSS.** O véu de papel já cobre o centro; a foto contribui pouco e custa 59% do peso.

```powershell
# opção 1, com o ffmpeg que você já tem
ffmpeg -i imagens\hero.jpeg -vf "scale=1536:-2:flags=lanczos" `
  -c:v libwebp -quality 60 -compression_level 6 uploads\hero.webp
```

Meça antes e depois com o PageSpeed Insights em mobile. Eu não consegui medir LCP nesta sessão, então não afirmo o ganho, só o peso.

---

## Benchmark

Abri e li os cinco. Onde a observação vem de leitura de página, está afirmada; onde não abri em profundidade, não afirmei.

| Portfólio | Link | O que faz melhor que o seu |
|---|---|---|
| **Brittany Chiang** | https://brittanychiang.com | Prova externa em cada projeto. O tema Halcyon exibe "100k+ Installs" do marketplace do VS Code: número que um terceiro pode conferir. Todos os seus números (70 ferramentas, 133 policies, 1.595 testes) são auditáveis só por você. Ela também separa **Writing** de **Projects**, e você mistura os dois sob "Projetos" |
| **Lee Robinson** | https://leerob.com | Resolve o teste dos cinco segundos numa frase: *"I'm an engineer and writer. I work on ML at Cursor, helping improve model behavior."* Empresa, função e especialidade em quinze palavras. O seu hero leva duas frases e não cita empresa nenhuma além da sua. E a home dele abre com **escrita**, não com grade de projetos |
| **Josh W. Comeau** | https://www.joshwcomeau.com | Demonstração interativa dentro do artigo ("An Interactive Guide to Flexbox"). Os seus cases explicam mecanismos que pedem exatamente isso, a fila de correção por faixa de confiança e a resolução da faixa BNCC, e hoje são prosa. Ele também vende três cursos próprios a partir do mesmo conteúdo |
| **Emil Kowalski** | https://emilkowal.ski | Escopo estreito e defensável ("Design Engineer", time Web da Linear) mais produtos próprios que servem de prova: Sonner e Vaul são componentes que outras pessoas instalam. Tem newsletter. Você tem dois produtos e nenhum canal de retorno |
| **Rauno Freiberg** | https://rauno.me | Seção **Craft** e **Field Notes**, com arquivo por ano (2023, 2022). Publicar não custa quatro mil palavras: são notas curtas e contínuas. O seu site tem duas peças longas e nada entre elas |

**O padrão que os cinco compartilham e o seu não tem:** um lugar onde algo novo aparece sem redesenhar o site. Quatro dos cinco têm produto próprio ou conteúdo monetizado; você tem dois produtos e não capitaliza nenhum em audiência.

**O que você faz melhor que os cinco, sem exceção:** admitir limite. "Números de acurácia não existem", "não há validação determinística do código citado contra base oficial", "o contorno continua sendo dívida, não desenho". Nenhum dos cinco escreve uma linha assim. Para um tech lead avaliando contratação, esse é o sinal mais forte do site inteiro. E ele está na seção VI de uma página que o visitante talvez nunca abra.

---

## Plano de ação

### Hoje (até 1h)
1. Corrigir a linha do MVP no PDF (#2). É uma frase e é a que mais custa.
2. Corrigir o status do Didata no case, cabeçalho e seção VI (#3).
3. Traduzir os dois depoimentos e o botão do currículo (#5, #14).
4. Trocar a barra de evidências e a quarta figura do CRM (#11, #12).
5. Padronizar o `alt` do Didata no nível do que você já escreveu para o CRM (#15).

### Esta semana
6. Reescrever o bloco de experiência dos dois PDFs: Kyber Tech como empresa, Kyber CRM no lugar do EduPlay, certificações da Anthropic (#1, #4).
7. Decidir sobre a experiência corporativa. Se ela existe, entra na seção III e no topo do PDF, e é a mudança de maior impacto para vaga pleno (#6).
8. Capturas do Didata por dentro: a tela de correção e a de divergência resolvem o case sozinhas (#13).
9. Recomprimir a `hero.webp` e medir no PageSpeed em mobile, antes e depois (#7).
10. Datas em cada projeto (#16).

### Este mês
11. Encurtar a home. Onze telas em mobile é demais. Mova a carteira e o índice para uma página `/projetos`, deixando três projetos na home (#9).
12. Case do Brava, ou tirar da grade principal. Hoje ele é o único sem verificação externa (#10).
13. Abrir `/notas`, publicação curta e datada. Quatro assuntos já estão escritos dentro dos cases: o pooler do Supabase travando o `migrate deploy`, o limite de 1 MB da Server Action, RLS no CRM contra autorização na aplicação no Didata, e por que a IA sugere mas não confirma (#18).
14. Resolver a audiência dupla (#17): ou volta um bloco curto de serviços apontando para a Kyber, ou o site assume que é só para contratação. Hoje está no meio.
15. Reduzir as nove faces de fonte. Spectral 700 aparece uma vez na página inteira (#8).

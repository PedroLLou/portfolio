# Análise do Portfólio — Pedro Lourençoni

## Diagnóstico geral

Seu portfólio já está **bem acima da média de um estudante ou desenvolvedor júnior**. Ele apresenta produtos reais, experiência comercial, decisões arquiteturais concretas, clientes, depoimentos, links ao vivo e um estudo de caso tecnicamente forte. O problema principal não é falta de conteúdo nem falta de competência.

O problema é que o site tenta ser três coisas ao mesmo tempo:

1. Portfólio para recrutadores.
2. Página pessoal de fundador.
3. Landing page comercial da Kyber.

Isso dilui seu posicionamento. Na primeira dobra você se apresenta como desenvolvedor e fundador; depois oferece desenvolvimento de SaaS, sites, automação, dashboards e UX/UI, além de explicar seu processo comercial. Para uma empresa procurando um desenvolvedor, parte da página parece uma agência; para um possível cliente, o site pessoal compete com o próprio site da Kyber.

Minha recomendação central é: **transforme o portfólio em uma prova de competência para vagas e oportunidades profissionais. A Kyber deve concentrar a venda de serviços.**

---

## O que está funcionando muito bem

### 1. Você mostra produção, não exercícios

A frase **“Produtos em produção, não protótipos”** é provavelmente a melhor ideia do site. Ela o diferencia imediatamente de portfólios compostos por clones de Netflix, calculadoras e projetos de tutorial.

Didata, Kyber CRM, Brava e os trabalhos para clientes demonstram que você consegue lidar com requisitos, operação, manutenção, usuários e restrições reais.

### 2. O estudo de caso do Kyber CRM é excelente

O case explica:

- O problema operacional.
- O modelo com quatro superfícies.
- Identidade por token.
- `AsyncLocalStorage`.
- RLS no banco.
- Automação com supervisão humana.
- Trade-offs operacionais e legais.
- Divisão de receita e multiusuário.

Isso é muito mais convincente do que apenas listar tecnologias. A seção que explica por que o sistema não envia mensagens automaticamente demonstra julgamento de engenharia, não só capacidade de implementação.

### 3. Seu posicionamento técnico é específico

Você não diz apenas “trabalho com IA”. Você mostra MCP, RAG, RLS, cron, autorização, multiusuário, geração, revisão e operação real. Isso aumenta bastante sua credibilidade técnica.

### 4. A identidade editorial é diferenciada

A combinação de Spectral, IBM Plex, numeração romana e linguagem editorial evita a aparência genérica de “portfólio feito com template de desenvolvedor”. Eu manteria essa direção visual.

O cuidado necessário é preservar a identidade sem transformar a página em um documento longo demais para ser escaneado rapidamente.

---

# Melhorias prioritárias

## 1. Escolha um público principal

Hoje um recrutador pode ficar com estas dúvidas:

- Pedro procura emprego ou clientes?
- Ele pretende trabalhar em uma empresa ou se dedicar integralmente à Kyber?
- A prioridade dele é engenharia, consultoria, produto ou agência?
- Ele está se candidatando como full stack, product engineer ou especialista em IA?

A solução não é esconder a Kyber. Ela é uma das suas melhores experiências. A solução é mudar a hierarquia:

> **Pedro é um desenvolvedor Full Stack e construtor de produtos. A Kyber é a empresa por meio da qual ele colocou isso em prática.**

Remova da página principal ou reduza fortemente:

- “O que eu construo para empresas”.
- Lista de cinco serviços.
- Processo comercial de conversa, proposta, produção e lançamento.

Esse conteúdo pertence ao site da Kyber. No portfólio, poderia aparecer apenas um link discreto:

> Precisa contratar um projeto? Conheça a Kyber Tech.

Isso deixa o site pessoal focado em engenharia, carreira e projetos.

---

## 2. Reescreva a hero para comunicar sua especialidade

A hero atual é boa, mas ainda genérica:

> Desenvolvedor full stack e fundador da Kyber Tech. Do problema ao produto em produção.

“Do problema ao produto” é uma boa mensagem, mas não explica rapidamente o tipo de produto que você sabe construir.

### Sugestão orientada a vagas

**Título**

> Desenvolvedor Full Stack especializado em SaaS e IA aplicada.

**Descrição**

> Construo produtos web de ponta a ponta, do banco de dados e APIs ao frontend, deploy e operação. Criei o Didata e o Kyber CRM, dois sistemas usados em produção.

**Linha de contexto**

> React · Next.js · Node.js · TypeScript · PostgreSQL · IA

**CTAs**

> Ver projetos em produção  
> Baixar currículo

**Linha adicional, caso esteja buscando oportunidades**

> Goiânia, Brasil · Remoto ou híbrido · Aberto a oportunidades Full Stack

A Kyber continuaria aparecendo logo abaixo, no histórico profissional e nos projetos, sem dominar a mensagem principal.

---

## 3. Encurte a homepage

Sua página possui conteúdo forte, mas tenta mostrar quase tudo nela. Para recrutadores, o ideal é uma página que permita entender seu perfil em poucos segundos e aprofundar apenas onde houver interesse.

### Estrutura recomendada

1. **Hero**
2. **Barra curta de evidências**
   - Produtos em produção
   - Clientes atendidos
   - Experiência desde 2023
   - Inglês avançado
3. **Três projetos principais**
   - Didata
   - Kyber CRM
   - Brava ou Premium
4. **Experiência profissional resumida**
5. **Sobre e stack compactos**
6. **Contato**
7. **Link para todos os projetos e estudos de caso**

As descrições completas, decisões arquiteturais, métricas e imagens adicionais devem ficar nas páginas individuais dos projetos.

---

## 4. Crie um estudo de caso completo do Didata

O Didata é apresentado como seu produto principal, mas só possui link para o site ao vivo. Já o Kyber CRM, que é privado, recebe um estudo de caso completo.

Essa hierarquia deveria ser invertida ou pelo menos equilibrada.

O case do Didata deveria mostrar:

- Como você identificou o problema dos professores.
- Como decidiu trabalhar por turma sem exigir cadastro individual de alunos.
- Arquitetura geral.
- Geração e persistência dos materiais.
- Uso de OpenAI e Anthropic.
- Como funciona a correção por imagem.
- Como você reduz alucinações.
- Fluxo de revisão humana.
- Multiusuário e isolamento de dados.
- Exportações PDF, DOCX e PPTX.
- Cobrança, limites de uso e custos de IA.
- Decisões tomadas depois do feedback dos professores.
- Resultados de uso, mesmo que ainda sejam pequenos.

O próprio produto atual já possui uma proposta muito mais madura do que a imagem usada no portfólio. A captura mostrada no portfólio ainda usa a hero antiga, enquanto o site atual posiciona o Didata como uma IA que conhece cada turma, cobre o ciclo de planejamento, avaliação, correção e replanejamento.

### Troque a imagem principal

Não use como principal uma captura da landing page.

Mostre o produto:

- Dashboard de turmas.
- Geração de material.
- Correção por foto.
- Resultado ou relatório.
- Uma pequena arquitetura visual.

Uma landing page prova que você sabe criar uma landing page. Uma interface interna prova que você construiu o SaaS.

---

## 5. Substitua métricas de esforço por métricas de valor

No Kyber CRM você destaca:

- 21.133 linhas de TypeScript.
- 70 ferramentas MCP.
- 133 policies.
- 29 tabelas.

Alguns números são interessantes, mas **linhas de código não indicam qualidade**. Em alguns contextos, mais linhas podem até significar mais complexidade.

Na homepage, eu usaria algo como:

- Usado diariamente na operação da Kyber.
- Quatro interfaces sobre o mesmo modelo de negócio.
- 29 tabelas protegidas por RLS.
- 70 ferramentas disponíveis para o agente.
- Propostas, clientes, financeiro e suporte em um sistema.
- Autorização aplicada diretamente no PostgreSQL.

Deixe linhas de código, quantidade de arquivos e migrations na parte técnica do case, não como prova principal.

---

## 6. Padronize as informações entre portfólio, currículo e LinkedIn

Existem inconsistências perceptíveis.

### Empresa e cargo

No portfólio você aparece como:

> Fundador e Desenvolvedor Full Stack, Kyber Tech.

No currículo aparece como:

> Fundador e Desenvolvedor Full Stack, Didata.

Como o Didata é apresentado como produto da Kyber, o currículo deveria seguir a mesma estrutura:

> **Fundador e Desenvolvedor Full Stack, Kyber Tech**  
> Produtos: Didata e Kyber CRM.

Isso torna sua trajetória mais clara e evita parecer que existem duas experiências empresariais diferentes.

### Métricas do Kyber CRM

O portfólio informa 70 ferramentas MCP e 32 migrations. O LinkedIn ainda exibe 39 ferramentas e 22 migrations. Atualize o LinkedIn ou retire números que mudam frequentemente.

### Certificações

O site menciona Microsoft Azure AI, Claude Code e MCP. Seu currículo em PDF lista apenas a certificação Microsoft. Inclua as certificações da Anthropic caso sejam oficiais e relevantes para as vagas buscadas.

### Projetos no currículo

Seu currículo ainda dá espaço ao EduPlay, enquanto o Kyber CRM é um projeto muito mais forte e atual. Eu substituiria EduPlay pelo Kyber CRM imediatamente.

---

## 7. Melhore os cards dos projetos

Cada projeto deveria ser compreendido sem que o usuário precise ler um parágrafo grande.

### Modelo ideal

**Didata**  
SaaS de IA para professores brasileiros.

**Problema:** planejamento e correção fragmentados entre chats, documentos e planilhas.  
**Minha atuação:** produto, UX, frontend, backend, IA, banco, pagamentos e deploy.  
**Destaque:** memória por turma e correção de provas por imagem com revisão humana.  
**Situação:** em produção.  
**Links:** Estudo de caso · Produto ao vivo

Para projetos em equipe, deixe explícito o que foi seu:

> Responsável pelo dashboard web, sistemas em Lua e integração com o banco.

Isso evita que um recrutador tenha de adivinhar sua contribuição.

---

## 8. Use páginas separadas para português e inglês

A versão rastreada apresenta os textos em português e inglês dentro da mesma estrutura, como “SobreAbout”, “ProjetosProjects” e parágrafos duplicados. Visualmente você provavelmente esconde uma versão por CSS ou JavaScript, mas tecnicamente isso pode:

- Aumentar o DOM.
- Dificultar indexação por idioma.
- Gerar leitura confusa em tecnologias assistivas.
- Deixar títulos e descrições menos específicos.
- Fazer ambos os idiomas competirem pela mesma URL.

A estrutura mais sólida seria:

```text
/pt/
/pt/projetos/kyber-crm/

/en/
/en/projects/kyber-crm/
```

Depois:

- `lang="pt-BR"` e `lang="en"` em cada página.
- `hreflang="pt-BR"`.
- `hreflang="en"`.
- `hreflang="x-default"`.
- Canonical próprio para cada versão.
- Botão de idioma como link, não apenas alteração local por JavaScript.

---

## 9. Consolide o domínio

O rodapé mostra `pedrolou.dev`, mas o endereço enviado e acessado está no subdomínio `vercel.app`.

Use apenas uma URL pública principal:

```text
pedrolou.dev
```

Configure:

- Redirecionamento permanente do endereço Vercel para o domínio.
- `rel="canonical"` apontando para o domínio.
- Sitemap usando apenas o domínio.
- URLs sociais e currículo apontando para o domínio.
- E-mail profissional, como `pedro@pedrolou.dev`, se possível.

Isso melhora percepção profissional, consistência e manutenção da identidade.

Também removeria `.html` da URL do case:

```text
/projetos/kyber-crm/
```

em vez de:

```text
/projetos/kyber-crm.html
```

---

## 10. Fortaleça o SEO técnico

### Homepage

**Title**

> Pedro Lourençoni Lima | Desenvolvedor Full Stack, SaaS e IA

**Meta description**

> Desenvolvedor Full Stack em Goiânia especializado em React, Next.js, Node.js, TypeScript, SaaS e aplicações com IA. Veja projetos em produção e estudos de caso.

### Dados estruturados

Use `ProfilePage` com `Person`:

- `name`
- `url`
- `image`
- `jobTitle`
- `sameAs` para LinkedIn e GitHub
- `worksFor` Kyber Tech
- `alumniOf` PUC Goiás
- `knowsAbout`

### Para cada estudo de caso

- Title próprio.
- Meta description própria.
- Open Graph específico.
- Imagem social 1200×630.
- Canonical.
- Data de publicação e atualização.
- Breadcrumb.
- Links para projeto anterior e próximo.

### Indexação

- Sitemap XML.
- Search Console.
- Solicitação de indexação da homepage e cases.
- Verificação de `robots.txt`.
- Monitoramento de páginas indexadas.

---

## 11. Faça uma revisão de acessibilidade

Pontos que merecem teste:

- Botões PT/EN com `aria-pressed` ou, preferencialmente, links para URLs diferentes.
- Ícones “in” e “gh” com nomes acessíveis completos, como “LinkedIn de Pedro” e “GitHub de Pedro”.
- Skip link para o conteúdo principal.
- Ordem de foco coerente.
- Estados de foco visíveis.
- Navegação integral por teclado.
- Contraste dos textos secundários e linhas decorativas.
- Respeito a `prefers-reduced-motion`.
- Headings sem saltos incorretos.
- `alt` que descreva a função da imagem, não apenas sua aparência.

Como referência mínima, alvos de interação devem ter pelo menos 24×24 CSS pixels e os indicadores de foco precisam ser claramente visíveis.

---

## 12. Performance: o que conferir

Como a página possui várias imagens grandes, valide:

- `width` e `height` definidos em todas as imagens.
- `srcset` e `sizes`.
- WebP ou AVIF.
- `loading="lazy"` nas imagens abaixo da primeira dobra.
- Imagem principal carregada com prioridade.
- Fontes locais com `font-display: swap`.
- Subconjuntos das fontes para PT e EN.
- JavaScript mínimo para navegação e troca de idioma.
- Ausência de animações que alterem layout.
- Cache longo para imagens, CSS e fontes.

### Metas de Core Web Vitals

- LCP até 2,5 segundos.
- INP até 200 ms.
- CLS até 0,1.

Use Vercel Speed Insights para acompanhar dados reais do projeto e PageSpeed/Lighthouse para diagnóstico de laboratório.

---

# Como eu deixaria a homepage

## Hero

> **Desenvolvedor Full Stack especializado em SaaS e IA aplicada.**  
> Construo produtos web de ponta a ponta, do banco de dados e APIs ao frontend, deploy e operação. Criei o Didata e o Kyber CRM, dois sistemas usados em produção.

`React · Next.js · Node.js · TypeScript · PostgreSQL · IA`

**Ver projetos em produção**  
**Baixar currículo**

---

## Evidências rápidas

> Produtos próprios em produção  
> Clientes reais atendidos  
> Experiência desde 2023  
> Inglês avançado

---

## Projetos selecionados

### Didata

Produto principal, com interface real, resultados e estudo de caso.

### Kyber CRM

Case de arquitetura, segurança e IA operacional.

### Premium ou Brava

Um case que demonstre trabalho para terceiros ou colaboração em equipe.

---

## Experiência

Timeline curta com Kyber, Premium, freelance e voluntariado.

---

## Sobre

Um texto de dois parágrafos, stack compacta e formação.

---

## Contato

> Estou disponível para conversar sobre oportunidades Full Stack, desenvolvimento de produto e aplicações com IA.

**Enviar e-mail**  
**LinkedIn**  
**GitHub**

Em uma linha separada:

> Procurando uma empresa para desenvolver seu projeto? Conheça a Kyber Tech.

---

# Ordem de implementação

## Faça primeiro

1. Definir o site como portfólio orientado a vagas.
2. Reescrever a hero.
3. Retirar a seção comercial extensa da Kyber.
4. Criar o estudo de caso do Didata.
5. Atualizar as capturas do Didata.
6. Alinhar portfólio, currículo e LinkedIn.
7. Colocar o domínio próprio como URL principal.

## Depois

8. Separar PT e EN em URLs distintas.
9. Implementar dados estruturados, sitemap e Search Console.
10. Revisar acessibilidade e Core Web Vitals.
11. Criar cases para Brava e Premium.
12. Adicionar analytics de cliques em currículo, LinkedIn, GitHub e contato.

---

# Conclusão

A base é forte. Com essas alterações, o site deixa de parecer “um desenvolvedor que também vende sites” e passa a comunicar com clareza:

> **Um product engineer full stack que já construiu e operou software real antes mesmo de concluir a graduação.**

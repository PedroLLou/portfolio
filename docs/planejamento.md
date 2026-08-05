# Planejamento de mudanças, portfólio

**Base:** `docs/analise-portfolio-pedrolou.md` e `docs/analise-portfolio-pedro-lourenconi.md`
**Escrito em:** 05/08/2026

---

## 1. Decisões já tomadas

Estas não estão em aberto. O resto do documento parte delas.

| Assunto | Decisão |
|---|---|
| Público | **Portfólio para vaga.** A Kyber vira link discreto. |
| Domínio | **pedrolou.dev**, a registrar e apontar. Canonical e Open Graph ficam nele. |
| Idiomas | **Mantém PT e EN no mesmo HTML.** Sem `/en/`, sem hreflang. |
| Case do Didata | Escrito dentro do repositório do Didata, via prompt. Ver `docs/prompt-case-didata.md`. |
| Disponibilidade | **"Aberto a oportunidades full stack"**, no hero e no contato. |
| Depoimento do Brava | Fica como está, sem nome. |
| Analytics | Nenhum por enquanto. |

---

## 2. Correções aos documentos de análise

Verifiquei antes de planejar. Três coisas nos documentos estão erradas ou incompletas.

**`pedrolou.dev` não resolve.** Não é bloqueio de robots nem `robots.txt` fechado: é falha de DNS, o domínio não responde. Consequência real, e pior que a descrita: o `canonical`, o `og:url` e o `og:image` apontam para um endereço inexistente. A imagem de preview não está "provavelmente quebrada", está quebrada com certeza, e o `canonical` manda o Google indexar uma página que não existe.

**Não existem links absolutos para `vercel.app`.** O primeiro documento abre com isso como achado P0. O código tem exatamente cinco URLs absolutas, todas para `pedrolou.dev`. Navegação, PDFs e imagens são todos relativos. O crawler resolveu os relativos contra o host que estava visitando e leu como se fossem absolutos.

**O estudo de caso não tem `og:image`.** Nenhum dos dois documentos notou. A página tem `og:title`, `og:description` e `og:url`, e nenhuma imagem. Compartilhar o case hoje gera cartão sem imagem, mesmo com o domínio funcionando.

Confirmados, sem ressalva: o README do GitHub diz **39 ferramentas MCP** contra 70 do site, e não linka o portfólio.

---

## 3. P0, bloqueia distribuição

Nada aqui é sobre design. É sobre o site poder ser encontrado e compartilhado.

### 3.1 Domínio

- [ ] Registrar `pedrolou.dev`
- [ ] Apontar na Vercel, em Settings > Domains
- [ ] Redirecionar `pedrolou.vercel.app` para o domínio, com 301
- [ ] Conferir que `canonical` e `og:url` batem com o domínio em produção

Enquanto o domínio não subir, considerar trocar as cinco URLs absolutas para `pedrolou.vercel.app`. Um canonical apontando para o nada é pior que um canonical num subdomínio feio.

### 3.2 Imagem social

- [ ] Criar um card **1200x630**, em **JPG ou PNG**, com nome e "Full Stack · Kyber Tech"
- [ ] Trocar `og:image` do `index.html`
- [ ] **Adicionar `og:image` ao case do Kyber CRM**, que hoje não tem nenhum
- [ ] Testar no LinkedIn Post Inspector e no Facebook Sharing Debugger

WebP em Open Graph é irregular fora do navegador. O card tem que ser JPG ou PNG. Hoje o `og:image` aponta para `pedro.jpg`, que existe no repositório, mas o retrato quadrado renderiza mal em cartão social e o domínio não responde.

### 3.3 Indexação

- [ ] Criar `robots.txt`
- [ ] Criar `sitemap.xml` com a home e o case
- [ ] Cadastrar a propriedade no Google Search Console
- [ ] Rodar o teste de URL ao vivo
- [ ] Solicitar indexação da home e do case

O repositório não tem nenhum dos dois arquivos hoje.

### 3.4 URLs limpas

- [ ] Criar `vercel.json` com `"cleanUrls": true`
- [ ] Conferir que `/projetos/kyber-crm` resolve
- [ ] Atualizar os links internos e o `canonical` do case

---

## 4. P1, a virada de posicionamento

Esta é a mudança que mais altera o site. Sai de "desenvolvedor que também vende sites" para "product engineer que já operou software real".

### 4.1 Tirar o comercial

- [ ] Remover a seção **II, "O que eu construo para empresas"**, com os cinco serviços
- [ ] Remover o bloco **"Como eu trabalho"**, os quatro passos
- [ ] Renumerar os fólios: hoje são I a V, passam a I a IV
- [ ] Colocar uma linha discreta no contato: *"Precisa contratar um projeto? Conheça a Kyber Tech."*

A carteira de clientes **fica**. Ela é prova de entrega repetida, não peça de venda, e o bloco do padrão escrito é o que a torna forte. O que sai é a oferta de serviço e o processo comercial, que pertencem ao site da Kyber.

### 4.2 Reescrever o hero

Hoje: *"Desenvolvedor full stack e fundador da Kyber Tech. Do problema ao produto em produção."*

O problema não é a frase, é que ela não diz que tipo de produto você constrói.

- [ ] Título: **Desenvolvedor Full Stack especializado em SaaS e IA aplicada**
- [ ] Descrição: construo produtos web de ponta a ponta, do banco e das APIs ao frontend, deploy e operação. Criei o Didata e o Kyber CRM, dois sistemas em produção.
- [ ] Manter a linha de stack
- [ ] Adicionar **"Aberto a oportunidades full stack"**
- [ ] CTAs: **Ver projetos em produção** e **Baixar currículo**

O segundo CTA muda: hoje é "Vamos conversar", que serve cliente. Para recrutador, o currículo vale mais.

### 4.3 Barra de evidências

- [ ] Inserir logo abaixo do hero, em uma linha: produtos próprios em produção · clientes reais atendidos · experiência desde 2023 · inglês avançado

Dá ao recrutador o resumo em três segundos, antes de qualquer rolagem.

---

## 5. P2, conteúdo

### 5.1 Case do Didata

O carro-chefe, público e em produção, tem um parágrafo. O Kyber CRM, privado e que ninguém pode abrir, tem case completo. Está invertido, e os dois documentos apontam isso como o item de maior valor da lista inteira.

- [ ] Rodar o prompt de `docs/prompt-case-didata.md` dentro do repositório do Didata
- [ ] Trazer o resultado para `projetos/didata.html`, no padrão do case do CRM
- [ ] **Trocar a captura.** A atual é a landing page. Landing prova que você sabe fazer landing; o que prova o SaaS é a interface por dentro: turmas, geração de material, correção por foto, relatório.

### 5.2 Métricas de esforço viram métricas de arquitetura

`21.133 linhas de TypeScript`, `103 arquivos` e `32 migrations` saem das figuras em destaque. Linha de código não indica qualidade e, para um sênior avaliando, pode contar contra.

- [ ] Tirar linhas, arquivos e migrations do bloco de figuras da home
- [ ] Manter no corpo do case, na parte técnica
- [ ] Manter em destaque: **70 ferramentas MCP**, **133 policies de RLS**, **29 tabelas**
- [ ] Acrescentar **10 dependências de produção**, que mostra disciplina em vez de volume
- [ ] Decidir a quarta figura entre as opções da seção 8

### 5.3 Datas e cicatrizes

- [ ] Colocar período em cada projeto: quando foi feito, quanto durou
- [ ] Replicar em cada case o padrão de **"Automatizar tudo, menos a última milha"**, com um bloco de decisão ou de "o que eu faria diferente"

Aquela seção é a melhor coisa do site, e é a única do tipo. Ela funciona porque mostra critério, não habilidade.

### 5.4 Cards de projeto legíveis sem parágrafo

- [ ] Padronizar: problema, minha atuação, destaque, situação, links
- [ ] No Brava, deixar explícito o que foi seu, já que foi feito por um time de três

---

## 6. P3, acabamento

- [ ] **JSON-LD.** `ProfilePage` com `Person` na home, `BreadcrumbList` nos cases. Você vende SEO estruturado para cliente na seção do padrão da Kyber; o próprio site não tem.
- [ ] **Ofuscar e-mail e telefone**, que hoje estão em texto puro e viram alvo de scraping.
- [ ] **`srcset` e `sizes`** nas imagens, para não servir 1901px a um celular.
- [ ] **Auto-hospedar as fontes** com `font-display: swap`, tirando uma conexão do caminho crítico.
- [ ] **Card social por página**, com `og:image` próprio para cada case.

---

## 7. Fora do site

Estes valem tanto quanto os do site e levam minutos.

### GitHub

- [ ] Corrigir **39 para 70** ferramentas MCP no README do perfil
- [ ] Adicionar o link do portfólio no README e no campo `site` do perfil
- [ ] Preencher bio e localização do perfil, que estão vazias
- [ ] Fixar `gerador-curriculo`, `tcc20261` e `ecossistema-kyber`
- [ ] Arquivar `rep1`, `CRUD-Agenda` e `lab-git-colaborativo-cmp2304`, que hoje aparecem como "Popular repositories"
- [ ] Descrever `ecossistema-kyber`, que está público e sem descrição

### LinkedIn e currículo

- [ ] LinkedIn ainda diz **39 ferramentas e 22 migrations**. Atualizar ou tirar números que mudam.
- [ ] Currículo diz **"Fundador e Desenvolvedor Full Stack, Didata"**. O portfólio diz Kyber Tech. Padronizar para Kyber Tech, com Didata e Kyber CRM listados como produtos.
- [ ] Currículo ainda tem **EduPlay**, que já saiu do site. Trocar pelo Kyber CRM.
- [ ] Currículo lista só a certificação Microsoft. Incluir as da Anthropic.

---

## 8. Depende de você

### 8.1 A quarta figura do Kyber CRM

Pedi tempo de montagem da fila e leads por semana. **Nenhum dos dois existe no banco:** o CRM não registra quanto tempo levava antes, nem série histórica de leads por semana. O que existe, consultado no MCP em 05/08/2026:

| Disponível | Valor |
|---|---|
| Leads no total | 213 |
| Leads ativos | 190 |
| Etapas do funil | 7 |
| Fila priorizada de hoje | 29, de 213 |
| Teto diário de toques | 40 WhatsApp e 15 Instagram |
| Clientes ativos | 5 |

**Opções viáveis, escolha uma:**

1. **213 leads geridos** — mostra escala do sistema, é o número mais forte e não expõe nada.
2. **Fila do dia: 29 de 213, priorizada por sinal** — mostra o motor de cadência funcionando, que é a parte mais interessante da arquitetura.
3. **55 toques por dia de teto, separados por canal** — mostra a decisão de risco, que conversa direto com a seção da última milha.
4. **10 dependências de produção** — sai do domínio de negócio e vira disciplina técnica.

**Não publicar:** MRR de R$ 956, ticket médio de R$ 191 e conversão de 2%. São dados comerciais sensíveis e, isolados, jogam contra.

Minha recomendação é a **1** para a home e a **2** dentro do case, onde há espaço para explicar.

### 8.2 Outros

- [ ] Prints do Didata por dentro, para o case e para trocar a captura da home
- [ ] Card social 1200x630, ou me diz para gerar um a partir da identidade do site
- [ ] Período de cada projeto, para as datas da seção 5.3

---

## 9. Ordem sugerida

| Quando | O quê |
|---|---|
| Hoje, cerca de 2h | Domínio · `robots.txt` e `sitemap.xml` · Search Console · `cleanUrls` · os seis itens do GitHub |
| Esta semana | Virada de posicionamento (seção 4) · card social · `og:image` do case |
| Próxima | Case do Didata · troca das capturas · métricas |
| Depois | JSON-LD · `srcset` · fontes locais · datas e blocos de decisão |

O item de maior impacto por minuto gasto é o **domínio**. Sem ele, tudo que for feito de SEO aponta para um endereço que não existe.

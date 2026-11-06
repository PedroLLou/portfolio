# Conteúdo verificado, novembro de 2026

Base de fatos para a atualização de 06/11/2026 e para o redesenho que vem
depois dela. Cada número tem a fonte e a data. O que não tem fonte não entra
no site.

Fontes: os repositórios `didata` (`97a0a60`, 05/11), `kyber-crm` (`581e0c3`,
05/11), `kyber-copilot`, `clinica-app`, `videos-motion` e os públicos do
GitHub, mais o espelho `ai-memory-pedro` (fotografia de 03/11). A contagem
refaz o mesmo comando nos commits de agosto, e eles reproduzem os números
que o site publicava, com uma exceção, contada abaixo.

## Kyber CRM

| Número | Agosto | Novembro | Como |
|---|---|---|---|
| Ferramentas MCP | 70 | **121** | `grep -c 'server.tool(' 'src/app/api/[transport]/route.ts'` |
| Policies RLS vivas | 133 (errado) | **276** | replay das migrations com `DROP`, mais 96 dinâmicas `area_*` |
| Tabelas em `public` | 29 | **78** | replay das migrations |
| Migrations | 32 | **141** | `ls supabase/migrations/*.sql` |
| Testes | não havia | **2.555** | execução de 02/11 (`kyber/notes/crm-prompt-integral-pos-vps.md`) |
| Páginas | 21 rotas | **46** páginas, 56 route handlers | `find src/app` |
| Dependências de produção | 10 | **17** | `package.json` |
| Commits | | 572, 8 do Igor | `git log --format=%an` |

O 133 de agosto contava comandos `CREATE POLICY` nos arquivos, não policies
existentes. Naquela data havia 97. O case agora diz isso.

Hospedagem: VPS própria desde 31/10/2026, 21h28, com PostgreSQL, Better
Auth, LISTEN/SSE, arquivos em CAS, Docker, Nginx e systemd. Vercel e Supabase
ficaram bloqueados. RPO de 1 h e reconstrução em 2 h **não** comprovados
(`docs/sistema/migracao-vps.md`).

Cadência de prospecção: 3 toques desde 02/09. Saiu o de prova social, medido
nos 1.542 toques do banco (`src/lib/cadencia.ts`). As taxas de resposta não
vão ao site: são dado comercial.

Leads: o número de agosto (213) saiu da home. A contagem atual vem do
conector do CRM e é dado comercial.

## Didata

| Número | Agosto | Novembro | Como |
|---|---|---|---|
| Testes unitários | 1.595 | **4.512** | execução de 02/11 (`docs/operacao/2026-11-02-redacao-publica.md`) |
| Testes e2e | 33 em 9 specs | **53 em 12 specs** | `e2e/*.spec.ts` |
| Modelos Prisma | 34 | **77** | `grep -c '^model ' prisma/schema.prisma` |
| Migrations | 86 | **118** | `prisma/migrations` |
| Páginas | 111 | **159** | `find src/app -name page.tsx` |
| Route handlers | 32 | **76** | `src/app/api` |
| Crons | 4 | **7** | `vercel.json` |
| ADRs | 13 | **33** | `docs/adr/` |
| Commits | 798 | **1.290** | API do GitHub |

Mudanças que o case passou a contar:

- Correção segue o Parecer CNE/CP 15/2026 (ADR-0021, 10/10): na
  dissertativa e na redação a IA só transcreve; nas objetivas a confirmação
  é uma a uma, e o botão de lote saiu.
- Visão: modelo da OpenAI com `json_schema` estrito e `store: false`. O
  Haiku 4.5 só entra se o catálogo de provedores de foto permitir, e o
  ADR-0032 liberou só a OpenAI.
- Avaliação offline desde 10/10: marcas objetivas 447/450 e 59/60, CER de
  página inteira 2,2% e 3,5%. Falta corpus no formato do Didata.
- BNCC: tabela curada de 171 habilidades com código e texto oficial.
- Banco em São Paulo desde 11/08 (latência de 393 ms para 63 ms). O app
  continua na Vercel; a VPS do Didata é só proposta (ADR-0014).

Números de uso existem em retratos datados no repositório e **não** foram
publicados. Decisão do Pedro.

## Kyber Copilot

Pré-lançamento, homologação com `noindex`. Preço sem decisão, nenhum
assinante comprovado. 79 commits: Pedro fez o núcleo, o MCP, a cota de IA,
o deploy e o redesenho; Igor fez a auditoria de lançamento, o design system
e a cobrança Asaas. 141 rotas, 71 migrations. Não publicar a URL de
homologação.

## Repositórios públicos

Testes rodados em 06/11, todos verdes: `asaas-webhook-kit` 61 mais 9
cenários de conformidade, `agent-handoff` 71, `numeros-ptbr` 88. Nenhum está
no npm. O nome `agent-handoff` no npm é de outro autor.

TCC (`tcc20261`): equipe de cinco, 8 dos 66 commits sem merge são do Pedro.
A parte dele é o fluxo Git/PR, o guia de contribuição e duas correções de
segurança com testes (#123, #125). A monografia é sobre gerência de
configuração.

## O que não entrou, e por quê

- **Estúdio de vídeo (`videos-motion`)**: engenharia boa, produção real
  mínima (2 carrosséis, nenhum vídeo publicado). Aparece como superfície do
  CRM, não como projeto.
- **Nome do piloto da clínica** e qualquer coisa de `docs/entrevistas/`:
  dado de terceiro.
- **Nome do cliente da ponte fiscal Shopify → ERP**: sem autorização.
- **Busca de vaga**: a memória registra estágio ou júnior, Goiânia e depois
  remoto. O site continua dizendo "aberto a oportunidades" até o Pedro
  decidir o quanto quer explicitar.

## O site no ar não é este repositório

`pedrolou.dev` em 06/11 serve uma versão escura com estátua de Atena, React
(`assets/experience/app.js`), Lenis e `cinematic.css`, que nunca foi
commitada. Ela foi publicada a partir do checkout local. O redesenho parte
deste repositório e substitui as duas.

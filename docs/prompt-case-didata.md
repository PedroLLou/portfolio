# Prompt para o estudo de caso do Didata

Rode isto com o Claude Code **dentro da pasta do repositório do Didata**.
Ele não escreve o HTML: ele levanta o conteúdo e devolve um markdown que
depois vira `projetos/didata.html` no portfólio, no mesmo padrão do case
do Kyber CRM.

Copie tudo abaixo da linha.

---

Você vai levantar o material para um estudo de caso do Didata que vai
para o portfólio do Pedro (pedrolou.dev). O leitor é recrutador técnico e
engenheiro sênior avaliando uma contratação, não cliente e não professor.

Leia o repositório antes de escrever qualquer coisa: `PRODUCT.md`,
`README.md`, `DESIGN.md`, `CLAUDE.md`, `prisma/schema.prisma`, a
estrutura de `src/`, `mcp/`, `e2e/` e as migrations. Confira também
`package.json` para saber o que é dependência de produção de verdade.

Escreva um markdown com estas seções, nesta ordem:

**1. Abertura, até 3 linhas.** O que é o Didata, para quem, e em que
situação está. Sem adjetivo de marketing.

**2. O problema.** O que o professor brasileiro faz hoje sem a
ferramenta, e onde o tempo dele vai embora. Se o repositório tiver
pesquisa, feedback ou notas de conversa com professor, use. Se não
tiver, diga que não tem em vez de supor.

**3. A decisão de produto que define o resto.** Provavelmente é
"a IA sugere, o professor confirma", mas confirme no `PRODUCT.md`.
Explique por que isso é escolha e não limitação técnica, e o que ela
custa em conveniência.

**4. Currículo brasileiro verificável.** Como o material cita o código da
habilidade da BNCC ou do currículo estadual, de onde vem essa base, e
como o sistema garante que a citação não é inventada. Este é o principal
diferencial contra usar ChatGPT direto, então explique o mecanismo, não
só o resultado.

**5. Correção por foto.** O caminho da imagem até a nota. Que modelo de
visão, que pré-processamento, o que acontece quando a leitura falha, e
**como você mede se acertou**. Se existir avaliação, conjunto de teste ou
métrica de acerto, traga os números.

**6. Arquitetura.** Um parágrafo e uma lista curta. Modelo de dados,
isolamento entre professores e escolas, onde mora a autorização,
geração e persistência de material, exportações, filas ou jobs, e como
o custo de IA é controlado (limites, cache, escolha de modelo por tarefa).

**7. Números reais.** Só o que existir no repositório ou no banco:
tabelas, rotas, testes end-to-end, cobertura, dependências de produção,
modelos usados. **Não invente e não estime.** Se não houver número de
uso (professores ativos, materiais gerados, escolas), escreva
explicitamente que não há, para o portfólio não publicar dado falso.

**8. O que quebrou e o que eu faria diferente.** Um problema real
enfrentado no caminho, o que foi feito e o que ficou por resolver. Se o
repositório tiver histórico disso em `ALTERACOES.md`, `FALTOU.md` ou
`AUDIT.md`, use como fonte.

**9. Capturas necessárias.** Liste que telas o case precisa, por nome de
rota, priorizando **produto por dentro**, não landing page: painel de
turmas, geração de material, correção por foto e relatório. Para cada
uma, diga que dado sensível precisa ser trocado ou borrado antes de
publicar.

Regras de escrita:

- Português do Brasil, tom sóbrio, sem superlativo.
- **Nenhum travessão.** Use vírgula, ponto ou parênteses.
- Nada de "solução inovadora", "revolucionar", "potencializar".
- Frase curta. Se um parágrafo passar de cinco linhas, quebre.
- Toda afirmação técnica tem que ser rastreável a um arquivo do
  repositório. Se você não achou, escreva "não encontrei no repositório"
  em vez de preencher.
- O `PRODUCT.md` proíbe prova social fabricada. Respeite isso aqui
  também: nenhum número que você não tenha visto.

Salve em `docs/case-portfolio.md` dentro do repositório do Didata.

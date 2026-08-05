# Prompt para a cicatriz do case do Kyber CRM

O case do Didata tem uma seção "o que quebrou, e o que eu faria
diferente". O do Kyber CRM não tem, e essa assimetria enfraquece o mais
antigo dos dois: ele mostra a decisão da última milha, que é critério,
mas não mostra erro.

Eu não escrevi essa seção porque não tenho o material. O resumo que você
me passou do CRM descreve arquitetura e decisões, não falhas. Inventar
uma cicatriz seria exatamente o que o resto do site evita.

Rode isto com o Claude Code **dentro da pasta do repositório do
kyber-crm**. Copie tudo abaixo da linha.

---

Você vai levantar material para uma seção de estudo de caso sobre o que
deu errado no Kyber CRM. O leitor é engenheiro sênior avaliando uma
contratação. O objetivo não é confessar por confessar: é mostrar
julgamento, o mesmo efeito que a seção sobre não automatizar o envio já
tem no case.

Procure evidência real, nesta ordem:

1. **Histórico do git.** Commits de revert, hotfix, correção urgente, ou
   mensagens que citem produção quebrada. Use `git log` com filtros por
   palavra (revert, fix, hotfix, urgente, quebrou, corrige) e olhe o que
   o diff realmente fez.
2. **Migrations que corrigem migrations anteriores.** Em
   `supabase/migrations`, procure arquivo que desfaz, altera ou endurece
   algo criado antes. `0012_harden_definer_grants` e
   `0014_rls_multiusuario` têm cara disso: descubra o que motivou cada
   um.
3. **Comentários no código que explicam um problema.** Procure por
   TODO, FIXME, HACK, gambiarra, workaround, "por isso", "não pode",
   "cuidado". Um comentário que explica por que algo é feito de um jeito
   estranho costuma marcar uma cicatriz.
4. **Documentação de gotcha.** Se existir CLAUDE.md, README ou docs com
   seção de armadilhas conhecidas, é a fonte mais direta.
5. **Decisões revertidas.** Coisa que entrou e saiu, ou que existe em
   duas versões no código.

Escolha **um** caso, o de melhor material, e escreva em markdown:

- **O que quebrou**, em linguagem concreta, com o sintoma que apareceu
  antes da causa. Sintoma primeiro, porque é assim que se vive o bug.
- **Por que quebrou**, a causa real, não a superficial. Se a causa foi um
  pressuposto nunca verificado, diga isso: é a parte que ensina.
- **Como foi corrigido**, com o commit.
- **O que ficou por resolver**, se algo ficou. Contorno que continua
  contorno vale ser nomeado como dívida, não vendido como desenho.
- **O que eu faria diferente**, uma ou duas coisas, concretas o
  suficiente para alguém aplicar.

Regras de escrita:

- Português do Brasil, sóbrio, sem superlativo.
- **Nenhum travessão.** Vírgula, ponto ou parênteses.
- Frase curta. Parágrafo de no máximo cinco linhas.
- Toda afirmação rastreável a um commit ou arquivo. Se não achou, escreva
  "não encontrei no repositório" em vez de preencher.
- Se depois de procurar não houver nenhuma falha documentada digna de
  nota, **diga isso e pare**. Um case sem cicatriz é melhor que um case
  com cicatriz inventada.

Salve em `docs/case-cicatriz.md` dentro do repositório do kyber-crm.

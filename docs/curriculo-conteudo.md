# Currículo em PDF, o que mudou

Os dois PDFs em `uploads/` foram regenerados em 05/08/2026. Este arquivo
registra o que mudou e por quê, porque um currículo sem histórico envelhece
igual a um estudo de caso sem data.

Origem das correções: `docs/auditoria-nova/auditoria-final.md`, itens 1, 2 e 6.

## Onde a fonte mora

O `gerador-curriculo` público no GitHub é **o kit em branco**:
`experiencia-profissional/README.md` diz `<preencher>` e o `.gitignore`
exclui `curriculos-gerados/*/`. Os dados reais e os arquivos gerados ficam
em `E:\curriculo`, fora de versionamento público.

O pipeline é markdown → HTML → PDF, e o PDF sai de um Chromium headless:

```powershell
cd E:\curriculo
python gerador-curriculo\scripts\gerar_pdf.py `
  curriculos-gerados\_geral\curriculo-pt.html `
  curriculos-gerados\_geral\curriculo-pt.pdf
```

Os PDFs publicados são cópia byte a byte de
`E:\curriculo\curriculos-gerados\_geral\`. Para trocar, edite o HTML de lá,
rode o script e copie para `uploads/`.

## O que estava errado

| Achado | Antes | Agora |
|---|---|---|
| Empresa | "Fundador, **Didata**" | Fundador, **Kyber Tech**. O Didata é um produto dela |
| Kyber | aparecia **zero vezes** | 5 ocorrências |
| EduPlay | citado **duas vezes** | 0. Saiu do portfólio, saiu do currículo |
| Brava | não aparecia | 1, na experiência da Kyber |
| Validação | "Validei o MVP com os primeiros usuários" | Removido |
| Premium | "ago/2025 a **atual**" | ago/2025 a **jul/2026** |
| Premium | "Automação de processos internos" | "Sistemas internos de uma construtora de obras públicas" |
| Certificações | só Microsoft | Microsoft e Anthropic, nos dois idiomas |
| Projetos | EduPlay e TCC | Kyber CRM e TCC |

A linha do MVP era a mais cara. Quando o diferencial do portfólio é
honestidade verificável, uma afirmação que o próprio estudo de caso desmente
por escrito vale menos que não ter afirmação nenhuma. No lugar dela, a
experiência agora cita a instrumentação de divergência, que é verdade
conferível no repositório.

A data da Premium era contradição entre as suas próprias fontes: o PDF dizia
"atual", o seu `experiencia-profissional/README.md` dizia "agosto de 2025 a
julho de 2026 (1 ano)". Você confirmou julho, e o site foi corrigido junto —
ele também dizia "atual" na seção de experiência.

## O que o currículo continua não dizendo

Coerente com o que o site não publica:

- **Nenhum número de uso do Didata.** O seu README menciona "~5 professores"
  em beta. Isso é dado de uso, e nem o site nem o case publicam número de
  uso enquanto não houver medição.
- **Nenhum dado comercial do CRM.** Sem MRR, sem ticket médio, sem conversão.
- **Nenhum nível declarado.** Sua decisão, registrada na auditoria final.

## Verificado nos dois PDFs

Uma página cada, como antes. `Kyber` 5×, `EduPlay` 0×, `Brava` 1×,
`Anthropic` 2×, a afirmação sobre o MVP 0×, e o período da Premium correto.

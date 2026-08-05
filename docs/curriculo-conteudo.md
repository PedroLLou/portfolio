# Conteúdo do currículo, para regenerar com o `gerador-curriculo`

Este arquivo existe porque o PDF é a peça que mais contradiz o site, e é a
única que eu não consigo corrigir sozinho: ele é gerado por outro
repositório. O texto abaixo está pronto para entrar.

Origem das correções: `docs/auditoria-nova/auditoria-final.md`, itens 1, 2 e 6.

---

## O que está errado hoje

Extraí o texto do PDF publicado em `uploads/` e conferi contra o site:

| Achado | Estado no PDF | Estado real |
|---|---|---|
| Empresa | "Fundador, **Didata**" | A empresa é a **Kyber Tech**. O Didata é um produto dela |
| Kyber | aparece **zero vezes** | É o segundo produto, com estudo de caso próprio no site |
| EduPlay | citado **duas vezes** | Saiu do portfólio |
| Brava | não aparece | Tem estudo de caso próprio desde agosto de 2026 |
| Validação | "Validei o MVP com os primeiros usuários" | O case do Didata diz, por escrito, que **não há entrevista, questionário nem pesquisa de campo** |

A última linha é a mais cara. Quando o diferencial do portfólio é
honestidade verificável, uma afirmação que o próprio site desmente vale
menos que não ter afirmação nenhuma.

---

## Bloco de experiência, para substituir

Substitui a entrada atual "Fundador e Desenvolvedor Full Stack, Didata ·
mar/2026 a atual".

> **Fundador e Desenvolvedor Full Stack, Kyber Tech** · mar/2026 a atual · remoto
>
> Empresa própria de software: produtos próprios e entrega para cliente.
>
> - **Didata** (usedidata.com.br), SaaS com IA para professores, em produção com plano gratuito e pago. Next.js, TypeScript, PostgreSQL/Prisma e Vision para correção de prova por foto. 1.595 testes unitários e CI que barra rota de IA sem reserva de cota.
> - **Kyber CRM**, sistema interno em uso diário. Um app Next.js servindo painel, servidor MCP de 70 ferramentas, páginas públicas por token e rotinas em cron, com 133 policies de RLS sobre 29 tabelas.
> - **Brava Dashboard**, painel administrativo para cliente: SPA em React sobre uma API HTTP em Lua dentro de um servidor de jogo, com autenticação gerenciada e túnel para uma máquina sem IP público.
> - Cinco sites de cliente entregues em padrão próprio: HTML estático, WebP, canonical, Open Graph, JSON-LD e sitemap, com o domínio registrado no nome do cliente. Um deles do primeiro contato ao ar em quatro dias.

---

## Entrada da Premium, para reescrever

Hoje lê como site de construtora. É a única experiência de sistema interno
de terceiro que existe no currículo, e é o que mais pesa para vaga.

> **Desenvolvedor, Premium Construções e Serviços** · ago/2025 a atual · Goiânia, PJ
>
> Sistemas internos de uma construtora de obras públicas.
>
> - Dashboard administrativo usado pela equipe, em React e Node.js com TypeScript.
> - Sistema com IA que lê notas fiscais e processa cerca de 120 por mês, integrando APIs.
> - Bot de WhatsApp para processos internos, e o site institucional da concepção ao deploy.

---

## A linha que o próprio case desmente

Remover:

> ~~Validei o MVP com os primeiros usuários e priorizei o roadmap pelo feedback.~~

Colocar no lugar:

> Instrumentei a divergência entre professor e IA por questão e por faixa de confiança, para medir acerto em uso, em vez de publicar acurácia sem conjunto de teste rotulado.

Diz mais sobre critério de engenharia e é verdade verificável no repositório.

---

## Ainda

- Trocar **EduPlay por Kyber CRM** na seção de projetos.
- Incluir as certificações da **Anthropic** (Claude Code e MCP) ao lado da Microsoft.
- Os dois PDFs, `uploads/curriculo-pt.pdf` e `uploads/curriculo-en.pdf`, precisam ser regenerados. O site já aponta cada idioma para o seu, então basta substituir os arquivos com o mesmo nome.

## O que eu não consigo fazer daqui

- Regenerar os PDFs: são do `gerador-curriculo`, outro repositório.
- Bio, localização e link do site no perfil do GitHub, e fixar ou arquivar repositório: não são arquivo, são configuração de conta.

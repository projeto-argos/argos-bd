# ARGOS — Banco de Dados

Modelagem e scripts PostgreSQL do ARGOS, sistema web de gestão de pecuária e de medicamentos aplicados em bovinos.

## Estrutura

```text
argos-bd/
├── modelo conceitual/
│   ├── português/     imagens e arquivo do brModelo (.brM3)
│   └── inglês/
├── modelo lógico/
│   ├── português/
│   └── inglês/
├── sql/
│   ├── scriptDDL+ConstraintsPortugues.sql
│   ├── scriptDDL+ConstraintsIngles.sql
│   ├── scriptDataLoadPortugues.sql
│   └── scriptDataLoadIngles.sql
├── convencao-nomenclatura.md
└── README.md
```

Os modelos e os scripts existem em português e em inglês, com a mesma estrutura. A versão usada pelo projeto é a em inglês; a tradução de cada tabela e atributo está na convenção de nomenclatura.

## Tabelas

14 tabelas: endereço, usuário, administrador, propriedade, rebanho, lote, animal, período de carência, fornecedor, medicamento, lote de medicamento, estoque de medicamento, aplicação e o vínculo usuário–propriedade.

## Como executar

Rode os scripts de um mesmo idioma, nesta ordem:

1. `scriptDDL+Constraints<Idioma>.sql`: cria as extensões (`pgcrypto` e `uuid-ossp`), as tabelas e as restrições.
2. `scriptDataLoad<Idioma>.sql`: insere os dados iniciais (15 registros por tabela e os administradores da equipe).

## Restrições de integridade

- Chaves primárias em UUID, geradas por `gen_random_uuid()`.
- Chaves estrangeiras entre todas as tabelas relacionadas.
- `UNIQUE` em CPF, e-mail, CNPJ e código do lote dentro do rebanho.
- `DEFAULT` em datas, contadores, status ativo e finalidade do rebanho.
- `CHECK` em formatos (CPF, CNPJ, CEP, telefone), quantidades não negativas, datas coerentes, categoria do lote (`ENGORDA`, `CRIA`, `RECRIA`), finalidade (`CORTE`) e via de administração.
- Exclusão lógica pela coluna `ativo`/`active`, com data da última alteração em `atualizado_em`/`updated_at`.

## Convenção de nomenclatura

Os padrões de nomes, tipos, restrições e relacionamentos de cada tabela estão em [convencao-nomenclatura.md](./convencao-nomenclatura.md).

## Integração

A aplicação Java que usa este banco está em [argos-web-crud](https://github.com/projeto-argos/argos-web-crud).

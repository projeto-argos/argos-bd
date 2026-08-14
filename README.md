# ARGOS — Banco de Dados

Repositório destinado à modelagem e aos scripts PostgreSQL do projeto interdisciplinar ARGOS.

## Conteúdo planejado

```text
argos-bd/
├── docs/
│   ├── modelo-conceitual/
│   ├── modelo-logico/
│   └── naming-convention.md
├── sql/
│   ├── 01-schema.sql
│   ├── 02-constraints.sql
│   └── 03-dataload.sql
└── README.md
```

## Entregas

- Modelo conceitual
- Modelo lógico
- Convenções de nomenclatura
- Script de criação das tabelas
- Chaves primárias e estrangeiras
- Restrições de integridade
- Valores `DEFAULT`
- Restrições `CHECK`
- Carga inicial de dados

## Ordem de execução

Os scripts deverão ser executados nesta ordem:

```text
01-schema.sql
02-constraints.sql
03-dataload.sql
```

## Integração

A aplicação Java que utiliza este banco está no repositório [argos-web-crud](https://github.com/projeto-argos/argos-web-crud).

## Segurança

Senhas, endereços privados, credenciais e arquivos `.env` não devem ser enviados ao repositório.

# ARGOS — Convenção de Nomenclatura

Este documento contém a convenção de nomenclatura do aplicativo ARGOS, com ele você consegue entender para que serve e as restrições (regras) de cada tabela; o tipo, tamanho, descrição e tradução de todos os atributos e os relacionamentos que cada tabela (entidade) é forte.

A equipe do app ARGOS realizou a modelagem conceitual, lógica e script tanto na língua inglesa quanto na língua portuguesa.

Optamos por utilizar a versão do banco de dados em língua inglesa, por isso deixamos a tradução de cada atributo e tabela com base na versão do mesmo em língua portuguesa.

O banco de dados do ARGOS é comporto por 14 tabelas, 123 atributos e 14 relacionamentos.

### Ordem dos atributos

1.  UUID

2.  CHAR

3.  VARCHAR

4.  TEXT

5.  INTEGER

6.  NUMERIC

7.  DATE

8.  BOOLEAN

9.  TIMESTAMP

### Ordem das restrições

1.  PK (Primary Key)

2.  FK (Foreign Key)

3.  UNIQUE

4.  NOT NULL

5.  CHECK

## USER (USUARIO)

| **Atributo** | **Tipo**  | **Tamanho** | **Descrição**                              |
|--------------|-----------|-------------|--------------------------------------------|
| id_user      | UUID      | \-          | Identificação única de cada registro       |
| password     | CHAR      | 60          | Autenticação do usuário para acessar o app |
| cpf          | VARCHAR   | 11          | Identificação única de cada usuário        |
| phone        | VARCHAR   | 20          | Meio de comunicação com o usuário          |
| role         | VARCHAR   | 50          | Função/ responsabilidade do usuário        |
| full_name    | VARCHAR   | 120         | Identificação de identidade do usuário     |
| email        | VARCHAR   | 120         | Meio de comunicação com o usuário          |
| birth_date   | DATE      | \-          | Identificação de identidade do usuário     |
| active       | BOOLEAN   | \-          | Situação do registro                       |
| updated_at   | TIMESTAMP | \-          | Última atualização do registro             |

A tabela “USER” serve para guardar informações sobre a identidade do usuário, como nome completo, cpf, telefone etc.

### Restrições

| **Nome**      | **Atributo** | **Restrição**                                            |
|---------------|--------------|----------------------------------------------------------|
| PK_USER       | id_user      | PK (Primary Key)                                         |
| UK_USER_CPF   | cpf          | UNIQUE                                                   |
| UK_USER_EMAIL | email        | UNIQUE                                                   |
| \-            | id_user      | NOT NULL                                                 |
| \-            | password     | NOT NULL                                                 |
| CK_USER_CPF   | cpf          | CHECK (cpf IS NULL OR cpf ~ '^\[0-9\]{11}\s\*\$')        |
| CK_USER_PHONE | phone        | CHECK (phone IS NULL OR phone ~ '^\[0-9\]{10,11}\s\*\$') |

### Tradução

| **Atributo** | **Tradução**    |
|--------------|-----------------|
| id_user      | id_usuario      |
| password     | senha           |
| cpf          | cpf             |
| phone        | telefone        |
| role         | cargo           |
| full_name    | nome_completo   |
| email        | email           |
| birth_date   | data_nascimento |
| active       | ativo           |
| updated_at   | atualizado_em   |

### Relacionamentos

#### USER_PROPERTY

**Relacionamento:** PERTENCE (1 : N)

**Leitura:**

Um “USER” pertence a muitas USER_PROPERTY, uma USER_PROPERTY é pertencente a um “USER”.

**Cardinalidade máxima:**

(1, n)

**Cardinalidade mínima:**

(0, n)

#### APPLICATION

**Relacionamento:** REALIZA (1 : N)

**Leitura:**

Um “USER” realiza muitas APPLICATION, uma APLICATION é realizada por um “USER”.

**Cardinalidade máxima:**

(1, n)

**Cardinalidade mínima:**

(0, n)

## ADMIN (ADMIN)

A tabela ADMIN serve para pessoas permitidas conseguirem acessar a área restrita do app. Ela guarda informações sobre as identidades dessas pessoas.

| **Atributo** | **Tipo**  | **Tamanho** | **Descrição**                                             |
|--------------|-----------|-------------|-----------------------------------------------------------|
| id_admin     | UUID      | \-          | Identificação única de cada registro                      |
| password     | CHAR      | 60          | Autenticação do admin para acessar a área restrita do app |
| cpf          | VARCHAR   | 11          | Identificação única de cada admin                         |
| phone        | VARCHAR   | 20          | Meio de comunicação com o admin                           |
| full_name    | VARCHAR   | 120         | Identificação de identidade do admin                      |
| email        | VARCHAR   | 120         | Meio de comunicação com o admin                           |
| active       | BOOLEAN   | \-          | Situação do registro                                      |
| updated_at   | TIMESTAMP | \-          | Última atualização do registro                            |

### Restrições

| **Nome**       | **Atributo** | **Restrição**                                            |
|----------------|--------------|----------------------------------------------------------|
| PK_ADMIN       | id_admin     | PK (Primary Key)                                         |
| UK_ADMIN_CPF   | cpf          | UNIQUE                                                   |
| UK_ADMIN_EMAIL | email        | UNIQUE                                                   |
| \-             | id_admin     | NOT NULL                                                 |
| \-             | password     | NOT NULL                                                 |
| CK_ADMIN_CPF   | cpf          | CHECK (cpf ~ '^\[0-9\]{11}\s\*\$')                       |
| CK_ADMIN_PHONE | phone        | CHECK (phone IS NULL OR phone ~ '^\[0-9\]{10,11}\s\*\$') |

### Tradução

| **Atributo** | **Tradução**  |
|--------------|---------------|
| id_admin     | id_admin      |
| password     | senha         |
| cpf          | cpf           |
| phone        | telefone      |
| full_name    | nome_completo |
| email        | email         |
| active       | ativo         |
| updated_at   | atualizado_em |

### Relacionamentos

Nenhum

## PROPERTY (PROPRIEDADE)

A tabela PROPERTY serve para guardar informações sobre a identidade propriedade, como nome, cnpj, telefone etc.

| **Atributo** | **Tipo**  | **Tamanho** | **Descrição**                                                 |
|--------------|-----------|-------------|---------------------------------------------------------------|
| id_property  | UUID      | \-          | Identificação única de cada registro                          |
| id_address   | UUID      | \-          | Identificação de um registro de ADDRESS que possui um vínculo |
| cnpj         | CHAR      | 14          | Identificação única de cada propriedade                       |
| phone        | VARCHAR   | 20          | Meio de comunicação com a propriedade                         |
| name         | VARCHAR   | 120         | Identificação de identidade da propriedade                    |
| active       | BOOLEAN   | \-          | Situação do registro                                          |
| updated_at   | TIMESTAMP | \-          | Última atualização do registro                                |

### Restrições

| **Nome**            | **Atributo** | **Restrição**                                                   |
|---------------------|--------------|-----------------------------------------------------------------|
| PK_PROPERTY         | id_property  | PK (Primary Key)                                                |
| FK_PROPERTY_ADDRESS | id_address   | FK (Foreign Key) - references <u>ADDRESS</u>(<u>id_address</u>) |
| UK_PROPERTY_ADDRESS | id_address   | UNIQUE                                                          |
| \-                  | id_property  | NOT NULL                                                        |
| \-                  | id_address   | NOT NULL                                                        |
| CK_PROPERTY_CNPJ    | cnpj         | CHECK (cnpj IS NULL OR cnpj ~ '^\[0-9\]{14}\s\*\$')             |
| CK_PROPERTY_PHONE   | phone        | CHECK (phone IS NULL OR phone ~ '^\[0-9\]{10,11}\s\*\$')        |

### Tradução

| **Atributo** | **Tradução**   |
|--------------|----------------|
| id_property  | id_propriedade |
| id_address   | id_endereco    |
| cnpj         | cnpj           |
| phone        | telefone       |
| name         | nome           |
| active       | ativo          |
| updated_at   | atualizado_em  |

### Relacionamentos

#### HERD

**Relacionamento:** POSSUI (1 : N)

**Leitura:**

Uma PROPERTY possui muitos HERD, um HERD é posse de uma PROPERTY.

**Cardinalidade máxima:**

(1, n)

**Cardinalidade mínima:**

(0, n)

#### USER_PROPERTY

**Relacionamento:** PERTENCE (1 : N)

**Leitura:**

Uma PROPERTY pertence a muitas USER_PROPERTY, uma USER_PROPERTY é pertencente a uma PROPERTY.

**Cardinalidade máxima:**

(1, n)

**Cardinalidade mínima:**

(0, n)

## ADDRESS (ENDERECO)

A tabela ADDRESS serve para guardar informações sobre a localização de um endereço, como estado, cidade, rua etc.

| **Atributo** | **Tipo**  | **Tamanho** | **Descrição**                                             |
|--------------|-----------|-------------|-----------------------------------------------------------|
| id_address   | UUID      | \-          | Identificação única de cada registro                      |
| state        | CHAR      | 2           | Identificação do estado de localização                    |
| zip_code     | CHAR      | 8           | Identificação do logradouro                               |
| city         | VARCHAR   | 100         | Identificação da cidade de localização                    |
| street       | VARCHAR   | 150         | Identificação da rua de localização                       |
| complement   | TEXT      | \-          | Observações/ complementos importantes sobre a localização |
| number       | INTEGER   | \-          | Identificação do número de localização                    |
| active       | BOOLEAN   | \-          | Situação do registro                                      |
| updated_at   | TIMESTAMP | \-          | Última atualização do registro                            |

### Restrições

| **Nome**            | **Atributo** | **Restrições**                                             |
|---------------------|--------------|------------------------------------------------------------|
| PK_ADDRESS          | id_address   | PK (Primary Key)                                           |
| \-                  | id_address   | NOT NULL                                                   |
| CK_ADDRESS_ZIP_CODE | zip_code     | CHECK (zip_code IS NULL OR zip_code ~ '^\[0-9\]{8}\s\*\$') |

### Tradução

| **Atributo** | **Tradução**  |
|--------------|---------------|
| id_address   | id_endereco   |
| state        | estado        |
| zip_code     | cep           |
| city         | cidade        |
| street       | rua           |
| complement   | complemento   |
| number       | numero        |
| active       | ativo         |
| updated_at   | atualizado_em |

### Relacionamentos

#### PROPERTY

**Relacionamento:** PERTENCE (1 : 1)

**Leitura:**

Um ADDRESS pertence a uma PROPERTY, uma PROPERTY é pertencente a um ADDRESS.

**Cardinalidade máxima:**

(1, 1)

**Cardinalidade mínima:**

(0, 1)

#### SUPPLIER

**Relacionamento:** PERTENCE (1 : N)

**Leitura:**

Um ADDRESS pertence a muitos SUPPLIER, um SUPPLIER é pertencente a um ADDRESS.

**Cardinalidade máxima:**

(1, n)

**Cardinalidade mínima:**

(0, n)

## HERD (REBANHO)

A tabela HERD serve para guardar informações sobre o rebanho, como finalidade, raça, quantidade de cabeças etc.

| **Atributo** | **Tipo**  | **Tamanho** | **Descrição**                                                                            |
|--------------|-----------|-------------|------------------------------------------------------------------------------------------|
| id_herd      | UUID      | \-          | Identificação única de cada registro                                                     |
| id_property  | UUID      | \-          | Identificação de um registro de PROPERTY que possui um vínculo                           |
| purpose      | VARCHAR   | 20          | Propósito do rebanho (BEEF)                                                              |
| breed        | VARCHAR   | 40          | Identificação das características biológicas e físicas e histórico de seleção do rebanho |
| herd_name    | VARCHAR   | 60          | Identificação de identidade do rebanho                                                   |
| head_count   | INTEGER   | \-          | Quantidade de cabeças de animal do rebanho                                               |
| active       | BOOLEAN   | \-          | Situação do registro                                                                     |
| updated_at   | TIMESTAMP | \-          | Última atualização do registro                                                           |

### Restrições

| **Nome**           | **Atributo** | **Restrições**                                      |
|--------------------|--------------|-----------------------------------------------------|
| PK_HERD            | id_herd      | PK (Primary Key)                                    |
| FK_HERD_PROPERTY   | id_property  | FK (Foreign Key) - references PROPERTY(id_property) |
| \-                 | id_herd      | NOT NULL                                            |
| \-                 | id_property  | NOT NULL                                            |
| CK_HERD_HEAD_COUNT | head_count   | CHECK (head_count \>= 0)                            |
| CK_HERD_PURPOSE    | purpose      | CHECK (UPPER(TRIM(purpose)) = 'CORTE')              |

### Tradução

| **Atributo** | **Tradução**   |
|--------------|----------------|
| id_herd      | id_rebanho     |
| id_property  | id_propriedade |
| purpose      | finalidade     |
| breed        | raca           |
| herd_name    | nome           |
| head_count   | qtd_cabecas    |
| active       | ativo          |
| updated_at   | atualizado_em  |

### Relacionamentos

#### LOT

**Relacionamento:** POSSUI (1 : N)

**Leitura:**

Um HERD possui muitos LOT, um LOT é posse de um HERD.

**Cardinalidade máxima:**

(1, n)

**Cardinalidade mínima:**

(0, n)

## LOT (LOTE)

A tabela LOT serve para guardar informações sobre o lote, como categoria, data de abertura, quantidade de cabeças etc.

| **Atributo** | **Tipo**  | **Tamanho** | **Descrição**                                                                      |
|--------------|-----------|-------------|------------------------------------------------------------------------------------|
| id_lot       | UUID      | \-          | Identificação única de cada registro                                               |
| id_herd      | UUID      | \-          | Identificação de um registro de HERD que possui um vínculo                         |
| lot_code     | VARCHAR   | 20          | Identificação única de cada lote                                                   |
| category     | VARCHAR   | 30          | Classificação da finalidade produtiva dos animais (FATTENING, BREEDING ou REARING) |
| head_count   | INTEGER   | \-          | Quantidade de cabeças de animal do lote                                            |
| open_date    | DATE      | \-          | Data oficial do registro do lote                                                   |
| active       | BOOLEAN   | \-          | Situação do registro                                                               |
| updated_at   | TIMESTAMP | \-          | Última atualização do registro                                                     |

### Restrições

| **Nome**          | **Atributo** | **Restrições**                                    |
|-------------------|--------------|---------------------------------------------------|
| PK_LOT            | id_lot       | PK (Primary Key)                                  |
| FK_LOT_HERD       | id_herd      | FK (Foreign Key) – references HERD(id_herd)       |
| UK_LOT_CODE_HERD  | lot_code     | UNIQUE                                            |
| UK_LOT_CODE_HERD  | id_herd      | UNIQUE                                            |
| \-                | id_lot       | NOT NULL                                          |
| \-                | lot_code     | NOT NULL                                          |
| \-                | category     | NOT NULL                                          |
| \-                | id_herd      | NOT NULL                                          |
| CK_LOT_HEAD_COUNT | head_count   | CHECK (head_count \>= 0)                          |
| CK_LOT_CATEGORY   | category     | CHECK (category IN ('ENGORDA', 'CRIA', 'RECRIA')) |

### Tradução

| **Atributo** | **Tradução**  |
|--------------|---------------|
| id_lot       | id_lote       |
| id_herd      | id_rebanho    |
| lot_code     | codigo_lote   |
| category     | categoria     |
| head_count   | qtd_cabecas   |
| open_date    | data_abertura |
| active       | ativo         |
| updated_at   | atualizado_em |

### Relacionamentos

#### ANIMAL

**Relacionamento:** POSSUI (1 : N)

**Leitura:**

Um LOT possui muitos ANIMAL, um ANIMAL é posse a um LOT.

**Cardinalidade máxima:**

(1, n)

**Cardinalidade mínima:**

(0, n)

#### APPLICATION

**Relacionamento:** FAZ (1 : N)

**Leitura:**

Um LOT faz muitas APPLICATION, uma APPLICATION é feita em um LOT.

**Cardinalidade máxima:**

(1, n)

**Cardinalidade mínima:**

(0, n)

## ANIMAL (ANIMAL)

A tabela ANIMAL serve para guardar informações sobre a identidade do animal e explicação sobre a situação de exceção, como brinco, motivo de exceção, observações etc.

| **Atributo**          | **Tipo**  | **Tamanho** | **Descrição**                                                                            |
|-----------------------|-----------|-------------|------------------------------------------------------------------------------------------|
| id_animal             | UUID      | \-          | Identificação única de cada registro                                                     |
| id_lot                | UUID      | \-          | Identificação de um registro de LOT que possui um vínculo                                |
| id_origin_lot         | UUID      | \-          | Identificação de um registro de LOT que possui um vínculo (o primeiro da vida do animal) |
| ear_tag               | VARCHAR   | 20          | Identificação única de cada animal                                                       |
| exception_reason      | VARCHAR   | 255         | Fatores que levaram o animal a entrar em situação de exceção                             |
| notes                 | TEXT      | \-          | Observações específicas do animal                                                        |
| current_weight        | NUMERIC   | 7, 2        | Identificação do peso atual do animal                                                    |
| birth_date            | DATE      | \-          | Identificação de identidade do animal                                                    |
| exception_start_date  | DATE      | \-          | Data que o animal entrou no período de exceção                                           |
| exception_end_date    | DATE      | \-          | Data que o animal saiu do período de exceção                                             |
| cleared_for_slaughter | BOOLEAN   | \-          | Verificação se o animal pode ser abatido                                                 |
| active                | BOOLEAN   | \-          | Situação do registro                                                                     |
| updated_at            | TIMESTAMP | \-          | Última atualização do registro                                                           |

### Restrições

| **Nome**                  | **Atributo**         | **Restrições**                                                                    |
|---------------------------|----------------------|-----------------------------------------------------------------------------------|
| PK_ANIMAL                 | id_animal            | PK (Primary Key)                                                                  |
| FK_ANIMAL_LOT             | id_lot               | FK (Foreign Key) – references LOT(id_lot)                                         |
| FK_ANIMAL_ORIGIN_LOT      | id_origin_lot        | FK (Foreign Key) – references LOT(id_lot)                                         |
| UK_ANIMAL_EARTAG_LOT      | id_lot               | UNIQUE                                                                            |
| UK_ANIMAL_EARTAG_LOT      | ear_tag              | UNIQUE                                                                            |
| \-                        | id_animal            | NOT NULL                                                                          |
| \-                        | ear_tag              | NOT NULL                                                                          |
| \-                        | exception_start_date | NOT NULL                                                                          |
| \-                        | id_lot               | NOT NULL                                                                          |
| CK_ANIMAL_CURRENT_WEIGHT  | current_weight       | CHECK (current_weight IS NULL OR current_weight \> 0)                             |
| CK_ANIMAL_EXCEPTION_DATES | exception_end_date   | CHECK (exception_end_date IS NULL OR exception_end_date \>= exception_start_date) |

### Tradução

| **Atributo**          | **Tradução**        |
|-----------------------|---------------------|
| id_animal             | id_animal           |
| id_lot                | id_lote             |
| id_origin_lot         | id_lote_origem      |
| ear_tag               | brinco              |
| exception_reason      | motivo_excecao      |
| notes                 | observacoes         |
| current_weight        | peso                |
| birth_date            | data_nascimento     |
| exception_start_date  | data_inicio_excecao |
| exception_end_date    | data_fim_excecao    |
| cleared_for_slaughter | liberado_abate      |
| active                | ativo               |
| updated_at            | atualizado_em       |

### Relacionamentos

#### WITHDRAWAL_PERIOD

**Relacionamento:** POSSUI (1 : N)

**Leitura:**

Um ANIMAL possui muitos WITHDRAWAL_PERIOD, um WITHDRAWAL_PERIOD é posse de um ANIMAL.

**Cardinalidade máxima:**

(1, n)

**Cardinalidade mínima:**

(0, n)

## WITHDRAWAL_PERIOD (PERIODO_CARENCIA)

A tabela WITHDRAWAL serve para guardar informações sobre o período de carência de um animal, como observações, dia de início, dia de fim etc.

| **Atributo**          | **Tipo**  | **Tamanho** | **Descrição**                                                |
|-----------------------|-----------|-------------|--------------------------------------------------------------|
| id_withdrawal         | UUID      | \-          | Identificação única de cada registro                         |
| id_animal             | UUID      | \-          | Identificação de um registro de ANIMAL que possui um vínculo |
| notes                 | TEXT      | \-          | Observações específicas do período de carência               |
| withdrawal_start_date | DATE      | \-          | Data mais antiga da exceção do animal                        |
| withdrawal_end_date   | DATE      | \-          | Data mais longe da exceção do animal                         |
| active                | BOOLEAN   | \-          | Situação do registro                                         |
| updated_at            | TIMESTAMP | \-          | Última atualização do registro                               |

### Restrições

| **Nome**             | **Atributo**          | **Restrições**                                                                       |
|----------------------|-----------------------|--------------------------------------------------------------------------------------|
| PK_WITHDRAWAL_PERIOD | id_withdrawal         | PK (Primary Key)                                                                     |
| FK_WITHDRAWAL_ANIMAL | id_animal             | FK (Foreign Key) – references ANIMAL(id_animal)                                      |
| \-                   | id_withdrawal         | NOT NULL                                                                             |
| \-                   | withdrawal_start_date | NOT NULL                                                                             |
| \-                   | id_animal             | NOT NULL                                                                             |
| CK_WITHDRAWAL_DATES  | withdrawal_end_date   | CHECK (withdrawal_end_date IS NULL OR withdrawal_end_date \>= withdrawal_start_date) |

### Tradução

| **Atributo**          | **Tradução**         |
|-----------------------|----------------------|
| id_withdrawal         | id_carencia          |
| id_animal             | id_animal            |
| notes                 | observacoes          |
| withdrawal_start_date | data_inicio_carencia |
| withdrawal_end_date   | data_fim_carencia    |
| active                | ativo                |
| updated_at            | atualizado_em        |

### Relacionamentos

Nenhum

## SUPPLIER (FORNECEDOR)

A tabela SUPPLIER serve para guardar informações sobre a identidade do fornecedor, como nome completo, cnpj, telefone etc.

| **Atributo** | **Tipo**  | **Tamanho** | **Descrição**                                                 |
|--------------|-----------|-------------|---------------------------------------------------------------|
| id_supplier  | UUID      | \-          | Identificação única de cada registro                          |
| id_address   | UUID      | \-          | Identificação de um registro de ADDRESS que possui um vínculo |
| cnpj         | VARCHAR   | 14          | Identificação única de cada fornecedor                        |
| phone        | VARCHAR   | 20          | Meio de comunicação com o fornecedor                          |
| full_name    | VARCHAR   | 120         | Identificação de identidade do fornecedor                     |
| email        | VARCHAR   | 120         | Meio de comunicação com o fornecedor                          |
| active       | BOOLEAN   | \-          | Situação do registro                                          |
| updated_at   | TIMESTAMP | \-          | Última atualização do registro                                |

### Restrições

| **Nome**            | **Atributo** | **Restrições**                                           |
|---------------------|--------------|----------------------------------------------------------|
| PK_SUPPLIER         | id_supplier  | PK (Primary Key)                                         |
| FK_SUPPLIER_ADDRESS | id_address   | FK (Foreign Key) – references ADDRESS(id_address)        |
| UK_SUPPLIER_CNPJ    | cnpj         | UNIQUE                                                   |
| \-                  | id_supplier  | NOT NULL                                                 |
| CK_SUPPLIER_CNPJ    | cnpj         | CHECK (cnpj IS NULL OR cnpj ~ '^\[0-9\]{14}\s\*\$')      |
| CK_SUPPLIER_PHONE   | phone        | CHECK (phone IS NULL OR phone ~ '^\[0-9\]{10,11}\s\*\$') |

### Tradução

| **Atributo** | **Tradução**  |
|--------------|---------------|
| id_supplier  | id_fornecedor |
| id_address   | id_endereco   |
| cnpj         | cnpj          |
| phone        | telefone      |
| full_name    | nome_completo |
| email        | email         |
| active       | ativo         |
| updated_at   | atualizado_em |

### Relacionamentos

#### MEDICINE

**Relacionamento:** POSSUI (1 : N)

**Leitura:**

Um SUPPLIER possui muitos MEDICINE, um MEDICINE é posse de um SUPPLIER.

**Cardinalidade máxima:**

(1, n)

**Cardinalidade mínima:**

(0, n)

## MEDICINE (MEDICAMENTO)

A tabela MEDICAMENTO serve para guardar informações sobre o medicamento, como nome comercial, princípio ativo, categoria terapêutica etc.

| **Atributo**              | **Tipo**  | **Tamanho** | **Descrição**                                                                                           |
|---------------------------|-----------|-------------|---------------------------------------------------------------------------------------------------------|
| id_medicine               | UUID      | \-          | Identificação única de cada registro                                                                    |
| id_supplier               | UUID      | \-          | Identificação de um registro de SUPPLIER que possui um vínculo                                          |
| unit                      | VARCHAR   | 10          | Unidade de medida do medicamento                                                                        |
| brand_name                | VARCHAR   | 80          | Identificação comercial do medicamento                                                                  |
| active_ingredient         | VARCHAR   | 80          | Substância química responsável pelo efeito terapêutico                                                  |
| indication                | TEXT      | \-          | Finalidade para a utilização do medicamento                                                             |
| therapeutic_category      | TEXT      | \-          | Agrupamento de identificação para qual tipo de doença, sintoma ou condição de saúde o medicamento serve |
| indicated_withdrawal_days | INTEGER   | \-          | Quantidade de dias de carência indicada                                                                 |
| dose                      | NUMERIC   | 10, 3       | Quantidade exata do medicamento                                                                         |
| active                    | BOOLEAN   | \-          | Situação do registro                                                                                    |
| updated_at                | TIMESTAMP | \-          | Última atualização do registro                                                                          |

### Restrições

| **Nome**                 | **Atributo**              | **Restrições**                                      |
|--------------------------|---------------------------|-----------------------------------------------------|
| PK_MEDICATION            | id_medicine               | PK (Primary Key)                                    |
| FK_MEDICATION_SUPPLIER   | id_supplier               | FK (Foreign Key) – references SUPPLIER(id_supplier) |
| \-                       | id_medicine               | NOT NULL                                            |
| \-                       | id_supplier               | NOT NULL                                            |
| CK_MEDICATION_WITHDRAWAL | indicated_withdrawal_days | CHECK (indicated_withdrawal_days \>= 0)             |

### Tradução

| **Atributo**              | **Tradução**           |
|---------------------------|------------------------|
| id_medicine               | id_medicamento         |
| id_supplier               | id_fornecedor          |
| unit                      | unidade_medida         |
| brand_name                | nome_comercial         |
| active_ingredient         | principio_ativo        |
| indication                | indicacao              |
| therapeutic_category      | categoria_teraputica   |
| indicated_withdrawal_days | carencia_indicada_dias |
| dose                      | dose                   |
| active                    | ativo                  |
| updated_at                | atualizado_em          |

### Relacionamentos

#### MEDICATION_BATCH

**Relacionamento:** PERTENCE (N : 1)

**Leitura:**

Um MEDICINE pertence a um MEDICATION_BATCH, um MEDICATION_BATCH é pertencente a muitos MEDICINE.

**Cardinalidade máxima:**

(n, 1)

**Cardinalidade mínima:**

(0, 1)

## MEDICATION_BATCH (LOTE_MEDICAMENTO)

A tabela MEDICATION_BATCH serve para guardar informações sobre o lote do medicamento, como data de fabricação, data de validade, quantidade inicial etc.

| **Atributo**        | **Tipo**  | **Tamanho** | **Descrição**                                                  |
|---------------------|-----------|-------------|----------------------------------------------------------------|
| id_medication_batch | UUID      | \-          | Identificação única de cada registro                           |
| id_medicine         | UUID      | \-          | Identificação de um registro de MEDICINE que possui um vínculo |
| batch_number        | VARCHAR   | 30          | Identificação única de cada lote de medicamento                |
| initial_quantity    | NUMERIC   | 10, 3       | Quantidade original de medicamentos                            |
| manufacture_date    | DATE      | \-          | Data de produção do lote de medicamento                        |
| expiry_date         | DATE      | \-          | Data de vencimento do lote de medicamento                      |
| delivery_date       | DATE      | \-          | Data oficial da chegada do lote de medicamento                 |
| active              | BOOLEAN   | \-          | Situação do registro                                           |
| updated_at          | TIMESTAMP | \-          | Última atualização do registro                                 |

### Restrições

| **Nome**                 | **Atributo**        | **Restrições**                                                  |
|--------------------------|---------------------|-----------------------------------------------------------------|
| PK_MEDICATION_BATCH      | id_medication_batch | PK (Primary Key)                                                |
| FK_MED_BATCH_MEDICATION  | id_medicine         | FK (Foreign Key) – references MEDICINE(id_medicine)             |
| \-                       | id_medication_batch | NOT NULL                                                        |
| \-                       | manufacture_date    | NOT NULL                                                        |
| \-                       | id_medicine         | NOT NULL                                                        |
| CK_MED_BATCH_EXPIRATION  | expiry_date         | CHECK (expiry_date IS NULL OR expiry_date \>= manufacture_date) |
| CK_MED_BATCH_INITIAL_QTY | initial_quantity    | CHECK (initial_quantity \>= 0)                                  |

### Tradução

| **Atributo**        | **Tradução**        |
|---------------------|---------------------|
| id_medication_batch | id_lote_medicamento |
| id_medicine         | id_medicamento      |
| batch_number        | lote_fabricacao     |
| initial_quantity    | quantidade_inicial  |
| manufacture_date    | data_fabricacao     |
| expiry_date         | data_validade       |
| delivery_date       | data_entrada        |
| active              | ativo               |
| updated_at          | atualizado_em       |

### Relacionamentos

#### MEDICATION_INVENTORY

**Relacionamento:** PERTENCE (N : 1)

**Leitura:**

Um MEDICATION_BATCH pertence a um MEDICATION_INVENTORY, um MEDICATION_INVENTORY é pertencente a muitos MEDICATION_BATCH.

**Cardinalidade máxima:**

(n, 1)

**Cardinalidade mínima:**

(0, 1)

#### APPLICATION

**Relacionamento:** FAZ (1 : N)

**Leitura:**

Um MEDICATION_BATCH faz muitas APPLICATION, uma APLICATION é feita por um MEDICATION_BATCH .

**Cardinalidade máxima:**

(1, n)

**Cardinalidade mínima:**

(0, n)

## MEDICATION_INVENTORY (ESTOQUE_MEDICAMENTO)

A tabela MEDICATION_INVENTORY serve para guardar informações sobre o estoque do medicamento, como local de armazenamento, quantidade disponível, quantidade máxima e mínima permite etc.

| **Atributo**            | **Tipo**  | **Tamanho** | **Descrição**                                                          |
|-------------------------|-----------|-------------|------------------------------------------------------------------------|
| id_medication_inventory | UUID      | \-          | Identificação única de cada registro                                   |
| id_medication_batch     | UUID      | \-          | Identificação de um registro de MEDICATION_BATCH que possui um vínculo |
| storage_location        | VARCHAR   | 60          | Local que os lotes de medicamento são guardados                        |
| available_quantity      | NUMERIC   | 10, 3       | Quantidade atual no estoque de medicamento                             |
| minimum_stock           | NUMERIC   | 10, 3       | Quantidade mínima permite no estoque de medicamento                    |
| maximum_stock           | NUMERIC   | 10, 3       | Quantidade máxima permite no estoque de medicamento                    |
| active                  | BOOLEAN   | \-          | Situação do registro                                                   |
| updated_at              | TIMESTAMP | \-          | Última atualização do registro                                         |

### Restrições

| **Nome**                      | **Atributo**            | **Restrições**                                                      |
|-------------------------------|-------------------------|---------------------------------------------------------------------|
| PK_MEDICATION_INVENTORY       | id_medication_inventory | PK (Primary Key)                                                    |
| FK_INVENTORY_MEDICATION_BATCH | id_medication_batch     | FK (Foreign Key) – references MEDICATION_BATCH(id_medication_batch) |
| \-                            | id_medication_inventory | NOT NULL                                                            |
| \-                            | id_medication_batch     | NOT NULL                                                            |
| CK_INVENTORY_AVAILABLE_QTY    | available_quantity      | CHECK (available_quantity \>= 0)                                    |
| CK_INVENTORY_MIN_MAX          | minimum_stock           | CHECK (minimum_stock \<= maximum_stock)                             |

### Tradução

| **Atributo**            | **Tradução**           |
|-------------------------|------------------------|
| id_medication_inventory | id_estoque_medicamento |
| id_medication_batch     | id_lote_medicamento    |
| storage_location        | local_armazenamento    |
| available_quantity      | quantidade_disponivel  |
| minimum_stock           | minimo_estoque         |
| maximum_stock           | maximo_estoque         |
| active                  | ativo                  |
| updated_at              | atualizado_em          |

### Relacionamento

Nenhum

## APPLICATION (APLICACAO)

A tabela APPLICATION serve para guardar informações sobre a aplicação, como objetivo, via de aplicação, observações etc.

| **Atributo**        | **Tipo**  | **Tamanho** | **Descrição**                                                                |
|---------------------|-----------|-------------|------------------------------------------------------------------------------|
| id_application      | UUID      | \-          | Identificação única de cada registro                                         |
| id_user             | UUID      | \-          | Identificação de um registro de “USER” que possui um vínculo                 |
| id_medication_batch | UUID      | \-          | Identificação de um registro de MEDICATION_BATCH que possui um vínculo       |
| id_lot              | UUID      | \-          | Identificação de um registro de LOT que possui um vínculo                    |
| unit                | VARCHAR   | 10          | Unidade de medida usada na aplicação                                         |
| route               | VARCHAR   | 20          | Via de aplicação (INTRAMUSCULAR, SUBCUTANEOUS, ORAL, TOPICAL ou INTRAVENOUS) |
| application_limb    | VARCHAR   | 50          | Membro do corpo que recebeu a aplicação                                      |
| application_site    | VARCHAR   | 100         | Local que ocorreu a aplicação                                                |
| goal                | VARCHAR   | 120         | Resultado esperado da aplicação                                              |
| notes               | TEXT      | \-          | Observações específicas da aplicação                                         |
| treated_head_count  | INTEGER   | \-          | Quantidade de cabeças de animal que receberam a aplicação                    |
| dose                | NUMERIC   | 10, 3       | Quantidade exata que foi aplicada                                            |
| active              | BOOLEAN   | \-          | Situação do registro                                                         |
| date_time           | TIMESTAMP | \-          | Data e hora da aplicação                                                     |
| updated_at          | TIMESTAMP | \-          | Última atualização do registro                                               |

### Restrições

| **Nome**                        | **Atributo**        | **Restrições**                                                                                                  |
|---------------------------------|---------------------|-----------------------------------------------------------------------------------------------------------------|
| PK_APPLICATION                  | id_application      | PK (Primary Key)                                                                                                |
| FK_APPLICATION_USER             | id_user             | FK (Foreign Key) – references "USER"(id_user)                                                                   |
| FK_APPLICATION_MEDICATION_BATCH | id_medication_batch | FK (Foreign Key) – references MEDICATION_BATCH(id_medication_batch)                                             |
| FK_APPLICATION_LOT              | id_lot              | FK (Foreign Key) – references LOT(id_lot)                                                                       |
| \-                              | id_application      | NOT NULL                                                                                                        |
| \-                              | id_user             | NOT NULL                                                                                                        |
| \-                              | id_medication_batch | NOT NULL                                                                                                        |
| \-                              | id_lot              | NOT NULL                                                                                                        |
| CK_APPLICATION_ROUTE            | route               | CHECK (route IS NULL OR UPPER(TRIM(route)) IN ('INTRAMUSCULAR', 'SUBCUTANEA', 'ORAL', 'TOPICA', 'INTRAVENOSA')) |
| CK_APPLICATION_HEAD_COUNT       | treated_head_count  | CHECK (treated_head_count \> 0)                                                                                 |

### Tradução

| **Atributo**        | **Tradução**        |
|---------------------|---------------------|
| id_application      | id_aplicacao        |
| id_user             | id_usuario          |
| id_medication_batch | id_lote_medicamento |
| id_lot              | id_lote             |
| unit                | unidade_medida      |
| route               | via_administracao   |
| application_limb    | membro_aplicado     |
| application_site    | local_aplicado      |
| goal                | objetivo            |
| notes               | observacoes         |
| treated_head_count  | qtd_cabecas         |
| dose                | dose                |
| active              | ativo               |
| date_time           | data_hora           |
| updated_at          | atualizado_em       |

### Relacionamentos

Nenhum

## USER_PROPERTY (USUARIO_PROPRIEDADE)

A tabela USER_PROPERTY serve para guardar as informações das propriedades que o usuário pertence e os usuários que propriedade pertence.

| **Atributo** | **Tipo** | **Tamanho** | **Descrição**                                                  |
|--------------|----------|-------------|----------------------------------------------------------------|
| id_user      | UUID     | \-          | Identificação de um registro de “USER” que possui um vínculo   |
| id_property  | UUID     | \-          | Identificação de um registro de PROPERTY que possui um vínculo |

### Restrições

| **Nome**                  | **Atributo** | **Restrições**                                      |
|---------------------------|--------------|-----------------------------------------------------|
| PK_USER_PROPERTY          | id_user      | PK (Primary Key)                                    |
| PK_USER_PROPERTY          | id_property  | PK (Primary Key)                                    |
| \-                        | id_user      | NOT NULL                                            |
| \-                        | id_property  | NOT NULL                                            |
| FK_USER_PROPERTY_USER     | id_user      | FK (Foreign Key) – references “USER”(id_user)       |
| FK_USER_PROPERTY_PROPERTY | id_property  | FK (Foreign Key) – references PROPERTY(id_property) |

### Tradução

| **Atributo** | **Tradução**   |
|--------------|----------------|
| id_user      | id_usuario     |
| id_property  | id_propriedade |

### Relacionamento

Nenhum

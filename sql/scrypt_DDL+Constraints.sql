-- 0. Habilita a extensão para geração automática de UUIDs
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- 1. TABELA USUARIO
CREATE TABLE USUARIO
(
    id_usuario    UUID NOT NULL DEFAULT gen_random_uuid(),
    nome          VARCHAR(100),
    telefone      CHAR(20),
    cpf           CHAR(11),
    email         VARCHAR(150),
    cnpj          CHAR(14),
    cargo         VARCHAR(50),
    ativo         BOOLEAN DEFAULT TRUE,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT PK_USUARIO PRIMARY KEY (id_usuario),
    CONSTRAINT UK_USUARIO_CPF UNIQUE (cpf),
    CONSTRAINT UK_USUARIO_CNPJ UNIQUE (cnpj),
    CONSTRAINT UK_USUARIO_EMAIL UNIQUE (email),
    -- Regras de Validação (CHECK)
    CONSTRAINT CK_USUARIO_CPF CHECK (cpf IS NULL OR cpf ~ '^[0-9]{11}$'),
    CONSTRAINT CK_USUARIO_CNPJ CHECK (cnpj IS NULL OR cnpj ~ '^[0-9]{14}$'),
    CONSTRAINT CK_USUARIO_TELEFONE CHECK (telefone IS NULL OR telefone ~ '^[0-9]{10,11}$')
);

-- 2. TABELA ADMIN
CREATE TABLE ADMIN
(
    id_admin      UUID NOT NULL DEFAULT gen_random_uuid(),
    nome          VARCHAR(100),
    cpf           CHAR(11),
    email         VARCHAR(150),
    telefone      CHAR(20),
    ativo         BOOLEAN DEFAULT TRUE,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT PK_ADMIN PRIMARY KEY (id_admin),
    CONSTRAINT UK_ADMIN_CPF UNIQUE (cpf),
    CONSTRAINT UK_ADMIN_EMAIL UNIQUE (email),
    -- Regras de Validação (CHECK)
    CONSTRAINT CK_ADMIN_CPF CHECK (cpf ~ '^[0-9]{11}$'),
    CONSTRAINT CK_ADMIN_TELEFONE CHECK (telefone IS NULL OR telefone ~ '^[0-9]{10,11}$')
);

-- 3. TABELA PROPRIEDADE
CREATE TABLE PROPRIEDADE
(
    id_propriedade UUID NOT NULL DEFAULT gen_random_uuid(),
    nome           VARCHAR(100),
    telefone       CHAR(20),
    ativo          BOOLEAN DEFAULT TRUE,
    atualizado_em  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_usuario     UUID NOT NULL,
    
    CONSTRAINT PK_PROPRIEDADE PRIMARY KEY (id_propriedade),
    CONSTRAINT FK_PROPRIEDADE_USUARIO FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario),
    -- Regra de Validação (CHECK)
    CONSTRAINT CK_PROPRIEDADE_TELEFONE CHECK (telefone IS NULL OR telefone ~ '^[0-9]{10,11}$')
);

-- 4. TABELA ENDERECO_PROPRIEDADE
CREATE TABLE ENDERECO_PROPRIEDADE
(
    id_endereco_propriedade UUID NOT NULL DEFAULT gen_random_uuid(),
    bairro                  VARCHAR(100),
    cidade                  VARCHAR(100),
    estado                  CHAR(2),
    numero                  VARCHAR(10),
    observacoes             TEXT,
    ativo                   BOOLEAN DEFAULT TRUE,
    atualizado_em           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_propriedade          UUID NOT NULL,
    
    CONSTRAINT PK_ENDERECO_PROPRIEDADE PRIMARY KEY (id_endereco_propriedade),
    CONSTRAINT FK_END_PROPRIEDADE FOREIGN KEY (id_propriedade) REFERENCES PROPRIEDADE(id_propriedade),
    -- Regra de Validação (CHECK)
    CONSTRAINT CK_END_PROP_NUMERO CHECK (numero IS NULL OR numero ~ '^[0-9]+$')
);

-- 5. TABELA REBANHO
CREATE TABLE REBANHO
(
    id_rebanho     UUID NOT NULL DEFAULT gen_random_uuid(),
    nome           VARCHAR(100),
    raca           VARCHAR(50),
    finalidade     VARCHAR(50),
    ativo          BOOLEAN DEFAULT TRUE,
    atualizado_em  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_propriedade UUID NOT NULL,
    
    CONSTRAINT PK_REBANHO PRIMARY KEY (id_rebanho),
    CONSTRAINT FK_REBANHO_PROPRIEDADE FOREIGN KEY (id_propriedade) REFERENCES PROPRIEDADE(id_propriedade)
);

-- 6. TABELA LOTE
CREATE TABLE LOTE
(
    id_lote       UUID NOT NULL DEFAULT gen_random_uuid(),
    categoria     VARCHAR(50),
    ativo         BOOLEAN DEFAULT TRUE,
    lote_excecao  BOOLEAN DEFAULT FALSE,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_rebanho    UUID NOT NULL,
    
    CONSTRAINT PK_LOTE PRIMARY KEY (id_lote),
    CONSTRAINT FK_LOTE_REBANHO FOREIGN KEY (id_rebanho) REFERENCES REBANHO(id_rebanho)
);

-- 7. TABELA ANIMAL_EXCECAO
CREATE TABLE ANIMAL_EXCECAO
(
    id_animal       UUID NOT NULL DEFAULT gen_random_uuid(),
    brinco          NUMERIC(15),
    peso            NUMERIC(6,2),
    data_nascimento DATE,
    observacoes     TEXT,
    ativo           BOOLEAN DEFAULT TRUE,
    atualizado_em   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_lote         UUID NOT NULL,
    
    CONSTRAINT PK_ANIMAL_EXCECAO PRIMARY KEY (id_animal),
    CONSTRAINT UK_ANIMAL_BRINCO UNIQUE (brinco),
    CONSTRAINT FK_ANIMAL_LOTE FOREIGN KEY (id_lote) REFERENCES LOTE(id_lote)
);

-- 8. TABELA PERIODO_CARENCIA
CREATE TABLE PERIODO_CARENCIA
(
    id_carencia         UUID NOT NULL DEFAULT gen_random_uuid(),
    liberado_para_abate BOOLEAN DEFAULT FALSE,
    data_fim_carencia   DATE,
    ativo               BOOLEAN DEFAULT TRUE,
    atualizado_em       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_animal           UUID NOT NULL,
    
    CONSTRAINT PK_PERIODO_CARENCIA PRIMARY KEY (id_carencia),
    CONSTRAINT FK_CARENCIA_ANIMAL FOREIGN KEY (id_animal) REFERENCES ANIMAL_EXCECAO(id_animal)
);

-- 9. TABELA FORNECEDOR
CREATE TABLE FORNECEDOR
(
    id_fornecedor UUID NOT NULL DEFAULT gen_random_uuid(),
    nome          VARCHAR(100),
    cnpj          CHAR(14),
    telefone      CHAR(20),
    email         VARCHAR(150),
    ativo         BOOLEAN DEFAULT TRUE,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT PK_FORNECEDOR PRIMARY KEY (id_fornecedor),
    CONSTRAINT UK_FORNECEDOR_CNPJ UNIQUE (cnpj),
    -- Regras de Validação (CHECK)
    CONSTRAINT CK_FORNECEDOR_CNPJ CHECK (cnpj IS NULL OR cnpj ~ '^[0-9]{14}$'),
    CONSTRAINT CK_FORNECEDOR_TELEFONE CHECK (telefone IS NULL OR telefone ~ '^[0-9]{10,11}$')
);

-- 10. TABELA ENDERECO_FORNECEDOR
CREATE TABLE ENDERECO_FORNECEDOR
(
    id_endereco_fornecedor UUID NOT NULL DEFAULT gen_random_uuid(),
    bairro                  VARCHAR(100),
    cidade                  VARCHAR(100),
    estado                  CHAR(2),
    numero                  CHAR(10),
    observacoes             TEXT,
    ativo                   BOOLEAN DEFAULT TRUE,
    atualizado_em           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_fornecedor           UUID NOT NULL,
    
    CONSTRAINT PK_ENDERECO_FORNECEDOR PRIMARY KEY (id_endereco_fornecedor),
    CONSTRAINT FK_END_FORNECEDOR FOREIGN KEY (id_fornecedor) REFERENCES FORNECEDOR(id_fornecedor),
    -- Regra de Validação (CHECK)
    CONSTRAINT CK_END_FORN_NUMERO CHECK (numero IS NULL OR numero ~ '^[0-9]+$')
);

-- 11. TABELA MEDICAMENTO
CREATE TABLE MEDICAMENTO
(
    id_medicamento        UUID NOT NULL DEFAULT gen_random_uuid(),
    nome                  VARCHAR(100),
    dose_ml               NUMERIC(6,2),
    principio_ativo       VARCHAR(100),
    carencia_indicada     INT,
    categoria_terapeutica VARCHAR(50),
    ativo                 BOOLEAN DEFAULT TRUE,
    atualizado_em         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_fornecedor         UUID NOT NULL,
    
    CONSTRAINT PK_MEDICAMENTO PRIMARY KEY (id_medicamento),
    CONSTRAINT FK_MEDICAMENTO_FORNECEDOR FOREIGN KEY (id_fornecedor) REFERENCES FORNECEDOR(id_fornecedor)
);

-- 12. TABELA ESTOQUE_MEDICAMENTO
CREATE TABLE ESTOQUE_MEDICAMENTO
(
    id_estoque_medicamento UUID NOT NULL DEFAULT gen_random_uuid(),
    lote_fabricacao        VARCHAR(50),
    qtd_disponivel         NUMERIC(10,2),
    local_armazenamento    VARCHAR(100),
    status                 VARCHAR(30),
    data_fabricacao        DATE,
    data_validade          DATE,
    data_entrega           DATE,
    ativo                  BOOLEAN DEFAULT TRUE,
    atualizado_em          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_medicamento         UUID NOT NULL,
    
    CONSTRAINT PK_ESTOQUE_MEDICAMENTO PRIMARY KEY (id_estoque_medicamento),
    CONSTRAINT FK_ESTOQUE_MEDICAMENTO FOREIGN KEY (id_medicamento) REFERENCES MEDICAMENTO(id_medicamento)
);

-- 13. TABELA APLICACAO
CREATE TABLE APLICACAO
(
    id_aplicacao           UUID NOT NULL DEFAULT gen_random_uuid(),
    dose_aplicada          NUMERIC(6,2),
    membro_aplicacao       VARCHAR(50),
    local_aplicacao        VARCHAR(100),
    objetivo               VARCHAR(100),
    data_hora              TIMESTAMP,
    observacoes            TEXT,
    ativo                  BOOLEAN DEFAULT TRUE,
    atualizado_em          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_animal              UUID NOT NULL,
    id_medicamento         UUID NOT NULL,
    id_estoque_medicamento UUID NOT NULL,
    
    CONSTRAINT PK_APLICACAO PRIMARY KEY (id_aplicacao),
    CONSTRAINT FK_APLICACAO_ANIMAL FOREIGN KEY (id_animal) REFERENCES ANIMAL_EXCECAO(id_animal),
    CONSTRAINT FK_APLICACAO_MEDICAMENTO FOREIGN KEY (id_medicamento) REFERENCES MEDICAMENTO(id_medicamento),
    CONSTRAINT FK_APLICACAO_ESTOQUE FOREIGN KEY (id_estoque_medicamento) REFERENCES ESTOQUE_MEDICAMENTO(id_estoque_medicamento)
);
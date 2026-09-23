-- ==============================================================================
	-- HABILITAÇÃO DE EXTENSÕES
	-- ==============================================================================
	CREATE EXTENSION IF NOT EXISTS "pgcrypto";
	CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

	-- ==============================================================================
	-- 1. TABELA ENDERECO
	-- ==============================================================================
	CREATE TABLE ENDERECO
	(
		id_endereco     UUID NOT NULL DEFAULT gen_random_uuid(),
		rua             VARCHAR(150),
		numero          INTEGER,
		cidade          VARCHAR(100),
		estado          CHAR(2),
		cep             CHAR(8),
		complemento     TEXT,
		ativo           BOOLEAN DEFAULT TRUE,
		atualizado_em   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

		CONSTRAINT PK_ENDERECO PRIMARY KEY (id_endereco),
		CONSTRAINT CK_ENDERECO_CEP CHECK (cep IS NULL OR cep ~ '^[0-9]{8}\s*$')
	);

	-- ==============================================================================
	-- 2. TABELA USUARIO
	-- ==============================================================================
	CREATE TABLE USUARIO
	(
		id_usuario      UUID NOT NULL DEFAULT gen_random_uuid(),
		nome_completo   VARCHAR(120),
		telefone        VARCHAR(20),
		cpf             VARCHAR(11),
		email           VARCHAR(120),
		cargo           VARCHAR(50),
		senha           CHAR(60) NOT NULL,
		data_nascimento DATE,
		ativo           BOOLEAN DEFAULT TRUE,
		atualizado_em   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

		CONSTRAINT PK_USUARIO PRIMARY KEY (id_usuario),
		CONSTRAINT UK_USUARIO_CPF UNIQUE (cpf),
		CONSTRAINT UK_USUARIO_EMAIL UNIQUE (email),
		CONSTRAINT CK_USUARIO_CPF CHECK (cpf IS NULL OR cpf ~ '^[0-9]{11}\s*$'),
		CONSTRAINT CK_USUARIO_TELEFONE CHECK (telefone IS NULL OR telefone ~ '^[0-9]{10,11}\s*$')
	);

	-- ==============================================================================
	-- 3. TABELA ADMIN
	-- ==============================================================================
	CREATE TABLE ADMIN
	(
		id_admin        UUID NOT NULL DEFAULT gen_random_uuid(),
		nome_completo   VARCHAR(120),
		cpf             VARCHAR(11),
		email           VARCHAR(120),
		telefone        VARCHAR(20),
		senha           CHAR(60) NOT NULL,
		ativo           BOOLEAN DEFAULT TRUE,
		atualizado_em   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

		CONSTRAINT PK_ADMIN PRIMARY KEY (id_admin),
		CONSTRAINT UK_ADMIN_CPF UNIQUE (cpf),
		CONSTRAINT UK_ADMIN_EMAIL UNIQUE (email),
		CONSTRAINT CK_ADMIN_CPF CHECK (cpf ~ '^[0-9]{11}\s*$'),
		CONSTRAINT CK_ADMIN_TELEFONE CHECK (telefone IS NULL OR telefone ~ '^[0-9]{10,11}\s*$')
	);

	-- ==============================================================================
	-- 4. TABELA PROPRIEDADE
	-- ==============================================================================
	CREATE TABLE PROPRIEDADE
	(
		id_propriedade  UUID NOT NULL DEFAULT gen_random_uuid(),
		nome            VARCHAR(120),
		cnpj            CHAR(14),
		telefone        VARCHAR(20),
		ativo           BOOLEAN DEFAULT TRUE,
		atualizado_em   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		id_usuario      UUID NOT NULL,
		id_endereco     UUID,

		CONSTRAINT PK_PROPRIEDADE PRIMARY KEY (id_propriedade),
		CONSTRAINT FK_PROPRIEDADE_USUARIO FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario),
		CONSTRAINT FK_PROPRIEDADE_ENDERECO FOREIGN KEY (id_endereco) REFERENCES ENDERECO(id_endereco),
		CONSTRAINT CK_PROPRIEDADE_CNPJ CHECK (cnpj IS NULL OR cnpj ~ '^[0-9]{14}\s*$'),
		CONSTRAINT CK_PROPRIEDADE_TELEFONE CHECK (telefone IS NULL OR telefone ~ '^[0-9]{10,11}\s*$')
	);

	-- ==============================================================================
	-- 5. TABELA REBANHO
	-- ==============================================================================
	CREATE TABLE REBANHO
	(
		id_rebanho      UUID NOT NULL DEFAULT gen_random_uuid(),
		nome            VARCHAR(100),
		raca            VARCHAR(50),
		finalidade      VARCHAR(50) DEFAULT 'Corte',
		qtd_cabecas     INT DEFAULT 0,
		ativo           BOOLEAN DEFAULT TRUE,
		atualizado_em   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		id_propriedade  UUID NOT NULL,

		CONSTRAINT PK_REBANHO PRIMARY KEY (id_rebanho),
		CONSTRAINT FK_REBANHO_PROPRIEDADE FOREIGN KEY (id_propriedade) REFERENCES PROPRIEDADE(id_propriedade),
		CONSTRAINT CK_REBANHO_QTD_CABECAS CHECK (qtd_cabecas >= 0),
		CONSTRAINT CK_REBANHO_FINALIDADE CHECK (UPPER(TRIM(finalidade)) = 'CORTE')
	);

	-- ==============================================================================
	-- 6. TABELA LOTE 
	-- ==============================================================================
	CREATE TABLE LOTE
	(
		id_lote         UUID NOT NULL DEFAULT gen_random_uuid(),
		codigo_lote     VARCHAR(20) NOT NULL,
		categoria       VARCHAR(30) NOT NULL,
		qtd_cabecas     INT DEFAULT 0,
		data_abertura   DATE,
		ativo           BOOLEAN DEFAULT TRUE,
		atualizado_em   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		id_rebanho      UUID NOT NULL,

		CONSTRAINT PK_LOTE PRIMARY KEY (id_lote),
		CONSTRAINT FK_LOTE_REBANHO FOREIGN KEY (id_rebanho) REFERENCES REBANHO(id_rebanho),
		CONSTRAINT UK_LOTE_CODIGO_REBANHO UNIQUE (id_rebanho, codigo_lote),
		CONSTRAINT CK_LOTE_QTD_CABECAS CHECK (qtd_cabecas >= 0),
		CONSTRAINT CK_LOTE_CATEGORIA CHECK (categoria IN ('ENGORDA', 'CRIA', 'RECRIA'))
	);

	-- ==============================================================================
	-- 7. TABELA ANIMAL
	-- ==============================================================================
	CREATE TABLE ANIMAL
	(
		id_animal           UUID NOT NULL DEFAULT gen_random_uuid(),
		brinco              VARCHAR(20) NOT NULL,
		peso                NUMERIC(7,2),
		data_nascimento     DATE,
		motivo_excecao      VARCHAR(255),
		data_inicio_excecao DATE NOT NULL,
		data_fim_excecao    DATE,
		liberado_abate      BOOLEAN DEFAULT FALSE,
		observacoes         TEXT,
		ativo               BOOLEAN DEFAULT TRUE,
		atualizado_em       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		id_lote             UUID NOT NULL,
		id_lote_origem      UUID,

		CONSTRAINT PK_ANIMAL PRIMARY KEY (id_animal),
		CONSTRAINT UK_ANIMAL_BRINCO_LOTE UNIQUE (id_lote, brinco),
		CONSTRAINT FK_ANIMAL_LOTE FOREIGN KEY (id_lote) REFERENCES LOTE(id_lote),
		CONSTRAINT FK_ANIMAL_LOTE_ORIGEM FOREIGN KEY (id_lote_origem) REFERENCES LOTE(id_lote),
		CONSTRAINT CK_ANIMAL_PESO CHECK (peso IS NULL OR peso > 0),
		CONSTRAINT CK_ANIMAL_DATAS_EXCECAO CHECK (data_fim_excecao IS NULL OR data_fim_excecao >= data_inicio_excecao)
	);

	-- ==============================================================================
	-- 8. TABELA PERIODO_CARENCIA
	-- ==============================================================================
	CREATE TABLE PERIODO_CARENCIA
	(
		id_carencia          UUID NOT NULL DEFAULT gen_random_uuid(),
		data_inicio_carencia DATE NOT NULL,
		data_fim_carencia    DATE,
		observacoes          TEXT,
		ativo                BOOLEAN DEFAULT TRUE,
		atualizado_em        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		id_animal            UUID NOT NULL,

		CONSTRAINT PK_PERIODO_CARENCIA PRIMARY KEY (id_carencia),
		CONSTRAINT FK_CARENCIA_ANIMAL FOREIGN KEY (id_animal) REFERENCES ANIMAL(id_animal),
		CONSTRAINT CK_CARENCIA_DATAS CHECK (data_fim_carencia IS NULL OR data_fim_carencia >= data_inicio_carencia)
	);

	-- ==============================================================================
	-- 9. TABELA FORNECEDOR
	-- ==============================================================================
	CREATE TABLE FORNECEDOR
	(
		id_fornecedor   UUID NOT NULL DEFAULT gen_random_uuid(),
		nome_completo   VARCHAR(120),
		cnpj            VARCHAR(14),
		telefone        VARCHAR(20),
		email           VARCHAR(120),
		ativo           BOOLEAN DEFAULT TRUE,
		atualizado_em   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		id_endereco     UUID,

		CONSTRAINT PK_FORNECEDOR PRIMARY KEY (id_fornecedor),
		CONSTRAINT UK_FORNECEDOR_CNPJ UNIQUE (cnpj),
		CONSTRAINT FK_FORNECEDOR_ENDERECO FOREIGN KEY (id_endereco) REFERENCES ENDERECO(id_endereco),
		CONSTRAINT CK_FORNECEDOR_CNPJ CHECK (cnpj IS NULL OR cnpj ~ '^[0-9]{14}\s*$'),
		CONSTRAINT CK_FORNECEDOR_TELEFONE CHECK (telefone IS NULL OR telefone ~ '^[0-9]{10,11}\s*$')
	);

	-- ==============================================================================
	-- 10. TABELA MEDICAMENTO
	-- ==============================================================================
	CREATE TABLE MEDICAMENTO
	(
		id_medicamento          UUID NOT NULL DEFAULT gen_random_uuid(),
		nome_comercial          VARCHAR(80),
		dose                    NUMERIC(10,3),
		unidade_medida          VARCHAR(10),
		principio_ativo         VARCHAR(80),
		indicacao               TEXT,
		carencia_indicada_dias INT DEFAULT 0,
		categoria_terapeutica   TEXT,
		ativo                   BOOLEAN DEFAULT TRUE,
		atualizado_em           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		id_fornecedor           UUID NOT NULL,

		CONSTRAINT PK_MEDICAMENTO PRIMARY KEY (id_medicamento),
		CONSTRAINT FK_MEDICAMENTO_FORNECEDOR FOREIGN KEY (id_fornecedor) REFERENCES FORNECEDOR(id_fornecedor),
		CONSTRAINT CK_MEDICAMENTO_CARENCIA CHECK (carencia_indicada_dias >= 0)
	);

	-- ==============================================================================
	-- 11. TABELA LOTE_MEDICAMENTO
	-- ==============================================================================
	CREATE TABLE LOTE_MEDICAMENTO
	(
		id_lote_medicamento UUID NOT NULL DEFAULT gen_random_uuid(),
		lote_fabricacao     VARCHAR(30),
		quantidade_inicial  NUMERIC(10,3),
		data_fabricacao     DATE NOT NULL,
		data_validade       DATE,
		data_entrada        DATE,
		id_medicamento      UUID NOT NULL,
		ativo               BOOLEAN DEFAULT TRUE,
		atualizado_em       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

		CONSTRAINT PK_LOTE_MEDICAMENTO PRIMARY KEY (id_lote_medicamento),
		CONSTRAINT FK_LOTE_MED_MEDICAMENTO FOREIGN KEY (id_medicamento) REFERENCES MEDICAMENTO(id_medicamento),
		CONSTRAINT CK_LOTE_MED_VALIDADE CHECK (data_validade IS NULL OR data_validade >= data_fabricacao),
		CONSTRAINT CK_LOTE_MED_QTD_INICIAL CHECK (quantidade_inicial >= 0)
	);

	-- ==============================================================================
	-- 12. TABELA ESTOQUE_MEDICAMENTO
	-- ==============================================================================
	CREATE TABLE ESTOQUE_MEDICAMENTO
	(
		id_estoque_medicamento  UUID NOT NULL DEFAULT gen_random_uuid(),
		quantidade_disponivel   NUMERIC(10,3),
		minimo_estoque          NUMERIC(10,3),
		maximo_estoque          NUMERIC(10,3),
		local_armazenamento     VARCHAR(60),
		ativo                   BOOLEAN DEFAULT TRUE,
		atualizado_em           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		id_lote_medicamento     UUID NOT NULL,

		CONSTRAINT PK_ESTOQUE_MEDICAMENTO PRIMARY KEY (id_estoque_medicamento),
		CONSTRAINT FK_ESTOQUE_LOTE_MEDICAMENTO FOREIGN KEY (id_lote_medicamento) REFERENCES LOTE_MEDICAMENTO(id_lote_medicamento),
		CONSTRAINT CK_ESTOQUE_QTD_DISPONIVEL CHECK (quantidade_disponivel >= 0),
		CONSTRAINT CK_ESTOQUE_MIN_MAX CHECK (minimo_estoque <= maximo_estoque)
	);

	-- ==============================================================================
	-- 13. TABELA APLICACAO
	-- ==============================================================================
	CREATE TABLE APLICACAO
	(
		id_aplicacao            UUID NOT NULL DEFAULT gen_random_uuid(),
		dose                    NUMERIC(10,3),
		unidade_medida          VARCHAR(10),
		qtd_cabecas_aplicadas   INT DEFAULT 1,
		via_administracao       VARCHAR(20),
		membro_aplicacao        VARCHAR(50),
		local_aplicacao         VARCHAR(100),
		objetivo                VARCHAR(120),
		data_hora               TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		observacoes             TEXT,
		ativo                   BOOLEAN DEFAULT TRUE,
		atualizado_em           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		id_usuario              UUID NOT NULL,
		id_lote_medicamento     UUID NOT NULL,
		id_lote                 UUID NOT NULL,

		CONSTRAINT PK_APLICACAO PRIMARY KEY (id_aplicacao),
		CONSTRAINT FK_APLICACAO_USUARIO FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario),
		CONSTRAINT FK_APLICACAO_LOTE_MEDICAMENTO FOREIGN KEY (id_lote_medicamento) REFERENCES LOTE_MEDICAMENTO(id_lote_medicamento),
		CONSTRAINT FK_APLICACAO_LOTE FOREIGN KEY (id_lote) REFERENCES LOTE(id_lote),
		CONSTRAINT CK_APLICACAO_VIA CHECK (via_administracao IS NULL OR UPPER(TRIM(via_administracao)) IN ('INTRAMUSCULAR', 'SUBCUTANEA', 'ORAL', 'TOPICA', 'INTRAVENOSA')),
		CONSTRAINT CK_APLICACAO_QTD_CABECAS CHECK (qtd_cabecas_aplicadas > 0)
	);
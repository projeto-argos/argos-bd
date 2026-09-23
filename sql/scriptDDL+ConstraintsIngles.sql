-- ==============================================================================
	-- ENABLE EXTENSIONS
	-- ==============================================================================
	CREATE EXTENSION IF NOT EXISTS "pgcrypto";
	CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

	-- ==============================================================================
	-- 1. TABLE ADDRESS
	-- ==============================================================================
	CREATE TABLE ADDRESS
	(
		id_address      UUID NOT NULL DEFAULT gen_random_uuid(),
		street          VARCHAR(150),
		number          INTEGER,
		city            VARCHAR(100),
		state           CHAR(2),
		zip_code        CHAR(8),
		complement      TEXT,
		active          BOOLEAN DEFAULT TRUE,
		updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

		CONSTRAINT PK_ADDRESS PRIMARY KEY (id_address),
		CONSTRAINT CK_ADDRESS_ZIP_CODE CHECK (zip_code IS NULL OR zip_code ~ '^[0-9]{8}\s*$')
	);

	-- ==============================================================================
	-- 2. TABLE USER
	-- ==============================================================================
	CREATE TABLE "USER"
	(
		id_user         UUID NOT NULL DEFAULT gen_random_uuid(),
		full_name       VARCHAR(120),
		phone           VARCHAR(20),
		cpf             VARCHAR(11),
		email           VARCHAR(120),
		role            VARCHAR(50),
		password        CHAR(60) NOT NULL,
		birth_date      DATE,
		active          BOOLEAN DEFAULT TRUE,
		updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

		CONSTRAINT PK_USER PRIMARY KEY (id_user),
		CONSTRAINT UK_USER_CPF UNIQUE (cpf),
		CONSTRAINT UK_USER_EMAIL UNIQUE (email),
		CONSTRAINT CK_USER_CPF CHECK (cpf IS NULL OR cpf ~ '^[0-9]{11}\s*$'),
		CONSTRAINT CK_USER_PHONE CHECK (phone IS NULL OR phone ~ '^[0-9]{10,11}\s*$')
	);

	-- ==============================================================================
	-- 3. TABLE ADMIN
	-- ==============================================================================
	CREATE TABLE ADMIN
	(
		id_admin        UUID NOT NULL DEFAULT gen_random_uuid(),
		full_name       VARCHAR(120),
		cpf             VARCHAR(11),
		email           VARCHAR(120),
		phone           VARCHAR(20),
		password        CHAR(60) NOT NULL,
		active          BOOLEAN DEFAULT TRUE,
		updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

		CONSTRAINT PK_ADMIN PRIMARY KEY (id_admin),
		CONSTRAINT UK_ADMIN_CPF UNIQUE (cpf),
		CONSTRAINT UK_ADMIN_EMAIL UNIQUE (email),
		CONSTRAINT CK_ADMIN_CPF CHECK (cpf ~ '^[0-9]{11}\s*$'),
		CONSTRAINT CK_ADMIN_PHONE CHECK (phone IS NULL OR phone ~ '^[0-9]{10,11}\s*$')
	);

	-- ==============================================================================
	-- 4. TABLE PROPERTY
	-- ==============================================================================
	CREATE TABLE PROPERTY
	(
		id_property     UUID NOT NULL DEFAULT gen_random_uuid(),
		name            VARCHAR(120),
		cnpj            CHAR(14),
		phone           VARCHAR(20),
		active          BOOLEAN DEFAULT TRUE,
		updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		id_user         UUID NOT NULL,
		id_address      UUID,

		CONSTRAINT PK_PROPERTY PRIMARY KEY (id_property),
		CONSTRAINT FK_PROPERTY_USER FOREIGN KEY (id_user) REFERENCES "USER"(id_user),
		CONSTRAINT FK_PROPERTY_ADDRESS FOREIGN KEY (id_address) REFERENCES ADDRESS(id_address),
		CONSTRAINT CK_PROPERTY_CNPJ CHECK (cnpj IS NULL OR cnpj ~ '^[0-9]{14}\s*$'),
		CONSTRAINT CK_PROPERTY_PHONE CHECK (phone IS NULL OR phone ~ '^[0-9]{10,11}\s*$')
	);

	-- ==============================================================================
	-- 5. TABLE HERD
	-- ==============================================================================
	CREATE TABLE HERD
	(
		id_herd         UUID NOT NULL DEFAULT gen_random_uuid(),
		name            VARCHAR(100),
		breed           VARCHAR(50),
		purpose         VARCHAR(50) DEFAULT 'Beef',
		head_count      INT DEFAULT 0,
		active          BOOLEAN DEFAULT TRUE,
		updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		id_property     UUID NOT NULL,

		CONSTRAINT PK_HERD PRIMARY KEY (id_herd),
		CONSTRAINT FK_HERD_PROPERTY FOREIGN KEY (id_property) REFERENCES PROPERTY(id_property),
		CONSTRAINT CK_HERD_HEAD_COUNT CHECK (head_count >= 0),
		CONSTRAINT CK_HERD_PURPOSE CHECK (UPPER(TRIM(purpose)) = 'BEEF')
	);

	-- ==============================================================================
	-- 6. TABLE BATCH 
	-- ==============================================================================
	CREATE TABLE BATCH
	(
		id_batch        UUID NOT NULL DEFAULT gen_random_uuid(),
		batch_code      VARCHAR(20) NOT NULL,
		category        VARCHAR(30) NOT NULL,
		head_count      INT DEFAULT 0,
		opening_date    DATE,
		active          BOOLEAN DEFAULT TRUE,
		updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		id_herd         UUID NOT NULL,

		CONSTRAINT PK_BATCH PRIMARY KEY (id_batch),
		CONSTRAINT FK_BATCH_HERD FOREIGN KEY (id_herd) REFERENCES HERD(id_herd),
		CONSTRAINT UK_BATCH_CODE_HERD UNIQUE (id_herd, batch_code),
		CONSTRAINT CK_BATCH_HEAD_COUNT CHECK (head_count >= 0),
		CONSTRAINT CK_BATCH_CATEGORY CHECK (category IN ('FATTENING', 'BREEDING', 'REARING'))
	);

	-- ==============================================================================
	-- 7. TABLE ANIMAL
	-- ==============================================================================
	CREATE TABLE ANIMAL
	(
		id_animal           UUID NOT NULL DEFAULT gen_random_uuid(),
		ear_tag             VARCHAR(20) NOT NULL,
		weight              NUMERIC(7,2),
		birth_date          DATE,
		exception_reason    VARCHAR(255),
		exception_start_date DATE NOT NULL,
		exception_end_date   DATE,
		cleared_for_slaughter BOOLEAN DEFAULT FALSE,
		notes               TEXT,
		active              BOOLEAN DEFAULT TRUE,
		updated_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		id_batch            UUID NOT NULL,
		id_origin_batch     UUID,

		CONSTRAINT PK_ANIMAL PRIMARY KEY (id_animal),
		CONSTRAINT UK_ANIMAL_EARTAG_BATCH UNIQUE (id_batch, ear_tag),
		CONSTRAINT FK_ANIMAL_BATCH FOREIGN KEY (id_batch) REFERENCES BATCH(id_batch),
		CONSTRAINT FK_ANIMAL_ORIGIN_BATCH FOREIGN KEY (id_origin_batch) REFERENCES BATCH(id_batch),
		CONSTRAINT CK_ANIMAL_WEIGHT CHECK (weight IS NULL OR weight > 0),
		CONSTRAINT CK_ANIMAL_EXCEPTION_DATES CHECK (exception_end_date IS NULL OR exception_end_date >= exception_start_date)
	);

	-- ==============================================================================
	-- 8. TABLE WITHDRAWAL_PERIOD
	-- ==============================================================================
	CREATE TABLE WITHDRAWAL_PERIOD
	(
		id_withdrawal           UUID NOT NULL DEFAULT gen_random_uuid(),
		withdrawal_start_date   DATE NOT NULL,
		withdrawal_end_date     DATE,
		notes                   TEXT,
		active                  BOOLEAN DEFAULT TRUE,
		updated_at              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		id_animal               UUID NOT NULL,

		CONSTRAINT PK_WITHDRAWAL_PERIOD PRIMARY KEY (id_withdrawal),
		CONSTRAINT FK_WITHDRAWAL_ANIMAL FOREIGN KEY (id_animal) REFERENCES ANIMAL(id_animal),
		CONSTRAINT CK_WITHDRAWAL_DATES CHECK (withdrawal_end_date IS NULL OR withdrawal_end_date >= withdrawal_start_date)
	);

	-- ==============================================================================
	-- 9. TABLE SUPPLIER
	-- ==============================================================================
	CREATE TABLE SUPPLIER
	(
		id_supplier     UUID NOT NULL DEFAULT gen_random_uuid(),
		full_name       VARCHAR(120),
		cnpj            VARCHAR(14),
		phone           VARCHAR(20),
		email           VARCHAR(120),
		active          BOOLEAN DEFAULT TRUE,
		updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		id_address      UUID,

		CONSTRAINT PK_SUPPLIER PRIMARY KEY (id_supplier),
		CONSTRAINT UK_SUPPLIER_CNPJ UNIQUE (cnpj),
		CONSTRAINT FK_SUPPLIER_ADDRESS FOREIGN KEY (id_address) REFERENCES ADDRESS(id_address),
		CONSTRAINT CK_SUPPLIER_CNPJ CHECK (cnpj IS NULL OR cnpj ~ '^[0-9]{14}\s*$'),
		CONSTRAINT CK_SUPPLIER_PHONE CHECK (phone IS NULL OR phone ~ '^[0-9]{10,11}\s*$')
	);

	-- ==============================================================================
	-- 10. TABLE MEDICATION
	-- ==============================================================================
	CREATE TABLE MEDICATION
	(
		id_medication           UUID NOT NULL DEFAULT gen_random_uuid(),
		trade_name              VARCHAR(80),
		dosage                  NUMERIC(10,3),
		unit_of_measure         VARCHAR(10),
		active_ingredient       VARCHAR(80),
		indication              TEXT,
		indicated_withdrawal_days INT DEFAULT 0,
		therapeutic_category    TEXT,
		active                  BOOLEAN DEFAULT TRUE,
		updated_at              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		id_supplier             UUID NOT NULL,

		CONSTRAINT PK_MEDICATION PRIMARY KEY (id_medication),
		CONSTRAINT FK_MEDICATION_SUPPLIER FOREIGN KEY (id_supplier) REFERENCES SUPPLIER(id_supplier),
		CONSTRAINT CK_MEDICATION_WITHDRAWAL CHECK (indicated_withdrawal_days >= 0)
	);

	-- ==============================================================================
	-- 11. TABLE MEDICATION_BATCH
	-- ==============================================================================
	CREATE TABLE MEDICATION_BATCH
	(
		id_medication_batch UUID NOT NULL DEFAULT gen_random_uuid(),
		manufacturing_batch VARCHAR(30),
		initial_quantity    NUMERIC(10,3),
		manufacturing_date  DATE NOT NULL,
		expiration_date     DATE,
		entry_date          DATE,
		id_medication       UUID NOT NULL,
		active              BOOLEAN DEFAULT TRUE,
		updated_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

		CONSTRAINT PK_MEDICATION_BATCH PRIMARY KEY (id_medication_batch),
		CONSTRAINT FK_MED_BATCH_MEDICATION FOREIGN KEY (id_medication) REFERENCES MEDICATION(id_medication),
		CONSTRAINT CK_MED_BATCH_EXPIRATION CHECK (expiration_date IS NULL OR expiration_date >= manufacturing_date),
		CONSTRAINT CK_MED_BATCH_INITIAL_QTY CHECK (initial_quantity >= 0)
	);

	-- ==============================================================================
	-- 12. TABLE MEDICATION_INVENTORY
	-- ==============================================================================
	CREATE TABLE MEDICATION_INVENTORY
	(
		id_medication_inventory UUID NOT NULL DEFAULT gen_random_uuid(),
		available_quantity      NUMERIC(10,3),
		minimum_stock           NUMERIC(10,3),
		maximum_stock           NUMERIC(10,3),
		storage_location        VARCHAR(60),
		active                  BOOLEAN DEFAULT TRUE,
		updated_at              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		id_medication_batch     UUID NOT NULL,

		CONSTRAINT PK_MEDICATION_INVENTORY PRIMARY KEY (id_medication_inventory),
		CONSTRAINT FK_INVENTORY_MEDICATION_BATCH FOREIGN KEY (id_medication_batch) REFERENCES MEDICATION_BATCH(id_medication_batch),
		CONSTRAINT CK_INVENTORY_AVAILABLE_QTY CHECK (available_quantity >= 0),
		CONSTRAINT CK_INVENTORY_MIN_MAX CHECK (minimum_stock <= maximum_stock)
	);

	-- ==============================================================================
	-- 13. TABLE APPLICATION
	-- ==============================================================================
	CREATE TABLE APPLICATION
	(
		id_application          UUID NOT NULL DEFAULT gen_random_uuid(),
		dosage                  NUMERIC(10,3),
		unit_of_measure         VARCHAR(10),
		treated_head_count      INT DEFAULT 1,
		administration_route    VARCHAR(20),
		application_limb        VARCHAR(50),
		application_site        VARCHAR(100),
		objective               VARCHAR(120),
		date_time               TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		notes                   TEXT,
		active                  BOOLEAN DEFAULT TRUE,
		updated_at              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		id_user                 UUID NOT NULL,
		id_medication_batch     UUID NOT NULL,
		id_batch                UUID NOT NULL,

		CONSTRAINT PK_APPLICATION PRIMARY KEY (id_application),
		CONSTRAINT FK_APPLICATION_USER FOREIGN KEY (id_user) REFERENCES "USER"(id_user),
		CONSTRAINT FK_APPLICATION_MEDICATION_BATCH FOREIGN KEY (id_medication_batch) REFERENCES MEDICATION_BATCH(id_medication_batch),
		CONSTRAINT FK_APPLICATION_BATCH FOREIGN KEY (id_batch) REFERENCES BATCH(id_batch),
		CONSTRAINT CK_APPLICATION_ROUTE CHECK (administration_route IS NULL OR UPPER(TRIM(administration_route)) IN ('INTRAMUSCULAR', 'SUBCUTANEOUS', 'ORAL', 'TOPICAL', 'INTRAVENOUS')),
		CONSTRAINT CK_APPLICATION_HEAD_COUNT CHECK (treated_head_count > 0)
	);

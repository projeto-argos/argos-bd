-- ==============================================================================
	-- DATALOAD
	-- ==============================================================================
	-- 1. TABLE ADDRESS
	INSERT INTO ADDRESS (id_address, street, number, city, state, zip_code, complement) VALUES
	('44444444-4444-4444-4444-000000000001', 'Rua Central', 101, 'Ribeirão Preto', 'SP', '14000000', 'Bairro Centro'),
	('44444444-4444-4444-4444-000000000002', 'Estrada Rural Um', 202, 'Barretos', 'SP', '14780000', 'Zona Rural'),
	('44444444-4444-4444-4444-000000000003', 'Av. Industrial', 303, 'Sertãozinho', 'SP', '14160000', 'Distrito Industrial'),
	('44444444-4444-4444-4444-000000000004', 'Rodovia SP-330', 404, 'Ribeirão Preto', 'SP', '14000001', 'Km 12'),
	('44444444-4444-4444-4444-000000000005', 'Rua das Palmeiras', 505, 'Ribeirão Preto', 'SP', '14000002', 'Chácara 5'),
	('44444444-4444-4444-4444-000000000006', 'Alameda dos Ipês', 606, 'Ribeirão Preto', 'SP', '14000003', 'Sítio Primavera'),
	('44444444-4444-4444-4444-000000000007', 'Estrada do Agreste', 707, 'Barretos', 'SP', '14780001', 'Gleba B'),
	('44444444-4444-4444-4444-000000000008', 'Avenida Sertão', 808, 'Sertãozinho', 'SP', '14160001', 'Setor Agrícola'),
	('44444444-4444-4444-4444-000000000009', 'Rua das Flores', 909, 'Ribeirão Preto', 'SP', '14000004', 'Bloco A'),
	('44444444-4444-4444-4444-000000000010', 'Estrada Municipal', 1010, 'Barretos', 'SP', '14780002', 'Km 45'),
	('44444444-4444-4444-4444-000000000011', 'Via de Acesso Leste', 1111, 'Sertãozinho', 'SP', '14160002', 'Galpão 3'),
	('44444444-4444-4444-4444-000000000012', 'Rua São José', 1212, 'Ribeirão Preto', 'SP', '14000005', 'Ao lado da igreja'),
	('44444444-4444-4444-4444-000000000013', 'Rodovia BR-050', 1313, 'Barretos', 'SP', '14780003', 'Fazenda Bela Vista'),
	('44444444-4444-4444-4444-000000000014', 'Estrada da Boiada', 1414, 'Sertãozinho', 'SP', '14160003', 'Área Rural 10'),
	('99999999-9999-9999-9999-000000000001', 'Av. dos Insumos', 50, 'Cravinhos', 'SP', '14150000', 'Distrito Industrial 1');

	-- 2. TABLE "USER"
	INSERT INTO "USER" (id_user, full_name, phone, cpf, email, role, password, birth_date) VALUES
	('11111111-1111-1111-1111-000000000001', 'Ana Silva', '11988887701', '12345678901', 'ana.silva@email.com', 'Veterinarian', crypt('senha123', gen_salt('bf', 12)), '1990-05-12'),
	('11111111-1111-1111-1111-000000000002', 'Bruno Costa', '11988887702', '12345678902', 'bruno.costa@email.com', 'Manager', crypt('senha123', gen_salt('bf', 12)), '1985-08-20'),
	('11111111-1111-1111-1111-000000000003', 'Carlos Eduardo', '11988887703', '12345678903', 'carlos.eduardo@email.com', 'Animal Scientist', crypt('senha123', gen_salt('bf', 12)), '1992-03-15'),
	('11111111-1111-1111-1111-000000000004', 'Daniela Rocha', '11988887704', '12345678904', 'daniela.rocha@email.com', 'Veterinarian', crypt('senha123', gen_salt('bf', 12)), '1994-11-02'),
	('11111111-1111-1111-1111-000000000005', 'Eduardo Lima', '11988887705', '12345678905', 'eduardo.lima@email.com', 'Foreman', crypt('senha123', gen_salt('bf', 12)), '1988-01-30'),
	('11111111-1111-1111-1111-000000000006', 'Fernanda Souza', '11988887706', '12345678906', 'fernanda.souza@email.com', 'Field Administrator', crypt('senha123', gen_salt('bf', 12)), '1996-07-22'),
	('11111111-1111-1111-1111-000000000007', 'Gabriel Alves', '11988887707', '12345678907', 'gabriel.alves@email.com', 'Tractor Driver', crypt('senha123', gen_salt('bf', 12)), '1991-09-10'),
	('11111111-1111-1111-1111-000000000008', 'Helena Martins', '11988887708', '12345678908', 'helena.martins@email.com', 'Veterinarian', crypt('senha123', gen_salt('bf', 12)), '1993-04-18'),
	('11111111-1111-1111-1111-000000000009', 'Igor Ferreira', '11988887709', '12345678909', 'igor.ferreira@email.com', 'Handling Assistant', crypt('senha123', gen_salt('bf', 12)), '1998-12-05'),
	('11111111-1111-1111-1111-000000000010', 'Juliana Paes', '11988887710', '12345678910', 'juliana.paes@email.com', 'Supervisor', crypt('senha123', gen_salt('bf', 12)), '1987-06-14'),
	('11111111-1111-1111-1111-000000000011', 'Lucas Mendes', '11988887711', '12345678911', 'lucas.mendes@email.com', 'Manager', crypt('senha123', gen_salt('bf', 12)), '1983-02-28'),
	('11111111-1111-1111-1111-000000000012', 'Mariana Oliveira', '11988887712', '12345678912', 'mariana.oliveira@email.com', 'Animal Scientist', crypt('senha123', gen_salt('bf', 12)), '1995-10-08'),
	('11111111-1111-1111-1111-000000000013', 'Nicolas Santos', '11988887713', '12345678913', 'nicolas.santos@email.com', 'Handling Assistant', crypt('senha123', gen_salt('bf', 12)), '1999-03-25'),
	('11111111-1111-1111-1111-000000000014', 'Patricia Ribeiro', '11988887714', '12345678914', 'patricia.ribeiro@email.com', 'Veterinarian', crypt('senha123', gen_salt('bf', 12)), '1991-01-19'),
	('11111111-1111-1111-1111-000000000015', 'Rafael Barbosa', '11988887715', '12345678915', 'rafael.barbosa@email.com', 'Foreman', crypt('senha123', gen_salt('bf', 12)), '1989-07-04');

	-- 3. TABLE ADMIN
	INSERT INTO ADMIN (full_name, cpf, email, phone, password) VALUES
	('Letícia Favoretto',    '11122233301', 'leticia.favoretto@email.com', '11988880001', crypt('admin123', gen_salt('bf', 12))),
	('Enzo Neves',           '11122233302', 'enzo.neves@email.com',        '11988880002', crypt('admin123', gen_salt('bf', 12))),
	('Luiz Henrique',        '11122233303', 'luiz.henrique@email.com',     '11988880003', crypt('admin123', gen_salt('bf', 12))),
	('Beatriz Dias',         '11122233304', 'beatriz.dias@email.com',      '11988880004', crypt('admin123', gen_salt('bf', 12))),
	('Vinicius de Oliveira', '11122233305', 'vinicius.oliveira@email.com', '11988880005', crypt('admin123', gen_salt('bf', 12))),
	('Matheus Fazan',        '11122233306', 'matheus.fazan@email.com',     '11988880006', crypt('admin123', gen_salt('bf', 12))),
	('Eduardo Toledo',       '11122233307', 'eduardo.toledo@email.com',    '11988880007', crypt('admin123', gen_salt('bf', 12))),
	('Murilo Paiva',         '11122233308', 'murilo.paiva@email.com',      '11988880008', crypt('admin123', gen_salt('bf', 12))),
	('Lucca Cansani',        '11122233309', 'lucca.cansani@email.com',     '11988880009', crypt('admin123', gen_salt('bf', 12))),
	('Pietra Gomes',         '11122233310', 'pietra.gomes@email.com',      '11988880010', crypt('admin123', gen_salt('bf', 12))),
	('Leticia Ribeiro',      '11122233311', 'leticia.ribeiro@email.com',   '11988880011', crypt('admin123', gen_salt('bf', 12)));

	-- 4. TABLE PROPERTY
	INSERT INTO PROPERTY (id_property, name, cnpj, phone, id_user, id_address) VALUES
	('22222222-2222-2222-2222-000000000001', 'Fazenda Sol Nascente', '12345678000101', '1633334401', '11111111-1111-1111-1111-000000000001', '44444444-4444-4444-4444-000000000001'),
	('22222222-2222-2222-2222-000000000002', 'Sítio das Águas', '12345678000102', '1633334402', '11111111-1111-1111-1111-000000000002', '44444444-4444-4444-4444-000000000002'),
	('22222222-2222-2222-2222-000000000003', 'Fazenda Santa Maria', '12345678000103', '1633334403', '11111111-1111-1111-1111-000000000003', '44444444-4444-4444-4444-000000000003'),
	('22222222-2222-2222-2222-000000000004', 'Estância Boi Gordo', '12345678000104', '1633334404', '11111111-1111-1111-1111-000000000004', '44444444-4444-4444-4444-000000000004'),
	('22222222-2222-2222-2222-000000000005', 'Fazenda Monte Verde', '12345678000105', '1633334405', '11111111-1111-1111-1111-000000000005', '44444444-4444-4444-4444-000000000005'),
	('22222222-2222-2222-2222-000000000006', 'Sítio Recanto Feliz', '12345678000106', '1633334406', '11111111-1111-1111-1111-000000000006', '44444444-4444-4444-4444-000000000006'),
	('22222222-2222-2222-2222-000000000007', 'Fazenda Palmeiras', '12345678000107', '1633334407', '11111111-1111-1111-1111-000000000007', '44444444-4444-4444-4444-000000000007'),
	('22222222-2222-2222-2222-000000000008', 'Fazenda Planalto', '12345678000108', '1633334408', '11111111-1111-1111-1111-000000000008', '44444444-4444-4444-4444-000000000008'),
	('22222222-2222-2222-2222-000000000009', 'Sítio Boa Vista', '12345678000109', '1633334409', '11111111-1111-1111-1111-000000000009', '44444444-4444-4444-4444-000000000009'),
	('22222222-2222-2222-2222-000000000010', 'Fazenda Vale Verde', '12345678000110', '1633334410', '11111111-1111-1111-1111-000000000010', '44444444-4444-4444-4444-000000000010'),
	('22222222-2222-2222-2222-000000000011', 'Estância Querência', '12345678000111', '1633334411', '11111111-1111-1111-1111-000000000011', '44444444-4444-4444-4444-000000000011'),
	('22222222-2222-2222-2222-000000000012', 'Fazenda São João', '12345678000112', '1633334412', '11111111-1111-1111-1111-000000000012', '44444444-4444-4444-4444-000000000012'),
	('22222222-2222-2222-2222-000000000013', 'Sítio Alvorada', '12345678000113', '1633334413', '11111111-1111-1111-1111-000000000013', '44444444-4444-4444-4444-000000000013'),
	('22222222-2222-2222-2222-000000000014', 'Fazenda Ouro Branco', '12345678000114', '1633334414', '11111111-1111-1111-1111-000000000014', '44444444-4444-4444-4444-000000000014'),
	('22222222-2222-2222-2222-000000000015', 'Fazenda Terra Prometida', '12345678000115', '1633334415', '11111111-1111-1111-1111-000000000015', '99999999-9999-9999-9999-000000000001');

	-- 5. TABLE HERD
	INSERT INTO HERD (id_herd, name, breed, purpose, head_count, id_property) VALUES
	('33333333-3333-3333-3333-000000000001', 'Nelore Elite A', 'Nelore', 'Beef', 50, '22222222-2222-2222-2222-000000000001'),
	('33333333-3333-3333-3333-000000000002', 'Angus Premium', 'Angus', 'Beef', 40, '22222222-2222-2222-2222-000000000002'),
	('33333333-3333-3333-3333-000000000003', 'Gyr Corte', 'Gyr', 'Beef', 30, '22222222-2222-2222-2222-000000000003'),
	('33333333-3333-3333-3333-000000000004', 'Brahman Comercial', 'Brahman', 'Beef', 60, '22222222-2222-2222-2222-000000000004'),
	('33333333-3333-3333-3333-000000000005', 'Brangus Engorda', 'Brangus', 'Beef', 25, '22222222-2222-2222-2222-000000000005'),
	('33333333-3333-3333-3333-000000000006', 'Senepol Puro', 'Senepol', 'Beef', 35, '22222222-2222-2222-2222-000000000006'),
	('33333333-3333-3333-3333-000000000007', 'Girolando Recria', 'Girolando', 'Beef', 45, '22222222-2222-2222-2222-000000000007'),
	('33333333-3333-3333-3333-000000000008', 'Nelore Mocho', 'Nelore', 'Beef', 55, '22222222-2222-2222-2222-000000000008'),
	('33333333-3333-3333-3333-000000000009', 'Hereford Sul', 'Hereford', 'Beef', 20, '22222222-2222-2222-2222-000000000009'),
	('33333333-3333-3333-3333-000000000010', 'Wagyu Seleção', 'Wagyu', 'Beef', 15, '22222222-2222-2222-2222-000000000010'),
	('33333333-3333-3333-3333-000000000011', 'Tabapuã Nelore', 'Tabapuã', 'Beef', 30, '22222222-2222-2222-2222-000000000011'),
	('33333333-3333-3333-3333-000000000012', 'Holandês Machos Corte', 'Holandês (Corte)', 'Beef', 40, '22222222-2222-2222-2222-000000000012'),
	('33333333-3333-3333-3333-000000000013', 'Guzerá Rústico', 'Guzerá', 'Beef', 35, '22222222-2222-2222-2222-000000000013'),
	('33333333-3333-3333-3333-000000000014', 'Canchim Confinamento', 'Canchim', 'Beef', 50, '22222222-2222-2222-2222-000000000014'),
	('33333333-3333-3333-3333-000000000015', 'Santa Gertrudis', 'Santa Gertrudis', 'Beef', 28, '22222222-2222-2222-2222-000000000015');

	-- 6. TABLE BATCH 
	INSERT INTO BATCH (id_batch, batch_code, category, head_count, opening_date, id_herd) VALUES
	('55555555-5555-5555-5555-000000000001', 'LOTE-001', 'BREEDING', 10, '2026-01-01', '33333333-3333-3333-3333-000000000001'),
	('55555555-5555-5555-5555-000000000002', 'LOTE-002', 'REARING', 12, '2026-01-01', '33333333-3333-3333-3333-000000000002'),
	('55555555-5555-5555-5555-000000000003', 'LOTE-003', 'FATTENING', 15, '2026-01-05', '33333333-3333-3333-3333-000000000003'),
	('55555555-5555-5555-5555-000000000004', 'LOTE-004', 'REARING', 20, '2026-01-10', '33333333-3333-3333-3333-000000000004'),
	('55555555-5555-5555-5555-000000000005', 'LOTE-005', 'FATTENING', 8, '2026-01-12', '33333333-3333-3333-3333-000000000005'),
	('55555555-5555-5555-5555-000000000006', 'LOTE-006', 'REARING', 5, '2026-01-15', '33333333-3333-3333-3333-000000000006'),
	('55555555-5555-5555-5555-000000000007', 'LOTE-007', 'REARING', 14, '2026-01	-20', '33333333-3333-3333-3333-000000000007'),
	('55555555-5555-5555-5555-000000000008', 'LOTE-008', 'FATTENING', 25, '2026-01-22', '33333333-3333-3333-3333-000000000008'),
	('55555555-5555-5555-5555-000000000009', 'LOTE-009', 'BREEDING', 10, '2026-02-01', '33333333-3333-3333-3333-000000000009'),
	('55555555-5555-5555-5555-000000000010', 'LOTE-010', 'FATTENING', 15, '2026-02-03', '33333333-3333-3333-3333-000000000010'),
	('55555555-5555-5555-5555-000000000011', 'LOTE-011', 'REARING', 18, '2026-02-05', '33333333-3333-3333-3333-000000000011'),
	('55555555-5555-5555-5555-000000000012', 'LOTE-012', 'FATTENING', 12, '2026-02-10', '33333333-3333-3333-3333-000000000012'),
	('55555555-5555-5555-5555-000000000013', 'LOTE-013', 'FATTENING', 16, '2026-02-12', '33333333-3333-3333-3333-000000000013'),
	('55555555-5555-5555-5555-000000000014', 'LOTE-014', 'FATTENING', 22, '2026-02-15', '33333333-3333-3333-3333-000000000014'),
	('55555555-5555-5555-5555-000000000015', 'LOTE-015', 'REARING', 19, '2026-02-20', '33333333-3333-3333-3333-000000000015');

	-- 7. TABLE ANIMAL
	INSERT INTO ANIMAL (id_animal, ear_tag, weight, birth_date, exception_reason, exception_start_date, exception_end_date, notes, id_batch) VALUES
	('66666666-6666-6666-6666-000000000001', 'BR-001', 450.50, '2023-01-15', 'Tratamento de Pneumonia e isolamento', '2026-01-10', '2026-02-10', 'Animal em isolamento na enfermaria', '55555555-5555-5555-5555-000000000001'),
	('66666666-6666-6666-6666-000000000002', 'BR-002', 480.00, '2023-02-10', 'Tratamento de Miíase no casco', '2026-01-15', '2026-02-05', 'Curativo local e aplicação de larvicida', '55555555-5555-5555-5555-000000000002'),
	('66666666-6666-6666-6666-000000000003', 'BR-003', 510.20, '2022-11-05', 'Fotossensibilização por intoxicação alimentar', '2026-01-12', '2026-02-01', 'Colocado em piquete com sombra', '55555555-5555-5555-5555-000000000003'),
	('66666666-6666-6666-6666-000000000004', 'BR-004', 390.00, '2023-05-20', 'Reação vacinal intensa no pescoço', '2026-01-18', '2026-01-28', 'Aplicado anti-inflamatório local', '55555555-5555-5555-5555-000000000004'),
	('66666666-6666-6666-6666-000000000005', 'BR-005', 530.80, '2022-08-14', 'Ferimento por arame e infecção de pele', '2026-01-20', '2026-02-10', 'Sutura e profilaxia antibiótica', '55555555-5555-5555-5555-000000000005'),
	('66666666-6666-6666-6666-000000000006', 'BR-006', 620.00, '2021-04-30', 'Baixa condição corporal e perda de peso acentuada', '2026-01-22', '2026-03-01', 'Suplementação intensiva no cocho', '55555555-5555-5555-5555-000000000006'),
	('66666666-6666-6666-6666-000000000007', 'BR-007', 495.30, '2022-12-01', 'Queratoconjuntivite e isolamento da luminosidade', '2026-01-25', '2026-02-15', 'Tratamento de pomada ocular', '55555555-5555-5555-5555-000000000007'),
	('66666666-6666-6666-6666-000000000008', 'BR-008', 560.00, '2022-03-18', 'Tratamento de Tristeza Parasitária Bovina (TPB)', '2026-02-01', '2026-03-05', 'Acompanhamento do hematócrito', '55555555-5555-5555-5555-000000000008'),
	('66666666-6666-6666-6666-000000000009', 'BR-009', 280.40, '2023-09-11', 'Abscesso hepático sob investigação sanitária', '2026-02-03', '2026-02-25', 'Piquete de retenção sanitária', '55555555-5555-5555-5555-000000000009'),
	('66666666-6666-6666-6666-000000000010', 'BR-010', 580.90, '2022-01-25', 'Isolamento por diarreia infecciosa neonatal', '2026-02-05', '2026-02-20', 'Hidratação e antidiarréico', '55555555-5555-5555-5555-000000000010'),
	('66666666-6666-6666-6666-000000000011', 'BR-011', 410.00, '2023-04-02', 'Corticoterapia prolongada por reação alérgica', '2026-02-08', '2026-02-28', 'Observação de efeito rebote', '55555555-5555-5555-5555-000000000011'),
	('66666666-6666-6666-6666-000000000012', 'BR-012', 505.00, '2022-07-19', 'Trauma na articulação do membro posterior', '2026-02-10', '2026-03-02', 'Repouso em piquete maternidade', '55555555-5555-5555-5555-000000000012'),
	('66666666-6666-6666-6666-000000000013', 'BR-013', 310.60, '2023-08-08', 'Isolamento profilático pós-introdução no lote', '2026-02-12', '2026-02-22', 'Quarentena prévia ao pastejo', '55555555-5555-5555-5555-000000000013'),
	('66666666-6666-6666-6666-000000000014', 'BR-014', 545.00, '2022-02-14', 'Acidose ruminal em adaptação de confinamento', '2026-02-15', '2026-03-01', 'Ajuste de fibra na dieta', '55555555-5555-5555-5555-000000000014'),
	('66666666-6666-6666-6666-000000000015', 'BR-015', 430.10, '2023-03-30', 'Tratamento antimicrobiano de Mastite parenquimatosa', '2026-02-18', '2026-03-10', 'Acompanhamento do descarte de leite/carne', '55555555-5555-5555-5555-000000000015');

	-- 8. TABLE WITHDRAWAL_PERIOD
	INSERT INTO WITHDRAWAL_PERIOD (id_withdrawal, withdrawal_start_date, withdrawal_end_date, notes, id_animal) VALUES
	('77777777-7777-7777-7777-000000000001', '2026-01-01', '2026-02-05', 'Carência de antiparasitário', '66666666-6666-6666-6666-000000000001'),
	('77777777-7777-7777-7777-000000000002', '2026-01-15', '2026-02-28', 'Carência antibiótico casco', '66666666-6666-6666-6666-000000000002'),
	('77777777-7777-7777-7777-000000000003', '2026-01-10', '2026-01-25', 'Tratamento de infecção', '66666666-6666-6666-6666-000000000003'),
	('77777777-7777-7777-7777-000000000004', '2026-01-18', '2026-02-01', 'Anti-inflamatório aplic.', '66666666-6666-6666-6666-000000000004'),
	('77777777-7777-7777-7777-000000000005', '2026-01-22', '2026-02-15', 'Suplementação intensiva', '66666666-6666-6666-6666-000000000005'),
	('77777777-7777-7777-7777-000000000006', '2026-01-25', '2026-03-01', 'Vermifugação severa', '66666666-6666-6666-6666-000000000006'),
	('77777777-7777-7777-7777-000000000007', '2026-02-01', '2026-02-20', 'Tratamento ocular', '66666666-6666-6666-6666-000000000007'),
	('77777777-7777-7777-7777-000000000008', '2026-02-05', '2026-03-10', 'Carência carrapaticida', '66666666-6666-6666-6666-000000000008'),
	('77777777-7777-7777-7777-000000000009', '2026-02-08', '2026-02-22', 'Vacinado pós-desmame', '66666666-6666-6666-6666-000000000009'),
	('77777777-7777-7777-7777-000000000010', '2026-02-10', '2026-03-15', 'Carência pré-abate', '66666666-6666-6666-6666-000000000010'),
	('77777777-7777-7777-7777-000000000011', '2026-02-12', '2026-03-05', 'Tratamento parasitário', '66666666-6666-6666-6666-000000000011'),
	('77777777-7777-7777-7777-000000000012', '2026-02-15', '2026-03-01', 'Período de engorda pré-abate', '66666666-6666-6666-6666-000000000012'),
	('77777777-7777-7777-7777-000000000013', '2026-02-18', '2026-03-20', 'Carência vacina aftosa', '66666666-6666-6666-6666-000000000013'),
	('77777777-7777-7777-7777-000000000014', '2026-02-20', '2026-03-25', 'Antiparasitário de engorda', '66666666-6666-6666-6666-000000000014'),
	('77777777-7777-7777-7777-000000000015', '2026-02-22', '2026-03-08', 'Tratamento preventivo', '66666666-6666-6666-6666-000000000015');

	-- 9. TABLE SUPPLIER
	INSERT INTO SUPPLIER (id_supplier, full_name, cnpj, phone, email, id_address) VALUES
	('88888888-8888-8888-8888-000000000001', 'AgroPharma Brasil', '11111111000101', '1639010001', 'contato@agropharma.com', '99999999-9999-9999-9999-000000000001'),
	('88888888-8888-8888-8888-000000000002', 'VetMedic Distribuidora', '11111111000102', '1639010002', 'vendas@vetmedic.com', '44444444-4444-4444-4444-000000000001'),
	('88888888-8888-8888-8888-000000000003', 'Laboratório AgroSaúde', '11111111000103', '1639010003', 'suporte@agrosaude.com', '44444444-4444-4444-4444-000000000002'),
	('88888888-8888-8888-8888-000000000004', 'BioVet Insumos', '11111111000104', '1639010004', 'atendimento@biovet.com', '44444444-4444-4444-4444-000000000003'),
	('88888888-8888-8888-8888-000000000005', 'RuralVet Produtos', '11111111000105', '1639010005', 'contato@ruralvet.com', '44444444-4444-4444-4444-000000000004'),
	('88888888-8888-8888-8888-000000000006', 'PharmaGado Ltda', '11111111000106', '1639010006', 'vendas@pharmagado.com', '44444444-4444-4444-4444-000000000005'),
	('88888888-8888-8888-8888-000000000007', 'NutriVet Saúde Animal', '11111111000107', '1639010007', 'sac@nutrivet.com', '44444444-4444-4444-4444-000000000006'),
	('88888888-8888-8888-8888-000000000008', 'Central Vet Insumos', '11111111000108', '1639010008', 'comercial@centralvet.com', '44444444-4444-4444-4444-000000000007'),
	('88888888-8888-8888-8888-000000000009', 'VetLife Soluções', '11111111000109', '1639010009', 'atendimento@vetlife.com', '44444444-4444-4444-4444-000000000008'),
	('88888888-8888-8888-8888-000000000010', 'AgroMedic Comércio', '11111111000110', '1639010010', 'contato@agromedic.com', '44444444-4444-4444-4444-000000000009'),
	('88888888-8888-8888-8888-000000000011', 'ProCampo Medicamentos', '11111111000111', '1639010011', 'vendas@procampo.com', '44444444-4444-4444-4444-000000000010'),
	('88888888-8888-8888-8888-000000000012', 'GadoForte Insumos', '11111111000112', '1639010012', 'sac@gadoforte.com', '44444444-4444-4444-4444-000000000011'),
	('88888888-8888-8888-8888-000000000013', 'BovinoVet Distribuição', '11111111000113', '1639010013', 'contato@bovinovet.com', '44444444-4444-4444-4444-000000000012'),
	('88888888-8888-8888-8888-000000000014', 'AgroSanidade Brasil', '11111111000114', '1639010014', 'vendas@agrosanidade.com', '44444444-4444-4444-4444-000000000013'),
	('88888888-8888-8888-8888-000000000015', 'MegaVet Soluções', '11111111000115', '1639010015', 'suporte@megavet.com', '44444444-4444-4444-4444-000000000014');

	-- 10. TABLE MEDICATION
	INSERT INTO MEDICATION (id_medication, trade_name, dosage, unit_of_measure, active_ingredient, indication, indicated_withdrawal_days, therapeutic_category, id_supplier) VALUES
	('aaaaaaa1-aaaa-aaaa-aaaa-000000000001', 'Ivervet 1%', 10.000, 'ml', 'Ivermectina', 'Controle de parasitas internos e externos', 35, 'Antiparasitário', '88888888-8888-8888-8888-000000000001'),
	('aaaaaaa1-aaaa-aaaa-aaaa-000000000002', 'Bovivet Penicilina', 15.000, 'ml', 'Penicilina G Procaína', 'Tratamento de infecções bacterianas', 30, 'Antibiótico', '88888888-8888-8888-8888-000000000002'),
	('aaaaaaa1-aaaa-aaaa-aaaa-000000000003', 'DexaGado Forte', 5.000, 'ml', 'Dexametasona', 'Anti-inflamatório esteroidal', 15, 'Anti-inflamatório', '88888888-8888-8888-8888-000000000003'),
	('aaaaaaa1-aaaa-aaaa-aaaa-000000000004', 'Carrapatox Spray', 20.000, 'ml', 'Cipermetrina', 'Controle de carrapatos e moscas', 14, 'Ectoparasiticida', '88888888-8888-8888-8888-000000000004'),
	('aaaaaaa1-aaaa-aaaa-aaaa-000000000005', 'Oxivet LA', 10.000, 'ml', 'Oxitetraciclina', 'Antibiótico de amplo espectro', 28, 'Antibiótico', '88888888-8888-8888-8888-000000000005'),
	('aaaaaaa1-aaaa-aaaa-aaaa-000000000006', 'DoraVet 3.15%', 10.000, 'ml', 'Doramectina', 'Antiparasitário de longa ação', 42, 'Antiparasitário', '88888888-8888-8888-8888-000000000006'),
	('aaaaaaa1-aaaa-aaaa-aaaa-000000000007', 'Flunixin Campo', 8.000, 'ml', 'Flunixin Meglumine', 'Anti-inflamatório não esteroidal', 10, 'Anti-inflamatório', '88888888-8888-8888-8888-000000000007'),
	('aaaaaaa1-aaaa-aaaa-aaaa-000000000008', 'Ceftiofur Max', 5.000, 'ml', 'Ceftiofur', 'Infecções respiratórias bovinas', 4, 'Antibiótico', '88888888-8888-8888-8888-000000000008'),
	('aaaaaaa1-aaaa-aaaa-aaaa-000000000009', 'SupleVet B12', 10.000, 'ml', 'Vitamina B12', 'Suplementação vitamínica', 0, 'Vitamínico', '88888888-8888-8888-8888-000000000009'),
	('aaaaaaa1-aaaa-aaaa-aaaa-000000000010', 'Complexo B Injetável', 5.000, 'ml', 'Complexo B', 'Suplemento nutricional', 0, 'Vitamínico', '88888888-8888-8888-8888-000000000010'),
	('aaaaaaa1-aaaa-aaaa-aaaa-000000000011', 'Vacina RaivaVet', 2.000, 'ml', 'Vírus Inativado da Raiva', 'Imunização contra raiva animal', 0, 'Vacina', '88888888-8888-8888-8888-000000000011'),
	('aaaaaaa1-aaaa-aaaa-aaaa-000000000012', 'Vacina AftosaShield', 5.000, 'ml', 'Antígeno Inativado Aftosa', 'Imunização febre aftosa', 0, 'Vacina', '88888888-8888-8888-8888-000000000012'),
	('aaaaaaa1-aaaa-aaaa-aaaa-000000000013', 'Cefalexina Injetável', 10.000, 'ml', 'Cefalexina', 'Tratamento de infecções em geral', 7, 'Antibiótico', '88888888-8888-8888-8888-000000000013'),
	('aaaaaaa1-aaaa-aaaa-aaaa-000000000014', 'Albendazol Pour-On', 15.000, 'ml', 'Albendazol', 'Vermífugo de amplo espectro', 14, 'Antiparasitário', '88888888-8888-8888-8888-000000000014'),
	('aaaaaaa1-aaaa-aaaa-aaaa-000000000015', 'CalciumVet Injectable', 50.000, 'ml', 'Gluconato de Cálcio', 'Tratamento de hipocalcemia', 0, 'Suplemento Mineral', '88888888-8888-8888-8888-000000000015');

	-- 11. TABLE MEDICATION_BATCH
	INSERT INTO MEDICATION_BATCH (id_medication_batch, manufacturing_batch, initial_quantity, manufacturing_date, expiration_date, entry_date, id_medication) VALUES
	('d1111111-1111-1111-1111-000000000001', 'LOTE-MED-01', 500.000, '2025-01-10', '2027-01-10', '2025-01-20', 'aaaaaaa1-aaaa-aaaa-aaaa-000000000001'),
	('d1111111-1111-1111-1111-000000000002', 'LOTE-MED-02', 300.000, '2025-02-01', '2026-08-01', '2025-02-15', 'aaaaaaa1-aaaa-aaaa-aaaa-000000000002'),
	('d1111111-1111-1111-1111-000000000003', 'LOTE-MED-03', 200.000, '2025-01-15', '2027-01-15', '2025-02-01', 'aaaaaaa1-aaaa-aaaa-aaaa-000000000003'),
	('d1111111-1111-1111-1111-000000000004', 'LOTE-MED-04', 400.000, '2025-03-01', '2026-09-01', '2025-03-10', 'aaaaaaa1-aaaa-aaaa-aaaa-000000000004'),
	('d1111111-1111-1111-1111-000000000005', 'LOTE-MED-05', 600.000, '2025-02-20', '2027-02-20', '2025-03-01', 'aaaaaaa1-aaaa-aaaa-aaaa-000000000005'),
	('d1111111-1111-1111-1111-000000000006', 'LOTE-MED-06', 250.000, '2025-01-05', '2027-05-05', '2025-01-15', 'aaaaaaa1-aaaa-aaaa-aaaa-000000000006'),
	('d1111111-1111-1111-1111-000000000007', 'LOTE-MED-07', 150.000, '2025-04-10', '2026-10-10', '2025-04-20', 'aaaaaaa1-aaaa-aaaa-aaaa-000000000007'),
	('d1111111-1111-1111-1111-000000000008', 'LOTE-MED-08', 350.000, '2025-03-15', '2027-03-15', '2025-04-01', 'aaaaaaa1-aaaa-aaaa-aaaa-000000000008'),
	('d1111111-1111-1111-1111-000000000009', 'LOTE-MED-09', 500.000, '2025-02-10', '2028-02-10', '2025-02-25', 'aaaaaaa1-aaaa-aaaa-aaaa-000000000009'),
	('d1111111-1111-1111-1111-000000000010', 'LOTE-MED-10', 100.000, '2025-05-01', '2026-11-01', '2025-05-10', 'aaaaaaa1-aaaa-aaaa-aaaa-000000000010'),
	('d1111111-1111-1111-1111-000000000011', 'LOTE-MED-11', 800.000, '2025-01-01', '2026-06-01', '2025-01-10', 'aaaaaaa1-aaaa-aaaa-aaaa-000000000011'),
	('d1111111-1111-1111-1111-000000000012', 'LOTE-MED-12', 1000.000, '2025-04-01', '2026-07-01', '2025-04-15', 'aaaaaaa1-aaaa-aaaa-aaaa-000000000012'),
	('d1111111-1111-1111-1111-000000000013', 'LOTE-MED-13', 200.000, '2025-03-20', '2027-03-20', '2025-04-05', 'aaaaaaa1-aaaa-aaaa-aaaa-000000000013'),
	('d1111111-1111-1111-1111-000000000014', 'LOTE-MED-14', 450.000, '2025-02-05', '2027-02-05', '2025-02-18', 'aaaaaaa1-aaaa-aaaa-aaaa-000000000014'),
	('d1111111-1111-1111-1111-000000000015', 'LOTE-MED-15', 300.000, '2025-05-15', '2028-05-15', '2025-05-25', 'aaaaaaa1-aaaa-aaaa-aaaa-000000000015');

	-- 12. TABLE MEDICATION_INVENTORY
	INSERT INTO MEDICATION_INVENTORY (id_medication_inventory, available_quantity, minimum_stock, maximum_stock, storage_location, id_medication_batch) VALUES
	('bbbbbbb1-bbbb-bbbb-bbbb-000000000001', 450.000, 50.000, 1000.000, 'Galpão Central - Prateleira A1', 'd1111111-1111-1111-1111-000000000001'),
	('bbbbbbb1-bbbb-bbbb-bbbb-000000000002', 280.000, 30.000, 500.000, 'Galpão Central - Prateleira A2', 'd1111111-1111-1111-1111-000000000002'),
	('bbbbbbb1-bbbb-bbbb-bbbb-000000000003', 180.000, 20.000, 300.000, 'Geladeira Agro - Compartimento 1', 'd1111111-1111-1111-1111-000000000003'),
	('bbbbbbb1-bbbb-bbbb-bbbb-000000000004', 380.000, 40.000, 600.000, 'Galpão Insumos - Prateleira B1', 'd1111111-1111-1111-1111-000000000004'),
	('bbbbbbb1-bbbb-bbbb-bbbb-000000000005', 550.000, 60.000, 1000.000, 'Galpão Central - Prateleira B2', 'd1111111-1111-1111-1111-000000000005'),
	('bbbbbbb1-bbbb-bbbb-bbbb-000000000006', 230.000, 25.000, 400.000, 'Galpão Central - Prateleira A3', 'd1111111-1111-1111-1111-000000000006'),
	('bbbbbbb1-bbbb-bbbb-bbbb-000000000007', 140.000, 15.000, 250.000, 'Geladeira Agro - Compartimento 2', 'd1111111-1111-1111-1111-000000000007'),
	('bbbbbbb1-bbbb-bbbb-bbbb-000000000008', 320.000, 35.000, 500.000, 'Galpão Insumos - Prateleira B3', 'd1111111-1111-1111-1111-000000000008'),
	('bbbbbbb1-bbbb-bbbb-bbbb-000000000009', 480.000, 50.000, 800.000, 'Galpão Central - Prateleira C1', 'd1111111-1111-1111-1111-000000000009'),
	('bbbbbbb1-bbbb-bbbb-bbbb-000000000010', 90.000, 10.000, 150.000, 'Geladeira Agro - Compartimento 3', 'd1111111-1111-1111-1111-000000000010'),
	('bbbbbbb1-bbbb-bbbb-bbbb-000000000011', 750.000, 100.000, 1200.000, 'Câmara Fria 1', 'd1111111-1111-1111-1111-000000000011'),
	('bbbbbbb1-bbbb-bbbb-bbbb-000000000012', 920.000, 100.000, 1500.000, 'Câmara Fria 2', 'd1111111-1111-1111-1111-000000000012'),
	('bbbbbbb1-bbbb-bbbb-bbbb-000000000013', 190.000, 20.000, 300.000, 'Armário Veterinário 1', 'd1111111-1111-1111-1111-000000000013'),
	('bbbbbbb1-bbbb-bbbb-bbbb-000000000014', 420.000, 45.000, 700.000, 'Galpão Insumos - Prateleira C2', 'd1111111-1111-1111-1111-000000000014'),
	('bbbbbbb1-bbbb-bbbb-bbbb-000000000015', 270.000, 30.000, 500.000, 'Galpão Central - Prateleira C3', 'd1111111-1111-1111-1111-000000000015');

	-- 13. TABLE APPLICATION
	INSERT INTO APPLICATION (id_application, dosage, unit_of_measure, treated_head_count, administration_route, application_limb, application_site, objective, date_time, notes, id_user, id_medication_batch, id_batch) VALUES
	('ccccccc1-cccc-cccc-cccc-000000000001', 10.000, 'ml', 10, 'SUBCUTANEOUS', 'Pescoço', 'Curral Principal', 'Vermifugação de rotina', '2026-01-10 08:30:00', 'Animais responderam bem', '11111111-1111-1111-1111-000000000001', 'd1111111-1111-1111-1111-000000000001', '55555555-5555-5555-5555-000000000001'),
	('ccccccc1-cccc-cccc-cccc-000000000002', 15.000, 'ml', 12, 'INTRAMUSCULAR', 'Anca', 'Curral de Manejo', 'Tratamento preventivo', '2026-01-12 09:00:00', 'Sem intercorrências', '11111111-1111-1111-1111-000000000002', 'd1111111-1111-1111-1111-000000000002', '55555555-5555-5555-5555-000000000002'),
	('ccccccc1-cccc-cccc-cccc-000000000003', 5.000, 'ml', 15, 'INTRAMUSCULAR', 'Pescoço', 'Retiro 1', 'Redução de inflamação', '2026-01-15 07:45:00', 'Aplicações no horário', '11111111-1111-1111-1111-000000000003', 'd1111111-1111-1111-1111-000000000003', '55555555-5555-5555-5555-000000000003'),
	('ccccccc1-cccc-cccc-cccc-000000000004', 20.000, 'ml', 20, 'TOPICAL', 'Dorso', 'Curral Principal', 'Banho de carrapaticida', '2026-01-18 10:15:00', 'Sucesso no manejo', '11111111-1111-1111-1111-000000000004', 'd1111111-1111-1111-1111-000000000004', '55555555-5555-5555-5555-000000000004'),
	('ccccccc1-cccc-cccc-cccc-000000000005', 10.000, 'ml', 8, 'SUBCUTANEOUS', 'Pescoço', 'Curral 2', 'Tratamento antibiótico', '2026-01-20 08:00:00', 'Lote monitorado', '11111111-1111-1111-1111-000000000005', 'd1111111-1111-1111-1111-000000000005', '55555555-5555-5555-5555-000000000005'),
	('ccccccc1-cccc-cccc-cccc-000000000006', 10.000, 'ml', 5, 'SUBCUTANEOUS', 'Pescoço', 'Curral Central', 'Desparasitação', '2026-01-25 11:30:00', 'Aplicação sem sobressaltos', '11111111-1111-1111-1111-000000000006', 'd1111111-1111-1111-1111-000000000006', '55555555-5555-5555-5555-000000000006'),
	('ccccccc1-cccc-cccc-cccc-000000000007', 8.000, 'ml', 14, 'INTRAMUSCULAR', 'Tábua do Pescoço', 'Curral Manejo', 'Alívio de dor', '2026-01-28 09:10:00', 'Acompanhamento necessário', '11111111-1111-1111-1111-000000000007', 'd1111111-1111-1111-1111-000000000007', '55555555-5555-5555-5555-000000000007'),
	('ccccccc1-cccc-cccc-cccc-000000000008', 5.000, 'ml', 25, 'SUBCUTANEOUS', 'Pescoço', 'Confinamento A', 'Tratamento respiratório', '2026-02-01 14:00:00', 'Procedimento rápido', '11111111-1111-1111-1111-000000000008', 'd1111111-1111-1111-1111-000000000008', '55555555-5555-5555-5555-000000000008'),
	('ccccccc1-cccc-cccc-cccc-000000000009', 10.000, 'ml', 10, 'INTRAMUSCULAR', 'Pescoço', 'Bezerreiro', 'Reforço vitamínico', '2026-02-03 08:20:00', 'Reforço concluído', '11111111-1111-1111-1111-000000000009', 'd1111111-1111-1111-1111-000000000009', '55555555-5555-5555-5555-000000000009'),
	('ccccccc1-cccc-cccc-cccc-000000000010', 5.000, 'ml', 15, 'INTRAMUSCULAR', 'Anca', 'Curral de Manejo', 'Suplementação', '2026-02-05 07:00:00', 'Suplementação aplicada', '11111111-1111-1111-1111-000000000010', 'd1111111-1111-1111-1111-000000000010', '55555555-5555-5555-5555-000000000010'),
	('ccccccc1-cccc-cccc-cccc-000000000011', 2.000, 'ml', 18, 'SUBCUTANEOUS', 'Pescoço', 'Curral 1', 'Imunização vacinal', '2026-02-08 10:30:00', 'Campanha de vacinação', '11111111-1111-1111-1111-000000000011', 'd1111111-1111-1111-1111-000000000011', '55555555-5555-5555-5555-000000000011'),
	('ccccccc1-cccc-cccc-cccc-000000000012', 5.000, 'ml', 12, 'SUBCUTANEOUS', 'Pescoço', 'Curral 2', 'Vacinação de febre aftosa', '2026-02-10 11:00:00', 'Comprovante emitido', '11111111-1111-1111-1111-000000000012', 'd1111111-1111-1111-1111-000000000012', '55555555-5555-5555-5555-000000000012'),
	('ccccccc1-cccc-cccc-cccc-000000000013', 10.000, 'ml', 16, 'INTRAMUSCULAR', 'Pescoço', 'Retiro 2', 'Aplicação de antibiótico geral', '2026-02-12 15:45:00', 'Tratamento rotineiro', '11111111-1111-1111-1111-000000000013', 'd1111111-1111-1111-1111-000000000013', '55555555-5555-5555-5555-000000000013'),
	('ccccccc1-cccc-cccc-cccc-000000000014', 15.000, 'ml', 22, 'TOPICAL', 'Dorso', 'Confinamento B', 'Desparasitação Pour-On', '2026-02-15 08:50:00', 'Cobriu lote completo', '11111111-1111-1111-1111-000000000014', 'd1111111-1111-1111-1111-000000000014', '55555555-5555-5555-5555-000000000014'),
	('ccccccc1-cccc-cccc-cccc-000000000015', 50.000, 'ml', 19, 'INTRAVENOUS', 'Veia Jugular', 'Hospital da Fazenda', 'Suplementação emergencial', '2026-02-18 16:20:00', 'Evolução favorável', '11111111-1111-1111-1111-000000000015', 'd1111111-1111-1111-1111-000000000015', '55555555-5555-5555-5555-000000000015');

-- 1. CRIAÇÃO DA BASE

DROP TABLE IF EXISTS base_negociacao_BULGARELLI;

CREATE TABLE base_negociacao_BULGARELLI (

    Identificador INT AUTO_INCREMENT PRIMARY KEY,

    -- DADOS DO CLIENTE
    DESC_emprestimo VARCHAR(10),
    ID_nome VARCHAR(40),
    ID_cpf VARCHAR(14),
    ID_email VARCHAR(50),
    ID_contato VARCHAR(20),
    ID_celular VARCHAR(20),
    ID_telefone VARCHAR(20),
    ID_veiculo VARCHAR(30),
    ID_placa VARCHAR(8),

    -- INDICADORES DA DÍVIDA
    INDEX_dias_atraso INT,
    INDEX_tentativas_contato INT,
    INDEX_valor_divida DECIMAL(10,2),
    INDEX_propensao VARCHAR(31),
    INDEX_saldo_risco DECIMAL(20,2),
    INDEX_parcela_atraso INT,
    INDEX_parcelas_totais INT,
    INDEX_codigo_contrato INT,

    -- DADOS DA NEGOCIAÇÃO
    SIST_status_negociacao VARCHAR(30),
    SIST_data_inclusao DATE,
    SIST_canal VARCHAR(50),
    SIST_id_funcionario VARCHAR(30),
    SIST_atualizacao_contrato VARCHAR(10),
    SIST_usuario_atualizacao VARCHAR(50),
    SIST_falecido INT
);



-- 2. INSERÇÃO DOS DADOS

INSERT INTO base_negociacao_BULGARELLI
(
    DESC_emprestimo,
    ID_nome,
    ID_cpf,
    ID_email,
    ID_contato,
    ID_celular,
    ID_telefone,
    ID_veiculo,
    ID_placa,
    INDEX_dias_atraso,
    INDEX_tentativas_contato,
    INDEX_valor_divida,
    INDEX_propensao,
    INDEX_saldo_risco,
    INDEX_parcela_atraso,
    INDEX_parcelas_totais,
    INDEX_codigo_contrato,
    SIST_status_negociacao,
    SIST_data_inclusao,
    SIST_canal,
    SIST_id_funcionario,
    SIST_atualizacao_contrato,
    SIST_usuario_atualizacao,
    SIST_falecido
)

VALUES

('CONSIGNADO', 'Ana Beatriz Souza', '529.184.736-01','anabeatriz.souza@example.com', '(11) 90001-1001','(11) 98801-1001', '0', 'Chevrolet Onix', 'ABC1D01',
32, 4, 2450.00, 'Digital', 105430.25, 1, 30, 482731,
'Em negociação', '2026-01-12', 'BOLETAGEM', 'ana.souza','11-09-2026','BANCO',0),

('CONSIGNADO', 'Bruno Henrique Lima', '047.693.251-02','bruno.henrique.lima@example.com', '(11) 90002-1002','(11) 98802-1002', '(11) 97702-1002', 'Fiat Argo', 'ABC1D02',
67, 7, 4780.00, 'Digital', 118750.80, 2, 35, 105964,
'Sem contato', '2026-01-21', 'DIGITAL', 'bruno.lima','11-09-2026','BANCO', 0),

('CONSIGNADO', 'Carla Mendes Rocha', '816.405.927-03','carla.mendes.rocha@example.com', '(11) 90003-1003','(11) 98803-1003', '0', 'Hyundai HB20', 'ABC1D03',
18, 2, 1320.00, 'Digital', 132640.45, 3, 40, 739215,
'Promessa de pagamento', '2026-02-23', 'OPERADOR', '4827','11-09-2026','BANCO', 0),

('PESSOAL', 'Daniel Oliveira Santos', '293.718.564-04','daniel.oliveira.santos@example.com', '(11) 90004-1004','0', '0', 'Volkswagen Polo', 'ABC1D04',
94, 9, 6250.00, 'Digital', 147890.30, 4, 45, 264807,
'Em atraso', '2026-03-22', 'SEM CONTATO', '1059','11-09-2026','BANCO', 0),

('PESSOAL', 'Eduarda Martins', '650.231.849-05','eduarda.martins@example.com', '(11) 90005-1005','(11) 98805-1005', '(11) 97705-1005', 'Toyota Corolla', 'ABC1D05',
41, 5, 8900.00, 'Digital', 159275.65, 5, 50, 591436,
'Em negociação', '2026-04-24', 'AGENTE VIRTUAL', '7392','11-09-2026','BANCO', 0),

('PESSOAL', 'Felipe Almeida Costa', '174.926.385-06','felipe.almeida.costa@example.com', '(11) 90006-1006','(11) 98806-1006', '0', 'Renault Kwid', 'ABC1D06',
12, 1, 980.00, 'Digital', 174520.90, 6, 55, 823057,
'Novo contato', '2026-05-25', 'OPERADOR', '2648','11-09-2026','BANCO', 0),

('PESSOAL', 'Gabriela Ferreira', '738.514.206-07','gabriela.ferreira@example.com', '(11) 90007-1007','(11) 98807-1007', '0', 'Fiat Mobi', 'ABC1D07',
75, 8, 3640.00, 'Digital', 186430.15, 7, 60, 347192,
'Sem contato', '2026-06-26', 'DIGITAL', 'carla.rocha','11-09-2026','BANCO', 0),

('GARANTIA', 'Henrique Barbosa', '405.827.193-08','henrique.barbosa@example.com', '(11) 90008-1008','0', '0', 'Honda Civic', 'ABC1D08',
53, 6, 9450.00, 'Digital', 198750.40, 8, 65, 916524,
'Em negociação', '2026-07-28', 'BOLETAGEM', 'daniel.santos','11-09-2026','BANCO', 0),

('GARANTIA', 'Izabela Maia Oliveira', '921.356.478-09','izabela.maia@example.com', '(11) 90009-1009','(11) 98809-1009', '(11) 97709-1009', 'Porsche', 'ABC1D09',
27, 3, 5280.00, 'Digital', 213680.75, 9, 70, 680341,
'Promessa de pagamento', '2026-04-24', 'SEM CONTATO', '5914','11-09-2026','BANCO', 0),

('GARANTIA', 'Edson Damasceno Samuel Arcanjo', '362.849.715-10','edson.damasceno@example.com', '(11) 90010-1010','(11) 98810-1010', '0', 'Ford Ka', 'ABC1D10',
108, 11, 2890.00, 'Digital', 225940.20, 10, 75, 153829,
'Em atraso', '2026-07-29', 'AGENTE VIRTUAL', 'eduarda.martins','11-09-2026','BANCO', 0),

('GARANTIA', 'João Pedro Ramos', '583.107.264-11','joao.pedro.ramos@example.com', '(11) 90011-1011','0', '0', 'Chevrolet Tracker', 'ABC1D11',
36, 4, 7150.00, '+Digital', 239815.55, 11, 80, 425716,
'Em negociação', '2025-01-11', 'DIGITAL', 'felipe.costa','11-09-2026','BANCO', 1),

('GARANTIA', 'Juliana Castro', '109.475.832-12','juliana.castro@example.com', '(11) 90012-1012','(11) 98812-1012', '0', 'Fiat Cronos', 'ABC1D12',
22, 2, 3250.00, '+Digital', 247630.85, 50, 50, 807263,
'Novo contato', '2025-02-12', 'OPERADOR', '8230','11-09-2026','API', 0),

('DEBITO', 'Lucas Gabriel Vieira', '846.293.517-13','lucas.gabriel.vieira@example.com', '(11) 90013-1013','(11) 98813-1013', '(11) 97713-1013', 'Volkswagen T-Cross', 'ABC1D13',
81, 9, 11800.00, '+Digital', 258490.10, 49, 50, 291548,
'Sem contato', '2025-03-13', 'BOLETAGEM', 'gabriela.ferreira','11-09-2026','API', 0),

('DEBITO', 'Mariana Lopes', '271.638.904-14','mariana.lopes@example.com', '(11) 90014-1014','(11) 98814-1014', '0', 'Chevrolet Prisma', 'ABC1D14',
45, 5, 4150.00, '+Digital', 269750.35, 48, 48, 634970,
'Em negociação', '2025-04-14', 'AGENTE VIRTUAL', '3471','11-09-2026','API', 0),

('DEBITO', 'Matheus Rodrigues', '694.520.381-15','matheus.rodrigues@example.com', '(11) 90015-1015','0', '0', 'Hyundai Creta', 'ABC1D15',
63, 7, 7890.00, '+Digital', 281640.70, 47, 90, 518302,
'Em atraso', '2025-05-15', 'SEM CONTATO', '9165','11-09-2026','API', 0),

('DEBITO', 'Rafael Martins', '358.741.629-16','rafael.martins@example.com', '(11) 90016-1016','(11) 98816-1016', '(11) 97716-1016', 'Jeep Renegade', 'ABC1D16',
29, 3, 6750.00, '+Digital', 295830.25, 46, 50, 746185,
'Promessa de pagamento', '2025-06-16', 'DIGITAL', 'henrique.barbosa','11-09-2026','API',0),

('DEBITO', 'Beatriz Fernandes', '017.865.423-17','beatriz.fernandes@example.com', '(11) 90017-1017','(11) 98817-1017', '0', 'Renault Sandero', 'ABC1D17',
15, 2, 2180.00, '+Digital', 307450.90, 45, 55, 329614,
'Novo contato', '2025-07-17', 'OPERADOR', '6803','11-09-2026','API',0),

('DEBITO', 'Ricardo Nunes', '472.319.856-18','ricardo.nunes@example.com', '(11) 90018-1018','0', '0', 'Toyota Yaris', 'ABC1D18',
120, 13, 5920.00, '+Digital', 318725.45, 44, 60, 952738,
'Sem contato', '2025-08-18', 'OPERADOR', '1538','11-09-2026','API', 0),

('INSS', 'Camila Araujo', '805.642.137-19','camila.araujo@example.com', '(11) 90019-1019','(11) 98819-1019', '(11) 97719-1019', 'Honda Fit', 'ABC1D19',
38, 4, 4680.00, '+Digital', 329680.80, 12, 65, 174605,
'Em negociação', '2025-09-19', 'BOLETAGEM', 'izabela.maia','11-09-2026','API', 0),

('INSS', 'Thiago Moreira', '136.957.284-20','thiago.moreira@example.com', '(11) 90020-1020','(11) 98820-1020', '0', 'Fiat Toro', 'ABC1D20',
72, 8, 12400.00, '+Digital', 341950.15, 13, 70, 863291,
'Em atraso', '2025-10-20', 'DIGITAL', 'joao.ramos','11-09-2026','API',0),

('INSS', 'Larissa Teixeira', '759.203.641-21','larissa.teixeira@example.com', '(11) 90021-1021','0', '0', 'Chevrolet Spin', 'ABC1D21',
24, 3, 3750.00, '+Digital', 356420.60, 14, 75, 407853,
'Promessa de pagamento', '2025-11-21', 'AGENTE VIRTUAL', '4257','11-09-2026','API',0),

('INSS', 'Gustavo Ribeiro', '284.516.793-22','gustavo.ribeiro@example.com', '(11) 90022-1022','(11) 98822-1022', '0', 'Volkswagen Virtus', 'ABC1D22',
56, 6, 6380.00, '-Digital', 367850.35, 15, 80, 625194,
'Em negociação', '2025-12-12', 'SEM CONTATO', '8072','11-09-2026','API',0),

('INSS', 'Amanda Silva', '613.849.205-23','amanda.silva@example.com', '(11) 90023-1023','(11) 98823-1023', '(11) 97723-1023', 'Nissan Versa', 'ABC1D23',
91, 10, 8200.00, '-Digital', 379640.90, 16, 30, 318760,
'Sem contato', '2026-01-10', 'BOLETAGEM', 'juliana.castro','11-09-2026','API',0),

('INSS', 'Diego Freitas', '927.164.538-24','diego.freitas@example.com', '(11) 90024-1024','0', '0', 'Ford EcoSport', 'ABC1D24',
33, 4, 4950.00, '-Digital', 385720.45, 17, 35, 794526,
'Em negociação', '2026-02-11', 'OPERADOR', '2915','11-09-2026','API',0),

('INSS', 'Leticia Moraes', '341.785.026-25','leticia.moraes@example.com', '(11) 90025-1025','(11) 98825-1025', '0', 'Hyundai i30', 'ABC1D25',
19, 2, 3120.00, '-Digital', 397850.75, 18, 40, 246913,
'Novo contato', '2026-03-12', 'DIGITAL', 'lucas.vieira','11-09-2026','API',0),

('PRIVADO', 'André Luiz Silva', '568.432.917-26','andre.luiz.silva@example.com', '(11) 90026-1026','(11) 98826-1026', '(11) 97726-1026', 'Chevrolet Cruze', 'ABC1D26',
47, 5, 7450.00, '-Digital', 408630.20, 19, 45, 581047,
'Em negociação', '2026-04-14', 'AGENTE VIRTUAL', '6349','11-09-2026','API',0),

('PRIVADO', 'Fernanda Dias', '093.671.845-27','fernanda.dias@example.com', '(11) 90027-1027','0', '0', 'Fiat Palio', 'ABC1D27',
102, 12, 2670.00, '-Digital', 419750.65, 20, 50, 930625,
'Em atraso', '2026-05-15', 'DIGITAL', 'mariana.lopes','11-09-2026','API',0),

('PRIVADO', 'Marcelo Cardoso', '715.248.369-28','marcelo.cardoso@example.com', '(11) 90028-1028','(11) 98828-1028', '0', 'Toyota Etios', 'ABC1D28',
68, 7, 4890.00, '-Digital', 427890.30, 21, 55, 162874,
'Sem contato', '2026-06-16', 'SEM CONTATO', '5183','11-09-2026','SISTEMA', 0),

('PRIVADO', 'Priscila Monteiro', '426.593.781-29','priscila.monteiro@example.com', '(11) 90029-1029','(11) 98829-1029', '(11) 97729-1029', 'Jeep Compass', 'ABC1D29',
35, 4, 10600.00, '-Digital', 438640.85, 22, 60, 853419,
'Promessa de pagamento', '2026-07-17', 'OPERADOR', '4827','11-09-2026','SISTEMA', 0),

('PRIVADO', 'Eduardo Barros', '852.307.614-30','eduardo.barros@example.com', '(11) 90030-1030','0', '0', 'Volkswagen Gol', 'ABC1D30',
14, 1, 1850.00, 'Digital', 449520.10, 43, 65, 704286,
'Novo contato', '2026-08-01', 'BOLETAGEM', 'matheus.rodrigues','11-09-2026','SISTEMA', 0),

('PRIVADO', 'Aline Moura', '165.824.937-31','aline.moura@example.com', '(11) 90031-1031','(11) 98831-1031', '0', 'Renault Duster', 'ABC1D31',
59, 6, 7280.00, 'Digital', 457830.55, 42, 70, 395721,
'Em negociação', '2026-08-02', 'AGENTE VIRTUAL', '1059','11-09-2026','SISTEMA', 0),

('PRIVADO', 'Vinicius Lopes', '604.179.283-32','vinicius.lopes@example.com', '(11) 90032-1032','0', '0', 'Chevrolet Montana', 'ABC1D32',
87, 9, 9150.00, 'Digital', 468750.90, 41, 75, 617508,
'Em atraso', '2026-08-03', 'DIGITAL', 'rafael.martins','11-09-2026','SISTEMA', 0),

('PRIVADO', 'Bianca Souza', '239.486.751-33','bianca.souza@example.com', '(11) 90033-1033','(11) 98833-1033', '(11) 97733-1033', 'Fiat Pulse', 'ABC1D33',
26, 3, 5430.00, 'Digital', 479630.25, 40, 80, 248365,
'Promessa de pagamento', '2026-08-04', 'SEM CONTATO', '7392','11-09-2026','SISTEMA', 1),

('PUBLICO', 'Caio Henrique', '781.625.394-34','caio.henrique@example.com', '(11) 90034-1034','(11) 98834-1034', '0', 'Honda HR-V', 'ABC1D34',
44, 5, 8760.00, '+Digital', 487950.70, 39, 85, 971402,
'Em negociação', '2026-08-05', 'BOLETAGEM', 'ana.souza','11-09-2026','SISTEMA', 0),

('PUBLICO', 'Luiza Maia Oliveira', '317.950.628-35','luiza.maia.oliveira@example.com', '(11) 90035-1035','0', '0', 'Ferrari', 'ABC1D35',
73, 8, 15900.00, '+Digital', 498420.35, 38, 90, 536819,
'Sem contato', '2026-08-06', 'OPERADOR', '2648','11-09-2026','SISTEMA', 0),

('PUBLICO', 'Leonardo Duarte', '946.218.573-36','leonardo.duarte@example.com', '(11) 90036-1036','(11) 98836-1036', '0', 'Chevrolet Cobalt', 'ABC1D36',
31, 3, 3980.00, '+Digital', 509680.80, 37, 40, 820473,
'Em negociação', '2026-08-07', 'AGENTE VIRTUAL', '5914','11-09-2026','SISTEMA', 0),

('PUBLICO', 'Monica Reis', '502.734.816-37','monica.reis@example.com', '(11) 90037-1037','(11) 98837-1037', '(11) 97737-1037', 'Nissan Sentra', 'ABC1D37',
116, 12, 9870.00, '+Digital', 518750.45, 36, 45, 154927,
'Em atraso', '2026-08-08', 'DIGITAL', 'bruno.lima','11-09-2026','SISTEMA', 0),

('PUBLICO', 'Samuel Costa', '128.365.749-38','samuel.costa@example.com', '(11) 90038-1038','0', '0', 'Volkswagen Nivus', 'ABC1D38',
21, 2, 4320.00, '+Digital', 529630.90, 35, 50, 683250,
'Novo contato', '2026-08-09', 'OPERADOR', '8230','11-09-2026','SISTEMA', 0),

('PUBLICO', 'Patricia Almeida', '673.901.452-39','patricia.almeida@example.com', '(11) 90039-1039','(11) 98839-1039', '0', 'Fiat Strada', 'ABC1D39',
62, 7, 8450.00, '+Digital', 537850.25, 34, 55, 429716,
'Em negociação', '2026-08-10', 'SEM CONTATO', '3471','11-09-2026','SISTEMA', 0),

('PUBLICO', 'Murilo Santos', '395.247.618-40','murilo.santos@example.com', '(11) 90040-1040','0', '0', 'Ford Ranger', 'ABC1D40',
98, 10, 14300.00, '-Digital', 548720.65, 33, 60, 765031,
'Sem contato', '2026-08-11', 'BOLETAGEM', 'carla.rocha','11-09-2026','SISTEMA', 0),

('PUBLICO', 'Elisa Martins', '814.536.270-41','elisa.martins@example.com', '(11) 90041-1041','(11) 98841-1041', '(11) 97741-1041', 'Hyundai Tucson', 'ABC1D41',
28, 3, 6190.00, '-Digital', 559430.10, 23, 65, 308594,
'Promessa de pagamento', '2026-08-12', 'DIGITAL', 'daniel.santos','11-09-2026','SISTEMA', 0),

('PUBLICO', 'Rodrigo Pires', '257.693.481-42','rodrigo.pires@example.com', '(11) 90042-1042','(11) 98842-1042', '0', 'Chevrolet S10', 'ABC1D42',
52, 6, 13750.00, '-Digital', 568750.55, 24, 70, 917263,
'Em negociação', '2026-08-13', 'AGENTE VIRTUAL', '9165','11-09-2026','SISTEMA', 0),

('FGTS', 'Vanessa Oliveira', '731.408.925-43','vanessa.oliveira@example.com', '(11) 90043-1043','0', '0', 'Renault Captur', 'ABC1D43',
16, 2, 3480.00, '-Digital', 579640.80, 25, 75, 542108,
'Novo contato', '2026-08-14', 'OPERADOR', '6803','11-09-2026','SISTEMA', 0),

('FGTS', 'Arthur Mendes', '069.852.314-44','arthur.mendes@example.com', '(11) 90044-1044','(11) 98844-1044', '0', 'Volkswagen Taos', 'ABC1D44',
79, 8, 10250.00, '-Digital', 587930.35, 26, 80, 236795,
'Em atraso', '2026-08-15', 'BOLETAGEM', 'eduarda.martins','11-09-2026','SISTEMA', 0),

('FGTS', 'Taina Ferreira', '482.175.639-45','taina.ferreira@example.com', '(11) 90045-1045','(11) 98845-1045', '(11) 97745-1045', 'Fiat Fastback', 'ABC1D45',
39, 4, 6840.00, '-Digital', 598720.90, 27, 30, 801634,
'Em negociação', '2026-08-16', 'SEM CONTATO', '1538','11-09-2026','SISTEMA', 0),

('FGTS', 'Igor Carvalho', '905.327.146-46','igor.carvalho@example.com', '(11) 90046-1046','0', '0', 'Honda City', 'ABC1D46',
64, 7, 5670.00, 'Digital', 607450.25, 28, 35, 375920,
'Sem contato', '2026-08-17', 'DIGITAL', 'felipe.costa','11-09-2026','SISTEMA', 0),

('FGTS', 'Luana Barbosa', '153.684.792-47','luana.barbosa@example.com', '(11) 90047-1047','(11) 98847-1047', '0', 'Toyota Corolla Cross', 'ABC1D47',
23, 2, 9320.00, 'Digital', 618930.70, 29, 40, 694281,
'Promessa de pagamento', '2026-08-18', 'OPERADOR', '4257','11-09-2026','SISTEMA', 0),

('FGTS', 'Wesley Ramos', '624.819.357-48','wesley.ramos@example.com', '(11) 90048-1048','(11) 98848-1048', '(11) 97748-1048', 'Chevrolet Tracker', 'ABC1D48',
85, 9, 7940.00, '+Digital', 629750.45, 30, 45, 127563,
'Em atraso', '2026-08-19', 'AGENTE VIRTUAL', '8072','11-09-2026','SISTEMA', 0),

('FGTS', 'Clara Nascimento', '378.542.961-49','clara.nascimento@example.com', '(11) 90049-1049','0', '0', 'Nissan Frontier', 'ABC1D49',
48, 5, 12650.00, '+Digital', 638420.85, 31, 50, 458307,
'Em negociação', '2026-08-20', 'BOLETAGEM', 'gabriela.ferreira','11-09-2026','SISTEMA', 0),

('FGTS', 'Renato Vieira', '840.216.735-50','renato.vieira@example.com', '(11) 90050-1050','(11) 98850-1050', '0', 'Jeep Commander', 'ABC1D50',
34, 4, 11480.00, '-Digital', 649830.60, 32, 55, 729815,
'Promessa de pagamento', '2026-08-21', 'SEM CONTATO', '2915','11-09-2026','SISTEMA', 0);





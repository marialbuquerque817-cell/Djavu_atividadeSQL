CREATE TABLE Convenio (
    id_convenio INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(20) UNIQUE,
    contato VARCHAR(100),
    desconto_percent DECIMAL(5,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE Paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    tipo_atendimento ENUM('PARTICULAR','CONVENIO') NOT NULL DEFAULT 'PARTICULAR',
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Medico (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
    crm VARCHAR(20) UNIQUE NOT NULL,
    salario_base DECIMAL(10,2) NOT NULL,
    cargo VARCHAR(100),
    data_admissao DATE,
    bonus DECIMAL(10,2) DEFAULT 0.00
);

CREATE TABLE Consulta (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    id_convenio INT NULL,
    data_consulta DATETIME NOT NULL,
    valor_consulta DECIMAL(10,2) NOT NULL,
    status ENUM('AGENDADA','REALIZADA','CANCELADA','REMARCADA') DEFAULT 'AGENDADA',
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
    FOREIGN KEY (id_convenio) REFERENCES Convenio(id_convenio)
);

CREATE TABLE Exame (
    id_exame INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    preco_base DECIMAL(10,2) NOT NULL,
    tipo ENUM('LABORATORIAL','IMAGEM','OUTROS'),
    tempo_resultado INT
);

CREATE TABLE Pedido_Exame (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_consulta INT NOT NULL,
    id_exame INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (id_consulta) REFERENCES Consulta(id_consulta),
    FOREIGN KEY (id_exame) REFERENCES Exame(id_exame)
);

CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_consulta INT NOT NULL,
    forma_pagamento ENUM('DINHEIRO','CARTAO','PIX','BOLETO') NOT NULL,
    valor_pago DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_consulta) REFERENCES Consulta(id_consulta)
);

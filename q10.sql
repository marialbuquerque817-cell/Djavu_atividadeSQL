INSERT INTO Convenio (nome, cnpj, contato, desconto_percent) VALUES
('Saúde Total', '12.345.678/0001-90', 'contato@saudetotal.com', 10.00),
('Vida Bem', '98.765.432/0001-09', 'contato@vidabem.com', 15.00),
('Plena Saúde', '55.222.333/0001-77', 'contato@plena.com', 20.00);

INSERT INTO Paciente (nome, cpf, data_nascimento, telefone, email, tipo_atendimento) VALUES
('Carlos Silva', '111.222.333-44', '1990-01-10', '11999998888', 'carlos@email.com', 'PARTICULAR'),
('Ana Souza', '555.666.777-88', '1985-07-12', '21988887777', 'ana@email.com', 'CONVENIO'),
('Marcos Lima', '999.888.777-66', '1995-09-01', '31999998888', 'marcos@email.com', 'CONVENIO'),
('Juliana Reis', '222.333.444-55', '2000-03-15', '11999991111', 'juliana@email.com', 'PARTICULAR'),
('Paula Rocha', '123.456.789-10', '1988-10-25', '21988776655', 'paula@email.com', 'CONVENIO');

INSERT INTO Medico (nome, especialidade, crm, salario_base, cargo, data_admissao) VALUES
('Dr. João Mendes', 'Cardiologia', 'CRM12345', 15000.00, 'Titular', '2020-01-01'),
('Dra. Maria Oliveira', 'Pediatria', 'CRM67890', 14000.00, 'Titular', '2019-06-15'),
('Dr. Pedro Santos', 'Ortopedia', 'CRM54321', 13000.00, 'Assistente', '2021-03-10'),
('Dra. Carla Lima', 'Dermatologia', 'CRM98765', 12500.00, 'Titular', '2022-02-20'),
('Dr. André Souza', 'Cardiologia', 'CRM112

START TRANSACTION;

INSERT INTO Paciente (nome, cpf, data_nascimento, telefone, email, tipo_atendimento)
VALUES ('Novo Paciente', '111.999.888-77', '1998-05-15', '11999997777', 'novo@email.com', 'CONVENIO');

SET @id_paciente = LAST_INSERT_ID();

INSERT INTO Consulta (id_paciente, id_medico, id_convenio, data_consulta, valor_consulta)
VALUES (@id_paciente, 2, 1, NOW(), 150.00);

SET @id_consulta = LAST_INSERT_ID();

INSERT INTO Pedido_Exame (id_consulta, id_exame, quantidade, subtotal)
VALUES 
(@id_consulta, 1, 1, 50.00),
(@id_consulta, 2, 1, 100.00);

COMMIT;

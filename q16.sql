INSERT INTO Paciente (nome, cpf, data_nascimento, telefone, email, tipo_atendimento)
VALUES ('Renata Silva', '741.852.963-00', '1999-04-12', '11999887766', 'renata@email.com', 'CONVENIO');

INSERT INTO Consulta (id_paciente, id_medico, id_convenio, data_consulta, valor_consulta)
VALUES (LAST_INSERT_ID(), 1, 1, NOW(), 200.00);

INSERT INTO Pedido_Exame (id_consulta, id_exame, quantidade, subtotal)
VALUES (LAST_INSERT_ID(), 1, 1, 50.00);

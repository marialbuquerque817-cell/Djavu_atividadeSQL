CREATE VIEW vw_consultas_realizadas AS
SELECT 
    p.nome AS paciente,
    m.nome AS medico,
    m.especialidade,
    c.valor_consulta,
    c.data_consulta
FROM Consulta c
JOIN Paciente p ON c.id_paciente = p.id_paciente
JOIN Medico m ON c.id_medico = m.id_medico
WHERE c.status = 'REALIZADA';

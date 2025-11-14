SELECT p.nome, COUNT(c.id_consulta) AS total_consultas
FROM Paciente p
LEFT JOIN Consulta c ON p.id_paciente = c.id_paciente
GROUP BY p.nome;

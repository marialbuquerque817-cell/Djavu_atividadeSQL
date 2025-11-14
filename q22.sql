SELECT m.nome, COUNT(c.id_consulta) AS total_consultas
FROM Medico m
LEFT JOIN Consulta c ON m.id_medico = c.id_medico
GROUP BY m.nome;

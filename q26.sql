SELECT m.nome, SUM(c.valor_consulta) AS total_receita
FROM Consulta c
JOIN Medico m ON c.id_medico = m.id_medico
GROUP BY m.nome
ORDER BY total_receita DESC
LIMIT 1;

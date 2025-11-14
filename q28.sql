SELECT c.id_consulta, p.nome AS paciente, SUM(pe.subtotal) AS total_exames
FROM Pedido_Exame pe
JOIN Consulta c ON pe.id_consulta = c.id_consulta
JOIN Paciente p ON c.id_paciente = p.id_paciente
GROUP BY c.id_consulta
HAVING total_exames > (SELECT AVG(preco_base) FROM Exame);

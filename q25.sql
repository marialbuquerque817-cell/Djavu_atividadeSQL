SELECT e.nome, COUNT(pe.id_exame) AS total_pedidos
FROM Pedido_Exame pe
JOIN Exame e ON pe.id_exame = e.id_exame
GROUP BY e.nome
ORDER BY total_pedidos DESC;

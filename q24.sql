SELECT 
    MONTH(data_consulta) AS mes,
    YEAR(data_consulta) AS ano,
    SUM(valor_consulta) AS faturamento_total
FROM Consulta
GROUP BY ano, mes
ORDER BY ano DESC, mes DESC;

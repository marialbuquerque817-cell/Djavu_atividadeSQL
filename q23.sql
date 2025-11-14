SELECT DISTINCT p.nome
FROM Paciente p
JOIN Consulta c ON p.id_paciente = c.id_paciente
WHERE c.id_convenio IS NULL;

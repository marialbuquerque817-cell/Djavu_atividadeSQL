SELECT co.nome AS convenio, COUNT(DISTINCT c.id_paciente) AS total_pacientes
FROM Consulta c
JOIN Convenio co ON c.id_convenio = co.id_convenio
GROUP BY co.nome
ORDER BY total_pacientes DESC;

DELETE FROM Paciente
WHERE id_paciente NOT IN (SELECT DISTINCT id_paciente FROM Consulta);

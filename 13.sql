UPDATE Consulta
SET status = 'REALIZADA'
WHERE data_consulta < NOW();

-- 8
DROP VIEW IF EXISTS vw_consultas_realizadas;
CREATE VIEW vw_consultas_realizadas AS
SELECT
  c.id AS consulta_id,
  p.nome AS paciente,
  m.nome AS medico,
  m.especialidade AS especialidade,
  c.valor_total AS valor,
  c.data_consulta AS data_consulta,
  c.hora AS hora
FROM consulta c
JOIN paciente p ON c.paciente_id = p.id
JOIN medico m ON c.medico_id = m.id
WHERE c.status = 'Realizada';
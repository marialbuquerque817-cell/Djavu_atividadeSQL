DELIMITER $$

-- Ao inserir um pedido de exame, recalcular o total da consulta associada
DROP TRIGGER IF EXISTS trg_after_insert_pedido_exame $$
CREATE TRIGGER trg_after_insert_pedido_exame
AFTER INSERT ON Pedido_Exame
FOR EACH ROW
BEGIN
    CALL sp_calc_update_valor_total(NEW.id_consulta);
END$$

-- Ao atualizar um pedido de exame (quantidade ou subtotal), recalcular
DROP TRIGGER IF EXISTS trg_after_update_pedido_exame $$
CREATE TRIGGER trg_after_update_pedido_exame
AFTER UPDATE ON Pedido_Exame
FOR EACH ROW
BEGIN
    CALL sp_calc_update_valor_total(NEW.id_consulta);
END$$

-- Ao deletar um pedido de exame, recalcular usando OLD.id_consulta
DROP TRIGGER IF EXISTS trg_after_delete_pedido_exame $$
CREATE TRIGGER trg_after_delete_pedido_exame
AFTER DELETE ON Pedido_Exame
FOR EACH ROW
BEGIN
    CALL sp_calc_update_valor_total(OLD.id_consulta);
END$$

-- Quando uma nova consulta for inserida, inicializar valor_total (considerando exames já presentes é raro, mas mantemos)
DROP TRIGGER IF EXISTS trg_after_insert_consulta $$
CREATE TRIGGER trg_after_insert_consulta
AFTER INSERT ON Consulta
FOR EACH ROW
BEGIN
    CALL sp_calc_update_valor_total(NEW.id_consulta);
END$$

-- Quando uma consulta for atualizada (ex: valor_consulta ou convênio mudam), recalcular
DROP TRIGGER IF EXISTS trg_after_update_consulta $$
CREATE TRIGGER trg_after_update_consulta
AFTER UPDATE ON Consulta
FOR EACH ROW
BEGIN
    CALL sp_calc_update_valor_total(NEW.id_consulta);
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_check_data_nascimento
BEFORE INSERT ON Paciente
FOR EACH ROW
BEGIN
    IF NEW.data_nascimento >= CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A data de nascimento deve ser anterior à data atual.';
    END IF;
END$$

DELIMITER ;

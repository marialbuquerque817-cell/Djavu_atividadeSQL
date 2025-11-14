ALTER TABLE Consulta
ADD COLUMN IF NOT EXISTS valor_total DECIMAL(12,2) NOT NULL DEFAULT 0.00;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_calc_update_valor_total $$
CREATE PROCEDURE sp_calc_update_valor_total(IN p_id_consulta INT)
BEGIN
    DECLARE v_valor_base DECIMAL(12,2) DEFAULT 0.00;
    DECLARE v_total_exames DECIMAL(12,2) DEFAULT 0.00;
    DECLARE v_desconto_pct DECIMAL(6,4) DEFAULT 0.0;
    DECLARE v_id_convenio INT;

    -- Obter valor base da consulta e id_convenio
    SELECT valor_consulta, id_convenio INTO v_valor_base, v_id_convenio
    FROM Consulta
    WHERE id_consulta = p_id_consulta;

    -- Somar subtotais dos exames (se houver)
    SELECT IFNULL(SUM(subtotal),0.00) INTO v_total_exames
    FROM Pedido_Exame
    WHERE id_consulta = p_id_consulta;

    -- Obter percentual de desconto do convênio (se houver)
    IF v_id_convenio IS NOT NULL THEN
        SELECT IFNULL(desconto_percent/100,0.0) INTO v_desconto_pct
        FROM Convenio
        WHERE id_convenio = v_id_convenio;
    ELSE
        SET v_desconto_pct = 0.0;
    END IF;

    -- Calcular total antes do desconto
    SET @v_total_pre_desconto = v_valor_base + v_total_exames;

    -- Aplicar desconto (sobre o total: consulta + exames)
    SET @v_total_pos_desconto = @v_total_pre_desconto - (@v_total_pre_desconto * v_desconto_pct);

    -- Atualizar campo valor_total na consulta
    UPDATE Consulta
    SET valor_total = ROUND(@v_total_pos_desconto,2)
    WHERE id_consulta = p_id_consulta;
END$$
DELIMITER ;

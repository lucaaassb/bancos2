-- Script Triggers para implementação das triggers
-- Autor: [Seu Nome]
-- Data: [Data Atual]

USE aula14Triggers;

-- Trigger para validar o nome do cliente (deve ter mais de 4 caracteres)
DELIMITER //
CREATE TRIGGER trg_valida_nome
BEFORE INSERT ON tbl_cliente
FOR EACH ROW
BEGIN
    IF CHAR_LENGTH(NEW.cliente_nome) <= 4 THEN
        SET NEW.cliente_nome = NULL;
    END IF;
END //
DELIMITER ;

-- Trigger para validar a compra (cliente e produto devem existir)
DELIMITER //
CREATE TRIGGER trg_valida_compra
BEFORE INSERT ON tbl_compra
FOR EACH ROW
BEGIN
    DECLARE cliente_existe INT;
    DECLARE produto_existe INT;
    
    SELECT COUNT(*) INTO cliente_existe 
    FROM tbl_cliente 
    WHERE cliente_id = NEW.cliente_id;
    
    SELECT COUNT(*) INTO produto_existe 
    FROM tbl_produto 
    WHERE produto_id = NEW.produto_id;
    
    IF cliente_existe = 0 OR produto_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cliente ou produto não existe';
    END IF;
END //
DELIMITER ;

-- Trigger para inserir email na newsletter
DELIMITER //
CREATE TRIGGER trg_newsletter
AFTER INSERT ON tbl_cliente
FOR EACH ROW
BEGIN
    IF NEW.cliente_email IS NOT NULL THEN
        INSERT INTO tbl_newsletter (newsletter_email, newsletter_data)
        VALUES (NEW.cliente_email, NOW());
    END IF;
END //
DELIMITER ;

-- Exemplos de uso das triggers:

-- 1. Tentar inserir cliente com nome inválido (será rejeitado)
-- INSERT INTO tbl_cliente (cliente_nome, cliente_email) VALUES ('Ana', 'ana@email.com');

-- 2. Tentar inserir compra com cliente/produto inexistente (será rejeitado)
-- INSERT INTO tbl_compra (cliente_id, produto_id, compra_data, compra_quantidade)
-- VALUES (999, 999, NOW(), 1);

-- 3. Inserir cliente com email (será inserido na newsletter)
-- INSERT INTO tbl_cliente (cliente_nome, cliente_email)
-- VALUES ('Carlos Silva', 'carlos@email.com'); 
-- Script Triggers para implementação das triggers
-- Autor: [Seu Nome]
-- Data: [Data Atual]

USE aula14Triggers;

-- Trigger para atualizar o estoque após uma venda
DELIMITER //
CREATE TRIGGER trg_atualiza_estoque
AFTER INSERT ON itens_venda
FOR EACH ROW
BEGIN
    UPDATE produtos 
    SET estoque = estoque - NEW.quantidade
    WHERE id = NEW.produto_id;
END //
DELIMITER ;

-- Trigger para registrar alterações de preço
DELIMITER //
CREATE TRIGGER trg_log_preco_produto
AFTER UPDATE ON produtos
FOR EACH ROW
BEGIN
    IF OLD.preco != NEW.preco THEN
        INSERT INTO log_produtos (produto_id, data_alteracao, preco_antigo, preco_novo)
        VALUES (NEW.id, NOW(), OLD.preco, NEW.preco);
    END IF;
END //
DELIMITER ;

-- Exemplos de uso das triggers:

-- 1. Realizar uma venda (irá acionar trg_atualiza_estoque)
-- INSERT INTO vendas (data_venda, total) VALUES (NOW(), 1500.00);
-- INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) 
-- VALUES (LAST_INSERT_ID(), 3, 1, 1500.00);

-- 2. Atualizar preço de um produto (irá acionar trg_log_preco_produto)
-- UPDATE produtos SET preco = 1600.00 WHERE id = 3; 
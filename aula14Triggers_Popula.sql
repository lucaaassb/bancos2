-- Script Popula para inserção de dados
-- Autor: [Seu Nome]
-- Data: [Data Atual]

USE aula14Triggers;

-- Inserção de clientes
INSERT INTO tbl_cliente (cliente_nome, cliente_email) VALUES
('João Silva', 'joao@email.com'),
('Maria Santos', 'maria@email.com'),
('Pedro Oliveira', 'pedro@email.com');

-- Inserção de produtos
INSERT INTO tbl_produto (produto_nome, produto_preco) VALUES
('Notebook', 3500.00),
('Smartphone', 2000.00),
('Tablet', 1500.00);

-- Inserção de compras
INSERT INTO tbl_compra (cliente_id, produto_id, compra_data, compra_quantidade) VALUES
(1, 1, NOW(), 1),
(2, 2, NOW(), 1),
(3, 3, NOW(), 2); 
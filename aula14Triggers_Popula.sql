-- Script Popula para inserção de dados
-- Autor: [Seu Nome]
-- Data: [Data Atual]

USE aula14Triggers;

-- Inserção de produtos
INSERT INTO produtos (nome, preco, estoque) VALUES
('Notebook', 3500.00, 10),
('Smartphone', 2000.00, 15),
('Tablet', 1500.00, 8),
('Monitor', 800.00, 12),
('Teclado', 150.00, 20);

-- Inserção de vendas
INSERT INTO vendas (data_venda, total) VALUES
(NOW(), 3500.00),
(NOW(), 2000.00);

-- Inserção de itens de venda
INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 3500.00),
(2, 2, 1, 2000.00); 
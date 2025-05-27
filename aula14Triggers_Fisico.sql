-- Script Físico para implementação de Triggers
-- Autor: [Seu Nome]
-- Data: [Data Atual]

-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS aula14Triggers;
USE aula14Triggers;

-- Criação das tabelas
CREATE TABLE IF NOT EXISTS produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE IF NOT EXISTS vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATETIME NOT NULL,
    total DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS itens_venda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venda_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (venda_id) REFERENCES vendas(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

CREATE TABLE IF NOT EXISTS log_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT NOT NULL,
    data_alteracao DATETIME NOT NULL,
    preco_antigo DECIMAL(10,2),
    preco_novo DECIMAL(10,2),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
); 
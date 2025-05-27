-- Script Físico para implementação de Triggers
-- Autor: [Seu Nome]
-- Data: [Data Atual]

-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS aula14Triggers;
USE aula14Triggers;

-- Criação das tabelas
CREATE TABLE IF NOT EXISTS tbl_cliente (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_nome VARCHAR(100) NOT NULL,
    cliente_email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS tbl_produto (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,
    produto_nome VARCHAR(100) NOT NULL,
    produto_preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS tbl_compra (
    compra_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    produto_id INT NOT NULL,
    compra_data DATETIME NOT NULL,
    compra_quantidade INT NOT NULL
);

CREATE TABLE IF NOT EXISTS tbl_newsletter (
    newsletter_id INT AUTO_INCREMENT PRIMARY KEY,
    newsletter_email VARCHAR(100) NOT NULL,
    newsletter_data DATETIME NOT NULL
); 
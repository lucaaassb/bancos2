-- Script Apaga para remoção das estruturas
-- Autor: [Seu Nome]
-- Data: [Data Atual]

USE aula14Triggers;

-- Remoção das triggers
DROP TRIGGER IF EXISTS trg_valida_nome;
DROP TRIGGER IF EXISTS trg_valida_compra;
DROP TRIGGER IF EXISTS trg_newsletter;

-- Remoção das tabelas
DROP TABLE IF EXISTS tbl_newsletter;
DROP TABLE IF EXISTS tbl_compra;
DROP TABLE IF EXISTS tbl_produto;
DROP TABLE IF EXISTS tbl_cliente;

-- Remoção do banco de dados
DROP DATABASE IF EXISTS aula14Triggers; 
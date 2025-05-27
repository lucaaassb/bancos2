-- Script Apaga para remoção das estruturas
-- Autor: [Seu Nome]
-- Data: [Data Atual]

USE aula14Triggers;

-- Remoção das triggers
DROP TRIGGER IF EXISTS trg_atualiza_estoque;
DROP TRIGGER IF EXISTS trg_log_preco_produto;

-- Remoção das tabelas
DROP TABLE IF EXISTS log_produtos;
DROP TABLE IF EXISTS itens_venda;
DROP TABLE IF EXISTS vendas;
DROP TABLE IF EXISTS produtos;

-- Remoção do banco de dados
DROP DATABASE IF EXISTS aula14Triggers; 
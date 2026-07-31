DROP DATABASE IF EXISTS imobiliaria_lardocelar;

CREATE DATABASE imobiliaria_lardocelar;

USE imobiliaria_lardocelar;

CREATE TABLE proprietario (
  id_proprietario INT PRIMARY KEY AUTO_INCREMENT,
  nome_proprietario VARCHAR(50) NOT NULL,
  cpf_proprietario CHAR(11) NOT NULL UNIQUE,
  telefone_proprietario CHAR(11) NOT NULL UNIQUE,
  email_proprietario VARCHAR(100) NOT NULL UNIQUE,
  dt_nasc_proprietario DATE NOT NULL
);

CREATE TABLE inquilino (
  id_inquilino INT PRIMARY KEY AUTO_INCREMENT,
  nome_inquilino VARCHAR(50) NOT NULL,
  cpf_inquilino CHAR(11) NOT NULL UNIQUE,
  telefone_inquilino CHAR(11) NOT NULL UNIQUE,
  email_inquilino VARCHAR(100) NOT NULL UNIQUE,
  dt_nasc_inquilino DATE NOT NULL
);

CREATE TABLE imovel (
  id_imovel INT PRIMARY KEY AUTO_INCREMENT,
  matricula INT NOT NULL UNIQUE,
  tipo ENUM('CASA', 'APARTAMENTO', 'SOBRADO') NOT NULL,
  endereco VARCHAR(100) NOT NULL,
  bairro VARCHAR(30) NOT NULL,
  status ENUM('DISPONÍVEL', 'ALUGADO', 'MANUTENÇÃO', 'INATIVO', 'RESERVADO') DEFAULT 'DISPONÍVEL',
  id_proprietario INT NOT NULL,
  FOREIGN KEY (id_proprietario) REFERENCES proprietario (id_proprietario)
);

CREATE TABLE aluguel (
  id_aluguel INT PRIMARY KEY AUTO_INCREMENT,
  contrato INT NOT NULL UNIQUE,
  dt_inicio DATE NOT NULL,
  dt_termino DATE,
  valor DECIMAL(7,2) NOT NULL,
  dia_pagamento INT NOT NULL,
  status ENUM('PAGO', 'EM ABERTO', 'ATRASADO') DEFAULT 'EM ABERTO',
  id_imovel INT NOT NULL,
  id_inquilino INT NOT NULL,
  FOREIGN KEY (id_imovel) REFERENCES imovel (id_imovel),
  FOREIGN KEY (id_inquilino) REFERENCES inquilino (id_inquilino)
);
CREATE DATABASE IF NOT EXISTS academia;
USE academia;

CREATE TABLE planos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(40) NOT NULL,
  mensalidade DECIMAL(6,2) NOT NULL
);

CREATE TABLE membros (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(80) NOT NULL,
  idade INT,
  plano_id INT,
  FOREIGN KEY (plano_id) REFERENCES planos(id)
);

INSERT INTO planos (nome, mensalidade) VALUES
  ('Básico', 80.00),
  ('Completo', 120.00);

INSERT INTO membros (nome, idade, plano_id) VALUES
  ('Carlos Souza', 25, 1),
  ('Daniela Rocha', 31, 2),
  ('Eduardo Pires', 19, 1);

SELECT * FROM membros;

SELECT nome FROM membros WHERE idade > 20;

SELECT membros.nome, planos.nome AS plano, planos.mensalidade
FROM membros
JOIN planos ON membros.plano_id = planos.id;

SELECT plano_id, COUNT(*) AS total_membros
FROM membros
GROUP BY plano_id;

UPDATE membros SET plano_id = 2 WHERE nome = 'Eduardo Pires';

DELETE FROM membros WHERE nome = 'Carlos Souza';

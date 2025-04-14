CREATE DATABASE bd_ex2;
 
USE bd_ex2;
 
CREATE TABLE Produto (
	idProduto INT PRIMARY KEY,
    Produto VARCHAR(45),
    idCategoria INT
);
 
CREATE TABLE Categoria (
	idCategoria INT PRIMARY KEY,
    Categoria VARCHAR(45)
);
 
ALTER TABLE Produto
ADD CONSTRAINT fk_Categoria_Produto
FOREIGN KEY (idCategoria)
REFERENCES Categoria(idCategoria);
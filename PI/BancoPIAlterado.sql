create database projetoTemp;
use projetoTemp;

CREATE TABLE fornecedor(
idFornecedor INT PRIMARY KEY AUTO_INCREMENT,
nomeFornecedor VARCHAR(50),
CNPJ CHAR(14),
produto VARCHAR(50),
estoque VARCHAR(50)
);
CREATE TABLE empresa(
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR(50),
CNPJ CHAR(14),
pedido VARCHAR(30)
);

CREATE TABLE lote(
	idLote INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(30) NOT NULL,
    fkSensor INT,
    CONSTRAINT cFkSensor FOREIGN KEY (fkSensor) REFERENCES sensor (idSensor),-- FOREIGN KEY
    produto VARCHAR(50),
    dtSaida DATETIME,
    dtEstimada DATE,
    tempoEstimado TIME,
    localLote VARCHAR (50),
    tempMedia DECIMAL(3,1),
    dtEntrega DATETIME,
    fkFornecedor INT, 
    CONSTRAINT cFkFornecedor FOREIGN KEY (fkFornecedor) REFERENCES fornecedor (idFornecedor),-- FOREIGN KEY
    qldEntrega  VARCHAR(50),
    CONSTRAINT qldEntregaC CHECK(qldEntrega IN('Bom Estado', 'Qualidade Prejudicada', 'Produto Deteriorado'))
);

CREATE TABLE produto(
	idProduto INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(30) NOT NULL,
    nomeProduto  VARCHAR(30),
    tempMax DECIMAL (4,1),
    tempMin DECIMAL (4,1),
	fkFornecedor INT, 
	CONSTRAINT cFkFornecedor FOREIGN KEY (fkFornecedor) REFERENCES fornecedor (idFornecedor) -- FOREIGN KEY
);

create table sensor(
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    codSensor INT NOT NULL,
    tempAtual DECIMAL (4,1),
    condicao VARCHAR(20),
    CONSTRAINT condicaoC CHECK(condicao IN ('Funcionando', 'Defeituoso')),
    localSensor VARCHAR(50) 
);
create table registroTemperatura(
	idRegistro INT PRIMARY KEY AUTO_INCREMENT,
    fkSensor INT,
    CONSTRAINT cFkSensor FOREIGN KEY (fkSensor) REFERENCES sensor (idSensor), -- FOREIGN KEY
	temperatura DECIMAL (4,1),
	dtRegistro DATETIME,
    fkLote INT,
    CONSTRAINT cFkLote FOREIGN KEY (fkLote) REFERENCES lote (idLote) -- FOREIGN KEY
);
-- Criação do banco de dados para o cenário de Oficina
-- drop database oficina;
create database oficina;
use oficina;
show tables;
desc Cliente;

-- -----------------------------------------------------
-- Table `Cliente`
-- -----------------------------------------------------
CREATE TABLE Cliente (
  idCliente int not null auto_increment primary key,
  Nome varchar(45) not null,
  Telefone char(11) not null,
  CPF char(11) null,
  CNPJ CHAR(15) null);

-- -----------------------------------------------------
-- Table Tipo_De_Serviço
-- -----------------------------------------------------
CREATE TABLE Tipo_De_Servico (
  idTipo_De_Servico INT NOT NULL,
  Descrição VARCHAR(45) NULL,
  PRIMARY KEY (idTipo_De_Servico));


-- -----------------------------------------------------
-- Table Responsável
-- -----------------------------------------------------
CREATE TABLE Responsavel (
  idResponsavel INT NOT NULL PRIMARY KEY,
  NivelHelpDesc VARCHAR(45) NULL,
  Nome VARCHAR(45) NULL,
  Departamento VARCHAR(45) NULL);


-- -----------------------------------------------------
-- Table Serviço
-- -----------------------------------------------------
CREATE TABLE Servico (
  idServico INT NOT NULL,
  Data_da_Solicitacao DATE NULL,
  Cliente_idCliente INT NOT NULL,
  Liberado TINYINT NULL,
  Tipo_De_Servico_idTipo_De_Servico INT NOT NULL,
  Responsavel_idResponsavel INT NOT NULL,
  PRIMARY KEY (idServico, Cliente_idCliente, Tipo_De_Servico_idTipo_De_Servico, Responsavel_idResponsavel),
  INDEX fk_Pedido_Cliente_idx (Cliente_idCliente ASC) VISIBLE,
  INDEX fk_Servico_Tipo_De_Servico1_idx (Tipo_De_Servico_idTipo_De_Servico ASC) VISIBLE,
  INDEX fk_Servico_Responsavel1_idx (Responsavel_idResponsavel ASC) VISIBLE,
  CONSTRAINT fk_Pedido_Cliente
    FOREIGN KEY (Cliente_idCliente)
    REFERENCES Cliente (idCliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Servico_Tipo_De_Servico1
    FOREIGN KEY (Tipo_De_Servico_idTipo_De_Servico)
    REFERENCES Tipo_De_Servico (idTipo_De_Servico)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Servico_Responsavel1
    FOREIGN KEY (Responsavel_idResponsavel)
    REFERENCES Responsavel (idResponsavel)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table Ordem_de_Seviço
-- -----------------------------------------------------
CREATE TABLE Ordem_de_Servico (
  idOrdem_de_Servico INT NOT NULL,
  Status ENUM ('EM ANDAMENTO', 'FINALIZADA') NOT NULL,
  Data_de_Entrega DATE NULL,
  Valor_Total VARCHAR(45) NOT NULL,
  PRIMARY KEY (idOrdem_de_Servico));


-- -----------------------------------------------------
-- Table Responsável_da_Ordem_de_Seviço
-- -----------------------------------------------------
CREATE TABLE Responsavel_da_Ordem_de_Servico (
  Responsavel_idResponsavel INT NOT NULL,
  Ordem_de_Servico_idOrdem_de_Servico INT NOT NULL,
  Valor_Mao_de_Obra FLOAT NOT NULL,
  PRIMARY KEY (Responsavel_idResponsavel, Ordem_de_Servico_idOrdem_de_Servico),
  INDEX fk_Responsavel_has_Ordem_de_Servico_Ordem_de_Servico1_idx (Ordem_de_Servico_idOrdem_de_Servico ASC) VISIBLE,
  INDEX fk_Responsavel_has_Ordem_de_Servico_Ordem_de_Sevico1_idx (Responsavel_idResponsavel ASC) VISIBLE,
  CONSTRAINT fk_Responsavel_has_Ordem_de_Servico_Responsavel1
    FOREIGN KEY (Responsavel_idResponsavel)
    REFERENCES Responsavel (idResponsavel)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Responsavel_has_Ordem_de_Servico_Ordem_de_Servico1
    FOREIGN KEY (Ordem_de_Servico_idOrdem_de_Servico)
    REFERENCES Ordem_de_Servico (idOrdem_de_Servico)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table Pecas
-- -----------------------------------------------------
CREATE TABLE Pecas (
  idpecas INT NOT NULL,
  descricao VARCHAR(255) NULL,
  valor DECIMAL(10,2) NULL,
  PRIMARY KEY (idpecas));


-- -----------------------------------------------------
-- Table Ordem_de_Seviço_e_Pecas
-- -----------------------------------------------------
CREATE TABLE Ordem_de_Servico_e_Pecas (
  Ordem_de_Servico_idOrdem_de_Servico INT NOT NULL,
  Pecas_idpecas INT NOT NULL,
  Quantidade INT NULL,
  PRIMARY KEY (Ordem_de_Servico_idOrdem_de_Servico, Pecas_idpecas),
  INDEX fk_Ordem_de_Servico_has_Pecas_Pecas1_idx (Pecas_idpecas ASC) VISIBLE,
  INDEX fk_Ordem_de_Servico_has_Pecas_Ordem_de_Servico1_idx (Ordem_de_Servico_idOrdem_de_Servico ASC) VISIBLE,
  CONSTRAINT fk_Ordem_de_Servico_has_Pecas_Ordem_de_Servico1
    FOREIGN KEY (Ordem_de_Servico_idOrdem_de_Servico)
    REFERENCES Ordem_de_Servico (idOrdem_de_Servico)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Ordem_de_Servico_has_Pecas_Pecas1
    FOREIGN KEY (Pecas_idpecas)
    REFERENCES Pecas (idpecas)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



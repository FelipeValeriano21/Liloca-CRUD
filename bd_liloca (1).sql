-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Nov-2022 às 23:12
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_liloca`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `bebida`
--

CREATE TABLE `bebida` (
  `idBebida` int(10) UNSIGNED NOT NULL,
  `Produto_idProduto` int(10) UNSIGNED NOT NULL,
  `medida` int(10) UNSIGNED DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `sabor` varchar(45) DEFAULT NULL,
  `quantidade` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(10) UNSIGNED NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `cpf` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nome`, `email`, `telefone`, `endereco`, `cpf`) VALUES
(22, 'Felipe Valeriano ', 'felipereis@hotmail.com.br', '1196285263', 'Rua Manuel Soares Filho 51', 2147483647),
(24, 'Lionel Andres Messi Cuccittini', 'LionelMessi@gmail.com', '11962869636', 'Rua Manuel Soares Filho 51', 41564153);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comida`
--

CREATE TABLE `comida` (
  `idComida` int(10) UNSIGNED NOT NULL,
  `Produto_idProduto` int(10) UNSIGNED NOT NULL,
  `medicao` int(11) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `decoracao`
--

CREATE TABLE `decoracao` (
  `idDecoracao` int(10) UNSIGNED NOT NULL,
  `Produto_idProduto` int(10) UNSIGNED NOT NULL,
  `tamanho` int(10) UNSIGNED DEFAULT NULL,
  `modelo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `festa`
--

CREATE TABLE `festa` (
  `idFesta` int(10) UNSIGNED NOT NULL,
  `Pedido_idPedido` int(10) UNSIGNED NOT NULL,
  `Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `idade` int(10) UNSIGNED DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `tema` varchar(200) DEFAULT NULL,
  `cores` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens`
--

CREATE TABLE `itens` (
  `Pedido_idPedido` int(10) UNSIGNED NOT NULL,
  `Produto_idProduto` int(10) UNSIGNED NOT NULL,
  `valor` int(10) UNSIGNED DEFAULT NULL,
  `quantidade` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(10) UNSIGNED NOT NULL,
  `data_pedido` date DEFAULT NULL,
  `data_festa` date DEFAULT NULL,
  `prazo` date DEFAULT NULL,
  `data_entrega` date DEFAULT NULL,
  `tipo_entrega` varchar(200) DEFAULT NULL,
  `frete` double DEFAULT NULL,
  `sinal` double DEFAULT NULL,
  `restante` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idProduto` int(10) UNSIGNED NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `valor_unit` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `bebida`
--
ALTER TABLE `bebida`
  ADD PRIMARY KEY (`idBebida`,`Produto_idProduto`),
  ADD KEY `Bebida_FKIndex1` (`Produto_idProduto`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Índices para tabela `comida`
--
ALTER TABLE `comida`
  ADD PRIMARY KEY (`idComida`,`Produto_idProduto`),
  ADD KEY `Comida_FKIndex1` (`Produto_idProduto`);

--
-- Índices para tabela `decoracao`
--
ALTER TABLE `decoracao`
  ADD PRIMARY KEY (`idDecoracao`,`Produto_idProduto`),
  ADD KEY `Decoracao_FKIndex1` (`Produto_idProduto`);

--
-- Índices para tabela `festa`
--
ALTER TABLE `festa`
  ADD PRIMARY KEY (`idFesta`),
  ADD KEY `Festa_FKIndex1` (`Cliente_idCliente`),
  ADD KEY `Festa_FKIndex2` (`Pedido_idPedido`);

--
-- Índices para tabela `itens`
--
ALTER TABLE `itens`
  ADD PRIMARY KEY (`Pedido_idPedido`,`Produto_idProduto`),
  ADD KEY `Pedido_has_Produto_FKIndex1` (`Pedido_idPedido`),
  ADD KEY `Pedido_has_Produto_FKIndex2` (`Produto_idProduto`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idProduto`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `bebida`
--
ALTER TABLE `bebida`
  MODIFY `idBebida` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `comida`
--
ALTER TABLE `comida`
  MODIFY `idComida` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `decoracao`
--
ALTER TABLE `decoracao`
  MODIFY `idDecoracao` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `festa`
--
ALTER TABLE `festa`
  MODIFY `idFesta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idProduto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;


--
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata para tabela bebida
--

--
-- Metadata para tabela cliente
--

--
-- Metadata para tabela comida
--

--
-- Metadata para tabela decoracao
--

--
-- Metadata para tabela festa
--

--
-- Metadata para tabela itens
--

--
-- Metadata para tabela pedido
--

--
-- Metadata para tabela produto
--

--
-- Metadata para o banco de dados bd_liloca
--
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

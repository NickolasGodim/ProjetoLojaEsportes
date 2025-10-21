-- phpMyAdmin SQL Dump
-- version 3.4.9
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tempo de Geração: 08/05/2025 às 19h23min
-- Versão do Servidor: 5.5.20
-- Versão do PHP: 5.3.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `escola3190`
--
CREATE DATABASE `escola3190` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `escola3190`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE IF NOT EXISTS `aluno` (
  `codigo` int(5) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `telefone` int(15) NOT NULL,
  `codcurso` int(5) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codcurso` (`codcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`codigo`, `nome`, `telefone`, `codcurso`) VALUES
(1, 'ManoelGomes', 14252622, 1),
(2, 'EdnaldoPereira', 53513222, 3),
(3, 'PedroHerobrine', 93916839, 2),
(4, 'RobertoCarlos', 90009222, 2),
(5, 'mafra', 135136136, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `coordenador`
--

CREATE TABLE IF NOT EXISTS `coordenador` (
  `codigo` int(5) NOT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `coordenador`
--

INSERT INTO `coordenador` (`codigo`, `nome`) VALUES
(1, 'oppenheimer'),
(2, 'pitagoras'),
(3, 'arquimedes'),
(4, 'joab');

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `codigo` int(5) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `codcoordenador` int(5) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codcoordenador` (`codcoordenador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`codigo`, `nome`, `codcoordenador`) VALUES
(1, 'matematica', 3),
(2, 'calculo', 2),
(3, 'fisica', 1),
(4, 'agentespecial', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `codigo` int(5) NOT NULL AUTO_INCREMENT,
  `login` varchar(25) NOT NULL,
  `senha` varchar(25) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`codigo`, `login`, `senha`) VALUES
(1, 'Herobrine', '123');

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`codcurso`) REFERENCES `curso` (`codigo`);

--
-- Restrições para a tabela `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`codcoordenador`) REFERENCES `coordenador` (`codigo`);
--
-- Banco de Dados: `loja`
--
CREATE DATABASE `loja` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `loja`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `codigo` int(5) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`codigo`, `nome`) VALUES
(1, 'Masculino'),
(2, 'Feminino'),
(3, 'Infantil');

-- --------------------------------------------------------

--
-- Estrutura da tabela `marca`
--

CREATE TABLE IF NOT EXISTS `marca` (
  `codigo` int(5) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `marca`
--

INSERT INTO `marca` (`codigo`, `nome`) VALUES
(1, 'Nike'),
(2, 'Adidas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
  `codigo` int(5) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  `cor` varchar(50) NOT NULL,
  `tamanho` varchar(10) NOT NULL,
  `preco` float(10,2) NOT NULL,
  `codmarca` int(5) NOT NULL,
  `codcategoria` int(5) NOT NULL,
  `codtipo` int(5) NOT NULL,
  `foto1` varchar(100) NOT NULL,
  `foto2` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codmarca` (`codmarca`),
  KEY `codcategoria` (`codcategoria`),
  KEY `codtipo` (`codtipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`codigo`, `descricao`, `cor`, `tamanho`, `preco`, `codmarca`, `codcategoria`, `codtipo`, `foto1`, `foto2`) VALUES
(1, 'Camisa Nike Dri-FIT apresenta tecido macio, que absorve o suor', 'Branca', 'G', 129.00, 1, 1, 1, '12585352f519a45fe80e53566b7fa465', '772306afcded61882f0bac9ce4def258'),
(2, 'De corridas de pista a corridas de 5 km nas férias, a blusa Pacer de ajuste descontraído é a camada ', 'Preta', 'M', 159.00, 1, 1, 1, 'a376faaa8fce08f0d755a402712079f2', '0852ea5f820c9484df8391a21057bff6'),
(3, 'Esta camiseta adidas permite que você mostre seu lado selvagem.', 'Preta', 'P', 129.00, 2, 2, 1, 'd64cff1b6301044751eaef641699981c', '2f6e075f25bd1ec26835e07b6af79128'),
(4, 'Camisa Adidas Branca Fem', 'Branca', 'P', 129.00, 2, 2, 1, 'cf2aac411ba1c63d2a6c8a38581daf3a', '92bc473993681b8722648b4499522abe'),
(5, ' Continue evoluindo com este tênis de corrida adidas para corridas diárias.', 'Preto', '36', 299.00, 2, 2, 2, '87f3dae17e2cf0840a283d9005620845', '115e3ced05db85dd0c98ef68db9d2373'),
(6, 'Este clássico adidas Superstar II é perfeito para o dia a dia.', 'Branco', '38', 359.00, 2, 1, 2, '067f4a9f5b6ee414045cf0783b168056', '5da30e418a08fbe0474007fb662d83d1'),
(7, 'Coloque seus pezinhos neste ícone para um visual old-school', 'Branco', '28', 479.00, 1, 3, 2, '4cf4c16d625aefd09d072120a30bef68', '662ecd9e46be6750ed39a100240eb303'),
(8, 'esse modelo combina detalhes de design de réplica com tecido que absorve o suor', 'Preta', 'P', 379.00, 1, 3, 1, 'fc713079771a344e8f7344acd97c5ea5', '09b2484a2b866932076b24033ca3e526'),
(9, 'Mostre seu amor pela sua seleção nacional com esta camiseta de algodão macio', 'Branca', 'PP', 279.00, 1, 3, 1, 'e8cbc68c49835a501b5e7a2cae90db54', '93afaa305282aea39b9beffb527c76b6'),
(10, 'Um estilo versátil que se adapta a todos os momentos.', 'Preto', '37', 449.00, 2, 1, 2, '258392265c52c11fb3a4706224bb0436', 'e400974d9dde6513317d9e3b5f757be1'),
(11, 'este tênis de corrida adidas oferece suporte enquanto você corre em busca dos seus objetivos.', 'Branco', '35', 229.00, 2, 2, 2, '6c0cf528d5dbb3e7c713fca17a63d35a', '98f3ee18e43d05f60093f8f0afd947f1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo`
--

CREATE TABLE IF NOT EXISTS `tipo` (
  `codigo` int(5) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tipo`
--

INSERT INTO `tipo` (`codigo`, `nome`) VALUES
(1, 'Roupas'),
(2, 'Calçados');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `codigo` int(5) NOT NULL AUTO_INCREMENT,
  `login` varchar(25) NOT NULL,
  `senha` varchar(25) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`codigo`, `login`, `senha`) VALUES
(1, 'Herobrine', '123');

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`codmarca`) REFERENCES `marca` (`codigo`),
  ADD CONSTRAINT `produto_ibfk_2` FOREIGN KEY (`codcategoria`) REFERENCES `categoria` (`codigo`),
  ADD CONSTRAINT `produto_ibfk_3` FOREIGN KEY (`codtipo`) REFERENCES `tipo` (`codigo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

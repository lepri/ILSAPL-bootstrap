-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: interlegis
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.13.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acomp_materia`
--

DROP TABLE IF EXISTS `acomp_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acomp_materia` (
  `cod_cadastro` int(11) NOT NULL AUTO_INCREMENT,
  `cod_materia` int(11) NOT NULL,
  `end_email` varchar(100) NOT NULL,
  `txt_hash` varchar(8) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_cadastro`),
  UNIQUE KEY `fk_{CCECA63D-5992-437B-BCD3-D7C98DA3E926}` (`cod_materia`,`end_email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `afastamento`
--

DROP TABLE IF EXISTS `afastamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afastamento` (
  `cod_afastamento` int(11) NOT NULL AUTO_INCREMENT,
  `cod_parlamentar` int(11) NOT NULL,
  `cod_mandato` int(11) NOT NULL,
  `num_legislatura` int(11) NOT NULL,
  `tip_afastamento` int(11) NOT NULL,
  `dat_inicio_afastamento` date NOT NULL,
  `dat_fim_afastamento` date DEFAULT NULL,
  `cod_parlamentar_suplente` int(11) NOT NULL,
  `txt_observacao` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_afastamento`),
  KEY `idx_parlamentar_mandato` (`cod_parlamentar`,`num_legislatura`),
  KEY `idx_afastamento_datas` (`cod_parlamentar`,`dat_inicio_afastamento`,`dat_fim_afastamento`),
  KEY `idx_tip_afastamento` (`tip_afastamento`),
  KEY `idx__parlamentar_suplente` (`cod_parlamentar_suplente`,`num_legislatura`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anexada`
--

DROP TABLE IF EXISTS `anexada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anexada` (
  `cod_materia_principal` int(11) NOT NULL,
  `cod_materia_anexada` int(11) NOT NULL,
  `dat_anexacao` date NOT NULL,
  `dat_desanexacao` date DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_materia_principal`,`cod_materia_anexada`),
  KEY `fk_{FD808F7A-0315-44A3-840C-C1FF58629458}` (`cod_materia_anexada`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assunto_materia`
--

DROP TABLE IF EXISTS `assunto_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assunto_materia` (
  `cod_assunto` int(11) NOT NULL,
  `des_assunto` varchar(200) NOT NULL,
  `des_dispositivo` varchar(50) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_assunto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assunto_norma`
--

DROP TABLE IF EXISTS `assunto_norma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assunto_norma` (
  `cod_assunto` int(4) NOT NULL AUTO_INCREMENT,
  `des_assunto` varchar(50) NOT NULL,
  `des_estendida` varchar(250) DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_assunto`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autor` (
  `cod_autor` int(11) NOT NULL AUTO_INCREMENT,
  `cod_partido` int(11) DEFAULT NULL,
  `cod_comissao` int(11) DEFAULT NULL,
  `cod_bancada` int(11) DEFAULT NULL,
  `cod_parlamentar` int(11) DEFAULT NULL,
  `tip_autor` tinyint(4) NOT NULL,
  `nom_autor` varchar(50) DEFAULT NULL,
  `des_cargo` varchar(50) DEFAULT NULL,
  `col_username` varchar(50) DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_autor`),
  KEY `idx_autor_parlam` (`ind_excluido`),
  KEY `idx_autor_comissao` (`ind_excluido`),
  KEY `fk_{7FD7B1C8-5F84-47DE-AE50-3B3A6BF35F45}` (`tip_autor`),
  KEY `fk_{10CB571D-FAFE-467D-98C8-09FD0F00E727}` (`cod_parlamentar`),
  KEY `fk_{68B1E5EA-F216-4197-8A5F-C59497C048A3}` (`cod_comissao`),
  KEY `fk_{A53C2D2C-9AA1-4B5C-90F3-E07953AC519A}` (`cod_partido`),
  FULLTEXT KEY `nom_autor` (`nom_autor`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `autoria`
--

DROP TABLE IF EXISTS `autoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoria` (
  `cod_autor` int(11) NOT NULL,
  `cod_materia` int(11) NOT NULL,
  `ind_primeiro_autor` tinyint(4) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_autor`,`cod_materia`),
  KEY `fk_{C9106F4C-7B01-4BD0-98EF-743B5F9ED8C4}` (`cod_materia`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bancada`
--

DROP TABLE IF EXISTS `bancada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bancada` (
  `cod_bancada` int(11) NOT NULL AUTO_INCREMENT,
  `num_legislatura` int(11) NOT NULL,
  `cod_partido` int(11) DEFAULT NULL,
  `nom_bancada` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `descricao` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dat_criacao` date DEFAULT NULL,
  `dat_extincao` date DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_bancada`),
  KEY `idt_nom_bancada` (`nom_bancada`),
  KEY `idx_cod_bancada` (`ind_excluido`),
  FULLTEXT KEY `nom_bancada` (`nom_bancada`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cargo_bancada`
--

DROP TABLE IF EXISTS `cargo_bancada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo_bancada` (
  `cod_cargo` tinyint(4) NOT NULL AUTO_INCREMENT,
  `des_cargo` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ind_unico` tinyint(4) NOT NULL DEFAULT '0',
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_cargo`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cargo_comissao`
--

DROP TABLE IF EXISTS `cargo_comissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo_comissao` (
  `cod_cargo` tinyint(4) NOT NULL AUTO_INCREMENT,
  `des_cargo` varchar(50) NOT NULL,
  `ind_unico` tinyint(4) NOT NULL DEFAULT '0',
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_cargo`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cargo_mesa`
--

DROP TABLE IF EXISTS `cargo_mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo_mesa` (
  `cod_cargo` tinyint(4) NOT NULL AUTO_INCREMENT,
  `des_cargo` varchar(50) NOT NULL,
  `ind_unico` tinyint(4) NOT NULL DEFAULT '0',
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_cargo`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coligacao`
--

DROP TABLE IF EXISTS `coligacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coligacao` (
  `cod_coligacao` int(11) NOT NULL AUTO_INCREMENT,
  `num_legislatura` int(11) NOT NULL,
  `nom_coligacao` varchar(50) NOT NULL,
  `num_votos_coligacao` int(11) DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_coligacao`),
  KEY `idx_coligacao_legislatura` (`ind_excluido`,`num_legislatura`),
  KEY `fk_{4115EE35-A318-4551-B19B-2C9789D5A186}` (`num_legislatura`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comissao`
--

DROP TABLE IF EXISTS `comissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comissao` (
  `cod_comissao` int(11) NOT NULL AUTO_INCREMENT,
  `tip_comissao` tinyint(4) NOT NULL,
  `nom_comissao` varchar(60) NOT NULL,
  `sgl_comissao` varchar(10) NOT NULL,
  `dat_criacao` date NOT NULL,
  `dat_extincao` date DEFAULT NULL,
  `nom_apelido_temp` varchar(100) DEFAULT NULL,
  `dat_instalacao_temp` date DEFAULT NULL,
  `dat_final_prevista_temp` date DEFAULT NULL,
  `dat_prorrogada_temp` date DEFAULT NULL,
  `dat_fim_comissao` date DEFAULT NULL,
  `nom_secretario` varchar(30) DEFAULT NULL,
  `num_tel_reuniao` varchar(15) DEFAULT NULL,
  `end_secretaria` varchar(100) DEFAULT NULL,
  `num_tel_secretaria` varchar(15) DEFAULT NULL,
  `num_fax_secretaria` varchar(15) DEFAULT NULL,
  `des_agenda_reuniao` varchar(100) DEFAULT NULL,
  `loc_reuniao` varchar(100) DEFAULT NULL,
  `txt_finalidade` text,
  `end_email` varchar(100) DEFAULT NULL,
  `ind_unid_deliberativa` tinyint(4) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_comissao`),
  KEY `idx_comissao_tipo` (`ind_excluido`),
  KEY `idt_comissao_nome` (`nom_comissao`),
  KEY `fk_{356BF991-4D23-4B93-93BF-2DFA60A2582E}` (`tip_comissao`),
  FULLTEXT KEY `nom_comissao` (`nom_comissao`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `composicao_bancada`
--

DROP TABLE IF EXISTS `composicao_bancada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composicao_bancada` (
  `cod_comp_bancada` int(11) NOT NULL AUTO_INCREMENT,
  `cod_parlamentar` int(11) NOT NULL,
  `cod_bancada` int(11) NOT NULL,
  `cod_cargo` tinyint(4) NOT NULL,
  `ind_titular` tinyint(4) NOT NULL,
  `dat_designacao` date NOT NULL,
  `dat_desligamento` date DEFAULT NULL,
  `des_motivo_desligamento` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `obs_composicao` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_comp_bancada`),
  KEY `fk_{F8A64E72-257D-4ABB-B921-85593A247FA9}` (`cod_cargo`),
  KEY `fk_{CC19A3D1-42B2-4156-A6F6-D51A7FED9BCA}` (`cod_bancada`),
  KEY `fk_{C52EA9E4-0190-4559-909D-336460F6F448}` (`cod_parlamentar`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `composicao_coligacao`
--

DROP TABLE IF EXISTS `composicao_coligacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composicao_coligacao` (
  `cod_partido` int(11) NOT NULL,
  `cod_coligacao` int(11) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_partido`,`cod_coligacao`),
  KEY `fk_{8A03037D-09B2-4219-A1AB-660BB5FB3324}` (`cod_coligacao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `composicao_comissao`
--

DROP TABLE IF EXISTS `composicao_comissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composicao_comissao` (
  `cod_comp_comissao` int(11) NOT NULL AUTO_INCREMENT,
  `cod_parlamentar` int(11) NOT NULL,
  `cod_comissao` int(11) NOT NULL,
  `cod_periodo_comp` int(11) NOT NULL,
  `cod_cargo` tinyint(4) NOT NULL,
  `ind_titular` tinyint(4) NOT NULL,
  `dat_designacao` date NOT NULL,
  `dat_desligamento` date DEFAULT NULL,
  `des_motivo_desligamento` varchar(150) DEFAULT NULL,
  `obs_composicao` varchar(150) DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_comp_comissao`),
  KEY `fk_{F8A64E72-257D-4ABB-B921-85593A247FA9}` (`cod_cargo`),
  KEY `fk_{BCEF3616-DB8D-4F2A-ACC0-056F3DE2440B}` (`cod_periodo_comp`),
  KEY `fk_{CC19A3D1-42B2-4156-A6F6-D51A7FED9BCA}` (`cod_comissao`),
  KEY `fk_{C52EA9E4-0190-4559-909D-336460F6F448}` (`cod_parlamentar`)
) ENGINE=MyISAM AUTO_INCREMENT=191 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `composicao_mesa`
--

DROP TABLE IF EXISTS `composicao_mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composicao_mesa` (
  `cod_parlamentar` int(11) NOT NULL,
  `cod_sessao_leg` int(11) NOT NULL,
  `cod_periodo_comp` int(11) NOT NULL,
  `cod_cargo` tinyint(4) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_parlamentar`,`cod_sessao_leg`,`cod_cargo`),
  KEY `fk_{B15DAF29-A146-4581-A1DF-96856DDDA6B0}` (`cod_sessao_leg`),
  KEY `fk_{7AAD6A7F-70B0-43D2-9FD9-906B3C09E9CF}` (`cod_cargo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cronometro_aparte`
--

DROP TABLE IF EXISTS `cronometro_aparte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronometro_aparte` (
  `int_reset` tinyint(4) NOT NULL,
  `int_start` tinyint(4) NOT NULL,
  `int_stop` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cronometro_discurso`
--

DROP TABLE IF EXISTS `cronometro_discurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronometro_discurso` (
  `int_reset` tinyint(4) NOT NULL,
  `int_start` tinyint(4) NOT NULL,
  `int_stop` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cronometro_ordem`
--

DROP TABLE IF EXISTS `cronometro_ordem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronometro_ordem` (
  `int_reset` tinyint(4) NOT NULL,
  `int_start` tinyint(4) NOT NULL,
  `int_stop` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dependente`
--

DROP TABLE IF EXISTS `dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependente` (
  `cod_dependente` int(11) NOT NULL AUTO_INCREMENT,
  `tip_dependente` tinyint(4) NOT NULL,
  `cod_parlamentar` int(11) NOT NULL,
  `nom_dependente` varchar(50) NOT NULL,
  `sex_dependente` char(1) NOT NULL,
  `dat_nascimento` date DEFAULT NULL,
  `num_cpf` varchar(14) DEFAULT NULL,
  `num_rg` varchar(15) DEFAULT NULL,
  `num_tit_eleitor` varchar(15) DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_dependente`),
  KEY `idx_dep_parlam` (`ind_excluido`,`cod_parlamentar`,`tip_dependente`),
  KEY `fk_{D4B97881-CA68-4CC7-8E3E-258E55797AB3}` (`cod_parlamentar`),
  KEY `fk_{5C850E68-A133-4741-B900-FC48FC469A7B}` (`tip_dependente`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `despacho_inicial`
--

DROP TABLE IF EXISTS `despacho_inicial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `despacho_inicial` (
  `cod_materia` int(11) NOT NULL,
  `num_ordem` tinyint(4) unsigned NOT NULL,
  `cod_comissao` int(11) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_materia`,`num_ordem`),
  KEY `idx_despinic_comissao` (`ind_excluido`,`cod_comissao`),
  KEY `fk_{24ED266E-2C4B-4C6C-84F0-57AFC228FACE}` (`cod_comissao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documento_acessorio`
--

DROP TABLE IF EXISTS `documento_acessorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento_acessorio` (
  `cod_documento` int(11) NOT NULL AUTO_INCREMENT,
  `cod_materia` int(11) NOT NULL,
  `tip_documento` int(11) NOT NULL,
  `nom_documento` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dat_documento` date DEFAULT NULL,
  `nom_autor_documento` varchar(50) DEFAULT NULL,
  `txt_ementa` text,
  `txt_observacao` text,
  `txt_indexacao` text,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_documento`),
  KEY `idx_doc_materia` (`ind_excluido`),
  KEY `idx_doc_tipdoc_mat` (`ind_excluido`),
  KEY `fk_{F4F80AA5-442B-49CF-95C6-A5D400BFA666}` (`tip_documento`),
  KEY `fk_{E56B7D01-44A5-4AF1-8D14-EF5BA538BD00}` (`cod_materia`),
  FULLTEXT KEY `txt_indexacao` (`txt_indexacao`)
) ENGINE=MyISAM AUTO_INCREMENT=320 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documento_acessorio_administrativo`
--

DROP TABLE IF EXISTS `documento_acessorio_administrativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento_acessorio_administrativo` (
  `cod_documento_acessorio` int(11) NOT NULL AUTO_INCREMENT,
  `cod_documento` int(11) NOT NULL DEFAULT '0',
  `tip_documento` int(11) NOT NULL DEFAULT '0',
  `nom_documento` varchar(30) NOT NULL DEFAULT '',
  `nom_arquivo` varchar(100) NOT NULL DEFAULT '',
  `dat_documento` date DEFAULT NULL,
  `nom_autor_documento` varchar(50) DEFAULT NULL,
  `txt_assunto` text,
  `txt_indexacao` text,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_documento_acessorio`),
  FULLTEXT KEY `txt_indexacao` (`txt_indexacao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documento_administrativo`
--

DROP TABLE IF EXISTS `documento_administrativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento_administrativo` (
  `cod_documento` int(11) NOT NULL AUTO_INCREMENT,
  `tip_documento` tinyint(4) NOT NULL,
  `num_documento` int(11) NOT NULL,
  `ano_documento` smallint(6) NOT NULL DEFAULT '0',
  `dat_documento` date NOT NULL,
  `num_protocolo` int(11) DEFAULT NULL,
  `txt_interessado` varchar(50) DEFAULT NULL,
  `cod_autor` int(11) DEFAULT NULL,
  `num_dias_prazo` tinyint(4) DEFAULT NULL,
  `dat_fim_prazo` date DEFAULT NULL,
  `ind_tramitacao` tinyint(4) NOT NULL DEFAULT '0',
  `txt_assunto` text NOT NULL,
  `txt_observacao` text,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_documento`),
  KEY `documento_administrativo_ind1` (`num_documento`,`ano_documento`),
  FULLTEXT KEY `txt_assunto` (`txt_assunto`),
  FULLTEXT KEY `txt_autoria` (`txt_interessado`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emenda`
--

DROP TABLE IF EXISTS `emenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emenda` (
  `cod_emenda` int(11) NOT NULL AUTO_INCREMENT,
  `tip_emenda` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `num_emenda` int(11) NOT NULL,
  `cod_materia` int(11) NOT NULL,
  `num_protocolo` int(11) DEFAULT NULL,
  `dat_apresentacao` date DEFAULT NULL,
  `txt_ementa` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `txt_observacao` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cod_autor` int(11) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_emenda`),
  UNIQUE KEY `idx_numemen_materia` (`num_emenda`,`cod_materia`,`ind_excluido`),
  KEY `idx_cod_materia` (`cod_materia`),
  KEY `idx_cod_autor` (`cod_autor`),
  FULLTEXT KEY `idx_txt_ementa` (`txt_ementa`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `encerramento_presenca`
--

DROP TABLE IF EXISTS `encerramento_presenca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encerramento_presenca` (
  `cod_presenca_encerramento` int(11) NOT NULL AUTO_INCREMENT,
  `cod_sessao_plen` int(11) NOT NULL DEFAULT '0',
  `cod_parlamentar` int(11) NOT NULL,
  `dat_ordem` date NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_presenca_encerramento`),
  UNIQUE KEY `idx_encpres_sessao_plenaria` (`cod_sessao_plen`,`cod_parlamentar`),
  KEY `fk_cod_parlamentar` (`cod_parlamentar`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expediente_materia`
--

DROP TABLE IF EXISTS `expediente_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expediente_materia` (
  `cod_ordem` int(11) NOT NULL AUTO_INCREMENT,
  `cod_sessao_plen` int(11) NOT NULL,
  `cod_materia` int(11) NOT NULL,
  `dat_ordem` date NOT NULL,
  `txt_observacao` text,
  `ind_excluido` tinyint(4) NOT NULL,
  `num_ordem` int(10) unsigned NOT NULL,
  `txt_resultado` text,
  `tip_votacao` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cod_ordem`),
  KEY `fk_{64030C9E-B34B-43F0-BF6E-8905767BA707}` (`cod_materia`),
  KEY `idx_exped_datord` (`dat_ordem`,`ind_excluido`)
) ENGINE=MyISAM AUTO_INCREMENT=849 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expediente_sessao_plenaria`
--

DROP TABLE IF EXISTS `expediente_sessao_plenaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expediente_sessao_plenaria` (
  `cod_sessao_plen` int(11) NOT NULL,
  `cod_expediente` int(11) NOT NULL,
  `txt_expediente` text,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_sessao_plen`,`cod_expediente`),
  KEY `fk_{7E6BF2B4-164F-4DD9-8AB5-5D78B3767037}` (`cod_expediente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filiacao`
--

DROP TABLE IF EXISTS `filiacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filiacao` (
  `dat_filiacao` date NOT NULL,
  `cod_parlamentar` int(11) NOT NULL,
  `cod_partido` int(11) NOT NULL,
  `dat_desfiliacao` date DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`dat_filiacao`,`cod_parlamentar`,`cod_partido`),
  KEY `fk_{E373439A-B5ED-4AAF-AF68-21EB9DFA16D7}` (`cod_partido`),
  KEY `fk_{ABE13037-AD71-4040-A2D3-16FCBABEB27E}` (`cod_parlamentar`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instituicao`
--

DROP TABLE IF EXISTS `instituicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instituicao` (
  `cod_instituicao` int(11) NOT NULL AUTO_INCREMENT,
  `tip_instituicao` tinyint(4) NOT NULL,
  `nom_instituicao` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_instituicao` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `nom_bairro` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cod_localidade` int(11) DEFAULT NULL,
  `num_cep` varchar(9) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_telefone` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_fax` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_web` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom_responsavel` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `des_cargo` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `txt_forma_tratamento` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `txt_observacao` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  `dat_insercao` datetime DEFAULT NULL,
  `txt_user_insercao` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `txt_ip_insercao` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `txt_user_alteracao` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `txt_ip_alteracao` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cod_instituicao`),
  FULLTEXT KEY `idx_nom_instituicao` (`nom_instituicao`),
  FULLTEXT KEY `idx_nom_responsavel` (`nom_responsavel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `legislacao_citada`
--

DROP TABLE IF EXISTS `legislacao_citada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legislacao_citada` (
  `cod_materia` int(11) NOT NULL,
  `cod_norma` int(11) NOT NULL,
  `des_disposicoes` varchar(15) DEFAULT NULL,
  `des_parte` varchar(8) DEFAULT NULL,
  `des_livro` varchar(7) DEFAULT NULL,
  `des_titulo` varchar(7) DEFAULT NULL,
  `des_capitulo` varchar(7) DEFAULT NULL,
  `des_secao` varchar(7) DEFAULT NULL,
  `des_subsecao` varchar(7) DEFAULT NULL,
  `des_artigo` varchar(4) DEFAULT NULL,
  `des_paragrafo` char(3) DEFAULT NULL,
  `des_inciso` varchar(10) DEFAULT NULL,
  `des_alinea` char(3) DEFAULT NULL,
  `des_item` char(3) DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_materia`,`cod_norma`),
  KEY `fk_{7C4DDF94-DF67-4F33-90A0-06A770185844}` (`cod_norma`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `legislatura`
--

DROP TABLE IF EXISTS `legislatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legislatura` (
  `num_legislatura` int(11) NOT NULL,
  `dat_inicio` date NOT NULL,
  `dat_fim` date NOT NULL,
  `dat_eleicao` date NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`num_legislatura`),
  KEY `idx_legislatura_datas` (`dat_inicio`,`ind_excluido`,`dat_fim`,`dat_eleicao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lexml_registro_provedor`
--

DROP TABLE IF EXISTS `lexml_registro_provedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lexml_registro_provedor` (
  `cod_provedor` int(11) NOT NULL AUTO_INCREMENT,
  `id_provedor` int(11) NOT NULL,
  `nom_provedor` varchar(255) NOT NULL,
  `sgl_provedor` varchar(15) NOT NULL,
  `adm_email` varchar(50) DEFAULT NULL,
  `nom_responsavel` varchar(255) DEFAULT NULL,
  `tipo` varchar(50) NOT NULL,
  `id_responsavel` int(11) DEFAULT NULL,
  `xml_provedor` longtext,
  PRIMARY KEY (`cod_provedor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lexml_registro_publicador`
--

DROP TABLE IF EXISTS `lexml_registro_publicador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lexml_registro_publicador` (
  `cod_publicador` int(11) NOT NULL AUTO_INCREMENT,
  `id_publicador` int(11) NOT NULL,
  `nom_publicador` varchar(255) NOT NULL,
  `adm_email` varchar(50) DEFAULT NULL,
  `sigla` varchar(255) DEFAULT NULL,
  `nom_responsavel` varchar(255) DEFAULT NULL,
  `tipo` varchar(50) NOT NULL,
  `id_responsavel` int(11) NOT NULL,
  PRIMARY KEY (`cod_publicador`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `localidade`
--

DROP TABLE IF EXISTS `localidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localidade` (
  `cod_localidade` int(11) NOT NULL DEFAULT '0',
  `nom_localidade` varchar(50) DEFAULT NULL,
  `nom_localidade_pesq` varchar(50) DEFAULT NULL,
  `tip_localidade` char(1) DEFAULT NULL,
  `sgl_uf` char(2) DEFAULT NULL,
  `sgl_regiao` char(2) DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_localidade`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mandato`
--

DROP TABLE IF EXISTS `mandato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mandato` (
  `cod_mandato` int(11) NOT NULL AUTO_INCREMENT,
  `cod_parlamentar` int(11) NOT NULL,
  `tip_afastamento` tinyint(4) DEFAULT NULL,
  `num_legislatura` int(11) NOT NULL,
  `cod_coligacao` int(11) DEFAULT NULL,
  `dat_inicio_mandato` date DEFAULT NULL,
  `tip_causa_fim_mandato` tinyint(4) DEFAULT NULL,
  `dat_fim_mandato` date DEFAULT NULL,
  `num_votos_recebidos` int(11) DEFAULT NULL,
  `dat_expedicao_diploma` date DEFAULT NULL,
  `txt_observacao` text,
  `ind_titular` tinyint(4) NOT NULL DEFAULT '1',
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_mandato`),
  KEY `idx_mandato_legislatura` (`num_legislatura`,`ind_excluido`,`cod_parlamentar`),
  KEY `fk_{EBAC53D4-E181-46D5-AEEB-CF13E42A85CA}` (`cod_coligacao`),
  KEY `fk_{69C8875B-81DD-46AD-9FBE-66F3643D2434}` (`tip_afastamento`),
  KEY `fk_{23A13602-2883-425B-BBF2-829D8DD61C1A}` (`cod_parlamentar`)
) ENGINE=MyISAM AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `materia_apresentada_sessao`
--

DROP TABLE IF EXISTS `materia_apresentada_sessao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materia_apresentada_sessao` (
  `cod_ordem` int(11) NOT NULL AUTO_INCREMENT,
  `cod_sessao_plen` int(11) NOT NULL,
  `cod_materia` int(11) NOT NULL,
  `dat_ordem` date NOT NULL,
  `txt_observacao` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `num_ordem` int(10) unsigned NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_ordem`),
  KEY `fk_cod_materia` (`cod_materia`),
  KEY `idx_apresent_datord` (`dat_ordem`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `materia_assunto`
--

DROP TABLE IF EXISTS `materia_assunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materia_assunto` (
  `cod_assunto` int(11) NOT NULL,
  `cod_materia` int(11) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_assunto`,`cod_materia`),
  KEY `fk_{DD991C81-16BE-4BCD-848E-6311C6838106}` (`cod_materia`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `materia_legislativa`
--

DROP TABLE IF EXISTS `materia_legislativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materia_legislativa` (
  `cod_materia` int(11) NOT NULL AUTO_INCREMENT,
  `tip_id_basica` int(11) NOT NULL,
  `num_protocolo` int(11) DEFAULT NULL,
  `num_ident_basica` int(11) NOT NULL,
  `ano_ident_basica` smallint(6) NOT NULL,
  `dat_apresentacao` date DEFAULT NULL,
  `tip_apresentacao` char(1) DEFAULT NULL,
  `cod_regime_tramitacao` tinyint(4) NOT NULL,
  `dat_publicacao` date DEFAULT NULL,
  `tip_origem_externa` int(11) DEFAULT NULL,
  `num_origem_externa` varchar(5) DEFAULT NULL,
  `ano_origem_externa` smallint(6) DEFAULT NULL,
  `dat_origem_externa` date DEFAULT NULL,
  `cod_local_origem_externa` int(11) DEFAULT NULL,
  `nom_apelido` varchar(50) DEFAULT NULL,
  `num_dias_prazo` tinyint(4) DEFAULT NULL,
  `dat_fim_prazo` date DEFAULT NULL,
  `ind_tramitacao` tinyint(4) NOT NULL,
  `ind_polemica` tinyint(4) DEFAULT NULL,
  `des_objeto` varchar(150) DEFAULT NULL,
  `ind_complementar` tinyint(4) DEFAULT NULL,
  `txt_ementa` text NOT NULL,
  `txt_indexacao` text,
  `txt_observacao` text,
  `cod_situacao` tinyint(4) DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  `txt_resultado` text,
  PRIMARY KEY (`cod_materia`),
  KEY `idx_matleg_ident` (`ind_excluido`,`tip_id_basica`,`ano_ident_basica`,`num_ident_basica`),
  KEY `idx_dat_apresentacao` (`dat_apresentacao`,`ind_excluido`,`tip_id_basica`),
  KEY `idx_matleg_dat_publicacao` (`dat_publicacao`,`ind_excluido`,`tip_id_basica`),
  KEY `tip_id_basica` (`tip_id_basica`),
  KEY `cod_local_origem_externa` (`cod_local_origem_externa`),
  KEY `tip_origem_externa` (`tip_origem_externa`),
  KEY `fk_{527325DF-C597-41FB-8067-05A63C9719CF}` (`cod_regime_tramitacao`),
  FULLTEXT KEY `txt_indexacao` (`txt_indexacao`),
  FULLTEXT KEY `txt_ementa` (`txt_ementa`)
) ENGINE=MyISAM AUTO_INCREMENT=1692 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mesa_sessao_plenaria`
--

DROP TABLE IF EXISTS `mesa_sessao_plenaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesa_sessao_plenaria` (
  `cod_cargo` tinyint(4) NOT NULL,
  `cod_sessao_leg` int(11) NOT NULL,
  `cod_parlamentar` int(11) NOT NULL,
  `cod_sessao_plen` int(11) NOT NULL,
  `ind_excluido` tinyint(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`cod_cargo`,`cod_sessao_leg`,`cod_parlamentar`,`cod_sessao_plen`),
  KEY `fk_{8515F0EE-645A-4173-9644-21EB4BAA0A5F}` (`cod_sessao_leg`),
  KEY `fk_{1A054080-B309-48F8-AA71-74223C0DDC4B}` (`cod_parlamentar`),
  KEY `fk_{66082FB0-63C1-4AE5-9674-4EEBAFE9C8A8}` (`cod_sessao_plen`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nivel_instrucao`
--

DROP TABLE IF EXISTS `nivel_instrucao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivel_instrucao` (
  `cod_nivel_instrucao` tinyint(4) NOT NULL AUTO_INCREMENT,
  `des_nivel_instrucao` varchar(50) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_nivel_instrucao`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `norma_juridica`
--

DROP TABLE IF EXISTS `norma_juridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `norma_juridica` (
  `cod_norma` int(11) NOT NULL AUTO_INCREMENT,
  `tip_norma` tinyint(4) NOT NULL,
  `cod_materia` int(11) DEFAULT NULL,
  `num_norma` int(11) NOT NULL,
  `ano_norma` smallint(6) NOT NULL,
  `tip_esfera_federacao` char(1) NOT NULL,
  `dat_norma` date DEFAULT NULL,
  `dat_publicacao` date DEFAULT NULL,
  `des_veiculo_publicacao` varchar(30) DEFAULT NULL,
  `num_pag_inicio_publ` int(11) DEFAULT NULL,
  `num_pag_fim_publ` int(11) DEFAULT NULL,
  `txt_ementa` text NOT NULL,
  `txt_indexacao` text,
  `txt_observacao` text,
  `ind_complemento` tinyint(4) DEFAULT NULL,
  `cod_assunto` char(16) NOT NULL DEFAULT '1',
  `cod_situacao` tinyint(4) DEFAULT NULL,
  `dat_vigencia` date DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_norma`),
  KEY `idx_nj_tipanonum` (`ind_excluido`,`ano_norma`,`num_norma`),
  KEY `idx_nj_matleg` (`ind_excluido`),
  KEY `fk_{426F88FC-1F92-4E25-B193-4D557EEB6293}` (`cod_materia`),
  KEY `fk_{6FD47544-1761-4534-B9CF-C2E631430922}` (`tip_norma`),
  KEY `idx_nj_assnorm` (`cod_assunto`),
  FULLTEXT KEY `txt_ementa` (`txt_ementa`),
  FULLTEXT KEY `txt_indexacao` (`txt_indexacao`)
) ENGINE=MyISAM AUTO_INCREMENT=3227 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `numeracao`
--

DROP TABLE IF EXISTS `numeracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numeracao` (
  `cod_materia` int(11) NOT NULL,
  `num_ordem` tinyint(4) NOT NULL,
  `tip_materia` int(11) NOT NULL,
  `num_materia` varchar(5) NOT NULL,
  `ano_materia` smallint(6) NOT NULL,
  `dat_materia` date DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_materia`,`num_ordem`),
  KEY `idx_numer_identificacao` (`ind_excluido`,`ano_materia`,`num_materia`,`tip_materia`),
  KEY `fk_{134EAD00-7226-4690-8752-9C0D548799CE}` (`tip_materia`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oradores`
--

DROP TABLE IF EXISTS `oradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oradores` (
  `cod_sessao_plen` int(11) NOT NULL,
  `cod_parlamentar` int(11) NOT NULL,
  `num_ordem` tinyint(4) NOT NULL,
  `url_discurso` varchar(150) DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_sessao_plen`,`cod_parlamentar`),
  KEY `fk_{A63E6611-A33C-4831-976E-64D1DCF51F7D}` (`cod_parlamentar`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oradores_expediente`
--

DROP TABLE IF EXISTS `oradores_expediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oradores_expediente` (
  `cod_sessao_plen` int(11) NOT NULL,
  `cod_parlamentar` int(11) NOT NULL,
  `num_ordem` tinyint(4) NOT NULL,
  `url_discurso` varchar(150) DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_sessao_plen`,`cod_parlamentar`),
  KEY `fk_{A63E6611-A33C-4831-976E-64D1DCF51F7D}` (`cod_parlamentar`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ordem_dia`
--

DROP TABLE IF EXISTS `ordem_dia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_dia` (
  `cod_ordem` int(11) NOT NULL AUTO_INCREMENT,
  `cod_sessao_plen` int(11) NOT NULL,
  `cod_materia` int(11) NOT NULL,
  `dat_ordem` date NOT NULL,
  `txt_observacao` text,
  `ind_excluido` tinyint(4) NOT NULL,
  `num_ordem` int(10) unsigned NOT NULL,
  `txt_resultado` text,
  `tip_votacao` int(11) unsigned NOT NULL,
  `ind_votacao_iniciada` int(4) NOT NULL DEFAULT '0',
  `tip_quorum` int(11) DEFAULT NULL,
  `dat_ultima_votacao` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_ordem`),
  KEY `idx_orddia_datord` (`dat_ordem`,`ind_excluido`),
  KEY `fk_{64030C9E-B34B-43F0-BF6E-8905767BA707}` (`cod_materia`)
) ENGINE=MyISAM AUTO_INCREMENT=451 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER before_ordem_dia_update  BEFORE UPDATE ON ordem_dia FOR EACH ROW BEGIN IF OLD.ind_votacao_iniciada = 1 AND NEW.ind_votacao_iniciada = 0 THEN SET NEW.dat_ultima_votacao = NOW(); END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ordem_dia_presenca`
--

DROP TABLE IF EXISTS `ordem_dia_presenca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_dia_presenca` (
  `cod_presenca_ordem_dia` int(11) NOT NULL AUTO_INCREMENT,
  `cod_sessao_plen` int(11) NOT NULL DEFAULT '0',
  `cod_parlamentar` int(11) NOT NULL,
  `dat_ordem` date NOT NULL,
  `dat_presenca` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cod_ip` varchar(50) NOT NULL,
  `cod_mac` varchar(50) NOT NULL,
  `cod_perfil` varchar(45) NOT NULL DEFAULT 'parlamentar',
  `ind_recontagem` tinyint(4) NOT NULL DEFAULT '0',
  `num_id_quorum` tinyint(4) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_presenca_ordem_dia`),
  KEY `fk_{0E3901A6-6BD1-4409-B003-C7D7E60539E1}` (`cod_parlamentar`),
  KEY `idx_orddiapres_sessao_plenaria` (`cod_sessao_plen`,`cod_parlamentar`)
) ENGINE=MyISAM AUTO_INCREMENT=1525 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orgao`
--

DROP TABLE IF EXISTS `orgao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgao` (
  `cod_orgao` int(11) NOT NULL AUTO_INCREMENT,
  `nom_orgao` varchar(60) NOT NULL,
  `sgl_orgao` varchar(10) NOT NULL,
  `ind_unid_deliberativa` tinyint(4) NOT NULL,
  `end_orgao` varchar(100) DEFAULT NULL,
  `num_tel_orgao` varchar(50) DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_orgao`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `origem`
--

DROP TABLE IF EXISTS `origem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `origem` (
  `cod_origem` int(11) NOT NULL AUTO_INCREMENT,
  `sgl_origem` varchar(10) NOT NULL,
  `nom_origem` varchar(50) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_origem`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parecer`
--

DROP TABLE IF EXISTS `parecer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parecer` (
  `cod_relatoria` int(11) NOT NULL,
  `cod_materia` int(11) NOT NULL,
  `tip_conclusao` char(3) DEFAULT NULL,
  `tip_apresentacao` char(1) NOT NULL,
  `txt_parecer` text,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_relatoria`,`cod_materia`),
  KEY `idx_parecer_materia` (`ind_excluido`,`cod_materia`),
  KEY `fk_{AFF28198-95BD-4AC4-AE37-E02F46C6EEF7}` (`cod_materia`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parlamentar`
--

DROP TABLE IF EXISTS `parlamentar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parlamentar` (
  `cod_parlamentar` int(11) NOT NULL AUTO_INCREMENT,
  `cod_nivel_instrucao` tinyint(4) DEFAULT NULL,
  `tip_situacao_militar` tinyint(4) DEFAULT NULL,
  `nom_completo` varchar(50) NOT NULL,
  `nom_parlamentar` varchar(50) DEFAULT NULL,
  `sex_parlamentar` char(1) NOT NULL,
  `dat_nascimento` date DEFAULT NULL,
  `num_cpf` varchar(14) DEFAULT NULL,
  `num_rg` varchar(15) DEFAULT NULL,
  `num_tit_eleitor` varchar(15) DEFAULT NULL,
  `cod_casa` int(11) NOT NULL,
  `num_gab_parlamentar` varchar(10) DEFAULT NULL,
  `num_tel_parlamentar` varchar(50) DEFAULT NULL,
  `num_fax_parlamentar` varchar(50) DEFAULT NULL,
  `end_residencial` varchar(100) DEFAULT NULL,
  `cod_localidade_resid` int(11) DEFAULT NULL,
  `num_cep_resid` varchar(9) DEFAULT NULL,
  `num_tel_resid` varchar(50) DEFAULT NULL,
  `num_fax_resid` varchar(50) DEFAULT NULL,
  `end_web` varchar(100) DEFAULT NULL,
  `nom_profissao` varchar(50) DEFAULT NULL,
  `end_email` varchar(100) DEFAULT NULL,
  `des_local_atuacao` varchar(100) DEFAULT NULL,
  `ind_ativo` tinyint(4) NOT NULL DEFAULT '1',
  `txt_biografia` text,
  `txt_observacao` text,
  `ind_unid_deliberativa` tinyint(4) NOT NULL,
  `txt_login` varchar(45) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_parlamentar`),
  KEY `ind_parl_ativo` (`ind_ativo`,`ind_excluido`),
  KEY `cod_localidade_resid` (`cod_localidade_resid`),
  KEY `fk_{BDD808DC-F097-4593-8886-EC504D1B59FD}` (`tip_situacao_militar`),
  KEY `fk_{AB9764AE-53C6-4D60-BA78-64A53A2D96E0}` (`cod_nivel_instrucao`),
  FULLTEXT KEY `nom_completo` (`nom_completo`),
  FULLTEXT KEY `nom_parlamentar` (`nom_parlamentar`)
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partido` (
  `cod_partido` int(11) NOT NULL AUTO_INCREMENT,
  `sgl_partido` varchar(9) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom_partido` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dat_criacao` date DEFAULT NULL,
  `dat_extincao` date DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_partido`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partido_old`
--

DROP TABLE IF EXISTS `partido_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partido_old` (
  `cod_partido` int(11) NOT NULL AUTO_INCREMENT,
  `sgl_partido` varchar(9) NOT NULL DEFAULT '',
  `nom_partido` varchar(50) NOT NULL DEFAULT '',
  `dat_criacao` date DEFAULT NULL,
  `dat_extincao` date DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_partido`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `periodo_comp_comissao`
--

DROP TABLE IF EXISTS `periodo_comp_comissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodo_comp_comissao` (
  `cod_periodo_comp` int(11) NOT NULL AUTO_INCREMENT,
  `dat_inicio_periodo` date NOT NULL,
  `dat_fim_periodo` date DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_periodo_comp`),
  KEY `ind_percompcom_datas` (`dat_inicio_periodo`,`dat_fim_periodo`,`ind_excluido`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `periodo_comp_mesa`
--

DROP TABLE IF EXISTS `periodo_comp_mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodo_comp_mesa` (
  `cod_periodo_comp` int(11) NOT NULL AUTO_INCREMENT,
  `num_legislatura` int(11) NOT NULL,
  `dat_inicio_periodo` date NOT NULL,
  `dat_fim_periodo` date NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_periodo_comp`),
  KEY `ind_percompmesa_datas` (`dat_inicio_periodo`,`dat_fim_periodo`,`ind_excluido`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `presenca_endereco`
--

DROP TABLE IF EXISTS `presenca_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presenca_endereco` (
  `cod_presenca_endereco` int(11) NOT NULL AUTO_INCREMENT,
  `txt_mac_address` varchar(45) NOT NULL,
  `txt_ip_address` varchar(45) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_presenca_endereco`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proposicao`
--

DROP TABLE IF EXISTS `proposicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proposicao` (
  `cod_proposicao` int(11) NOT NULL AUTO_INCREMENT,
  `cod_materia` int(11) DEFAULT NULL,
  `cod_autor` int(11) NOT NULL,
  `tip_proposicao` int(11) NOT NULL,
  `dat_envio` datetime NOT NULL,
  `dat_recebimento` datetime DEFAULT NULL,
  `txt_descricao` varchar(400) NOT NULL,
  `cod_mat_ou_doc` int(11) DEFAULT NULL,
  `dat_devolucao` datetime DEFAULT NULL,
  `txt_justif_devolucao` varchar(200) DEFAULT NULL,
  `txt_observacao` text,
  `num_proposicao` int(11) DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_proposicao`),
  KEY `idx_prop_autor` (`ind_excluido`,`dat_envio`,`dat_recebimento`),
  KEY `fk_{D39DD456-C780-43C2-A7FA-3DD7446D2E95}` (`tip_proposicao`),
  KEY `fk_{C0D47C05-5531-45DC-A73F-0E8BDE53E654}` (`cod_autor`),
  KEY `fk_{30C6320C-F250-4420-AA14-CAFA39FE099D}` (`cod_materia`)
) ENGINE=MyISAM AUTO_INCREMENT=1127 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `props_painel`
--

DROP TABLE IF EXISTS `props_painel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `props_painel` (
  `cod_props_painel` int(11) NOT NULL,
  `txt_jornal` text,
  `txt_jornal_cor` varchar(45) DEFAULT NULL,
  `txt_jornal_fonte` varchar(5) DEFAULT NULL,
  `txt_mensagem` text,
  `txt_mensagem_fonte` varchar(5) DEFAULT NULL,
  `txt_fonte` varchar(45) NOT NULL,
  `txt_painel_cor_fonte` varchar(45) NOT NULL,
  `txt_painel_cor_fundo` varchar(45) NOT NULL,
  `txt_apartante_cor` varchar(45) DEFAULT NULL,
  `txt_apartante_tempo` varchar(45) DEFAULT NULL,
  `txt_apartante_fonte` varchar(5) DEFAULT NULL,
  `txt_questao_ordem_cor` varchar(45) DEFAULT NULL,
  `txt_questao_ordem_tempo` varchar(45) DEFAULT NULL,
  `txt_questao_ordem_fonte` varchar(5) DEFAULT NULL,
  `txt_orador_cor` varchar(45) DEFAULT NULL,
  `txt_orador_tempo` varchar(45) DEFAULT NULL,
  `txt_orador_fonte` varchar(5) DEFAULT NULL,
  `txt_mesa_cor` varchar(45) DEFAULT NULL,
  `txt_mesa_fonte` varchar(5) DEFAULT NULL,
  `txt_presenca_cor` varchar(45) DEFAULT NULL,
  `txt_presenca_fonte` varchar(5) DEFAULT NULL,
  `txt_ausencia_cor` varchar(45) DEFAULT NULL,
  `txt_ausencia_fonte` varchar(5) DEFAULT NULL,
  `txt_presenca_total_cor` varchar(45) DEFAULT NULL,
  `txt_presenca_total_fonte` varchar(5) DEFAULT NULL,
  `txt_ausencia_total_cor` varchar(45) DEFAULT NULL,
  `txt_ausencia_total_fonte` varchar(5) DEFAULT NULL,
  `txt_total_sim_cor` varchar(45) DEFAULT NULL,
  `txt_total_sim_fonte` varchar(5) DEFAULT NULL,
  `txt_total_nao_cor` varchar(45) DEFAULT NULL,
  `txt_total_nao_fonte` varchar(5) DEFAULT NULL,
  `txt_total_abstencao_cor` varchar(45) DEFAULT NULL,
  `txt_total_abstencao_fonte` varchar(5) DEFAULT NULL,
  `txt_total_nao_votou_cor` varchar(45) DEFAULT NULL,
  `txt_total_nao_votou_fonte` varchar(5) DEFAULT NULL,
  `txt_total_votos_cor` varchar(45) DEFAULT NULL,
  `txt_total_votos_fonte` varchar(5) DEFAULT NULL,
  `txt_total_presentes_cor` varchar(45) DEFAULT NULL,
  `txt_total_presentes_fonte` varchar(5) DEFAULT NULL,
  `txt_total_ausentes_cor` varchar(45) DEFAULT NULL,
  `txt_total_ausentes_fonte` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`cod_props_painel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `protocolo`
--

DROP TABLE IF EXISTS `protocolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protocolo` (
  `cod_protocolo` int(7) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `num_protocolo` int(7) unsigned zerofill DEFAULT NULL,
  `ano_protocolo` smallint(6) NOT NULL,
  `dat_protocolo` date NOT NULL,
  `hor_protocolo` time NOT NULL DEFAULT '00:00:00',
  `dat_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tip_protocolo` int(4) NOT NULL,
  `tip_processo` int(4) NOT NULL,
  `txt_interessado` varchar(60) DEFAULT NULL,
  `cod_autor` int(11) DEFAULT NULL,
  `txt_assunto_ementa` text,
  `tip_documento` int(11) DEFAULT NULL,
  `tip_materia` int(11) DEFAULT NULL,
  `num_paginas` int(6) DEFAULT NULL,
  `txt_observacao` text,
  `ind_anulado` tinyint(4) NOT NULL DEFAULT '0',
  `txt_user_anulacao` varchar(20) DEFAULT NULL,
  `txt_ip_anulacao` varchar(15) DEFAULT NULL,
  `txt_just_anulacao` varchar(60) DEFAULT NULL,
  `timestamp_anulacao` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_protocolo`),
  KEY `idx_num_protocolo` (`cod_protocolo`,`ano_protocolo`),
  FULLTEXT KEY `txt_assunto_ementa` (`txt_assunto_ementa`),
  FULLTEXT KEY `txt_interessado` (`txt_interessado`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regime_tramitacao`
--

DROP TABLE IF EXISTS `regime_tramitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regime_tramitacao` (
  `cod_regime_tramitacao` tinyint(4) NOT NULL AUTO_INCREMENT,
  `des_regime_tramitacao` varchar(50) NOT NULL DEFAULT '',
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_regime_tramitacao`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registro_presenca_ordem`
--

DROP TABLE IF EXISTS `registro_presenca_ordem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_presenca_ordem` (
  `cod_registro_pre` int(11) NOT NULL AUTO_INCREMENT,
  `cod_sessao_plen` int(11) NOT NULL,
  `num_id_quorum` tinyint(4) NOT NULL,
  `ind_status_pre` tinyint(1) NOT NULL DEFAULT '1',
  `dat_abre_pre` datetime NOT NULL,
  `dat_fecha_pre` datetime NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_registro_pre`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registro_presenca_sessao`
--

DROP TABLE IF EXISTS `registro_presenca_sessao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_presenca_sessao` (
  `cod_registro_pre` int(11) NOT NULL AUTO_INCREMENT,
  `cod_sessao_plen` int(11) NOT NULL,
  `num_id_quorum` tinyint(4) NOT NULL,
  `ind_status_pre` tinyint(1) NOT NULL DEFAULT '1',
  `dat_abre_pre` datetime NOT NULL,
  `dat_fecha_pre` datetime NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_registro_pre`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registro_votacao`
--

DROP TABLE IF EXISTS `registro_votacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_votacao` (
  `cod_votacao` int(11) NOT NULL AUTO_INCREMENT,
  `tip_resultado_votacao` int(10) unsigned NOT NULL,
  `cod_materia` int(11) NOT NULL,
  `cod_ordem` int(11) NOT NULL,
  `cod_emenda` int(11) DEFAULT NULL,
  `cod_subemenda` int(11) DEFAULT NULL,
  `cod_substitutivo` int(11) DEFAULT NULL,
  `num_votos_sim` tinyint(4) unsigned NOT NULL,
  `num_votos_nao` tinyint(4) unsigned NOT NULL,
  `num_abstencao` tinyint(4) unsigned NOT NULL,
  `txt_observacao` text,
  `ind_excluido` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`cod_votacao`),
  KEY `fk_{70A39BB5-1A1F-4A39-A420-60F127A58F27}` (`cod_ordem`),
  KEY `fk_{32117E29-146C-4C59-A7DA-23DE5E48C69D}` (`cod_materia`),
  KEY `fk_{5BE62220-4750-4C6B-91FC-F1007F222354}` (`tip_resultado_votacao`)
) ENGINE=MyISAM AUTO_INCREMENT=434 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registro_votacao_parlamentar`
--

DROP TABLE IF EXISTS `registro_votacao_parlamentar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_votacao_parlamentar` (
  `cod_votacao` int(11) NOT NULL,
  `cod_parlamentar` int(11) NOT NULL,
  `ind_excluido` tinyint(4) unsigned NOT NULL,
  `vot_parlamentar` varchar(10) NOT NULL,
  PRIMARY KEY (`cod_votacao`,`cod_parlamentar`),
  KEY `fk_{3522BEA8-E908-455C-A2DF-EE3AB2E9527F}` (`cod_parlamentar`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relatoria`
--

DROP TABLE IF EXISTS `relatoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relatoria` (
  `cod_relatoria` int(11) NOT NULL AUTO_INCREMENT,
  `cod_materia` int(11) NOT NULL,
  `cod_parlamentar` int(11) NOT NULL,
  `tip_fim_relatoria` tinyint(4) DEFAULT NULL,
  `cod_comissao` int(11) DEFAULT NULL,
  `dat_desig_relator` date NOT NULL,
  `dat_destit_relator` date DEFAULT NULL,
  `tip_apresentacao` char(1) DEFAULT NULL,
  `txt_parecer` text,
  `tip_conclusao` char(1) DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_relatoria`),
  KEY `idx_relat_materia` (`ind_excluido`,`cod_materia`,`cod_parlamentar`),
  KEY `fk_{F7F8B115-DDB4-4F33-B4FF-7263331E1501}` (`cod_comissao`),
  KEY `fk_{2663F1EB-C0C4-4BA3-9653-0A5EF5679F90}` (`tip_fim_relatoria`),
  KEY `fk_{FE49AA7B-8152-4FEC-9E7D-584756D0B3F4}` (`cod_parlamentar`),
  KEY `fk_{600D5A3E-C3BF-4501-8763-C4C6D11635F0}` (`cod_materia`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reuniao_comissao`
--

DROP TABLE IF EXISTS `reuniao_comissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reuniao_comissao` (
  `cod_reuniao` int(11) NOT NULL AUTO_INCREMENT,
  `cod_comissao` int(11) NOT NULL,
  `num_reuniao` int(11) NOT NULL,
  `dat_inicio_reuniao` date NOT NULL,
  `hr_inicio_reuniao` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `txt_observacao` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_reuniao`),
  KEY `fk_cod_comissao` (`cod_comissao`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessao_legislativa`
--

DROP TABLE IF EXISTS `sessao_legislativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessao_legislativa` (
  `cod_sessao_leg` int(11) NOT NULL AUTO_INCREMENT,
  `num_legislatura` int(11) NOT NULL,
  `num_sessao_leg` tinyint(4) NOT NULL,
  `tip_sessao_leg` char(1) NOT NULL,
  `dat_inicio` date NOT NULL,
  `dat_fim` date NOT NULL,
  `dat_inicio_intervalo` date DEFAULT NULL,
  `dat_fim_intervalo` date DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_sessao_leg`),
  KEY `idx_sessleg_datas` (`dat_inicio`,`ind_excluido`,`dat_fim`,`dat_inicio_intervalo`,`dat_fim_intervalo`),
  KEY `idx_sessleg_legislatura` (`ind_excluido`,`num_legislatura`),
  KEY `fk_{95492094-75C0-4662-8E8C-C6A42DED04D6}` (`num_legislatura`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessao_plenaria`
--

DROP TABLE IF EXISTS `sessao_plenaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessao_plenaria` (
  `cod_sessao_plen` int(11) NOT NULL AUTO_INCREMENT,
  `cod_andamento_sessao` int(11) DEFAULT NULL,
  `tip_sessao` tinyint(4) NOT NULL,
  `cod_sessao_leg` int(11) NOT NULL,
  `num_legislatura` int(11) NOT NULL,
  `tip_expediente` varchar(10) NOT NULL,
  `dat_inicio_sessao` date NOT NULL,
  `dia_sessao` varchar(15) NOT NULL,
  `hr_inicio_sessao` varchar(5) NOT NULL,
  `hr_fim_sessao` varchar(5) DEFAULT NULL,
  `num_sessao_plen` int(11) unsigned NOT NULL,
  `dat_fim_sessao` date DEFAULT NULL,
  `url_audio` varchar(150) DEFAULT NULL,
  `url_video` varchar(150) DEFAULT NULL,
  `ind_iniciada` tinyint(4) DEFAULT '0',
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_sessao_plen`),
  KEY `fk_{B66AB9CE-C220-4D54-A8FF-9CA3E3DDB740}` (`cod_sessao_leg`),
  KEY `fk_{039D36D8-2672-497E-9DA8-0CD4C69B678E}` (`tip_sessao`),
  KEY `fk_{6729818C-6E9B-4F54-8AFD-D43E610D2345}` (`cod_andamento_sessao`)
) ENGINE=MyISAM AUTO_INCREMENT=251 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessao_plenaria_log`
--

DROP TABLE IF EXISTS `sessao_plenaria_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessao_plenaria_log` (
  `cod_sessao_plen_log` int(11) NOT NULL AUTO_INCREMENT,
  `cod_sessao_plen` int(11) DEFAULT NULL,
  `txt_login` varchar(45) NOT NULL,
  `txt_ip` varchar(45) NOT NULL,
  `txt_mac` varchar(45) NOT NULL,
  `txt_acao` varchar(45) NOT NULL,
  `txt_mensagem` varchar(500) NOT NULL,
  `dat_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_sessao_plen_log`)
) ENGINE=MyISAM AUTO_INCREMENT=574 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessao_plenaria_presenca`
--

DROP TABLE IF EXISTS `sessao_plenaria_presenca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessao_plenaria_presenca` (
  `cod_presenca_sessao` int(11) NOT NULL AUTO_INCREMENT,
  `cod_sessao_plen` int(11) NOT NULL,
  `cod_parlamentar` int(11) NOT NULL,
  `dat_sessao` date DEFAULT NULL,
  `dat_presenca` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cod_ip` varchar(50) NOT NULL,
  `cod_mac` varchar(50) NOT NULL,
  `cod_perfil` varchar(20) NOT NULL DEFAULT 'parlamentar',
  `ind_recontagem` tinyint(4) NOT NULL DEFAULT '0',
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_presenca_sessao`),
  KEY `fk_{DC33E098-6E15-45BD-B505-78B0A05562F8}` (`cod_parlamentar`),
  KEY `idx_pres_sessao_plenaria` (`cod_sessao_plen`,`cod_parlamentar`)
) ENGINE=MyISAM AUTO_INCREMENT=2219 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status_tramitacao`
--

DROP TABLE IF EXISTS `status_tramitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_tramitacao` (
  `cod_status` int(11) NOT NULL AUTO_INCREMENT,
  `sgl_status` varchar(10) NOT NULL DEFAULT '',
  `des_status` varchar(60) NOT NULL DEFAULT '',
  `ind_fim_tramitacao` tinyint(4) NOT NULL DEFAULT '0',
  `ind_retorno_tramitacao` tinyint(4) NOT NULL DEFAULT '0',
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_status`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status_tramitacao_administrativo`
--

DROP TABLE IF EXISTS `status_tramitacao_administrativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_tramitacao_administrativo` (
  `cod_status` int(11) NOT NULL AUTO_INCREMENT,
  `sgl_status` varchar(10) NOT NULL DEFAULT '',
  `des_status` varchar(60) NOT NULL DEFAULT '',
  `ind_fim_tramitacao` tinyint(4) NOT NULL DEFAULT '0',
  `ind_retorno_tramitacao` tinyint(4) NOT NULL DEFAULT '0',
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subemenda`
--

DROP TABLE IF EXISTS `subemenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subemenda` (
  `cod_subemenda` int(11) NOT NULL AUTO_INCREMENT,
  `tip_subemenda` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `num_subemenda` int(11) NOT NULL,
  `cod_emenda` int(11) NOT NULL,
  `num_protocolo` int(11) DEFAULT NULL,
  `dat_apresentacao` date DEFAULT NULL,
  `txt_ementa` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `txt_observacao` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cod_autor` int(11) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_subemenda`),
  UNIQUE KEY `idx_numsub_emenda` (`num_subemenda`,`cod_emenda`,`ind_excluido`),
  KEY `idx_cod_autor` (`cod_autor`),
  KEY `idx_cod_emenda` (`cod_emenda`),
  FULLTEXT KEY `idx_txt_ementa` (`txt_ementa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `substitutivo`
--

DROP TABLE IF EXISTS `substitutivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `substitutivo` (
  `cod_substitutivo` int(11) NOT NULL AUTO_INCREMENT,
  `num_substitutivo` int(11) NOT NULL,
  `cod_materia` int(11) NOT NULL,
  `num_protocolo` int(11) DEFAULT NULL,
  `dat_apresentacao` date DEFAULT NULL,
  `txt_ementa` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `txt_observacao` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cod_autor` int(11) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_substitutivo`),
  UNIQUE KEY `idx_numsub_materia` (`num_substitutivo`,`cod_materia`,`ind_excluido`),
  KEY `idx_cod_autor` (`cod_autor`),
  KEY `idx_cod_materia` (`cod_materia`),
  FULLTEXT KEY `idx_txt_ementa` (`txt_ementa`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_afastamento`
--

DROP TABLE IF EXISTS `tipo_afastamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_afastamento` (
  `tip_afastamento` tinyint(4) NOT NULL AUTO_INCREMENT,
  `des_afastamento` varchar(50) NOT NULL,
  `ind_afastamento` tinyint(4) NOT NULL,
  `ind_fim_mandato` tinyint(4) NOT NULL,
  `des_dispositivo` varchar(50) DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`tip_afastamento`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_autor`
--

DROP TABLE IF EXISTS `tipo_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_autor` (
  `tip_autor` tinyint(4) NOT NULL,
  `des_tipo_autor` varchar(50) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`tip_autor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_comissao`
--

DROP TABLE IF EXISTS `tipo_comissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_comissao` (
  `tip_comissao` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nom_tipo_comissao` varchar(50) NOT NULL,
  `sgl_natureza_comissao` char(1) NOT NULL,
  `sgl_tipo_comissao` varchar(10) NOT NULL,
  `des_dispositivo_regimental` varchar(50) DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`tip_comissao`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_dependente`
--

DROP TABLE IF EXISTS `tipo_dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_dependente` (
  `tip_dependente` tinyint(4) NOT NULL AUTO_INCREMENT,
  `des_tipo_dependente` varchar(50) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`tip_dependente`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_documento` (
  `tip_documento` int(11) NOT NULL AUTO_INCREMENT,
  `des_tipo_documento` varchar(50) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`tip_documento`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_documento_administrativo`
--

DROP TABLE IF EXISTS `tipo_documento_administrativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_documento_administrativo` (
  `tip_documento` int(11) NOT NULL AUTO_INCREMENT,
  `sgl_tipo_documento` varchar(5) NOT NULL DEFAULT '',
  `des_tipo_documento` varchar(50) NOT NULL DEFAULT '',
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tip_documento`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_expediente`
--

DROP TABLE IF EXISTS `tipo_expediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_expediente` (
  `cod_expediente` int(11) NOT NULL AUTO_INCREMENT,
  `nom_expediente` varchar(100) NOT NULL,
  `ind_excluido` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`cod_expediente`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_fim_relatoria`
--

DROP TABLE IF EXISTS `tipo_fim_relatoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_fim_relatoria` (
  `tip_fim_relatoria` tinyint(4) NOT NULL AUTO_INCREMENT,
  `des_fim_relatoria` varchar(50) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`tip_fim_relatoria`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_instituicao`
--

DROP TABLE IF EXISTS `tipo_instituicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_instituicao` (
  `tip_instituicao` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nom_tipo_instituicao` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tip_instituicao`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_materia_legislativa`
--

DROP TABLE IF EXISTS `tipo_materia_legislativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_materia_legislativa` (
  `tip_materia` int(11) NOT NULL AUTO_INCREMENT,
  `sgl_tipo_materia` varchar(5) NOT NULL,
  `des_tipo_materia` varchar(50) NOT NULL,
  `ind_num_automatica` tinyint(4) NOT NULL DEFAULT '0',
  `quorum_minimo_votacao` tinyint(4) NOT NULL DEFAULT '1',
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`tip_materia`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_norma_juridica`
--

DROP TABLE IF EXISTS `tipo_norma_juridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_norma_juridica` (
  `tip_norma` tinyint(4) NOT NULL AUTO_INCREMENT,
  `voc_lexml` varchar(50) DEFAULT NULL,
  `sgl_tipo_norma` char(3) NOT NULL,
  `des_tipo_norma` varchar(50) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`tip_norma`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_proposicao`
--

DROP TABLE IF EXISTS `tipo_proposicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_proposicao` (
  `tip_proposicao` int(11) NOT NULL AUTO_INCREMENT,
  `des_tipo_proposicao` varchar(50) NOT NULL,
  `ind_mat_ou_doc` char(1) NOT NULL,
  `tip_mat_ou_doc` int(11) NOT NULL,
  `nom_modelo` varchar(50) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`tip_proposicao`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_resultado_votacao`
--

DROP TABLE IF EXISTS `tipo_resultado_votacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_resultado_votacao` (
  `tip_resultado_votacao` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom_resultado` varchar(100) NOT NULL,
  `ind_excluido` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`tip_resultado_votacao`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_sessao_plenaria`
--

DROP TABLE IF EXISTS `tipo_sessao_plenaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_sessao_plenaria` (
  `tip_sessao` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nom_sessao` varchar(30) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  `num_minimo` int(11) NOT NULL,
  PRIMARY KEY (`tip_sessao`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_situacao_materia`
--

DROP TABLE IF EXISTS `tipo_situacao_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_situacao_materia` (
  `tip_situacao_materia` int(11) NOT NULL AUTO_INCREMENT,
  `des_tipo_situacao` varchar(100) DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tip_situacao_materia`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_situacao_militar`
--

DROP TABLE IF EXISTS `tipo_situacao_militar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_situacao_militar` (
  `tip_situacao_militar` tinyint(4) NOT NULL,
  `des_tipo_situacao` varchar(50) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`tip_situacao_militar`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_situacao_norma`
--

DROP TABLE IF EXISTS `tipo_situacao_norma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_situacao_norma` (
  `tip_situacao_norma` int(11) NOT NULL AUTO_INCREMENT,
  `des_tipo_situacao` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tip_situacao_norma`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tramitacao`
--

DROP TABLE IF EXISTS `tramitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tramitacao` (
  `cod_tramitacao` int(11) NOT NULL AUTO_INCREMENT,
  `cod_status` int(11) DEFAULT NULL,
  `cod_materia` int(11) NOT NULL,
  `dat_tramitacao` date DEFAULT NULL,
  `cod_unid_tram_local` int(11) DEFAULT NULL,
  `dat_encaminha` date DEFAULT NULL,
  `cod_unid_tram_dest` int(11) DEFAULT NULL,
  `ind_ult_tramitacao` tinyint(4) NOT NULL,
  `ind_urgencia` tinyint(4) NOT NULL,
  `sgl_turno` char(1) DEFAULT NULL,
  `txt_tramitacao` text,
  `dat_fim_prazo` date DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_tramitacao`),
  KEY `idx_tramit_ultmat` (`ind_excluido`,`ind_ult_tramitacao`,`dat_tramitacao`,`cod_materia`),
  KEY `fk_{148E953C-B4DE-4414-8F07-411C22E026D5}` (`cod_unid_tram_local`),
  KEY `fk_{31E2B1CA-1382-42D0-895C-3DA1D638C381}` (`cod_unid_tram_dest`),
  KEY `fk_{5435E2E4-A74E-4162-BDE6-59274FC44EE4}` (`cod_materia`),
  KEY `fk_{E7ED48B8-D1B6-4776-B464-CD1E379B1AA1}` (`cod_status`)
) ENGINE=MyISAM AUTO_INCREMENT=7396 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tramitacao_administrativo`
--

DROP TABLE IF EXISTS `tramitacao_administrativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tramitacao_administrativo` (
  `cod_tramitacao` int(11) NOT NULL AUTO_INCREMENT,
  `cod_documento` int(11) NOT NULL DEFAULT '0',
  `dat_tramitacao` date DEFAULT NULL,
  `cod_unid_tram_local` int(11) DEFAULT NULL,
  `dat_encaminha` date DEFAULT NULL,
  `cod_unid_tram_dest` int(11) DEFAULT NULL,
  `cod_status` int(11) DEFAULT NULL,
  `ind_ult_tramitacao` tinyint(4) NOT NULL DEFAULT '0',
  `txt_tramitacao` text,
  `dat_fim_prazo` date DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_tramitacao`),
  KEY `tramitacao_ind1` (`ind_ult_tramitacao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unidade_tramitacao`
--

DROP TABLE IF EXISTS `unidade_tramitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidade_tramitacao` (
  `cod_unid_tramitacao` int(11) NOT NULL AUTO_INCREMENT,
  `cod_comissao` int(11) DEFAULT NULL,
  `cod_orgao` int(11) DEFAULT NULL,
  `cod_parlamentar` int(11) DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_unid_tramitacao`),
  KEY `idx_unidtramit_orgao` (`ind_excluido`,`cod_orgao`),
  KEY `idx_unidtramit_comissao` (`ind_excluido`,`cod_comissao`),
  KEY `idx_unidtramit_parlamentar` (`ind_excluido`,`cod_parlamentar`),
  KEY `fk_{1B76CB09-36AB-4486-BCC2-135089FF327A}` (`cod_orgao`),
  KEY `fk_{DC1969CD-6502-4AB8-959F-707C05F438D4}` (`cod_comissao`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vinculo_norma_juridica`
--

DROP TABLE IF EXISTS `vinculo_norma_juridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vinculo_norma_juridica` (
  `cod_vinculo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_norma_referente` int(11) NOT NULL,
  `cod_norma_referida` int(11) NOT NULL,
  `tip_vinculo` char(1) DEFAULT NULL,
  `ind_excluido` char(1) NOT NULL,
  PRIMARY KEY (`cod_vinculo`),
  KEY `idx_vnj_norma_referente` (`cod_norma_referente`,`ind_excluido`,`cod_norma_referida`),
  KEY `idx_vnj_norma_referida` (`cod_norma_referida`,`ind_excluido`,`cod_norma_referente`)
) ENGINE=MyISAM AUTO_INCREMENT=813 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-22 12:35:23

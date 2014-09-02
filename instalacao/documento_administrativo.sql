DROP TABLE IF EXISTS `acomp_materia`;
CREATE TABLE `acomp_materia` (
  `cod_cadastro` int(11) NOT NULL AUTO_INCREMENT,
  `cod_materia` int(11) NOT NULL,
  `end_email` varchar(100) NOT NULL,
  `txt_hash` varchar(8) NOT NULL,
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_cadastro`),
  UNIQUE KEY `fk_{CCECA63D-5992-437B-BCD3-D7C98DA3E926}` (`cod_materia`,`end_email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 PACK_KEYS=0 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `documento_acessorio_administrativo` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `documento_administrativo` (
  `cod_documento` int(11) NOT NULL AUTO_INCREMENT,
  `tip_documento` tinyint(4) NOT NULL,
  `num_documento` int(11) NOT NULL,
  `ano_documento` smallint(6) NOT NULL DEFAULT '0',
  `dat_documento` date NOT NULL,
  `num_protocolo` int(11) NULL DEFAULT NULL,
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Estrutura da tabela `oradores_expediente`
--

CREATE TABLE IF NOT EXISTS `oradores_expediente` (
  `cod_sessao_plen` int(11) NOT NULL,
  `cod_parlamentar` int(11) NOT NULL,
  `num_ordem` tinyint(4) NOT NULL,
  `url_discurso` varchar(150) DEFAULT NULL,
  `ind_excluido` tinyint(4) NOT NULL,
  PRIMARY KEY (`cod_sessao_plen`,`cod_parlamentar`),
  KEY `fk_{A63E6611-A33C-4831-976E-64D1DCF51F7D}` (`cod_parlamentar`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 PACK_KEYS=0;

CREATE TABLE IF NOT EXISTS `status_tramitacao_administrativo` (
  `cod_status` int(11) NOT NULL AUTO_INCREMENT,
  `sgl_status` varchar(10) NOT NULL DEFAULT '',
  `des_status` varchar(60) NOT NULL DEFAULT '',
  `ind_fim_tramitacao` tinyint(4) NOT NULL DEFAULT '0',
  `ind_retorno_tramitacao` tinyint(4) NOT NULL DEFAULT '0',
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_status`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 PACK_KEYS=1 AUTO_INCREMENT=3 ;

--
-- Inserindo dados da tabela `status_tramitacao_administrativo`
--

INSERT INTO `status_tramitacao_administrativo` (`cod_status`, `sgl_status`, `des_status`, `ind_fim_tramitacao`, `ind_retorno_tramitacao`, `ind_excluido`) VALUES
(1, 'DEF', 'Deferido', 1, 0, 0),
(2, 'IND', 'Indeferido', 1, 0, 0);

CREATE TABLE IF NOT EXISTS `tipo_documento_administrativo` (
  `tip_documento` int(11) NOT NULL AUTO_INCREMENT,
  `sgl_tipo_documento` varchar(5) NOT NULL DEFAULT '',
  `des_tipo_documento` varchar(50) NOT NULL DEFAULT '',
  `ind_excluido` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tip_documento`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 PACK_KEYS=1 AUTO_INCREMENT=4 ;

--
-- Inserindo dados da tabela `tipo_documento_administrativo`
--

INSERT INTO `tipo_documento_administrativo` (`tip_documento`, `sgl_tipo_documento`, `des_tipo_documento`, `ind_excluido`) VALUES
(1, 'CNV', 'Convite', 0),
(2, 'OFC', 'Oficio', 0),
(3, 'REQ', 'Requerimento', 0);

CREATE TABLE IF NOT EXISTS `tramitacao_administrativo` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 PACK_KEYS=1 AUTO_INCREMENT=1 ;

--
-- Criando a tabela `protocolo`
--

CREATE TABLE IF NOT EXISTS `protocolo` (
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
  `cod_documento` int(11) DEFAULT NULL,
  `cod_materia` int(11) DEFAULT NULL,
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 PACK_KEYS=1;

--
-- Ajustes em tabelas existentes
--

ALTER TABLE  `materia_legislativa` ADD  `num_protocolo` INT( 11 ) NULL DEFAULT NULL AFTER  `tip_id_basica`;

ALTER TABLE  `materia_legislativa` CHANGE  `num_ident_basica`  `num_ident_basica` INT( 11 ) NOT NULL;

ALTER TABLE  `composicao_comissao` CHANGE  `dat_desligamento`  `dat_desligamento` DATE NULL DEFAULT NULL;

ALTER TABLE  `composicao_comissao` CHANGE  `des_motivo_desligamento`  `des_motivo_desligamento` VARCHAR( 150 ) NULL DEFAULT NULL;

ALTER TABLE  `composicao_comissao` CHANGE  `obs_composicao`  `obs_composicao` VARCHAR( 150 ) NULL DEFAULT NULL;

ALTER TABLE `oradores` ADD `url_discurso` VARCHAR( 150 ) NULL DEFAULT NULL AFTER `num_ordem`;

ALTER TABLE `sessao_plenaria` ADD `url_audio` VARCHAR( 150 ) NULL DEFAULT NULL AFTER `dat_fim_sessao`;

ALTER TABLE `sessao_plenaria` ADD `url_video` VARCHAR( 150 ) NULL DEFAULT NULL AFTER `url_audio`;

ALTER TABLE  `oradores_expediente` CHANGE  `url_discurso`  `url_discurso` VARCHAR( 150 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;

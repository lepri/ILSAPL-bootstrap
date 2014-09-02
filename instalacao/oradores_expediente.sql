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


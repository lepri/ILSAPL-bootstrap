ALTER TABLE `oradores` ADD `url_discurso` VARCHAR( 150 ) NULL DEFAULT NULL AFTER `num_ordem`;

ALTER TABLE `sessao_plenaria` ADD `url_audio` VARCHAR( 150 ) NULL DEFAULT NULL AFTER `dat_fim_sessao`;

ALTER TABLE `sessao_plenaria` ADD `url_video` VARCHAR( 150 ) NULL DEFAULT NULL AFTER `url_audio`;

ALTER TABLE  `oradores_expediente` CHANGE  `url_dircurso`  `url_discurso` VARCHAR( 150 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;

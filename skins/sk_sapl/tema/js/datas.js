$(document).ready(function() {
    $('#pesq_basica_form').bootstrapValidator({
        container: 'tooltip',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            dt_apres: {
                validators: {
                    date: {
                        format: 'DD/MM/YYYY',
                        message: 'A data informada é inválida'
                    }
                }
            },

            dt_apres2: {
                validators: {
                    date: {
                        format: 'DD/MM/YYYY',
                        message: 'A data informada é inválida'
                    }
                }
            },

            dt_public: {
                validators: {
                    date: {
                        format: 'DD/MM/YYYY',
                        message: 'A data informada é inválida'
                    }
                }
            },

            dt_public2: {
                validators: {
                    date: {
                        format: 'DD/MM/YYYY',
                        message: 'A data informada é inválida'
                    }
                }
            }
        }
    });

    $('#datepicker1')
        .on('changeDate', function(e) {
            // Validate the date when user change it
            $('#pesq_basica_form').bootstrapValidator('revalidateField', 'dt_apres');
        });
    $('#datepicker2')
        .on('changeDate', function(e) {
            // Validate the date when user change it
            $('#pesq_basica_form').bootstrapValidator('revalidateField', 'dt_apres2');
        });
    $('#datepicker3')
        .on('changeDate', function(e) {
            // Validate the date when user change it
            $('#pesq_basica_form').bootstrapValidator('revalidateField', 'dt_public');
        });
    $('#datepicker4')
        .on('changeDate', function(e) {
            // Validate the date when user change it
            $('#pesq_basica_form').bootstrapValidator('revalidateField', 'dt_public2');
        });
});

$(document).ready(function() {
    $('#form_ata').bootstrapValidator({
        container: 'tooltip',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            txt_dat_inicio: {
                validators: {
                    date: {
                        format: 'DD/MM/YYYY',
                        message: 'A data informada é inválida'
                    }
                }
            },

            txt_dat_fim: {
                validators: {
                    date: {
                        format: 'DD/MM/YYYY',
                        message: 'A data informada é inválida'
                    }
                }
            }
        }
    });

    $('#datepicker1')
        .on('changeDate', function(e) {
            // Validate the date when user change it
            $('#form_ata').bootstrapValidator('revalidateField', 'txt_dat_inicio');
        });
    $('#datepicker2')
        .on('changeDate', function(e) {
            // Validate the date when user change it
            $('#form_ata').bootstrapValidator('revalidateField', 'txt_dat_fim');
        });
});

$(document).ready(function() {
    $('#form_tramitacoes').bootstrapValidator({
        container: 'tooltip',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            txt_dat_inicio_periodo: {
                validators: {
                    date: {
                        format: 'DD/MM/YYYY',
                        message: 'A data informada é inválida'
                    }
                }
            },

            txt_dat_fim_periodo: {
                validators: {
                    date: {
                        format: 'DD/MM/YYYY',
                        message: 'A data informada é inválida'
                    }
                }
            }
        }
    });

    $('#datepicker1')
        .on('changeDate', function(e) {
            // Validate the date when user change it
            $('#form_tramitacoes').bootstrapValidator('revalidateField', 'txt_dat_inicio_periodo');
        });
    $('#datepicker2')
        .on('changeDate', function(e) {
            // Validate the date when user change it
            $('#form_tramitacoes').bootstrapValidator('revalidateField', 'txt_dat_fim_periodo');
        });
});

$(document).ready(function() {
    $('#form_proposicoes').bootstrapValidator({
        container: 'tooltip',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            txt_dat_inicio_periodo: {
                validators: {
                    date: {
                        format: 'DD/MM/YYYY',
                        message: 'A data informada é inválida'
                    }
                }
            },

            txt_dat_fim_periodo: {
                validators: {
                    date: {
                        format: 'DD/MM/YYYY',
                        message: 'A data informada é inválida'
                    }
                }
            }
        }
    });

    $('#datepicker1')
        .on('changeDate', function(e) {
            // Validate the date when user change it
            $('#form_proposicoes').bootstrapValidator('revalidateField', 'dt_apres');
        });
    $('#datepicker2')
        .on('changeDate', function(e) {
            // Validate the date when user change it
            $('#form_proposicoes').bootstrapValidator('revalidateField', 'dt_apres2');
        });
});

$(document).ready(function() {
    $('#comissao_form').bootstrapValidator({
        container: 'tooltip',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            txt_dat_criacao: {
                validators: {
                    date: {
                        format: 'DD/MM/YYYY',
                        message: 'A data informada é inválida'
                    }
                }
            },

            txt_dat_extincao: {
                validators: {
                    date: {
                        format: 'DD/MM/YYYY',
                        message: 'A data informada é inválida'
                    }
                }
            },

            txt_dat_instalacao_temp: {
                validators: {
                    date: {
                        format: 'DD/MM/YYYY',
                        message: 'A data informada é inválida'
                    }
                }
            },

            txt_dat_final_prevista_temp: {
                validators: {
                    date: {
                        format: 'DD/MM/YYYY',
                        message: 'A data informada é inválida'
                    }
                }
            },
            txt_dat_prorrogada_temp: {
                validators: {
                    date: {
                        format: 'DD/MM/YYYY',
                        message: 'A data informada é inválida'
                    }
                }
            },
            txt_dat_fim_comissao: {
                validators: {
                    date: {
                        format: 'DD/MM/YYYY',
                        message: 'A data informada é inválida'
                    }
                }
            }
        }
    });

//    $('#datepicker1')
//        .on('changeDate', function(e) {
//            // Validate the date when user change it
//            $('#comissao_form').bootstrapValidator('revalidateField', 'txt_dat_criacao');
//        });
//    $('#datepicker2')
//        .on('changeDate', function(e) {
//            // Validate the date when user change it
//            $('#comissao_form').bootstrapValidator('revalidateField', 'txt_dat_extincao');
//        });
//    $('#datepicker3')
//        .on('changeDate', function(e) {
//            // Validate the date when user change it
//            $('#comissao_form').bootstrapValidator('revalidateField', 'txt_dat_instalacao_temp');
//        });
//    $('#datepicker4')
//        .on('changeDate', function(e) {
//            // Validate the date when user change it
//            $('#comissao_form').bootstrapValidator('revalidateField', 'txt_dat_final_prevista_temp');
//        });
//
//    $('#datepicker5')
//        .on('changeDate', function(e) {
//            // Validate the date when user change it
//            $('#comissao_form').bootstrapValidator('revalidateField', 'txt_dat_prorrogada_temp');
//        });
//
//    $('#datepicker6')
//        .on('changeDate', function(e) {
//            // Validate the date when user change it
//            $('#comissao_form').bootstrapValidator('revalidateField', 'txt_dat_fim_comissao');
//        });
});

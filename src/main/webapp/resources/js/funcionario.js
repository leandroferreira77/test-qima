camposReadOnly = ['salarioProjetado', 'nivelHierarquico', 'cbo'];
dtDesligamentoChangend = function (event) {
    if (event.target.value) {
        $("#status").val("0");
        $("#modalMotivoDesligamento").modal();
    } else {
        $("#status").val("1");
        $("#dtDesligamento").val("");
    }
    trataCamposCLT();
};

trataCamposCLT = function () {
    statusCampos = $("#tipoContratacao").val() === 'CLT';
    $('#btnAddDependente').attr('disabled', statusCampos);

    $('#status').find('option:not(:selected)').attr('disabled', (statusCampos && $('#status').val() === '1'));
    $('#status').attr('readOnly', (statusCampos && $('#status').val() === '1'));
    $("input,select,textarea").each(function (index) {
        var name = $(this).attr("name");
        if ((name && (!name.match("^complementoFuncionario.*") || name === 'complementoFuncionario.tipoContratacao') && !camposReadOnly.includes($(this).attr('id')))) {
            if ($(this).is('select')) {
                $(this).find('option:not(:selected)').attr('disabled', statusCampos);
                $(this).attr('readOnly', (statusCampos && $('#status').val() === '1'));
            } else if ($(this).attr('type') === 'checkbox') {
                $(this).attr('disabled', statusCampos);
                parent = $(this).parent();
                $('<input type="hidden" value="' + ($(this).is(':checked') ? 1 : 0) + '" name="' + $(this).attr('name') + '" />').appendTo(parent);
            } else {
                $(this).attr("readOnly", statusCampos);
            }
        }
    })
};
categoriaSalarialChanged = function (event) {

    console.log('chamou categoriaSalarialChanged');
    categoriaSal = $('#categoriaSalarial').val();
    if (categoriaSal === '2') {
        $("#salarioProjetado").val($('#salarioProjetado').masked($("#salarioAtual").cleanVal() * 220));
    } else if (categoriaSal === '1') {
        $("#salarioProjetado").val($('#salarioProjetado').masked($("#salarioAtual").cleanVal()));
    } else {
        $("#salarioProjetado").val('R$ 0,00')
    }
    if ($('#cdnFuncionarioAnterior').val()) {
        $("#motivoAlteraSalario").show();
        $("#motivoLogSalario").prop("required", true);
        $("#observacaoSalario").prop("required", true);
    }
};
$(function () {
    $("#codUnidFederacRh").bind('change', function (event) {
        $.post('/municipios/listByEstadoId/' + $("#codUnidFederacRh").val(), function (municipios) {
            $('#nomCidadRh option').remove();
            $('#nomCidadRh').append($('<option></option>').text('').val(''));
            $.each(municipios, function (index, item) {
                $('#nomCidadRh').append($('<option></option>').text(item).val(item));
            })

        });
    });
    salvarAdvertencia = function () {
        showLoading();
        $.post('/funcionarios/addAdvertencia', {
            //String descricao, LocalDate data,Long cdnFuncionario
            descricao: $('#descAdvertencia').val(),
            data: $('#dataAdvertencia').val(),
            cdnFuncionario: $('#cdnFuncionario').val()
        }, function (data) {
            hideLoading();
            $('#descAdvertencia').val('');
            $('#dataAdvertencia').val('');
            advertenciasTable.ajax.reload();
            toastr.success("Advertência registada com sucesso!");
        });
    };
    salvarLogDesligamento = function () {

        if ($('#dtDesligamento').val() == "") {

            toastr.warning("Data Desligamento campo obrigatorio", "Mensagem", {
                allowHtml: true,
                closeButton: true
            });

            return false;
        }

        $.post('/funcionarios/addMotivoDesligamento', {
            //String descricao, LocalDate data,Long cdnFuncionario
            descricao: $('#motivoDesligamento').val(),
            data: $('#dtDesligamento').val(),
            cdnFuncionario: $('#cdnFuncionario').val()
        }, function (data) {
            $('#motivoDesligamento').val('');
            desligamentosTable.ajax.reload();
            toastr.success("Motivo desligamento registrado com sucesso!");
            hideLoading();
        });
    };


    $("#cargo").autocomplete({
        delay: 100,
        source: "/cargo/listCargosLike",
        select: function (event, ui) {
            event.preventDefault();
            cargo = JSON.parse(ui.item.value);
            $("#cdnCargoBasic").val(cargo.cargoPK.cargoBasico.cdnCargoBasic);
            $("#cargo").val(cargo.desCargo);
            $("#nivelHierarquico").val(cargo.hierarquiaCargo.cdnNivHierFuncnal + ' - ' + cargo.hierarquiaCargo.descNivelHierarquico);
            $("#cdnNivelHierarquico").val(cargo.hierarquiaCargo.cdnNivHierFuncnal);
            //$("#desNivelHierarquico").text(cargo.hierarquiaCargo.descNivelHierarquico);
            $("#cbo").val(cargo.cargoPK.cargoBasico.codClassifOcupac);
        }
    });

    $("#chefe").autocomplete({
        delay: 100,
        source: "/funcionarios/listFuncionariosLike",
        select: function (event, ui) {
            event.preventDefault();
            chefe = JSON.parse(ui.item.value);
            $("#complementoFuncionario\\.responsavel\\.cdnFuncionario").val(chefe.cdnFuncionario);
            $("#chefe").val(chefe.pessoaFisica.nomPessoaFisic);
        }
    });
    formataMes = function (curDate) {
        curMonth = curDate.getMonth() + 1;
        curMonth = (curMonth < 10 ? '0' : '') + curMonth;
        return curMonth;
    };
    formataDataYYYMMDD = function (curDate) {
        curYear = curDate.getFullYear();
        curMonth = formataMes(curDate);
        day = '01';
        return curYear + '-' + curMonth + '-' + day;
    };
});
$(document).ready(function () {
    $('#btnSalvarAdvertencia').bind('click', salvarAdvertencia);
    $('#btnSalvarLogDesligamento').bind('click', salvarLogDesligamento);
    $("#dtDesligamento").bind('blur', dtDesligamentoChangend);
    $('#categoriaSalarial').bind('change', categoriaSalarialChanged);
    $('#salarioAtual').bind('change', categoriaSalarialChanged);
    $("#tipoContratacao").bind('change', function (event) {
        trataCamposCLT();
        $("#dtDesligamento").val('');
        //$('#dtAdmissao').val(formataDataYYYMMDD(new Date()));
    });
    $("#cpf").mask('000.000.000-00', {
        reverse: false,
        onComplete: function (cpf) {

            if (validaDigitoVerificadorCPF(cpf)) {
                $.post('/pessoaFisica/checkCpfExistente',
                    {
                        codIdFeder: function () {
                            return $('#cpf').val();
                        }
                    },
                    function (pessoaFisica) {
                        if (pessoaFisica) {
                            if (pessoaFisica.funcionario && pessoaFisica.funcionario.length > 0
                                && pessoaFisica.funcionario.filter(function (e) {
                                    return e.cdnFuncionario !== Number($('#cdnFuncionario').val()) && !e.datDesligtoFunc
                                }).length > 0) {
                                toastr.warning('CPF informado já cadastrado para a matrícula ' + pessoaFisica.funcionario[0].cdnFuncionario);
                                $('#cpf').css('border', '3px solid red');
                                $('#cpf').focus();
                            }
                        } else {
                            $('#cpf').css('border', '');
                        }
                    });
            } else {
                $('#cpf').css('border', '3px solid red');
                toastr.error('Número CPF inválido, por favor verifique.')
            }
        }
    });
    $('#cpf').bind('blur', function (event) {
        if ($('#cpf').attr('readOnly') == null) {
            if (!$('#cpf').val() || $('#cpf').val().length < 11) {
                $('#cpf').css('border', '3px solid red');
                toastr.error('Número CPF inválido, por favor verifique.');
            } else if (validaDigitoVerificadorCPF($('#cpf').val())) {
                $.post('/pessoaFisica/checkCpfExistente',
                    {
                        codIdFeder: function () {
                            return $('#cpf').val();
                        }
                    },
                    function (pessoaFisica) {
                        if (pessoaFisica) {
                            if (pessoaFisica.funcionario && pessoaFisica.funcionario.length > 0
                                && pessoaFisica.funcionario.filter(function (e) {
                                    return e.cdnFuncionario !== Number($('#cdnFuncionario').val()) && !e.datDesligtoFunc
                                }).length > 0) {
                                toastr.warning('CPF informado já cadastrado para a matrícula ' + pessoaFisica.funcionario[0].cdnFuncionario);
                                $('#cpf').css('border', '3px solid red');
                                $('#cpf').focus();
                            } else {
                                $('#cpf').css('border', '');
                            }
                        } else {
                            $('#cpf').css('border', '');
                        }
                    });
            } else {
                $('#cpf').css('border', '');
            }
        }
    });
    $("#salarioAtual").mask('#.##0,00', {reverse: true});
    $("#salarioProjetado").mask('#.##0,00', {reverse: true});
    $("#cep").mask('000000-000', {reverse: true});
    $("#sigla").mask('AAA');
    $("#cdnFuncionario").mask('00000000');
    $("#crachaTemporario").mask('00000000');
    $("#rg").mask('00.000.000-A');
    $("#carteirinha").mask('000000.0000.000000.00-0');
    $("#ctps").mask('AAAAAAAAAA');
    $("#pis").mask('AAAAAAAAAA');
    $("#sinete").mask('00');
    $("#funcionarioForm").submit(function (event) {
        $("#cpf").unmask();
        //$("#salarioAtual").unmask();
        $("#salarioAtual").val($("#salarioAtual").cleanVal() / 100);
        //$("#salarioProjetado").unmask();
        $("#salarioProjetado").val($("#salarioProjetado").cleanVal() / 100);
        $("#cep").unmask();
        $("#sigla").unmask();
        $("#cdnFuncionario").unmask();
        $("#crachaTemporario").unmask();
        $("#rg").unmask();
        $("#carteirinha").unmask();
        $("#ctps").unmask();
        $("#pis").unmask();
        $("#sinete").unmask();
    });
    desligamentosTable = $('#desligamentos').DataTable({
        dom: 'r',
        ajax: {
            url: '/funcionarios/listarMotivosDesligamento?cdnFuncionario=' + $('#cdnFuncionario').val(),
            dataSrc: ''
        },
        columns: [
            {data: 'logDesligamentoPK.data'},
            {data: 'motivo'},
            {data: 'cdnUsuario'}
        ]
    });
    advertenciasTable = $('#advertencias').DataTable({
        dom: 'r',
        ajax: {
            url: '/funcionarios/listarAdvertencias?cdnFuncionario=' + $('#cdnFuncionario').val(),
            dataSrc: ''
        },
        columns: [
            {data: 'data'},
            {data: 'advertencia'},
            {data: 'cdnUsuario'}
        ]
    });
    $(function () {
        $('#foto').fileupload({
            url: '/funcionarios/uploadFoto',
            formData: [{name: 'cdnFuncionario', value: $('#cdnFuncionario').val()}],
            dataType: 'json',
            acceptFileTypes: /(\.)(jpe?g|png)$/i,
            done: function (e, data) {
                if (data.result[0] === 'sucesso') {
                    toastr.success(data.result[1]);
                    $('#foto3_4').attr('src', '/funcionarios/foto?cdnFuncionario=' + $('#cdnFuncionario').val());
                } else {
                    toastr.error(data.result[1]);
                }
            }
        });
        /*$('#foto').on('fileuploaddone', function (e, data) {
            console.log(data);
            console.log(e);

        })*/

    });
    trataCamposCLT();
});

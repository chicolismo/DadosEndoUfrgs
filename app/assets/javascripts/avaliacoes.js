/*jshint devel: true */
/*globals $*/

"use strict";
$(function () {

    var form = $('.new_avaliacao, .edit_avaliacao');

    //=========================================================================
    // Trata de esconder os detalhes dos sintomas
    //=========================================================================
    var sintomas = form.find('.sintomas-opcoes');
    var sintomasDetalhes = form.find('.sintomas-detalhes').hide();
    (function () {
        var input = sintomas.find('input:checked');
        if (input.val() === 'Presentes' || input.val() === 'radio114') {
            sintomasDetalhes.slideDown(200);
        } else {
            sintomasDetalhes.slideUp(200);
        }
    }());
    sintomas.on('change', function () {
        var input = $(this).find('input:checked');

        // TODO: Mudar isto no futuro
        if (input.val() === 'Presentes' || input.val() === 'radio114') {
            sintomasDetalhes.slideDown(200);
        } else {
            sintomasDetalhes.slideUp(200);
        }
    });
    //=========================================================================

    //=========================================================================
    // Trata de esconder os detalhes do histórico de traumatismo
    //=========================================================================
    var traumatismo = form.find('.traumatismo');
    var traumatismoDetalhes = form.find('.traumatismo-detalhes').hide();
    (function () {
        var input = traumatismo.find('input:checked');
        if (input.val() && input.val().toLowerCase() === 'sim') {
            traumatismoDetalhes.slideDown(200);
        } else {
            traumatismoDetalhes.slideUp(200);
        }
    }());
    traumatismo.on('change', function () {
        var input = $(this).find('input:checked');

        // TODO: Mudar isto no futuro
        if (input.val() && input.val().toLowerCase() === 'sim') {
            traumatismoDetalhes.slideDown(200).find('input').eq(0).focus();
        } else {
            traumatismoDetalhes.slideUp(200);
        }
    });
    //=========================================================================

    //=========================================================================
    // Trata de esconder os detalhes dos tratamentos realizados
    //=========================================================================
    var tratamentos = form.find('.tratamentos-realizados');
    // TODO remover
    var tratamentosDetalhes = form.find('.tratamentos-realizados-detalhes').hide();
    (function () {
        var input = tratamentos.find('input:checked');
        if (input.val() && input.val().toLowerCase() === 'sim') {
            tratamentosDetalhes.slideDown(200);
        } else {
            tratamentosDetalhes.slideUp(200);
        }
    }());
    tratamentos.on('change', function () {
        var input = $(this).find('input:checked');

        // TODO: Mudar isto no futuro
        if (input.val() && input.val().toLowerCase() === 'sim') {
            tratamentosDetalhes.slideDown(200);
        } else {
            tratamentosDetalhes.slideUp(200);
        }
    });
    //=========================================================================

    //=========================================================================
    // Trata de esconder os detalhes dos exames clínicos
    //=========================================================================
    var exameClinico = form.find('.exame-clinico');
    exameClinico.each(function () {
        var exame = $(this);
        var input = exame.find('input:checked');
        var next = exame.next();
        var value;
        if (input.length > 0) {
            value = input.val();
        }
        if (input.length === 0 || value === 'ausente' || value === 'não coletado') {
            next.slideUp(200);
        } else {
            next.slideDown(200);
        }
    });
    exameClinico.on('change', function () {
        var input = $(this).find('input:checked');
        var next = $(this).next();
        var value = input.val();
        if (value === 'ausente' || value === 'não coletado') {
            next.slideUp(200);
        } else {
            next.slideDown(200).find('input').eq(0).focus();
        }
    });

    //=========================================================================
    // Trata de esconder os detalhes do material da restauração da coroa
    //=========================================================================
    var coroaMaterial = form.find('.coroa-material');
    coroaMaterial.each(function () {
        var coroa = $(this);
        var input = coroa.find('input:checked');
        var next = coroa.next();
        if (input.length > 0) {
            next.slideDown(200);
        } else {
            next.slideUp(200);
        }
    });
    coroaMaterial.on('change', function () {
        var coroa = $(this);
        var input = coroa.find('input:checked');
        var next = coroa.next();
        if (input.length > 0) {
            next.slideDown(200).find('input').eq(0).focus();
        } else {
            next.slideUp(200);
        }
    });

    //=========================================================================
    // Trata de esconder os detalhes da bolsa periodontal
    //=========================================================================
    var bolsaPeriodontal = form.find('.bolsa-periodontal');
    bolsaPeriodontal.each(function () {
        var bolsa = $(this);
        var input = bolsa.find('input:checked');
        var next = bolsa.next();
        if (input.length > 0) {
            next.slideDown(200);
        } else {
            next.slideUp(200);
        }
    });
    bolsaPeriodontal.on('change', function () {
        var bolsa = $(this);
        var input = bolsa.find('input:checked');
        var next = bolsa.next();
        if (input.length > 0) {
            next.slideDown(200).find('input').eq(0).focus();
        } else {
            next.slideUp(200);
        }
    });
});

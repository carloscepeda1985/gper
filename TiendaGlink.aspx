﻿<%@ Page Language="VB" MasterPageFile="~/MasterGlink.Master" EnableEventValidation="false" AutoEventWireup="false" CodeFile="TiendaGlink.aspx.vb" Inherits="FichaContratista" Title="Glink" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

 <link href="css/sweetalert.css" rel="stylesheet">
 <script src="js/sweetalert.min.js"></script>

    <script type="text/javascript">


        function successalert(rutTienda) {

            swal({
                title: "Los cambios han sido guardados correctamente",
                type: "success",
            },
                function (isConfirm) {
                    if (isConfirm) {
                        location.href = "TiendaGlink.aspx?rut=" + rutTienda;
                    }
                });
        }
        function successalert2() {

            swal({
                title: "La tienda ha sido eliminada correctamente",
                type: "success",
            },
                function (isConfirm) {
                    if (isConfirm) {
                        location.href = "TiendasGlink.aspx";
                    }
                });
        }

        function checkTelefono(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 8) return true;
            patron = /^[0-9-+]+$/;
            te = String.fromCharCode(tecla);
            return patron.test(te);
        }

        function checkTexto(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            //Tecla de retroceso para borrar, siempre la permite
            if (tecla == 8) return true;
            // Patron de entrada, en este caso solo acepta numeros y letras
            patron = /^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/;
            tecla_final = String.fromCharCode(tecla);
            return patron.test(tecla_final);
        }

        function checkRutValidacion(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            //Tecla de retroceso para borrar, siempre la permite
            if (tecla == 8) return true;
            // Patron de entrada, en este caso solo acepta numeros y letras
            patron = /^[0-9-kK]+$/;
            tecla_final = String.fromCharCode(tecla);
            return patron.test(tecla_final);
        }

        function checkCorreo(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            //Tecla de retroceso para borrar, siempre la permite
            if (tecla == 8) return true;
            // Patron de entrada, en este caso solo acepta numeros y letras
            patron = /^[a-zA-Z0-9-@_.]+$/;
            tecla_final = String.fromCharCode(tecla);
            return patron.test(tecla_final);


        }


        function validar_rut(source, arguments) {
            var rut = arguments.Value; suma = 0; mul = 2; i = 0;

            for (i = rut.length - 3; i >= 0; i--) {
                suma = suma + parseInt(rut.charAt(i)) * mul;
                mul = mul == 7 ? 2 : mul + 1;
            }

            var dvr = '' + (11 - suma % 11);
            if (dvr == '10') dvr = 'K'; else if (dvr == '11') dvr = '0';

            if (rut.charAt(rut.length - 2) != "-" || rut.charAt(rut.length - 1).toUpperCase() != dvr)
                arguments.IsValid = false;
            else
                arguments.IsValid = true;
        }

        function checkRut(rut) {

            var valor = rut.value.replace('.', '');
            valor = valor.replace('-', '');

            cuerpo = valor.slice(0, -1);
            dv = valor.slice(-1).toUpperCase();

            rut.value = cuerpo + '-' + dv

        }

    </script>
	


<style>
    .bar {
        list-style-type: none;
        height: 38px;
        background-image: -webkit-linear-gradient(top,#01203c 0,#01203c 0%);
        background-image: linear-gradient(to bottom,#01203c 0,#01203c 0%);
        font-size: 40px;
        font: 26px Tahoma, Verdana, Arial, sans-serif;
        border-radius: 4px;
        margin-bottom: 11px;
    }

    e.letracolor {
        padding-left: 20px;
        color: #fff;
    }
</style>

<style type="text/css">
   /* .btn-sample {
        color: #FFFFFF;
        background-color: #123740;
        border-color: #123740;
    }


        .btn-sample:focus,
        .btn-sample:active,
        .btn-sample.active,
        .open .dropdown-toggle.btn-sample {
            color: #FFFFFF;
            background-color: #0559a2;
            border-color: #0559a2;
        }

    .btn-info {
        color: #FFFFFF;
        background-color: #0559a2;
        border-color: #0559a2;
    }


        .btn-info:focus,
        .btn-info:active,
        .btn-info.active,
        .open .dropdown-toggle.btn-info {
            color: #FFFFFF;
            background-color: #0559a2;
            border-color: #0559a2;
        }



    .btn-primary {
        color: #FFFFFF;
        background-color: #0559a2;
        border-color: #0559a2;
    }


        .btn-primary:focus,
        .btn-primary:active,
        .btn-primary.active,
        .open .dropdown-toggle.btn-primary {
            color: #FFFFFF;
            background-color: #0559a2;
            border-color: #0559a2;
        }



    .btn-warning {
        color: #FFFFFF;
        background-color: #0559a2;
        border-color: #0559a2;
    }


        .btn-warning:focus,
        .btn-warning:active,
        .btn-warning.active,
        .open .dropdown-toggle.btn-warning {
            color: #FFFFFF;
            background-color: #0559a2;
            border-color: #0559a2;
        }



    .btn-danger {
        color: #FFFFFF;
        background-color: #0559a2;
        border-color: #0559a2;
    }


        .btn-danger:focus,
        .btn-danger:active,
        .btn-danger.active,
        .open .dropdown-toggle.btn-danger {
            color: #FFFFFF;
            background-color: #0559a2;
            border-color: #0559a2;
        }




    .btn-success {
        color: #FFFFFF;
        background-color: #0559a2;
        border-color: #0559a2;
    }


        .btn-success:focus,
        .btn-successr:active,
        .btn-success.active,
        .open .dropdown-toggle.btn-success {
            color: #FFFFFF;
            background-color: #0559a2;
            border-color: #0559a2;
        }*/



    .btn-sample:active,
    .btn-sample.active,
    .open .dropdown-toggle.btn-sample {
        background-image: none;
    }

    .btn-sample.disabled,
    .btn-sample[disabled],
    fieldset[disabled] .btn-sample,
    .btn-sample.disabled:focus,
    .btn-sample[disabled]:focus,
    fieldset[disabled] .btn-sample:focus,
    .btn-sample.disabled:active,
    .btn-sample[disabled]:active,
    fieldset[disabled] .btn-sample:active,
    .btn-sample.disabled.active,
    .btn-sample[disabled].active,
    fieldset[disabled] .btn-sample.active {
        color: #FFFFFF;
        background-color: #f4841a;
        border-color: #f4841a;
    }

    .btn-sample .badge {
        color: #FFFFFF;
        background-color: #f4841a;
        border-color: #f4841a;
    }

    .nuevoEstilo1 {
        color: #FFFFFF;
    }

    .nuevoEstilo2 {
        color: #FFFFFF;
    }

    .nuevoEstilo3 {
        color: #FFFFFF;
    }

    .nuevoEstilo4 {
        color: #FFFFFF;
    }

    .nuevoEstilo5 {
        color: #FFFFFF;
        font-weight: bold;
    }

    .nuevoEstilo6 {
        color: #FFFFFF;
    }

    .nuevoEstilo7 {
        color: #FFFFFF;
    }

    .nuevoEstilo8 {
        color: #FFFFFF;
    }



    .align-center, .center {
        text-align: center !important;
    }

    .profile-user-info {
        display: table;
        width: 98%;
        width: calc(100% - 24px);
        margin: 0 auto
    }

    .profile-info-row {
        display: table-row
    }

    .profile-info-name,
    .profile-info-value {
        display: table-cell;
        border-top: 1px dotted #D5E4F1
    }

    .profile-info-name {
        text-align: right;
        padding: 6px 10px 6px 4px;
        font-weight: 400;
        color: #667E99;
        background-color: transparent;
        width: 110px;
        vertical-align: middle
    }

    .profile-info-value {
        padding: 6px 4px 6px 6px
    }

        .profile-info-value > span + span:before {
            display: inline;
            content: ",";
            margin-left: 1px;
            margin-right: 3px;
            color: #666;
            border-bottom: 1px solid #FFF
        }

        .profile-info-value > span + span.editable-container:before {
            display: none
        }

    .profile-info-row:first-child .profile-info-name,
    .profile-info-row:first-child .profile-info-value {
        border-top: none
    }

    .profile-user-info-striped {
        border: 1px solid #DCEBF7
    }

        .profile-user-info-striped .profile-info-name {
            color: #336199;
            background-color: #EDF3F4;
            border-top: 1px solid #F7FBFF
        }

        .profile-user-info-striped .profile-info-value {
            border-top: 1px dotted #DCEBF7;
            padding-left: 12px
        }

    .profile-picture {
        border: 1px solid #CCC;
        background-color: #FFF;
        padding: 4px;
        display: inline-block;
        max-width: 100%;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        box-shadow: 1px 1px 1px rgba(0, 0, 0, .15)
    }

    .dd-empty,
    .dd-handle,
    .dd-placeholder,
    .dd2-content {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box
    }

    .profile-activity {
        padding: 10px 4px;
        border-bottom: 1px dotted #D0D8E0;
        position: relative;
        border-left: 1px dotted #FFF;
        border-right: 1px dotted #FFF
    }

        .profile-activity:first-child {
            border-top: 1px dotted transparent
        }

            .profile-activity:first-child:hover {
                border-top-color: #D0D8E0
            }

        .profile-activity:hover {
            background-color: #F4F9FD;
            border-left: 1px dotted #D0D8E0;
            border-right: 1px dotted #D0D8E0
        }

        .profile-activity img {
            border: 2px solid #C9D6E5;
            border-radius: 100%;
            max-width: 40px;
            margin-right: 10px;
            margin-left: 0;
            box-shadow: none
        }

        .profile-activity .thumbicon {
            background-color: #74ABD7;
            display: inline-block;
            border-radius: 100%;
            width: 38px;
            height: 38px;
            color: #FFF;
            font-size: 18px;
            text-align: center;
            line-height: 38px;
            margin-right: 10px;
            margin-left: 0;
            text-shadow: none !important
        }

        .profile-activity .time {
            display: block;
            margin-top: 4px;
            color: #777
        }

        .profile-activity a.user {
            font-weight: 700;
            color: #9585BF
        }

        .profile-activity .tools {
            position: absolute;
            right: 12px;
            bottom: 8px;
            display: none
        }

        .profile-activity:hover .tools {
            display: block
        }

    .user-profile .ace-thumbnails li {
        border: 1px solid #CCC;
        padding: 3px;
        margin: 6px
    }

        .user-profile .ace-thumbnails li .tools {
            left: 3px;
            right: 3px
        }

        .user-profile .ace-thumbnails li:hover .tools {
            bottom: 3px
        }

    .user-title-label:hover {
        text-decoration: none
    }

    .user-title-label + .dropdown-menu {
        margin-left: -12px
    }

    .profile-contact-links {
        padding: 4px 2px 5px;
        border: 1px solid #E0E2E5;
        background-color: #F8FAFC
    }

    .btn-link:hover .ace-icon {
        text-decoration: none !important
    }

    .profile-social-links > a:hover > .ace-icon,
    .profile-users .memberdiv .name a:hover .ace-icon,
    .profile-users .memberdiv .tools > a:hover {
        text-decoration: none
    }

    .profile-social-links > a {
        text-decoration: none;
        margin: 0 1px
    }

    .profile-skills .progress {
        height: 26px;
        margin-bottom: 2px;
        background-color: transparent
    }

        .profile-skills .progress .progress-bar {
            line-height: 26px;
            font-size: 13px;
            font-weight: 700;
            font-family: "Open Sans";
            padding: 0 8px
        }

    .profile-users .user {
        display: block;
        position: static;
        text-align: center;
        width: auto
    }

        .profile-users .user img {
            padding: 2px;
            border-radius: 100%;
            border: 1px solid #AAA;
            max-width: none;
            width: 64px;
            -webkit-transition: all .1s;
            -o-transition: all .1s;
            transition: all .1s
        }

            .profile-users .user img:hover {
                -webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .33);
                box-shadow: 0 0 1px 1px rgba(0, 0, 0, .33)
            }

    .profile-users .memberdiv {
        background-color: #FFF;
        width: 100px;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        border: none;
        text-align: center;
        margin: 0 8px 24px
    }

        .profile-users .memberdiv .body {
            display: inline-block;
            margin: 8px 0 0
        }

        .profile-users .memberdiv .popover {
            visibility: hidden;
            min-width: 0;
            max-height: 0;
            max-width: 0;
            margin-left: 0;
            margin-right: 0;
            top: -5%;
            left: auto;
            right: auto;
            opacity: 0;
            display: none;
            position: absolute;
            -webkit-transition: opacity .2s linear 0s, visibility 0s linear .2s, max-height 0s linear .2s, max-width 0s linear .2s, min-width 0s linear .2s;
            -o-transition: opacity .2s linear 0s, visibility 0s linear .2s, max-height 0s linear .2s, max-width 0s linear .2s, min-width 0s linear .2s;
            transition: opacity .2s linear 0s, visibility 0s linear .2s, max-height 0s linear .2s, max-width 0s linear .2s, min-width 0s linear .2s
        }

            .profile-users .memberdiv .popover.right {
                left: 100%;
                right: auto;
                display: block
            }

            .profile-users .memberdiv .popover.left {
                left: auto;
                right: 100%;
                display: block
            }

        .profile-users .memberdiv > :first-child:hover .popover {
            visibility: visible;
            opacity: 1;
            z-index: 1060;
            max-height: 250px;
            max-width: 250px;
            min-width: 150px;
            -webkit-transition-delay: 0s;
            -moz-transition-delay: 0s;
            -o-transition-delay: 0s;
            transition-delay: 0s
        }

        .profile-users .memberdiv .tools {
            position: static;
            display: block;
            width: 100%;
            margin-top: 2px
        }

            .profile-users .memberdiv .tools > a {
                margin: 0 2px
            }

    .user-status {
        display: inline-block;
        width: 11px;
        height: 11px;
        background-color: #FFF;
        border: 3px solid #AAA;
        border-radius: 100%;
        vertical-align: middle;
        margin-right: 1px
    }

        .user-status.status-online {
            border-color: #8AC16C
        }

        .user-status.status-busy {
            border-color: #E07F69
        }

        .user-status.status-idle {
            border-color: #FFB752
        }

    .tab-content.profile-edit-tab-content {
        border: 1px solid #DDD;
        padding: 8px 32px 32px;
        -webkit-box-shadow: 1px 1px 0 0 rgba(0, 0, 0, .2);
        box-shadow: 1px 1px 0 0 rgba(0, 0, 0, .2);
        background-color: #FFF
    }

    @media only screen and (max-width:480px) {
        .profile-info-name {
            width: 80px
        }

        .profile-user-info-striped .profile-info-name {
            float: none;
            width: auto;
            text-align: left;
            padding: 6px 4px 6px 10px;
            display: block
        }

        .profile-user-info-striped .profile-info-value {
            margin-left: 10px;
            display: block
        }

        .user-profile .memberdiv {
            width: 50%;
            margin-left: 0;
            margin-right: 0
        }
    }



    .itemdiv {
        padding-right: 3px;
        min-height: 66px
    }

        .itemdiv > .user {
            display: inline-block;
            width: 42px;
            position: absolute;
            left: 0
        }

            .itemdiv > .user > .img,
            .itemdiv > .user > img {
                border-radius: 100%;
                border: 2px solid #5293C4;
                max-width: 40px;
                position: relative
            }

            .itemdiv > .user > .img {
                padding: 2px
            }

        .itemdiv > .body {
            width: auto;
            margin-left: 50px;
            margin-right: 12px;
            position: relative
        }

            .itemdiv > .body > .time {
                display: block;
                font-size: 11px;
                font-weight: 700;
                color: #666;
                position: absolute;
                right: 9px;
                top: 0
            }

                .itemdiv > .body > .time .ace-icon {
                    font-size: 14px;
                    font-weight: 400
                }

            .itemdiv > .body > .name {
                display: block;
                color: #999
            }

                .itemdiv > .body > .name > b {
                    color: #777
                }

            .itemdiv > .body > .text {
                display: block;
                position: relative;
                margin-top: 2px;
                padding-bottom: 19px;
                padding-left: 7px;
                font-size: 13px
            }

                .itemdiv.dialogdiv:before,
                .itemdiv.dialogdiv > .body:before,
                .itemdiv > .body > .text:after {
                    content: "";
                    position: absolute
                }

                .itemdiv > .body > .text:after {
                    display: block;
                    height: 1px;
                    font-size: 0;
                    overflow: hidden;
                    left: 16px;
                    right: -12px;
                    margin-top: 9px;
                    border-top: 1px solid #E4ECF3
                }

                .itemdiv > .body > .text > .ace-icon:first-child {
                    color: #DCE3ED;
                    margin-right: 4px
                }

        .itemdiv:last-child > .body > .text {
            border-bottom-width: 0
        }

            .itemdiv:last-child > .body > .text:after {
                display: none
            }

        .itemdiv.dialogdiv {
            padding-bottom: 14px
        }

            .itemdiv.dialogdiv:before {
                display: block;
                top: 0;
                bottom: 0;
                left: 19px;
                width: 3px;
                max-width: 3px;
                background-color: #E1E6ED;
                border: 1px solid #D7DBDD;
                border-width: 0 1px
            }

            .itemdiv.dialogdiv:last-child {
                padding-bottom: 0
            }

                .itemdiv.dialogdiv:last-child:before {
                    display: none
                }

            .itemdiv.dialogdiv > .user > img {
                border-color: #C9D6E5
            }

            .itemdiv.dialogdiv > .body {
                border: 1px solid #DDE4ED;
                padding: 5px 8px 8px;
                border-left-width: 2px;
                margin-right: 1px
            }

                .itemdiv.dialogdiv > .body:before {
                    display: block;
                    left: -7px;
                    top: 11px;
                    width: 8px;
                    height: 8px;
                    border: 2px solid #DDE4ED;
                    border-width: 2px 0 0 2px;
                    background-color: #FFF;
                    -webkit-box-sizing: content-box;
                    -moz-box-sizing: content-box;
                    box-sizing: content-box;
                    -webkit-transform: rotate(-45deg);
                    -ms-transform: rotate(-45deg);
                    -o-transform: rotate(-45deg);
                    transform: rotate(-45deg)
                }

                .itemdiv.dialogdiv > .body > .time {
                    position: static;
                    float: right
                }

                .itemdiv.dialogdiv > .body > .text {
                    padding-left: 0;
                    padding-bottom: 0
                }

                    .itemdiv.dialogdiv > .body > .text:after {
                        display: none
                    }

            .itemdiv.dialogdiv .tooltip-inner {
                word-break: break-all
            }

        .itemdiv.memberdiv {
            width: 175px;
            padding: 2px;
            margin: 3px 0;
            float: left;
            border-bottom: 1px solid #E8E8E8
        }

    @media (min-width:992px) {
        .itemdiv.memberdiv {
            max-width: 50%
        }
    }

    @media (max-width:991px) {
        .itemdiv.memberdiv {
            min-width: 33.333%
        }
    }

    .itemdiv.memberdiv > .user > img {
        border-color: #DCE3ED
    }

    .itemdiv.memberdiv > .body > .time {
        position: static
    }

    .itemdiv.memberdiv > .body > .name {
        line-height: 18px;
        height: 18px;
        margin-bottom: 0
    }

        .itemdiv.memberdiv > .body > .name > a {
            display: inline-block;
            max-width: 100px;
            max-height: 18px;
            overflow: hidden;
            text-overflow: ellipsis;
            word-break: break-all
        }

    .itemdiv .tools {
        position: absolute;
        right: 5px;
        bottom: 10px;
        display: none
    }

    .item-list > li > .checkbox,
    .item-list > li > label.inline,
    .itemdiv:hover .tools {
        display: inline-block
    }

    .itemdiv .tools .btn {
        border-radius: 36px;
        margin: 1px 0
    }

    .itemdiv .body .tools {
        bottom: 4px
    }

    .itemdiv.commentdiv .tools {
        right: 9px
    }

    .item-list {
        margin: 0;
        padding: 0;
        list-style: none
    }

        .item-list > li {
            padding: 9px;
            background-color: #FFF;
            margin-top: -1px;
            position: relative
        }

            .item-list > li.selected {
                color: #8090A0;
                background-color: #F4F9FC
            }

                .item-list > li.selected .lbl,
                .item-list > li.selected label {
                    text-decoration: line-through;
                    color: #8090A0
                }

            .item-list > li label {
                font-size: 13px
            }

            .item-list > li .percentage {
                font-size: 11px;
                font-weight: 700;
                color: #777
            }


    .ace-thumbnails > li,
    .ace-thumbnails > li > :first-child {
        display: block;
        position: relative
    }

    .ace-thumbnails {
        list-style: none;
        margin: 0;
        padding: 0
    }

        .ace-thumbnails > li {
            float: left;
            overflow: hidden;
            margin: 2px;
            border: 2px solid #333
        }

            .ace-thumbnails > li > :first-child:focus {
                outline: 0
            }

            .ace-thumbnails > li .tags {
                display: inline-block;
                position: absolute;
                bottom: 0;
                right: 0;
                overflow: visible;
                direction: rtl;
                padding: 0;
                margin: 0;
                height: auto;
                width: auto;
                background-color: transparent;
                border-width: 0;
                vertical-align: inherit
            }

                .ace-thumbnails > li .tags > .label-holder {
                    opacity: .92;
                    filter: alpha(opacity=92);
                    display: table;
                    margin: 1px 0 0;
                    direction: ltr;
                    text-align: left
                }

            .ace-thumbnails > li > .tools,
            .ace-thumbnails > li > :first-child > .text {
                position: absolute;
                text-align: center;
                background-color: rgba(0, 0, 0, .55)
            }

            .ace-thumbnails > li .tags > .label-holder:hover {
                opacity: 1;
                filter: alpha(opacity=100)
            }

            .ace-thumbnails > li > .tools {
                top: 0;
                bottom: 0;
                left: -30px;
                width: 24px;
                vertical-align: middle;
                -webkit-transition: all .2s ease;
                -o-transition: all .2s ease;
                transition: all .2s ease
            }

                .ace-thumbnails > li > .tools.tools-right {
                    left: auto;
                    right: -30px
                }

                .ace-thumbnails > li > .tools.tools-bottom {
                    width: auto;
                    height: 28px;
                    left: 0;
                    right: 0;
                    top: auto;
                    bottom: -30px
                }

                .ace-thumbnails > li > .tools.tools-top {
                    width: auto;
                    height: 28px;
                    left: 0;
                    right: 0;
                    top: -30px;
                    bottom: auto
                }

            .ace-thumbnails > li:hover > .tools {
                left: 0;
                right: 0
            }

                .ace-thumbnails > li:hover > .tools.tools-bottom {
                    top: auto;
                    bottom: 0
                }

                .ace-thumbnails > li:hover > .tools.tools-top {
                    bottom: auto;
                    top: 0
                }

                .ace-thumbnails > li:hover > .tools.tools-right {
                    left: auto;
                    right: 0
                }

            .ace-thumbnails > li > .in.tools {
                left: 0;
                right: 0
            }

                .ace-thumbnails > li > .in.tools.tools-bottom {
                    top: auto;
                    bottom: 0
                }

                .ace-thumbnails > li > .in.tools.tools-top {
                    bottom: auto;
                    top: 0
                }

                .ace-thumbnails > li > .in.tools.tools-right {
                    left: auto;
                    right: 0
                }

            .ace-thumbnails > li > .tools > a,
            .ace-thumbnails > li > :first-child .inner a {
                display: inline-block;
                color: #FFF;
                font-size: 18px;
                font-weight: 400;
                padding: 0 4px
            }

                .ace-thumbnails > li > .tools > a:hover,
                .ace-thumbnails > li > :first-child .inner a:hover {
                    text-decoration: none;
                    color: #C9E2EA
                }

            .ace-thumbnails > li .tools.tools-bottom > a,
            .ace-thumbnails > li .tools.tools-top > a {
                display: inline-block
            }

            .ace-thumbnails > li > :first-child > .text {
                right: 0;
                left: 0;
                bottom: 0;
                top: 0;
                color: #FFF;
                opacity: 0;
                filter: alpha(opacity=0);
                -webkit-transition: all .2s ease;
                -o-transition: all .2s ease;
                transition: all .2s ease
            }

    .dialogs,
    .itemdiv {
        position: relative
    }

    .ace-thumbnails > li > :first-child > .text:before {
        content: '';
        display: inline-block;
        height: 100%;
        vertical-align: middle;
        margin-right: 0
    }

    .ace-thumbnails > li > :first-child > .text > .inner {
        padding: 4px 0;
        margin: 0;
        display: inline-block;
        vertical-align: middle;
        max-width: 90%
    }

    .ace-thumbnails > li:hover > :first-child > .text {
        opacity: 1;
        filter: alpha(opacity=100)
    }

    @media only screen and (max-width:480px) {
        .ace-thumbnails {
            text-align: center
        }

            .ace-thumbnails > li {
                float: none;
                display: inline-block
            }
    }


    .tab-content {
        border: 1px solid #C5D0DC;
        padding: 16px 12px;
        position: relative
    }

        .tab-content.no-padding {
            padding: 0
        }

        .tab-content.no-border {
            border: none;
            padding: 12px
        }

        .tab-content.padding-32 {
            padding: 32px 24px
        }

        .tab-content.no-border.padding-32 {
            padding: 32px
        }

        .tab-content.padding-30 {
            padding: 30px 23px
        }

        .tab-content.no-border.padding-30 {
            padding: 30px
        }

        .tab-content.padding-28 {
            padding: 28px 21px
        }

        .tab-content.no-border.padding-28 {
            padding: 28px
        }

        .tab-content.padding-26 {
            padding: 26px 20px
        }

        .tab-content.no-border.padding-26 {
            padding: 26px
        }

        .tab-content.padding-24 {
            padding: 24px 18px
        }

        .tab-content.no-border.padding-24 {
            padding: 24px
        }

        .tab-content.padding-22 {
            padding: 22px 17px
        }

        .tab-content.no-border.padding-22 {
            padding: 22px
        }

        .tab-content.padding-20 {
            padding: 20px 15px
        }

        .tab-content.no-border.padding-20 {
            padding: 20px
        }

        .tab-content.padding-18 {
            padding: 18px 14px
        }

        .tab-content.no-border.padding-18 {
            padding: 18px
        }

        .tab-content.padding-16 {
            padding: 16px 12px
        }

        .tab-content.no-border.padding-16 {
            padding: 16px
        }

        .tab-content.padding-14 {
            padding: 14px 11px
        }

        .tab-content.no-border.padding-14 {
            padding: 14px
        }

        .tab-content.padding-12 {
            padding: 12px 9px
        }

        .tab-content.no-border.padding-12 {
            padding: 12px
        }

        .tab-content.padding-10 {
            padding: 10px 8px
        }

        .tab-content.no-border.padding-10 {
            padding: 10px
        }

        .tab-content.padding-8 {
            padding: 8px 6px
        }

        .tab-content.no-border.padding-8 {
            padding: 8px
        }

        .tab-content.padding-6 {
            padding: 6px 5px
        }

        .tab-content.no-border.padding-6 {
            padding: 6px
        }

        .tab-content.padding-4 {
            padding: 4px 3px
        }

        .tab-content.no-border.padding-4 {
            padding: 4px
        }

        .tab-content.no-border.padding-2,
        .tab-content.padding-2 {
            padding: 2px
        }

        .tab-content.no-border.padding-0,
        .tab-content.padding-0 {
            padding: 0
        }


    .nav.nav-tabs.padding-28 {
        padding-left: 28px
    }

    .tabs-left > .nav.nav-tabs.padding-28,
    .tabs-right > .nav.nav-tabs.padding-28 {
        padding-left: 0;
        padding-top: 28px
    }

    .nav.nav-tabs.padding-26 {
        padding-left: 26px
    }

    .tabs-left > .nav.nav-tabs.padding-26,
    .tabs-right > .nav.nav-tabs.padding-26 {
        padding-left: 0;
        padding-top: 26px
    }

    .nav.nav-tabs.padding-24 {
        padding-left: 24px
    }

    .tabs-left > .nav.nav-tabs.padding-24,
    .tabs-right > .nav.nav-tabs.padding-24 {
        padding-left: 0;
        padding-top: 24px
    }

    .nav.nav-tabs.padding-22 {
        padding-left: 22px
    }

    .tabs-left > .nav.nav-tabs.padding-22,
    .tabs-right > .nav.nav-tabs.padding-22 {
        padding-left: 0;
        padding-top: 22px
    }

    .nav.nav-tabs.padding-20 {
        padding-left: 20px
    }

    .tabs-left > .nav.nav-tabs.padding-20,
    .tabs-right > .nav.nav-tabs.padding-20 {
        padding-left: 0;
        padding-top: 20px
    }

    .nav.nav-tabs.padding-18 {
        padding-left: 18px
    }

    .tabs-left > .nav.nav-tabs.padding-18,
    .tabs-right > .nav.nav-tabs.padding-18 {
        padding-left: 0;
        padding-top: 18px
    }

    .nav.nav-tabs.padding-16 {
        padding-left: 16px
    }

    .tabs-left > .nav.nav-tabs.padding-16,
    .tabs-right > .nav.nav-tabs.padding-16 {
        padding-left: 0;
        padding-top: 16px
    }

    .nav.nav-tabs.padding-14 {
        padding-left: 14px
    }

    .tabs-left > .nav.nav-tabs.padding-14,
    .tabs-right > .nav.nav-tabs.padding-14 {
        padding-left: 0;
        padding-top: 14px
    }

    .nav.nav-tabs.padding-12 {
        padding-left: 12px
    }

    .tabs-left > .nav.nav-tabs.padding-12,
    .tabs-right > .nav.nav-tabs.padding-12 {
        padding-left: 0;
        padding-top: 12px
    }

    .nav.nav-tabs.padding-10 {
        padding-left: 10px
    }

    .tabs-left > .nav.nav-tabs.padding-10,
    .tabs-right > .nav.nav-tabs.padding-10 {
        padding-left: 0;
        padding-top: 10px
    }

    .nav.nav-tabs.padding-8 {
        padding-left: 8px
    }

    .tabs-left > .nav.nav-tabs.padding-8,
    .tabs-right > .nav.nav-tabs.padding-8 {
        padding-left: 0;
        padding-top: 8px
    }

    .nav.nav-tabs.padding-6 {
        padding-left: 6px
    }

    .tabs-left > .nav.nav-tabs.padding-6,
    .tabs-right > .nav.nav-tabs.padding-6 {
        padding-left: 0;
        padding-top: 6px
    }

    .nav.nav-tabs.padding-4 {
        padding-left: 4px
    }

    .tabs-left > .nav.nav-tabs.padding-4,
    .tabs-right > .nav.nav-tabs.padding-4 {
        padding-left: 0;
        padding-top: 4px
    }

    .nav.nav-tabs.padding-2 {
        padding-left: 2px
    }

    .tabs-left > .nav.nav-tabs.padding-2,
    .tabs-right > .nav.nav-tabs.padding-2 {
        padding-left: 0;
        padding-top: 2px
    }

    .nav-tabs {
        border-color: #C5D0DC;
        margin-bottom: 0 !important;
        position: relative;
        top: 1px
    }

        .nav-tabs > li > a {
            padding: 7px 12px 8px
        }

            .nav-tabs > li > a,
            .nav-tabs > li > a:focus {
                border-radius: 0 !important;
                border-color: #C5D0DC;
                background-color: #F9F9F9;
                color: #999;
                margin-right: -1px;
                line-height: 18px;
                position: relative
            }

                .nav-tabs > li > a:hover {
                    background-color: #FFF;
                    color: #4C8FBD;
                    border-color: #C5D0DC
                }

                .nav-tabs > li > a:active,
                .nav-tabs > li > a:focus {
                    outline: 0 !important
                }

        .nav-tabs > li.active > a,
        .nav-tabs > li.active > a:focus,
        .nav-tabs > li.active > a:hover {
            color: #576373;
            border-color: #C5D0DC #C5D0DC transparent;
            border-top: 2px solid #4C8FBD;
            background-color: #FFF;
            z-index: 1;
            line-height: 18px;
            margin-top: -1px;
            box-shadow: 0 -2px 3px 0 rgba(0, 0, 0, .15)
        }

    .tabs-below > .nav-tabs {
        top: auto;
        margin-bottom: 0;
        margin-top: -1px;
        border-color: #C5D0DC;
        border-bottom-width: 0
    }

        .tabs-below > .nav-tabs > li > a,
        .tabs-below > .nav-tabs > li > a:focus,
        .tabs-below > .nav-tabs > li > a:hover {
            border-color: #C5D0DC
        }

        .tabs-below > .nav-tabs > li.active > a,
        .tabs-below > .nav-tabs > li.active > a:focus,
        .tabs-below > .nav-tabs > li.active > a:hover {
            border-color: transparent #C5D0DC #C5D0DC;
            border-top-width: 1px;
            border-bottom: 2px solid #4C8FBD;
            margin-top: 0;
            box-shadow: 0 2px 3px 0 rgba(0, 0, 0, .15)
        }

    .tabs-left > .nav-tabs > li > a,
    .tabs-right > .nav-tabs > li > a {
        min-width: 60px
    }

    .tabs-left > .nav-tabs {
        top: auto;
        margin-bottom: 0;
        border-color: #C5D0DC;
        float: left
    }

        .tabs-left > .nav-tabs > li {
            float: none !important
        }

            .tabs-left > .nav-tabs > li > a,
            .tabs-left > .nav-tabs > li > a:focus,
            .tabs-left > .nav-tabs > li > a:hover {
                border-color: #C5D0DC;
                margin: 0 -1px 0 0
            }

            .tabs-left > .nav-tabs > li.active > a,
            .tabs-left > .nav-tabs > li.active > a:focus,
            .tabs-left > .nav-tabs > li.active > a:hover {
                border-color: #C5D0DC transparent #C5D0DC #C5D0DC;
                border-top-width: 1px;
                border-left: 2px solid #4C8FBD;
                margin: 0 -1px;
                -webkit-box-shadow: -2px 0 3px 0 rgba(0, 0, 0, .15) !important;
                box-shadow: -2px 0 3px 0 rgba(0, 0, 0, .15) !important
            }

    .tabs-right > .nav-tabs {
        top: auto;
        margin-bottom: 0;
        border-color: #C5D0DC;
        float: right
    }

        .tabs-right > .nav-tabs > li {
            float: none !important
        }

            .tabs-right > .nav-tabs > li > a,
            .tabs-right > .nav-tabs > li > a:focus,
            .tabs-right > .nav-tabs > li > a:hover {
                border-color: #C5D0DC;
                margin: 0 -1px
            }

            .tabs-right > .nav-tabs > li.active > a,
            .tabs-right > .nav-tabs > li.active > a:focus,
            .tabs-right > .nav-tabs > li.active > a:hover {
                border-color: #C5D0DC #C5D0DC #C5D0DC transparent;
                border-top-width: 1px;
                border-right: 2px solid #4C8FBD;
                margin: 0 -2px 0 -1px;
                -webkit-box-shadow: 2px 0 3px 0 rgba(0, 0, 0, .15);
                box-shadow: 2px 0 3px 0 rgba(0, 0, 0, .15)
            }

    .nav-tabs > li > a .badge {
        padding: 1px 5px;
        line-height: 15px;
        opacity: .75;
        vertical-align: initial
    }

    .nav-tabs > li > a .ace-icon {
        opacity: .75
    }

    .nav-tabs > li.active > a .ace-icon,
    .nav-tabs > li.active > a .badge {
        opacity: 1
    }

    .nav-tabs li .ace-icon {
        width: 1.25em;
        display: inline-block;
        text-align: center
    }

    .nav-tabs > li.open .dropdown-toggle {
        background-color: #4F99C6;
        border-color: #4F99C6;
        color: #FFF
    }

        .nav-tabs > li.open .dropdown-toggle > .ace-icon {
            color: #FFF !important
        }

    .tabs-left .tab-content,
    .tabs-right .tab-content {
        overflow: auto
    }

    .dark {
        color: #333 !important
    }

    .white {
        color: #FFF !important
    }

    .red {
        color: #DD5A43 !important
    }

    .red2 {
        color: #E08374 !important
    }

    .light-red {
        color: #F77 !important
    }

    .blue {
        color: #478FCA !important
    }

    .light-blue {
        color: #93CBF9 !important
    }

    .green {
        color: #69AA46 !important
    }

    .light-green {
        color: #B0D877 !important
    }

    .orange {
        color: #FF892A !important
    }

    .orange2 {
        color: #FEB902 !important
    }

    .light-orange {
        color: #FCAC6F !important
    }

    .purple {
        color: #A069C3 !important
    }

    .pink {
        color: #C6699F !important
    }

    .pink2 {
        color: #D6487E !important
    }

    .brown {
        color: brown !important
    }

    .grey {
        color: #777 !important
    }
</style>




			<div class="tab-content no-border padding-24">
				<div id="home" class="tab-pane in active">
					<div class="row">
						<div class="col-xs-12 col-sm-3 center">
							<span class="profile-picture">
								<asp:Image ID="Image1" runat="server"  Width="80%" Height="80%" ImageAlign="Middle"/>
							</span>
                            <br/>
                               <div container>
                               <br/>
     <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal">Actualizar Logo</button><br />
    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModaleli" style="margin-top:10px">Eliminar Tienda</button>
       
     <!-- Modal Logo -->
  <div class="modal fade" data-backdrop="static" data-keyboard="false" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background:#185189; color: white;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Subir nueva imagen</h4>
        </div>
        <div class="modal-body">
          <br/>
          <p>
          
         <input type="file" id="File1" name="File1" runat="server" />
          </p>
          <br/>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Cancelar</button>
            <formaction id="Form1" enctype="multipart/form-data"   runat="server" CssClass="btn btn-danger btn-flat">    
             <asp:Button ID="Button1" runat="server" Text="Subir Foto" CssClass="btn btn-success"  CausesValidation="false"  />
            <%--<input type="submit" id="Submit1" value="Subir" runat="server" name="Submit1" CssClass="btn btn-danger"/> --%>       
    </formaction>
        </div>
      </div>
      
    </div>
  </div>


 <!-- Modal Eliminar-->
  <div class="modal fade" data-backdrop="static" data-keyboard="false" id="myModaleli" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background:#185189; color: white;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Eliminar Tienda</h4>
        </div>
        <div class="modal-body">
          <br/>
          <p>
          
        ¿Esta seguro que desea eliminar ésta tienda?
          </p>
          <br/>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default btn-flat" data-dismiss="modal" >Cancelar</button>
            <asp:Button ID="Button3" runat="server" Text="Eliminar"  CssClass="btn btn-danger btn-flat" CausesValidation="false" />
        </div>
      </div>
      
    </div>
  </div>




    </div>
    



						</div><!-- /.col -->
						<div class="col-xs-12 col-sm-9">
							<h4 class="blue">
								<span class="middle">
                                    <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></span>

			
							</h4>

							<div class="profile-user-info">
								<div class="profile-info-row">
									<div class="profile-info-name"> Rut </div>

									<div class="profile-info-value">
										<span>
                                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></span>
									</div>
								</div>

								<div class="profile-info-row">
									<div class="profile-info-name"> Contacto </div>

									<div class="profile-info-value">
										<i class="fa fa-map-marker light-orange bigger-110"></i>
										<span>
                                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></span>
									</div>
								</div>

								<div class="profile-info-row">
									<div class="profile-info-name"> Teléfono </div>

									<div class="profile-info-value">
										<span>
                                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></span>
									</div>
								</div>

                                <div class="profile-info-row">
									<div class="profile-info-name"> Email </div>

									<div class="profile-info-value">
										<span>
                                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></span>
									</div>
								</div>

                                <div class="profile-info-row">
									<div class="profile-info-name"> Contraseña </div>

									<div class="profile-info-value">
										<span>
                                            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></span>
									</div>
								</div>



							</div>                      


						</div><!-- /.col -->
					</div><!-- /.row -->

                    <hr/>


					<div class="space-20"></div>


                    <div class="row">
					
							<div class="widget-box transparent">

                             <div container>
     <div>
     <button style="float: right"; type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2">+ Agregar</button>
  
      <div class="input-group">
<div class="widget-header widget-header-small">
                                      <h4 class="widget-title smaller">
										Listado de Trabajadores
									</h4>
								</div>
     
      </div>
      </div>
     <!-- Modal -->
  <div class="modal fade" data-backdrop="static" data-keyboard="false" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header"style="background:#185189; color: white;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Ingrese datos del Trabajador</h4>
        </div>
        <div class="modal-body">
          <p>

                    <div class="form-group"> <label>Rut</label>
                     
                        <div class="input-group">
                      
                            <span class="input-group-addon"><i style="width: 20px" class="glyphicon glyphicon-align-justify"></i></span>

                            <asp:TextBox type="text" ID="TextBox6" runat="server" CssClass="form-control" maxlength="10"  placeholder="Ingresar rut" onkeypress="return checkRutValidacion(event);" onkeyup="checkRut(this)" ></asp:TextBox> 
                            
                        </div>
                          <asp:RequiredFieldValidator id="reqRut" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="Debe ingresar Rut"/>

                          <asp:CustomValidator id="customRut" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="red" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="El rut no es valido" ClientValidationFunction="validar_rut" />

                      </div>

                    <div class="form-group"> <label>Nombre</label>
                        <div class="input-group">
                       
                          <span class="input-group-addon"><i style="width: 20px" class="glyphicon glyphicon-shopping-cart"></i></span>
       
                           <asp:TextBox type="text" ID="TextBox2" runat="server" CssClass="form-control" placeholder="Ingresar nombre" onkeypress="return checkTexto(event);"  ></asp:TextBox> 
                        </div>
                        <asp:RequiredFieldValidator id="reqTienda" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Debe ingresar nombre"/>
                    </div>

                    <div class="form-group"> <label>Apellido</label>
                        <div class="input-group">
                       
                          <span class="input-group-addon"><i style="width: 20px" class="glyphicon glyphicon-shopping-cart"></i></span>
       
                           <asp:TextBox type="text" ID="TextBox3" runat="server" CssClass="form-control" placeholder="Ingresar apellido" onkeypress="return checkTexto(event);"  ></asp:TextBox> 
                        </div>
                        <asp:RequiredFieldValidator id="reqApellido" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Debe ingresar apellido"/>
                    </div>

                     <div class="form-group"> <label>Teléfono</label>
                        <div class="input-group">
                       
                          <span class="input-group-addon"><i style="width: 20px" class="glyphicon glyphicon-earphone"></i></span>
       
                           <asp:TextBox type="text" ID="TextBox4" runat="server" CssClass="form-control" placeholder="Ingresar teléfono"  maxlength="12"  onkeypress="return checkTelefono(event);" ></asp:TextBox> 
                        </div>
                          <asp:RequiredFieldValidator id="reqTelefono" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Debe ingresar teléfono"/>
                    </div>

                 <div class="form-group"> <label>Dirección</label>
                        <div class="input-group">
                       
                          <span class="input-group-addon"><i style="width: 20px" class="glyphicon glyphicon glyphicon-home"></i></span>
       
                           <asp:TextBox type="text" ID="TextBox1" runat="server" CssClass="form-control" placeholder="Ingresar cargo" onkeypress="return checkTexto(event);"  ></asp:TextBox> 
                        </div>
                        <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="Debe ingresar cargo"/>
                    </div>

                    <div class="form-group"> <label>Cargo</label>
                        <div class="input-group">
                       
                          <span class="input-group-addon"><i style="width: 20px" class="glyphicon glyphicon-shopping-cart"></i></span>
       
                           <asp:TextBox type="text" ID="TextBox7" runat="server" CssClass="form-control" placeholder="Ingresar cargo" onkeypress="return checkTexto(event);"  ></asp:TextBox> 
                        </div>
                        <asp:RequiredFieldValidator id="reqCargo" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="Debe ingresar cargo"/>
                    </div>

                    <div class="form-group"> <label>Empresa</label>
                        <div class="input-group">
                       
                          <span class="input-group-addon"><i style="width: 20px" class="glyphicon glyphicon-shopping-cart"></i></span>
       
                           <asp:TextBox type="text" ID="TextBox8" runat="server" CssClass="form-control" placeholder="Ingresar empresa" onkeypress="return checkTexto(event);"  ></asp:TextBox> 
                        </div>
                        <asp:RequiredFieldValidator id="reqEmpresa" runat="server" CssClass="form-control" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="Debe ingresar empresa"/>
                    </div>

<%--          Rut:<asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox> 
          Nombre:<asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox> 
          Apellido:<asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox> 
          Teléfono:<asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
          Cargo:<asp:TextBox ID="TextBox7" runat="server" CssClass="form-control"></asp:TextBox>
          Empresa:<asp:TextBox ID="TextBox8" runat="server" CssClass="form-control"></asp:TextBox>--%>
          <br/>
          </p>
         
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Cancelar</button>
            <asp:Button ID="Button4" runat="server" Text="Guardar cambios" CssClass="btn btn-success btn-flat" />
        </div>
      </div>
      
    </div>
  </div>

    </div>
											
    <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="false" 
            CssClass="table table-bordered bs-table" AllowPaging="True" PageSize="10">
            <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" HeaderText='<span class="glyphicon glyphicon-edit" style="color:white"></span>' ControlStyle-CssClass="btn btn-primary" SelectText="Editar" />
            <asp:BoundField DataField="Rut" HeaderText="Rut" ItemStyle-Width="130" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Apellido" HeaderText="Apellido" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Numero" HeaderText="Teléfono" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Direc" HeaderText="Dirección" ItemStyle-Width="150" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Cargo" HeaderText="Cargo" ItemStyle-Width="150" ItemStyle-Wrap="false" />
 
            <asp:TemplateField HeaderText="CDT" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("CDT").ToString() = "P", "cd.svg", "sd.svg")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="CAFP" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("CAFP").ToString() = "P", "cd.svg", "sd.svg")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="AFC" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("AFC").ToString() = "P", "cd.svg", "sd.svg")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="INP" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("INP").ToString() = "P", "cd.svg", "sd.svg")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="CCAF" ItemStyle-Width="100" ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# "~/Images/" & (If(Eval("CCAF").ToString() = "P", "cd.svg", "sd.svg")) %>' runat="server" Height = "25" Width = "25" />
            </ItemTemplate>
            </asp:TemplateField>

    </Columns>
            <HeaderStyle BackColor="#185189" ForeColor="White" />
        </asp:GridView>
 </div>

							</div>
					
					</div>


                  <center> <asp:Button ID="Button2" runat="server"  Text="Volver" class="btn btn-danger"  width="30%" CausesValidation="False"/> </center>


				</div><!-- /#home -->

</asp:Content>

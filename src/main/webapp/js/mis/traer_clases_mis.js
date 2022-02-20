var ruta_contenedores_mis = "./contenedores/mis/";
var ruta_cruds_mis = "./cruds/mis/";
var ruta_grillas_mis = "./grillas/mis/";
var ruta_consultas_mis = "./consultas/mis/";


function traer_eliminar_mis()
{
    $.get(ruta_contenedores_mis + 'contenedor_eliminar.jsp', function (res) {
        $("#contenedor_principal").html('');
        $("#contenedor_principal").html(res);

        cargar_estilo_calendario_insert("dd/mm/yyyy");
        elminar_fila();
        

    });
}
function traer_detalle_eliminar_mis(fecha) {
    $.get(ruta_grillas_mis + 'grilla_eliminar.jsp', {fecha: fecha}, function (res) {

        $("#div_eliminar").html('');
        $("#div_eliminar").html(res);
        $("#grilla_eliminar").DataTable();


    });
}
  
function ir_registro_tipo_reproceso() {
    $.get(ruta_contenedores_mis + 'contenedor_registro_tipo_reproceso.jsp', function (data) {
        $("#contenedor_principal").html('');

        $("#contenedor_principal").html(data);

        llenar_grilla_tipo_reproceso();
    });
}

function traer_grilla_carromesa(fecha_carromesa) {
    $.get(ruta_grillas_mis + 'grilla_carros_mesas.jsp', {fecha_carromesa: fecha_carromesa}, function (res) {
        $("#div_grilla_carromesa").html(res);
        $('#tabla_carromesa').DataTable();
    });
}


function traer_registro_mis()
{
    $("#contenido_2").html("");
    $.get(ruta_contenedores_mis + 'contenedor_registro.jsp', function (res) {
        $("#contenedor_principal").html('');
        $("#contenedor_principal").html(res);

        inicializar_unidad_medida();
        $('.checkbox').bootstrapToggle();
        cargar_estilo_calendario_insert('yyyy/mm/dd');
        $("#tipo_huevo").prop('required', true);

        $('#chkToggle_aviario').change(function ()
        {
            $('#fecha_puesta').val("");
            if ($(this).prop("checked") == true)
            {
                $('#cbox_aviarios').removeAttr('required');
            } else
            {
                $("#cbox_aviarios").prop('required', 'required');
            }
        });
        $('#form-reprocesos').on('submit', function (event)
        {
            event.preventDefault();
            procesar_lotes_rp();
            event.stopPropagation();
        });

    });
}

function validar_fechaInicial_fechaFinal_mis()
{
    $('#cbox_aviarios').html('');
    var fecha_clasificacion_inicial = $('#calendario_registro').val();
    var fecha_clasificacion_final = $('#fecha_clas_final').val();

    var hora_inicial = $('#hora_desde').val();
    var hora_final = $('#hora_hasta').val();
    var minuto_final = $('#minuto_hasta').val();
    var minuto_desde = $('#minuto_desde').val();

    var date_inicial = new Date(fecha_clasificacion_inicial + ' ' + hora_inicial + ':' + minuto_desde + ':00');
    var date_final = new Date(fecha_clasificacion_final + ' ' + hora_final + ':' + minuto_final + ':00');

    var date_inicial_consulta = fecha_clasificacion_inicial + ' ' + hora_inicial + ':' + minuto_desde + ':59.000';
    var date_final_consulta = fecha_clasificacion_final + ' ' + hora_final + ':' + minuto_final + ':00.000';


    if (fecha_clasificacion_inicial.length > 0 && fecha_clasificacion_final.length > 0 && hora_inicial.length > 0 && hora_final.length > 0)
    {
        if (date_inicial > date_final)
        {
            swal.fire({
                type: 'error',
                title: "FECHA DE CLASIFICACION INICIAL NO PUEDE SER MAYOR A LA FINAL.!!!",
                confirmButtonText: "CERRAR"
            });
            $('#fecha_clas_final').val('');

        } else
        {
            $.get(ruta_consultas_mis + 'consulta_aviarios_hora.jsp', {fecha_inicio: date_inicial_consulta, fecha_final: date_final_consulta}, function (res)
            {
                $('#cbox_aviarios').html(res.aviarios);
            });
        }
    }
}

function ir_registro_reproceso_tradicional() {
    $("#contenido_2").html("");
    $.get(ruta_contenedores_mis + 'contenedor_registro_tradicional.jsp', function (res) {
        $("#contenedor_principal").html('');
        $("#contenedor_principal").html(res);

        $('#calendario_registro').datepicker();
        $('#fecha_puesta').datepicker();
        inicializar_unidad_medida();
    });
}


function ir_registro_sp_tradicional() {
    $("#contenido_2").html("");
    $.get(ruta_contenedores_mis + 'contenedor_registro_tradicional_supro.jsp', function (res) {
        $("#contenedor_principal").html('');
        $("#contenedor_principal").html(res);

        $('#calendario_registro').datepicker();
        $('#fecha_puesta').datepicker();
        inicializar_unidad_medida();
    });
}


function traer_informe_mis() {
    $.get(ruta_contenedores_mis + 'contenedor_informe.jsp', function (res) {
        $("#contenedor_principal").html('');
        $("#contenedor_principal").html(res);

        cargar_estilo_calendario_insert("dd/mm/yyyy");
    });
}


function traer_contendor_pdf_jsp_mis() {
    $.get(ruta_contenedores_mis + 'contenedor_pdf.jsp', function (res) {
        $("#contenido_2").html(res);

    });
}

function traer_reporte_lotes_mis() {

    $.get(ruta_contenedores_mis + 'contenedor_reporte_carros.jsp', function (res) {
        $("#contenido_2").html('');
        $("#contenido_2").html(res);
        $("#contenido_2").show();

        $('#contenido').html('');

        $("#calendario_reporte_carros").datepicker();
    });

}

function ir_carro_a_mesa() {
    $.get(ruta_contenedores_mis + 'contenedor_carro_mesa.jsp', function (res) {
        $("#contenedor_principal").html('');
        $("#contenedor_principal").html(res);

        $("#calendario_mesa").datepicker();
    });
}

function ir_reporte_rotos_mis()
{
    $.get(ruta_contenedores_mis + 'contenedor_reporte_rotos.jsp', function (res) {
        $("#contenedor_principal").html('');
        $("#contenedor_principal").html(res);
        cargar_estilo_calendario_insert("dd/mm/yyyy")
     });

}

function ir_transferencias_reprocesos_mis()
{
    $.get(ruta_contenedores_mis + 'contenedor_registro_transferencias_reprocesos.jsp', function (res)
    {
        $("#contenedor_principal").html('');
        $("#contenedor_principal").html(res);

    });

}
function ir_transferencias_subproductos_mis()
{
    $.get(ruta_contenedores_mis + 'contenedor_transferencia_subproducto.jsp', function (res)
    {
        $("#contenedor_principal").html('');
        $("#contenedor_principal").html(res);

    });

}
function ir_informe_pendientes_alimentacion_mis()
{
    $.get(ruta_contenedores_mis + 'contenedor_informe_pendientes_alimentacion.jsp', function (res)
    {
        $("#contenedor_principal").html('');
        $("#contenedor_principal").html(res);

        llenar_grilla_pendientes_alimentacion_mis();
    });
}

function llenar_grilla_pendientes_alimentacion_mis()
{
    $('#example').dataTable({
        "ajax": ruta_consultas_mis + 'consulta_gen_grilla_pendientes_alimentacion.jsp',
        drawCallback: function () //SIRVE PARA QUE AL TIPEAR EL FILTRO SE EJECUTE
        {
            var sum = $('#example').DataTable().column(2, {filter: 'applied'}).data().sum();
            $('#total').html((sum).toLocaleString().replace(/,/g, ".", ));
        }, "language": {
            "sUrl": "plugins/Spanish.txt"}, "pageLength": 100,
    });
}

function traer_contendor_pdf_reproceso_mis(pagina)
{
    $.get(ruta_contenedores_mis + pagina + '.jsp', function (res) {
        $("#contenedor_principal").html('');
        $("#contenedor_principal").html(res);

        cargar_estilo_calendario_insert('dd/mm/yyyy');
    });

}

function cuadro_registro_mis(id_carrito, nro_carro) {
    Swal.fire
            (
                    {
                        title: 'AGREGAR NRO MESA A CARRO NRO. ' + nro_carro,
                        type: 'warning',
                        html: '<form id="form_carros_mesa"> \n\
                        <input type="text" class=" form-control" placeholder="Codigo de mesa" id="txt_mesa" name="txt_mesa" required>\n\
                        <br><br><br><input type="submit" class="form-control bg-success" value="REGISTRAR" id="btn_reg">  \n\
                        </form>',
                        showCancelButton: false,
                        showConfirmButton: false
                    }
            );
    $('#form_carros_mesa').on('submit', function (e) {
        e.preventDefault();
        enviar_datos_carromesa(id_carrito, $('#txt_mesa').val());
    });
}

function llenar_grilla_tipo_reproceso() {

    $.get(ruta_grillas_mis + 'grilla_registro_tipo_reproceso.jsp', function (data) {
        $("#div_grilla_registro").html('');
        $("#div_grilla_registro").html(data);
        $('#tabla_reproceso').DataTable();


    });
}

function principal_mis() {

    $.get(ruta_grillas_mis + 'grilla_normal.jsp', ({calendario_informe: $('#calendario_informe').val()}), function (data) {
        $("#div_grilla_registro").html('');
        $('#div_grilla').html(data);
        $("#grilla_registros").DataTable();
    });
}

function editar_reproceso(id, clasificadora, descripcion, tipo_reproceso) {
    Swal.fire({
        title: 'MODIFICACION DE TIPO DE REPROCESO',
        text: 'DESEA EDITAR EL TIPO SELECCIONADO?',
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'SI, EDITAR!',
        cancelButtonText: 'NO, CANCELAR!'
    }).then((result) => {
        if (result.value) {
            Swal.fire({
                title: 'PROCESANDO!',
                html: 'ESPERE<strong></strong>...',
                allowOutsideClick: false,
                onBeforeOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                        Swal.getContent().querySelector('strong')
                                .textContent = Swal.getTimerLeft()
                    }, 1000)
                }
            });


            $.ajax({
                type: "POST",
                url: ruta_cruds_mis + 'control_editar_tipo_reproceso.jsp',
                data: ({clasificadora: clasificadora, descripcion: descripcion, id: id, tipo_reproceso: tipo_reproceso}),
                success: function (data)
                {

                    aviso_editado_tipo_reproceso(data.mensaje_impresion, data.mensaje, data.tipo_mensaje, clasificadora, descripcion, id, tipo_reproceso);

                }
            });
        }
    });

}

function aviso_editado_tipo_reproceso(mensaje_impresion, mensaje, tipo_mensaje, clasificadora, descripcion, id, tipo_reproceso) {
    swal.fire({
        type: mensaje_impresion,
        title: mensaje,
        confirmButtonText: "CERRAR"
    });

    if (tipo_mensaje == "1") {
        var area_res;
        var tipo;
        if (clasificadora == 'OVO') {
            area_res = "LAVADOS";
        } else if (clasificadora == 'CCH') {
            area_res = "CLASIFICADORAS";
        } else if (clasificadora == 'CCHO') {
            area_res = "CLASIFICADORAS Y LAVADOS";
        }

        if (tipo_reproceso == "SUB") {
            tipo = "SUBPRODUCTO";
        } else {
            tipo = "REPROCESO";

        }
        $("#" + id + '_1').html(descripcion);
        $("#" + id + '_2').html(area_res);
        $("#" + id + '_3').html(tipo);

        $('.modal').click();
        llenar_grilla_tipo_reproceso();

    }
}

function aviso_eliminar_reproceso(id, descripcion) {

    Swal.fire({
        title: '¿Seguro que deseas ELIMINAR el registro?',
        text: 'Eliminar el tipo de reproceso,' + descripcion,
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'SI, ELIMINAR!',
        cancelButtonText: 'NO, CANCELAR!'
    }).then((result) => {
        if (result.value) {
            Swal.fire({
                title: 'PROCESANDO!',
                html: 'ESPERE<strong></strong>...',
                allowOutsideClick: false,
                onBeforeOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                        Swal.getContent().querySelector('strong')
                                .textContent = Swal.getTimerLeft()
                    }, 1000)
                }
            });


            control_eliminar_reproceso(id);


        }
    });
}

function  control_eliminar_reproceso(id) {

    $.get(ruta_cruds_mis + 'control_eliminar_tipo_reproceso.jsp',
            {id: id}, function (res) {

        aviso_eliminar_tipo_reproceso(res.mensaje_impresion, res.mensaje, id, res.tipo_mensaje);

    });
}

function aviso_eliminar_tipo_reproceso(mensaje_impresion, mensaje, id, tipo_mensaje) {
    swal.fire({
        type: mensaje_impresion,
        title: mensaje,
        confirmButtonText: "CERRAR"
    });
    if (tipo_mensaje == "1") {
        $('#' + id + '').remove();
    }

}

function enviar_datos_lotes_tradicionales(total) {
    Swal.fire({
        title: 'CONFIRMACION',
        text: "DESEA REGISTRAR LOS DATOS?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'SI, REGISTRAR!',
        cancelButtonText: 'NO, CANCELAR!'
    }).then((result) => {
        if (result.value)
        {
            Swal.fire({
                title: 'PROCESANDO!',
                html: 'ESPERE<strong></strong>...',
                allowOutsideClick: false,
                onBeforeOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                        Swal.getContent().querySelector('strong')
                                .textContent = Swal.getTimerLeft()
                    }, 1000)
                }
            });
            $.ajax(
                    {
                        type: "POST",
                        url: ruta_cruds_mis + "control_registro_tradicional.jsp",
                        data: ({txt_cantidad: total, fecha_puesta: $('#fecha_puesta').val(), cod_carrito: $('#cod_carrito').val(),
                            tipo_huevo: $('#tipo_huevo').val(), unidad_medida: $('#unidad_medida').val(),
                            hora_desde: $('#hora_desde').val(), hora_hasta: $('#hora_hasta').val(),
                            calendario_registro: $('#calendario_registro').val(), tipo_aviario: $('#tipo_aviario').val(),
                            txt_responsable: $('#txt_responsable').val(), txt_liberado: $('#txt_liberado').val(),
                            txt_obs: $('#txt_obs').val(), cbox_reproceso: $('#cbox_reproceso').val(),
                            cbox_sub: $('#cbox_sub').val(), cbox_zona_liberado: $('#cbox_zona_liberado').val()}),
                        success: function (data)
                        {
                            if (data.tipo_respuesta == "1")
                            {
                                Swal.fire(data.mensaje, '', 'success');

                                traer_menu("U")
                            } else
                            {
                                Swal.fire(data.mensaje, '', 'error');
                            }
                        }
                    });
        }
    });
}

function enviar_datos_lotes(total) {
    Swal.fire({
        title: 'CONFIRMACION',
        text: "DESEA REGISTRAR LOS DATOS?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'SI, REGISTRAR!',
        cancelButtonText: 'NO, CANCELAR!'
    }).then((result) => {
        if (result.value) {
            Swal.fire({
                title: 'PROCESANDO!',
                html: 'ESPERE<strong></strong>...',
                allowOutsideClick: false,
                onBeforeOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                        Swal.getContent().querySelector('strong')
                                .textContent = Swal.getTimerLeft()
                    }, 1000)
                }
            });
            $.ajax({
                type: "POST",
                url: ruta_cruds_mis + "control_registro.jsp",
                data: ({txt_cantidad: total, fecha_puesta: $('#fecha_puesta').val(), cod_carrito: $('#cod_carrito').val(),
                    tipo_huevo: $('#tipo_huevo').val(), unidad_medida: $('#unidad_medida').val(),
                    hora_desde: $('#hora_desde').val(), hora_hasta: $('#hora_hasta').val(),
                    calendario_registro: $('#calendario_registro').val(), tipo_aviario: $('#tipo_aviario').val(),
                    txt_responsable: $('#txt_responsable').val(), txt_liberado: $('#txt_liberado').val(),
                    txt_obs: $('#txt_obs').val(), cbox_reproceso: $('#cbox_reproceso').val(),
                    cbox_sub: $('#cbox_sub').val(), cbox_zona_liberado: $('#cbox_zona_liberado').val()}),
                success: function (data)
                {
                    if (data.tipo_respuesta == "1") {
                        Swal.fire(data.mensaje, '', 'success');
                        traer_registro();
                    } else {
                        Swal.fire(data.mensaje, '', 'error');
                    }
                }
            });

        }
    });
}

function traer_control_eliminar_mis(id) {

    $.get(ruta_cruds_mis + 'eliminar_control.jsp', {id: id}, function (res) {



        swal.fire({
            type: 'error',
            title: "REGISTRO ELIMINADO ",
            confirmButtonText: "CERRAR"
        });

        traer_detalle_eliminar($('#calendario_eliminar').val())
    });
}

function traer_grilla_reproceso() {

    $.get(ruta_grillas_mis + 'grilla_reproceso.jsp', function (res) {
        $("#contenedor_grilla_reproceso").html(res);
    });

}

function validacion_eliminacion(cod_interno, cod_carrito) {

    Swal.fire({
        title: '¿Seguro que deseas ELIMINAR el registro?',
        text: 'Eliminar carro Nº ' + cod_carrito,
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'SI, ELIMINAR!',
        cancelButtonText: 'NO, CANCELAR!'
    }).then((result) => {
        if (result.value) {
            Swal.fire({
                title: 'PROCESANDO!',
                showConfirmlButton: false,
                allowOutsideClick: false,
                onBeforeOpen: () => {
                    Swal.showLoading();
                    timerInterval = setInterval(() => {
                        Swal.getContent().querySelector('strong').textContent = Swal.getTimerLeft();
                    }, 1000);
                }
            });
            traer_control_eliminar_mis(cod_interno);
        }
    });
}

function inicializar_unidad_medida_mis() {
    medida = $("#unidad_medida");
    tipo_huevo = $("#tipo_huevo");
    tipo_huevo.change(cargar_unidad_medida_mis);
}

function cargar_unidad_medida_mis() {

    medida.children().remove();
    var nombre_option = new Array();
    var valores = new Array();
    var id_fecha = $('#id_date').val();
    nombre_option[0] = "GRANEL";
    valores[0] = "1";
    for (var i = 0; i < nombre_option.length; i++)
    {
        medida.append('<option value="' + valores[i] + '">' + nombre_option[i] + '</option>');
    }
    $('#cod_carrito').val("");

    if (tipo_huevo.val() === "9")
    {
        $('#cod_carrito').val(id_fecha);
    }
}

function limpiar_campos_mis()
{
    var gramos, kg, unidad, plancha;
    unidad = $('#txt_unidad').val('');
    plancha = $('#txt_plancha').val('');
    gramos = $('#txt_gramos').val('');
    kg = $('#txt_kg').val('');
}

function detalle_reproceso(calendario, combo_disposicion) {
    $.get(ruta_grillas_mis + 'grilla_reproceso.jsp', {calendario: calendario, combo_disposicion: combo_disposicion}, function (res) {
        $("#contenedor_grilla_reproceso").html(res);
        $("#box_reproceso").on('click', function () {
            chequear_reproceso();
        });
    });
}

function chequear_reproceso() {
    var checked = $("#box_reproceso").prop('checked');
    $('#contenedor_grilla_reproceso').find('input:checkbox').prop('checked', checked);
}

function aviso() {
    swal({
        title: "ERROR, COMPLETE TODOS LOS DATOS",
        text: "",
        timer: 2000,
        showConfirmButton: false
    }
    );
    $.preloader.stop();
}

function aviso2() {
    swal({
        title: "CORRECTO",
        text: "",
        timer: 2000,
        showConfirmButton: false
    }
    );
}

function enviar_datos_carromesa(id_carrito, codigo_mesa) {

    $.ajax({
        type: "POST",
        url: ruta_cruds_mis + "control_carro_mesa.jsp",
        data: ({id_carrito: id_carrito, codigo_mesa: codigo_mesa}),

        beforeSend: function () {
            Swal.fire({
                title: 'PROCESANDO!',
                html: '<strong>ESPERE</strong>...',
                allowOutsideClick: false,
                onBeforeOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                        Swal.getContent().querySelector('strong')
                                .textContent = Swal.getTimerLeft()
                    }, 1000);
                }
            });
        },
        success: function (data) {
            $('#' + id_carrito + '').remove();

            swal.fire({
                type: 'success',
                title: "REGISTRADO CON EXITO.",
                confirmButtonText: "CERRAR"});
        }

    });

}

function  registrar_tipo_reproceso(area, desc, tipo_rep) {

    Swal.fire({
        title: ' ',
        text: 'CREAR EL TIPO DE REPROCESO O SUBPRODUCTO?',
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'SI',
        cancelButtonText: 'NO, CANCELAR!'
    }).then((result) => {
        if (result.value) {

            $.ajax({
                type: "POST",
                url: ruta_cruds_mis + "control_registro_tipo_reproceso.jsp",
                data: ({desc: desc, area: area, tipo_rep: tipo_rep}),

                beforeSend: function () {
                    Swal.fire({
                        title: 'PROCESANDO!',
                        html: '<strong>ESPERE</strong>...',
                        allowOutsideClick: false,
                        onBeforeOpen: () => {
                            Swal.showLoading()
                            timerInterval = setInterval(() => {
                                Swal.getContent().querySelector('strong')
                                        .textContent = Swal.getTimerLeft()
                            }, 1000);
                        }
                    });
                },
                success: function (data) {

                    swal.fire({
                        type: 'success',
                        title: data.mensaje,
                        confirmButtonText: "CERRAR"});
                    $('#modal_agregar').attr("style", "display:none");
                    $('.modal-backdrop').hide();
                    ir_registro_tipo_reproceso();
                }

            });
        }
    });
}

$("#txt_plancha").click(function () {
    $(this).select();
});
$("#txt_unidad").click(function () {
    $(this).select();
});

$("#txt_gramos").click(function () {
    $(this).select();
});
$("#txt_kg").click(function () {
    $(this).select();
});

function ir_grilla_transferencia_reporte(fecha, tipo) {
    $.ajax({
        type: "POST",
        url: ruta_consultas_mis + "consulta_transferencias_botones.jsp",
        data: ({fecha: fecha, tipo: tipo, tipo_reporte: $('#tipo_reporte').val()}),

        beforeSend: function () {
            cargar_load("Consultando");
        },
        success: function (data) {
            $('#div_grilla_tipo_transferencia').html("");
            $('#div_grilla_tipo_transferencia').html(data);
            cerrar_load();
        }
    });


}  


 
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 <%@include  file="../../chequearsesion.jsp" %>
      <%
         String fecha_clasificacion="";
         clases.controles.connectarBD();   
         Statement stmt = clases.controles.connect.createStatement();
         ResultSet rs = stmt.executeQuery("SELECT  convert(varchar,getdate(),111) as fecha,REPLACE(CONVERT(VARCHAR(10),  convert(varchar,getdate(),103), 5),'/','') ");
       
        while(rs.next())
        {          
            fecha_clasificacion=rs.getString(1);
        }    
            clases.controles.DesconnectarBD();  %> 
            
         
             <form method="post"   id="formulario">
           <div class="form-control bg-navy" style="font-weight: bold;color:white;"  onclick="huevos_sc_liberar();" > 
                        <center> REGISTRO DE HUEVOS SIN CLASIFICAR</center></div>

         <br>
        <div class="form-group">
            <div class="input-group">
                <div class="form-groupss " >
                    <b>Fecha de recogida inicial</b>
                    <input style="font-weight: bold;" id="calendario_registro" name="calendario_registro"  class="datepicker" required   value="<%=fecha_clasificacion%>"  onchange=" $('#fecha_clas_final').val($('#calendario_registro').val());validar_fechaInicial_fechaFinal();"/>
                </div>
                <input type="checkbox"  class="checkbox"  data-toggle="toggle" data-on="MANUAL SI"     data-off="MAQUINA SI"   id="chkToggletiporeco"   data-onstyle="success" data-offstyle="warning">
 
                <input id="codigo_especial"     name="codigo_especial"   value="NO"  type="hidden"/>
                <input id="codigo_borroso"      name="codigo_borroso"    value="NO"  type="hidden"/>
                <input id="tipo_reco"           name="tipo_reco"    value="MECANICA"  type="hidden"/>
                <input id="codigo_cepillado"    name="codigo_cepillado"  value="NO"  type="hidden" />
                <input type="hidden" value="M" name="tipo_aviario" id="tipo_aviario">

            </div>
        </div>
         <div id="boxColor_red">
            <br>
            <div class="input-group">
                 <b>   FECHAS INVOLUCRADAS</b> 
                <input id="txt_fecha_involucrada" name="txt_fecha_involucrada" autocomplete="off"  type="text" placeholder="FECHAS INVOLUCRADAS (OPCIONAL)"/>
            </div>
              <br>
        </div>  
        <br>
        <div class="input-append" style="display: none">  
            <div class="form-groupss " >
                <b>TIPO MAPLES</b>
                <select style="font-weight: bold;" class="form-control" name="tipo_maples" id="tipo_maples" required>
                    <OPTION style="font-weight: bold;" VALUE="IM">TIPO IM</OPTION>
                    <OPTION style="font-weight: bold;" VALUE="IIM">TIPO IIM</OPTION>
                    <OPTION style="font-weight: bold;" VALUE="IIH">TIPO IIH</OPTION>
                </select>  
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <select style   ="font-weight: bold;" class="form-control" name="tipo_huevo" id="tipo_huevo"    >
                     <OPTION style="font-weight: bold;" VALUE="SC">SIN CLASIFICAR</OPTION>
                   
                </select>  
                <span class="input-group-addon">-</span>
                <div class="input-append">  
                    <div class="form-groupss ">
                        <b>Fecha de puesta</b>
                        <input style="font-weight: bold;" id="fecha_puesta" name="fecha_puesta" class="datepicker"   width="276"  placeholder="Fecha puesta"  required="true"/>
                    </div>
                </div>
            </div> 
        </div>
                  <input style="font-weight: bold;" name="cod_carrito" id="cod_carrito" type="number" autocomplete="off" required class="form-control" placeholder="Codigo carrito,Mesa,Pallet" onkeyup="contar()" onKeyPress="return soloNumeros(event)" required>
         <br>
     
        <div class="input-group">
            <b>   Cantidad</b>
             <div class="input-group" id="div_cant_plancha">
            <input name="txt_plancha" id="txt_plancha"  type="number" class="form-control"   placeholder="PLANCHAS" >
            -<input name="txt_unidad" id="txt_unidad"  type="number" class="form-control"    placeholder="UNIDADES"  >
        </div> 
        </div>
        <br>
        <div id="boxColor">  
            <br>
                  <b>   Hora inicio</b> 
                <input type="text" data-field="time"  autocomplete="off"  placeholder="HORA DE INICIO"  name="hora_desde" id="hora_desde" required onchange="validar_fechaInicial_fechaFinal();">
                <div class="dtBox"id="dtBox_inicio">
                </div>
             <br>
             <div class="input-group">
                 <b>   Fecha final de recogida</b> 
                <input type="text" id="fecha_clas_final"  name="fecha_clas_final" class="datepicker" placeholder="FECHA FINAL " value="<%=fecha_clasificacion%>" onchange="validar_fechaInicial_fechaFinal()" required >
            </div>
            <br>
            <div class="input-group">
                 <b>   Hora final</b> 
                <input type="text" data-field="time"  autocomplete="off"   placeholder="HORA DE FINALIZACION" name="hora_hasta" id="hora_hasta" required onchange="validar_fechaInicial_fechaFinal();">
                <div class="dtBox" id="dtBox_final">
                </div>
            </div>
             <br>
             <div class="input-group" id="div_aviarios"  >
                <input type="checkbox"  class="checkbox"  data-toggle="toggle" data-on="NO APLICA"     data-off="APLICA"   id="chkToggle_aviario"             data-onstyle="success" data-offstyle="warning">

                     <b>Aviarios disponibles segun horario</b> 
                    <select  name="cbox_aviarios"  id="cbox_aviarios" class="form-control"  multiple="multiple"   >
                    
                    </select>
                
                </div>
                <br>
            </div>
             <br>
         
        <br>
        <div class="form-group" id="div_responsable_liberado">
            <div class="input-group">
                <b>   Responsable</b>
                <input name="txt_responsable" style="text-transform: uppercase;font-weight: bold;" autocomplete="off" id="txt_responsable" required="true"type="text"   placeholder="Responsable">
            </div>  
        <br>
        <div class="input-group" style="display: none">
                <b>   Liberado por</b>
                <input name="txt_liberado"  style="text-transform: uppercase;font-weight: bold;" value="N/A" id="txt_liberado" autocomplete="off" required="true" type="text"   placeholder="Liberado por.">
            </div>  
        </div>  
        <br>
        <div class="input-group">
            <b>   Comentario</b>
            <input name="txt_obs"    style="text-transform: uppercase;font-weight: bold;" id="txt_obs" type="text" autocomplete="off" class="text-negro"     placeholder="Comentario">
        </div>   
        <br> 
        <input name="text_resultado" style="display: none"  id="text_resultado" type="text"   lass="form-control">
        <input type="submit" value="Registrar" id="btn_registrar" name="btn_registrar"  style="font-weight: bold;color:white;" class="form-control btn btn-primary  " style="height:50px"   />
        <br>
        <br> 
    </form> 
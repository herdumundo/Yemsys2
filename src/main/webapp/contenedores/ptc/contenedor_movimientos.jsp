<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 
 <form id="frm_movimiento" method="post">      
    <div class="form-group">
        <select  name="tipo"    id="tipo" class="form-control"   >
            <OPTION selected disabled>SELECCIONAR FILTRO POR FECHA DE PUESTA O CLASIFICACION</OPTION>
            <option value="P">FECHA DE PUESTA</option>
            <option value="C">FECHA DE CLASIFICACION</option>
            <option value="I">FECHA INVOLUCRADA</option>
        </select>
        
        <a> Fecha</a> 
        <div class="input-group">
            <div class="input-append">  
            <input id="calendario_retenido" type="text" class="datepicker"  width="276"/>
            </div> 
            <span class="input-group-addon">-</span>
        <select  name="estado_requerido"     id="estado_requerido" class="form-control"   >
            <OPTION selected disabled>SELECCIONAR ESTADO DE LIBERACI�N</OPTION>
            <option value="L">LIBERAR</option>
            <option value="R">RETENER</option>
            <option value="Z">RETENER CON REPORTE</option>
        </select>
        </div> 
    </div>
     <div id="boxColor">  
            <br>
            <div class="input-group">
                <b>   Hora inicio</b>
                <input type="text" data-field="time"  autocomplete="off"  placeholder="HORA DE INICIO"  name="desde" id="desde" required  >
                <div class="dtBox"id="dtBox_inicio">
                </div>
            </div>
            <br>
            
            <br>
            <div class="input-group">
                <b>   Hora final</b>
                <input type="text" data-field="time"  autocomplete="off"   placeholder="HORA DE FINALIZACION" name="hasta" id="hasta" required  >
                <div class="dtBox" id="dtBox_final">
                </div>
            </div>
             <br>
               
                <br>
            </div>
            
    <input type="text" placeholder="LIBERADO POR" id="liberado_por" name="liberado_por" class="form-control" style="display: none">
        <br>
    <div class="form-group" id="combo_retenido" style="display: none">
            <div class="input-group">
            <select class="form-control"  name="estado_liberacion" id="estado_liberacion">
                <OPTION value="" selected disabled>Estado de liberaci�n</OPTION>
                <OPTION VALUE="NC">NO CONFORME</OPTION> 
                <OPTION VALUE="PNC">POTENCIALMENTE NO CONFORME</OPTION>
                <OPTION VALUE="PNC-NC">POTENCIALMENTE NO CONFORME - NO CONFORME</OPTION>
            </select>   
                
        <span class="input-group-addon">-</span>
            Motivo de retencion
            <select class="form-control" name="motivo_retencion" id="motivo_retencion" multiple="multiple" >
                <%
                clases.controles.connectarBD();  
                Statement stmt = clases.controles.connect.createStatement();
                ResultSet rs2 = stmt.executeQuery( "select * from motivo_retencion where tipo='motivo'");
                while(rs2.next())
                {%>    
                <OPTION VALUE="<%=rs2.getString("descripcion")%>"><%=rs2.getString("descripcion")%></OPTION> 
                <%}%>  
            </select>  
            </div> 
            <br>
            <select class="form-control" name="disposicion" id="disposicion"  >
                <OPTION  value="" disabled selected >DISPOSICION</OPTION>
              <%    ResultSet rs4 = stmt.executeQuery( " select * from motivo_retencion where tipo='disposicion'");
                    while(rs4.next())   
                {%>    
                <OPTION VALUE="<%=rs4.getString("id")%>"><%=rs4.getString("descripcion")%></OPTION> 
                <%}%>  
            </select> 
        </div> 
            <input type="button"   class="form-control btn-light-blue " value="BUSCAR" onclick="buscar_lotes_movimientos();">
            <br>
               <br>
        <div class="input-append" id="divid_grilla_retenido" >
        </div>
        <input type="submit" value="REGISTRAR" class="form-control btn-primary">       
        <table id="tabla_lotes"  data-row-style="rowStyle" class="cell-border stripe hover" data-toggle="table" data-click-to-select="true"">
            <thead>
                <tr>
                    <th ></th>
                    <th class="ocultar">Cod interno</th>
                    <th class="ocultar">Cod lote</th>
                    <th>Cod carrito</th>
                    <th>Tipo huevo</th>
                    <th>Estado liberacion</th>
                    <th class="ocultar">Cod. estado costeo</th><!-- "Tipo" NO CAMBIAR, VERIFICA SI SE SELECCIONAN TODAS LAS FILAS, ENTONCES COMPARO SI EN LA POSICION 6 ES IGUAL A Tipo, QUE NO SUME COMO VALOR. -->
                    <th class="ocultar">Cod. Disposicion</th>
                    <th class="ocultar">Estado costeo</th>
                    <th>Disposicion</th>
                    <th>Motivo retencion.</th>
                    <th>Horario Clas.</th>
                    <th>Fecha involucrada.</th>
                    <th>Aviarios involucrados.</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
       
    </form>
       
     <%clases.controles.DesconnectarBD();%>
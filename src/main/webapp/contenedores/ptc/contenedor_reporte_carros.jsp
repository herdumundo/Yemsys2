 <%@include  file="../../chequearsesion.jsp" %>

<%    String area = (String) sesionOk.getAttribute("clasificadora"); %>
     <br>
     <form  action="cruds/ptc/control_reporte_carros.jsp"  target="_blank">
        <div class="input-append">  
            <input type="checkbox"  class="checkbox"  data-toggle="toggle" data-on="INVOLUCRADA"     data-off="PUESTA"   id="check_tipo_calendario"             data-onstyle="warning" data-offstyle="success">
            <br>
            <input id="tipo_calendario"    name="tipo_calendario"  value="PUESTA"  type="hidden" />
            <input id="calendario_reporte_carros" name="calendario_reporte_carros" id="calendario_reporte_carros" class="datepicker" type="text"  width="276" required="true"  />
        </div> 
        <div class="input-append">  
            <a>FECHA DE CLASIFICACION</a>
            <input id="calendario_reporte_clasificacion" name="calendario_reporte_clasificacion" id="calendario_reporte_clasificacion" class="datepicker" type="text"  width="276" required="true"  />
        </div> 
        <br> 
        <a >ESTADO DE LIBERACION</a> 
        <select class="form-control" name="cbox_estado" id="cbox_estado" required="true"> 
            <OPTION value="" selected disabled>SELECCIONAR ESTADO DE LIBERACION</OPTION>
            <OPTION   VALUE="L">LIBERADO</OPTION>
            <OPTION   VALUE="R">RETENIDO</OPTION>
        </select>   
        <br> 
        <a>TIPO DE HUEVO</a> <br>
            <select class="selectpicker" name="tipo_huevo" id="tipo_huevo" multiple data-live-search="true" required="required" data-actions-box="true" > 
                <OPTION   VALUE="A">A</OPTION>
                <OPTION   VALUE="B">B</OPTION>   
                <OPTION   VALUE="C">C</OPTION>
                <OPTION   VALUE="D">D</OPTION>
                <OPTION   VALUE="S">S</OPTION>   
                <OPTION   VALUE="J">J</OPTION>
                <OPTION   VALUE="G">G</OPTION>
            </select> 
            <br> <br> 
             <a>FILTRO POR AVIARIO</a> 
            <input type="checkbox"  class="checkbox"  data-toggle="toggle" data-on="SI"     data-off="NO"   id="check_filtro_aviario"  data-onstyle="warning" data-offstyle="success">
            <br>
            <input id="filtro_aviario"    name="filtro_aviario"  value="NO"  type="hidden" />
            <BR>
            <div id="div_aviarios" style="display: none">
            <a>SELECCION DE AVIARIOS POR FILTRAR</a>
 <select class="selectpicker" name="aviarios" id="aviarios" multiple data-live-search="true"  data-actions-box="true"> 
                <OPTION   VALUE="<%=area%>1"><%=area%>1</OPTION>
                <OPTION   VALUE="<%=area%>2"><%=area%>2</OPTION>   
                <OPTION   VALUE="<%=area%>3"><%=area%>3</OPTION>
                <OPTION   VALUE="<%=area%>4"><%=area%>4</OPTION>
                <OPTION   VALUE="<%=area%>5"><%=area%>5</OPTION>   
                <OPTION   VALUE="<%=area%>6"><%=area%>6</OPTION>
                <OPTION   VALUE="<%=area%>7"><%=area%>7</OPTION>
                <OPTION   VALUE="<%=area%>8"><%=area%>8</OPTION>
                <OPTION   VALUE="<%=area%>9"><%=area%>9</OPTION>
                <OPTION   VALUE="<%=area%>10"><%=area%>10</OPTION>
                <OPTION   VALUE="<%=area%>11"><%=area%>11</OPTION>
                <OPTION   VALUE="<%=area%>12"><%=area%>12</OPTION>
                
            </select>    
                </div>
        <div id="boxColor">  
             <center><a>HORARIO DE CLASIFICACION</a>  </center>
            <br>
                <div class="input-group">
                    <b>   Hora inicio</b>
                    <input type="text" data-field="time"  autocomplete="off"  placeholder="HORA DE INICIO"  name="desde" id="desde"    >
                    <div class="dtBox"id="dtBox_inicio">
                    </div>
                </div>
            <br>
            <br>
            <div class="input-group">
                <b>   Hora final</b>
                <input type="text" data-field="time"  autocomplete="off"   placeholder="HORA DE FINALIZACION" name="hasta" id="hasta"    >
                <div class="dtBox" id="dtBox_final">
                </div>
            </div>
            <br>
            <br>
        </div>
        <br>  
        <br> 
        <input   class="btn  btn-success form-control" type="submit"   value="Generar reporte"> 
    
    
         
   
    
    
    
    </form> 
    
    
    
   

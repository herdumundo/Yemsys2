 <form id="formulario_reporte_reproceso" name="formulario_reporte_reproceso" action="cruds/mis/control_reporte_reproceso.jsp" target="_blank">
       
     <div class="form-control bg-navy" style="font-weight: bold;color:black;"><center> GENERACION DE REPORTES DE REPROCESOS Y SUBPRODUCTOS.</center></div>  
  
     
    <div class="input-append">  
    <a>FECHA DE CLASIFICACION</a>  
        
    <input id="calendario_reporte_reproceso" name="calendario_reporte_reproceso" class="datepicker" required="true"  />
    
    
    </div> 
    
    <br> 
        <select class="form-control" name="cbox_reproceso_pdf" id="cbox_reproceso_pdf">
            <OPTION selected disabled>Seleccione reproceso o subproducto</OPTION>
            <OPTION VALUE="RP">REPROCESO</OPTION>
            <OPTION VALUE="PI">SUBPRODUCTO</OPTION>
        </select>   
    <br> 
      
        <select class="form-control" name="cbox_categoria_reproceso_pdf" id="cbox_categoria_reproceso_pdf">
                <OPTION selected disabled>Seleccione categor�a</OPTION>
                <OPTION VALUE="FCO">FCO</OPTION>
                <OPTION VALUE="LDO">LDO</OPTION>
        </select> 
            <br>    <br> 
         <input style="width:260px; height:80px" class="btn btn-success" type="submit" value="Generar reporte"> 
        
          
      </form> 
   
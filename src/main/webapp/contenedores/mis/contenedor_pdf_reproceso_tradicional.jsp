 <form id="formulario_reporte_reproceso" name="formulario_reporte_reproceso" action="cruds/mis/control_reporte_reproceso_tradicional.jsp" target="_blank">
     <input type="hidden" id="tipo" name="tipo" value="RP">
     <div class="form-control bg-info" style="font-weight: bold;color:black;"><center> GENERACION DE REPORTES AVIARIOS TRADICIONALES REPROCESOS.</center></div>  
     <br>
    <div class="input-append">  
        <a>FECHA DE PUESTA</a>
        <input id="calendario_reporte_reproceso" name="calendario_reporte_reproceso" data-format="dd/mm/yyyy"  width="276" required="true"  />
     </div> 
    
    <br> 
        
    
         <input   class=" form-control btn btn-success " style="font-weight: bold;color:black;"type="submit" value="Generar reporte"> 
        
          
      </form> 
   
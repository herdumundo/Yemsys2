   
 
 
     
<form id="formulario_reporte_reproceso" name="formulario_reporte_reproceso" action="control_reporte_reproceso.jsp" >
    
     
    <div class="input-append">  
        <input id="calendario_reporte_reproceso" name="calendario_reporte_reproceso" data-format="dd/mm/yyyy"  width="276" required="true"  />
    
    
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
   
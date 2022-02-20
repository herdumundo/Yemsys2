 <!DOCTYPE html>
 <%@ page session="true" %>
<%@include  file="../../chequearsesion.jsp" %>
<%    
      String clasificadora = (String) sesionOk.getAttribute("clasificadora");
      sesionOk.setAttribute("area",clasificadora);
 %>
    <div class="input-append">  
              <div class="form-control bg-navy" style="font-weight: bold;color:black;"><center> VISUALIZACION DE INFORMES REGISTRADOS.</center></div>  

        <a>Fecha de clasificación</a>
        <input id="calendario_informe" class="datepicker" width="276"    />
        
        <input type="button" class="form-control bg-navy"value="Buscar" onclick="principal_mis()">
    </div> 
   <br>   
 <div  id="div_grilla"  >
         </div>  
      
       

     
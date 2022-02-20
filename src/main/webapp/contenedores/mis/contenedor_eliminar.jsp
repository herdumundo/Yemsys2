<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
 <jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
<%@include  file="../../chequearsesion.jsp" %>
 
     <div class="container-fluid">
        
      <div class="form-control bg-navy" style="font-weight: bold;color:black;"><center> ELIMINACIÓN DE REGISTROS.</center></div>  
     <br>
         <input   style="display: none"id="text_id_eliminar" name="text_id_eliminar" type="text" >
       
       
     <div class="input-append">  
         <a>Fecha de clasificación</a>
         <input id="calendario_eliminar"  class="datepicker"  width="276" />
  </div>  
         <button   class="btn bg-navy "  onclick="traer_detalle_eliminar_mis($('#calendario_eliminar').val());">BUSCAR</button> 
    <br>
        <div id="div_eliminar"  >
            
        
        </div>   
    
    
    
        </div>
        
        
        
        
      
  <%@page import="clases.controles"%>
<%@ page language="java" import="java.sql.*" errorPage="error.jsp" %>
  <jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>   
<%@include  file="../../chequearsesion.jsp" %>
      <%
        String area_registro = (String) sesionOk.getAttribute("clasificadora"); 
        String area_format=    (String) sesionOk.getAttribute("area_fallas");
        controles.VerificarConexion();
        Connection cn = controles.connectSesion;
        fuente.setConexion(cn);           //CAMBIAR BASE DE DATOS                                                                                                                                                                                                                                                                                                                                                                                                                //CAMBIAR BASE DE DATOS       
        ResultSet rs = fuente.obtenerDato("SELECT  convert(varchar,getdate(),111) as fecha,REPLACE(CONVERT(VARCHAR(10),  convert(varchar,getdate(),103), 5),'/','') ");
       while(rs.next()){          
 %>    
     
 <form method="post"   id="formulario">
     
            <div class="input-append">  
            <span class="input-group-addon">Fecha de recepcion</span>
            <input id="calendario_registro" name="calendario_registro" data-format="yyyy/mm/dd"  width="276"  value="<%=rs.getString(1)%>"   />
           
            <input id="id_date" name="id_date" style="display: none" type="text"  width="276"  value="<%=rs.getString(2)%>"   />
            <input id="id_clasificadora" name="id_clasificadora" style="display: none"  type="text"  width="276"  value="<%=area_registro%>"   />
            
            <input type="hidden" value="8" id="tipo_huevo">
            <input type="hidden" value="T" id="tipo_aviario">
            <input type="hidden" value="1" id="unidad_medida">
             
              
            </div> 
            <br>
            
            <span class="input-group-addon">Fecha de puesta</span>
            <input id="fecha_puesta" name="fecha_puesta" data-format="yyyy/mm/dd"  width="276" value="<%=rs.getString(1)%>" placeholder="Fecha puesta"  />
                    <%} %> 
         
    
            <span class="input-group-addon">Codigo de carro/mesa</span>
            <input name="cod_carrito" id="cod_carrito" type="number"  autocomplete="off"  class="form-control" placeholder="Codigo carrito,Mesa,Pallet" onkeyup="contar()"  >
            
             
             
    
        
        <br>
         <div class="form-group">
       Cantidad
            <div class="input-group" style="display: none" id="div_kgramos">
          <input name="txt_kg" id="txt_kg"  type="number" class="form-control"  placeholder="KILOGRAMOS"  >
           <span class="input-group-addon">-</span>
          
             <input name="txt_gramos" id="txt_gramos"   type="number" class="form-control"  placeholder="GRAMOS"  >
  
            </div>
        
            <div class="input-group" id="div_cant_plancha">
                <input name="txt_plancha" id="txt_plancha"  type="number" class="form-control"  placeholder="PLANCHAS" >
                -<input name="txt_unidad" id="txt_unidad"  type="number" class="form-control"  placeholder="UNIDADES"  >
            </div> 
         </div>
      
        <br>
        <div class="form-group" id="div_responsable_liberado">
           
                <span class="input-group-addon">Aviarios</span>
                <input name="txt_responsable" style="text-transform: uppercase;" autocomplete="off" id="txt_responsable" type="text" class="form-control" placeholder="INGRESE NRO DE AVIARIO">
        
        </div>   
         <input name="txt_obs" style="text-transform: uppercase;display: none"   value="AVIARIO TRADICIONAL" id="txt_obs" type="text" autocomplete="off"    class="form-control" placeholder="Comentario">
            <br>
            <br>
            <input name="text_resultado" style="display: none"  id="text_resultado" type="text"   lass="form-control">
            <input type="button" value="Registrar" id="btn_registrar" name="btn_registrar" class="form-control btn btn-primary  " style="  height:50px" onclick="procesar_aviario_tradicionales();"   />
            <br> 
            <br> 
            <input onClick="traer_menu()" type="button" value="Cancelar" name="btnCancelar" style="  height:50px"  class="form-control btn btn-success " />

</form>
     
            
           
  
</div>

   
      
    
     
        
        
        
 
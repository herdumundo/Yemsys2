<%@page import="clases.controles"%>
<%@page import="clases.fuentedato"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page session="true" %>
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page" />
 <%     
    clases.controles.connectarBD();
    fuente.setConexion(clases.controles.connect);
    ResultSet rs,rs2;
    rs = fuente.obtenerDato("select * from  maehara.dbo.[@CAMIONES] where u_estado='Activo' and   u_desc<>'' ");
    rs2 = fuente.obtenerDato("select code,name  from maehara.dbo.[@CHOFERES] where U_estado='activo'");

%>
<div>
     
<div  class=" form-control bg-navy" role="alert">
         <strong style="color: white;"  ><center>Registro de pedido.</center></strong> 
    </div>   
    
        <div id="div_pedido"> 
    <a style="font-weight: bold;color:black">SELECCIONE CAMION</a> 

    <select id="cbox_camion" class="btn btn-dark"  style="font-weight: bold;color:white;" onchange="separar_codigo_camion();">
        <option value="-">CAMION</option>
        <%while(rs.next())
        { %><option id="<%=rs.getString("u_capacidad")%>_<%=rs.getString("code")%>" value="<%=rs.getString("u_capacidad")%>_<%=rs.getString("code")%>"><%=rs.getString("code")%>-<%=rs.getString("u_desc")%> </option><%  } %>
    </select>
     <a style="font-weight: bold;color:black">SELECCIONE CHOFER</a> 
    <select id="cbox_chofer" class="btn btn-dark"  style="font-weight: bold;color:white;" onchange="separar_codigo_camion();">
        <option value="-">CHOFER</option>
        <%while(rs2.next())
        { %><option id="<%=rs2.getString("code")%>" value="<%=rs2.getString("code")%>"><%=rs2.getString("name")%> </option><%  } %>
    </select>
    
     
    
    <a style="font-weight: bold;color:black">DISPONIBILIDAD:</a><input type="text" disabled id="txt_disponibilidad" style="font-weight: bold;color:black" value="0" >
    <a style="font-weight: bold;color:black">CARROS CARGADOS:</a><input type="text" disabled id="txt_cargados" style="font-weight: bold;color:black" value="0" >
    <input type="hidden" id="id_pedido"> 
    <input type="hidden" id="validacion_cantidades"> 
    <input type="hidden" id="validacion_tipos"> 
    
    <br> <br>
   
    
        <form  class="row align-items-end"  action="cruds/logistica/control_reporte_log_stock_ptc.jsp" target="_blank">
            <input type="button" value="GENERAR PEDIDO" class="form-control col bg-success inline" id="btn_generar"style="font-weight: bold;color:white;"   >
            <input type="submit" value="GENERAR REPORTE" class="form-control col bg-dark "  style="font-weight: bold;color:white;"   >

       </form> <br>
       
       <input type="text" placeholder="Observaci�n (Opcional)" id="txt_obs" class="form-control"><br> 
     
    
       </div>
       
       <div class="container my-4">
        <button id="modalActivate" type="button" class="btn bg-navy form-control" data-toggle="modal" data-target="#exampleModalPreview">
        Abrir ventana de pedidos
        </button>
        <!-- Modal -->
        <div class="modal fade right" id="exampleModalPreview" tabindex="-1" role="dialog" aria-labelledby="exampleModalPreviewLabel" aria-hidden="true">
            <div class="modal-dialog-full-width modal-dialog momodel modal-fluid" role="document">
                <div class="modal-content-full-width modal-content ">
                    <div class=" modal-header-full-width   modal-header text-center">
                         <button type="button" class="close " data-dismiss="modal" aria-label="Close">
                            <span style="font-size: 1.3em;" aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <a style="font-weight: bold;color:black">CARROS RESTANTES:</a><input type="text" disabled id="txt_restantes" style="font-weight: bold;color:black" value="0" >
                        <div id="contenido_grillas">

                        </div>  

                    </div>
                    <div class="modal-footer-full-width  modal-footer">
                        <button type="button" class="btn btn-danger btn-md btn-rounded" data-dismiss="modal">Cerrar</button>
                     </div>
                </div>
            </div>
        </div>
    </div>


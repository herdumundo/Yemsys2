  <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
 <%@ page session="true" %>
 <jsp:useBean id="fuente" class="clases.fuentedato" scope="page" />

 <%@include  file="../../chequearsesion.jsp" %>
<%    
      String clasificadora = (String) sesionOk.getAttribute("clasificadora");
 %>

    <form id="formulario" action="post">
        <div class="form-control bg-warning" style="font-weight: bold;color:black;" onclick="grilla_recogidas_liberadas()" ><center>Huevos pendientes de recogidas</center></div>
        <a>Fecha puesta</a>
        <input type="text" id="fecha_puesta" name="fecha_puesta" placeholder="Ingrese fecha de puesta" class="form-control  datepicker" required>
        <br>
        <a>Cantidad</a>

        <input type="number" class="form-control" id="txt_cantidad" name="txt_cantidad" placeholder="Ingrese cantidad" required>
        <br>
        <input type="submit" class="form-control btn-primary" value="Registrar"  >

        <div id="grilla_recogida">
            
 <table id="grilla_eliminar" class="table table-striped table-bordered" style="width:100%">
                <thead>
                  
                    <th>
                    Fecha de puesta
                    </th>
                    <th>
                    Cantidad
                    </th>
                   <th>
                    Liberar
                    </th> 
                    <th>
                    Eliminar
                    </th> 
                </thead>
            <tbody id="grilla_liberar">
            <%

        clases.controles.connectarBD();   
        Connection cn = clases.controles.connect; 
        fuente.setConexion(cn);
        ResultSet rs = fuente.obtenerDato(" select convert(varchar,fecha_puesta,103) as fp,* from  mae_ptc_pendientes_recogidas where clasificadora='"+clasificadora+"' and estado='1'");
            while(rs.next())
                {%>  
                <tr id="<%=rs.getString("id")%>">  
                    <td> <b><%=rs.getString("fp")%>  </b></td>
                    <td> <b><%=String.format("%,d", rs.getInt("cantidad"))%></b></td>
                   
                    <td> <i class="fas fa-cart-plus fa-2x text-warning  " onclick="liberar_recogida('<%=rs.getString("id")%>','DESEA LIBERAR LOS PENDIENTES?','2')" ></i>
                    <td> <i class="fas fa-trash fa-2x text-danger  " onclick="liberar_recogida('<%=rs.getString("id")%>','DESEA ELIMINAR EL REGISTRO?','5')" ></i>
                    </td>  
                <%}
                    cn.close();
                    clases.controles.DesconnectarBD();
                %>   
                </tr> 
            </tbody>   
    </table>   
      

        </div>

    </form>   
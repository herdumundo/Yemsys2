<%-- 
    Document   : informe_factura
    Created on : 05/03/2020, 11:04:47 AM
    Author     : hvelazquez
--%>
<%@page import="clases.embarque"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
   <%@include  file="../../chequearsesion.jsp" %>

<!DOCTYPE html>
<body>
    <%     
        
        
           try {
        
    String area =(String) sesionOk.getAttribute("area");
    String fecha =request.getParameter("calendario");
    clases.controles.VerificarConexion();
   // Connection cn = clases.controles.connectSesion;
    fuente.setConexion( clases.controles.connectSesion); 
    ResultSet rs;
    String nro_factura = "";
    String chofer = "";
    String camion = "";
    String id = "";
    String user = "";
        
         
        rs = fuente.obtenerDato (" select a.id, a.area,a.fecha_embarque,a.nro_factura,b.Name as chofer, c.Name as camion, usuario_grupomaehara "
                + "from "
                + "embarque_cab   a with(nolock) "
                + "inner join "+clases.variables.BD2+".dbo.[@CHOFERES]   b with(nolock) on a.id_chofer=b.Code "
                + "inner join "+clases.variables.BD2+".dbo.[@CAMIONES]  c with(nolock) on a.id_camion=c.Code "
                + "where "
                        + "convert(varchar,fecha_embarque,103)='"+fecha+"' and area='"+area+"'");
            while (rs.next())
            {             
              nro_factura=rs.getString("nro_factura");
              chofer=rs.getString("chofer");
              camion=rs.getString("camion");
              id=rs.getString("id");
              user=rs.getString("usuario_grupomaehara");
              
   %>
   <form  action="cruds/embarques/control_reporte_embarque.jsp" target="_blank" >
            
       <div class="row">
            <div class="col-12">

                <div class="card">
                    <div class="card-header bg-navy">
                        <h3 class="card-title">  Embarque nro: <%=id%>  </h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                <i class="fas fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    </div>
                    <div class="card-body">
                         <input style="display: none" type="text" name="numero" value="<%=id%>">
                         <table class="table">
                             <thead>
                            <tr><th>Factura</th>
                             <th>Fecha</th>
                             <th>Usuario</th>
                             <th>Chofer</th>
                             <th>Camión</th></tr>
                             </thead>
                             <tbody>
                                 <tr>
                                     <td><%=nro_factura%> </td>
                                     <td><%=fecha%> </td>
                                     <td><%=user%> </td>
                                     <td><%=chofer%> </td>
                                     <td><%=camion%> </td>
                                      
                                 </tr>  
                             </tbody>
                         </table>
                    </div>

                    <div class="card-footer">
                        <input type="submit" class="form-control bg-navy"  value="IR A REPORTE">
                    </div>

                </div>

            </div>
        </div>     

                    
           
  </form>
        <%} 
            rs.close();
          //  cn.close();
           // clases.controles.DesconnectarBD();
         } 
    catch (Exception e) {
 String d=e.toString();
}
                 
        %>
         
 </body>
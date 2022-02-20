<%-- 
    Document   : control_ot
    Created on : 07/04/2021, 08:53:01 AM
    Author     : hvelazquez
--%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page session="true" %>
<%@include  file="../../chequearsesion.jsp" %>
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page" />
<%@page contentType="application/json; charset=utf-8" %>

<%    
    clases.controles.connectarBD();
    fuente.setConexion(clases.controles.connect);
    JSONObject ob = new JSONObject();
    ob=new JSONObject();
    String usuario       = (String) sesionOk.getAttribute("usuario");
    String id        = request.getParameter("id");
    String nro_factura        = request.getParameter("cbox_factura");
    
    String mensaje="";
    int tipo_respuesta=0;    
    try 
    {
        clases.controles.connect.setAutoCommit(false);
        CallableStatement  callableStatement=null;   
        callableStatement = clases.controles.connect.prepareCall("{call [mae_log_ptc_pedidos_facturar](?,?,?,?,?)}");
        callableStatement .setString(      1,   usuario  );
        callableStatement .setString(   2,      id  );
        callableStatement .setString(   3,      nro_factura  );
         
        callableStatement.registerOutParameter("estado_registro", java.sql.Types.INTEGER);
        callableStatement.registerOutParameter("mensaje", java.sql.Types.VARCHAR);
        callableStatement.execute(); 
        tipo_respuesta = callableStatement.getInt("estado_registro");
        mensaje= callableStatement.getString("mensaje");
        if (tipo_respuesta==0)
        {
            clases.controles.connect.rollback(); 
        }   
        else  
        {
            clases.controles.connect.commit();
        }
            clases.controles.DesconnectarBD();
            ob.put("mensaje", mensaje);
            ob.put("tipo_respuesta", tipo_respuesta);
    } 
    catch (Exception e) 
    {           
        ob.put("mensaje", e.toString());
        ob.put("tipo_respuesta", "0");
    }
    out.print(ob); %>
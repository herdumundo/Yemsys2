  
<%@page import="org.json.JSONObject"%>
<%@page import="clases.controles"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@include  file="../../chequearsesion.jsp" %>
<%@ page contentType="application/json; charset=utf-8" %>
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
        <% 
        clases.controles.VerificarConexion();
       // Connection cn = clases.controles.connect;        
        fuente.setConexion(controles.connectSesion);  
        String  numero_factura      = request.getParameter("numero_factura") ;
        String  area                =(String)sesionOk.getAttribute("area_gm");
 	String  tipo_huevo          = request.getParameter("tipo_huevo") ;
	int     cantidad            = Integer.parseInt(request.getParameter("cantidad")) ;
	int     cod_huevo           = Integer.parseInt(request.getParameter("cod_huevo")) ;
	String  cod_lote            = request.getParameter("cod_lote") ;
	int     carro               = Integer.parseInt(request.getParameter("carro")) ;
 	String  fecha_puesta        = request.getParameter("fecha_puesta") ;
	String  estado_lote         = request.getParameter("estado_lote") ;
	int     identificador_lote  = Integer.parseInt(request.getParameter("identificador_lote")) ;
        int     mensaje             =0;
        
             try { 
            controles.connectSesion.setAutoCommit(false);
            CallableStatement  callableStatement=null;   
            String getDBUSERByUserIdSql = "{call pa_embarque_pendientes( ?, ?, ?, ?, ? ,?,?,?,?,?,?)}";
            callableStatement = controles.connectSesion.prepareCall(getDBUSERByUserIdSql);
            callableStatement .setString(   1,  area );
            callableStatement .setString(   2,  tipo_huevo);
            callableStatement .setInt(      3,  cantidad);
            callableStatement .setInt(      4,  cod_huevo);
            callableStatement .setString(   5,  cod_lote);
            callableStatement .setInt(      6,  carro );
            callableStatement .setString(   7,  numero_factura.substring(numero_factura.length() - 7));
            callableStatement .setString(   8,  fecha_puesta);
            callableStatement .setString(   9,  estado_lote);
            callableStatement .setInt(      10, identificador_lote );
            callableStatement.registerOutParameter("mensaje", java.sql.Types.INTEGER);
            callableStatement.execute();
            mensaje = callableStatement.getInt("mensaje");
            controles.connectSesion.commit();
           } catch (Exception e) {
        
        controles.connectSesion.rollback();
        String error=e.toString();
        
         }
       
     JSONObject ob = new JSONObject();
     ob=new JSONObject();
      clases.controles.DesconnectarBD();
      out.print(ob); 
        %>  
   
 

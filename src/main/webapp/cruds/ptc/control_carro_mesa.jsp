<%@page import="clases.controles"%>
<%@page import="java.sql.PreparedStatement"%>
 <jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@page import="java.sql.Connection"%>
<%@include  file="../../chequearsesion.jsp" %>
<%     
   
    clases.controles.connectarBD();  
    Connection cn = clases.controles.connect;
    fuente.setConexion(cn);   
    String  codigo_mesa  = request.getParameter("codigo_mesa");
    String id_lote=request.getParameter("codigo_carro");
    PreparedStatement pss = cn.prepareStatement("update lotes set cod_cambio ='"+codigo_mesa+"' where cod_interno='"+id_lote+"' ");
    pss.executeUpdate();
    cn.close();
    controles.DesconnectarBD();
%> <a> CARRITO NRO <b> </b>, REGISTRADO COMO </a><br><br>     
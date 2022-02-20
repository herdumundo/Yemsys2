  <%@page import="clases.controles"%>
<%@page import="clases.variables"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.swing.JOptionPane"%>
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@ page contentType="application/json; charset=utf-8" %>

<%@include  file="../../chequearsesion.jsp" %>
<%
        clases.controles.connectarBD();  
        Connection cn = clases.controles.connect;
        fuente.setConexion(cn);   
        String  seleccionados       =request.getParameter("caja_check");
        String combo_disposicion    =request.getParameter("disposicion");
        String fecha_alimentacion   =request.getParameter("calendario_alimentacion");
        String nro_mesa             =request.getParameter("txt_nro_mesa");
        String liberado_por         =request.getParameter("txt_lib");
        String usuario              =(String) sesionOk.getAttribute("usuario");
        String  combo_disposicion_insert=request.getParameter("disposicion_insert");
        String lote="";
        int tipo_envio=0;
        String tipo_mensaje="";
        String mensaje="";
        String tipo_costeo="";
        int cod_interno=0;
        String[] elementos = seleccionados.split(",");
        int res_out=1;
        int resultad_final=1;
            
        String variable=variables.valor_procedure;
   try {    
          
        if(combo_disposicion.equals(combo_disposicion_insert)){
             tipo_envio=1;
         }
     //    6      REPROCESAR LAVAR 7  REPROCESAR RECLASIFICAR   8    ACEPTAR TAL CUAL   
    //     9 CORRECCION            27 AMPLIACION DE LA MUESTRA  30 CONSTATACION DE GCA
        else if (combo_disposicion_insert.equals("6")||combo_disposicion_insert.equals("7")||combo_disposicion_insert.equals("8")
        ||combo_disposicion_insert.equals("9")||combo_disposicion_insert.equals("27")||combo_disposicion_insert.equals("30"))
                    {
                 tipo_envio=2;
                           
                    } 
      
         cn.setAutoCommit(false);
        for(int i=0; i<elementos.length; i++){
      String [] sub_contenido=elementos[i].split("-");

        lote=sub_contenido[0];
        cod_interno=Integer.parseInt(sub_contenido[1]);
        tipo_costeo=sub_contenido[2];
        CallableStatement  callableStatement=null;   
            callableStatement = cn.prepareCall("{call mae_ptc_insert_disposicion( ?, ?, ?, ?, ? ,?,?,?,?,? )}");
            callableStatement .setString(1, lote);
            callableStatement .setString(2, nro_mesa);
            callableStatement .setString(3, fecha_alimentacion);
            callableStatement .setString(4, combo_disposicion_insert);
            callableStatement .setInt(5, tipo_envio);//HACE REFERENCIA AL TIPO_ENVIO.
            callableStatement .setString(6, liberado_por);
            callableStatement .setString(7, usuario);
            callableStatement .setInt(8, cod_interno);
            callableStatement .setString(9, tipo_costeo);//HACE REFERENCIA AL TIPO_REGISTRO.
            
            
             callableStatement.registerOutParameter("mensaje", java.sql.Types.INTEGER);
            callableStatement.execute();
            res_out = callableStatement.getInt("mensaje");
                resultad_final=resultad_final*res_out;
         }
           if(resultad_final==0)
            {
                cn.rollback();
            tipo_mensaje="0";
            mensaje="HUBO UN ERROR AL REGISTRAR LA DISPOSICION.";   
            }
           else if (resultad_final==1)
            {
              cn.commit();
               tipo_mensaje="1";
            mensaje="REGISTRADO CON EXITO.";   
           
            }
        
        
        
        } 
            catch (Exception e) {
            tipo_mensaje="0";
            mensaje=e.toString();
                
                                } 

        JSONObject ob = new JSONObject();
        ob=new JSONObject();
        ob.put("tipo_mensaje", tipo_mensaje);
        ob.put("mensaje", mensaje);
        
        cn.close();
        controles .DesconnectarBD();
        out.print(ob); 
       
       
            %>
           
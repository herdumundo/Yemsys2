<%@page import="clases.controles"%>
<%@page import="clases.variables"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<jsp:useBean id="fuente" class="clases.fuentedato" scope="page"/>
<%@ page contentType="application/json; charset=utf-8" %>
<%@include  file="../../chequearsesion.jsp" %>
<%  
    clases.controles.connectarBD();  
    Connection cn = clases.controles.connect;
    fuente.setConexion(cn);
    JSONObject ob = new JSONObject();
    ob=new JSONObject();
    String fecha_puesta         =   request.getParameter("fecha_puesta");
    String codigo_cepillado     =   request.getParameter("codigo_cepillado");
     String clasificadora        =   (String) sesionOk.getAttribute("clasificadora");
    String nrocarro             =   request.getParameter("cod_carrito");
    String codigo_borroso       =   request.getParameter("codigo_borroso");
    String tipo_maples          =   request.getParameter("tipo_maples");
    String codigo_especial      =   request.getParameter("codigo_especial");
    // String tipo_huevo           =   request.getParameter("tipo_huevo");
    String planchas             =   request.getParameter("txt_plancha");
    String granel             =   request.getParameter("txt_unidad");
    //String unidad_medida        =   request.getParameter("unidad_medida");
    String categoria            =   (String) sesionOk.getAttribute("categoria");
    String hora_desde_minutos           =   request.getParameter("hora_desde");
    String hora_hasta_minutos           =   request.getParameter("hora_hasta");
    String fecha                =   request.getParameter("calendario_registro");
    String tipo_aviario         =   request.getParameter("tipo_aviario");
    //String tipo_almacenamiento  =   request.getParameter("tipo_almacenamiento");
    String responsable          =   request.getParameter("txt_responsable");
    String liberado             =   request.getParameter("txt_liberado");
    String comentario           =   request.getParameter("txt_obs");
    String nombre_usuario       =   (String) sesionOk.getAttribute("nombre_usuario");
    String fecha_fin            =   request.getParameter("fecha_clas_final");
    String tipo_reco            =   request.getParameter("tipo_reco");
    
    
    
    int cantidad_bd=0;
    int cantidad_movimiento=0;
    int cantidad=0;
    String mensaje="";
    int tipo_respuesta=0;
    String combobox="N/A";
     String aviarios="";
    // String tipo_huevo_formateado=""; 
    String unidad_format="";
    String lote=nrocarro+"_"+fecha_puesta.replace("/","")+"_"+categoria+"_SC";
    String contenido_cajones_cargados= "";
    String table_cuerpo= "";
     String[] array_aviarios = request.getParameterValues("cbox_aviarios");
    String fechas_involucradas = request.getParameter("txt_fecha_involucrada");
    String hora_desde=hora_desde_minutos.substring(0,2);
    String hora_hasta=hora_hasta_minutos.substring(0,2);
    String carro_almacenamiento="";
    
    carro_almacenamiento=nrocarro.substring(0,1);
    String tipo_almacenamiento="";
     if(carro_almacenamiento.equals("6")){
                tipo_almacenamiento="C";                            
    }
    else if(carro_almacenamiento.equals("7")){
                tipo_almacenamiento="M";                            
    }
    else  if(carro_almacenamiento.equals("9")){
                tipo_almacenamiento="P";                            
    }
   
      try {
           
          if(planchas.length()==0){
              planchas="0";
          }
          if(granel.length()==0){
              granel="0";
          }
          
            int cantidad_unidad_medida=0;
            cantidad_unidad_medida=(Integer.parseInt(planchas)*30)+Integer.parseInt(granel);
            cantidad_movimiento=((Integer.parseInt(planchas)*30)+Integer.parseInt(granel))/360;
            
            if(array_aviarios==null)
            {
            aviarios="";            
            }
            else 
            {
                for(int i=0; i<array_aviarios.length; i++)   
                {
               
                    if (array_aviarios.length>1)
                    {
                        if(i==0){
                        aviarios=array_aviarios[i];  
                        }
                        else 
                        {
                            aviarios=aviarios+ ","+array_aviarios[i];  
                        }
                    }
                    if (array_aviarios.length==1){
                        aviarios=array_aviarios[i];  
                    }
                }
            }
              
              ResultSet result_cantidad_existente=  fuente.obtenerDato("exec [mae_ptc_select_lotesCantExist_SC] @cod_carrito='"+nrocarro+"' ");
                
                if (result_cantidad_existente.next())
                {
                    cantidad_bd= result_cantidad_existente.getInt("cantidad");
                }
          
                if ((cantidad_bd+cantidad_movimiento)>12)
                {
                    //res_out= resultad_final;
                    tipo_respuesta=2;
                    mensaje="CANTIDAD EXCEDIDA, TOTAL DE CAJONES CARGADOS "+cantidad_bd;
                    //CANTIDAD EXCEDIDA
                    ResultSet consulta_tipos_cargados=  fuente.obtenerDato("exec [mae_ptc_select_tipos_cargados] @cod_carrito='"+nrocarro+"'");

                    while (consulta_tipos_cargados.next())
                     {
                         contenido_cajones_cargados=contenido_cajones_cargados+"<tr><td>"+consulta_tipos_cargados.getString("tipo_huevo")+"</td><td>"+
                         consulta_tipos_cargados.getString("cantidad")+"</td><td>"+consulta_tipos_cargados.getString("fecha_puesta")+"</td><td>"+
                         consulta_tipos_cargados.getString("clasificadora_actual")+"</td><td>"+consulta_tipos_cargados.getString("estado")+"</td></tr>";
                     } 
                     table_cuerpo="<table class='table'> "
                     + "<thead> <tr>  <th>Tipo</th><th>Cantidad</th><th>Puesta</th><th>Area</th><th>Estado</th></tr> </thead>"
                     + "<tbody>"+contenido_cajones_cargados+"</tbody></table> ";
                }
        else 
            {
                cn.setAutoCommit(false);
                CallableStatement  callableStatement=null;   
                callableStatement = cn.prepareCall("{call mae_ptc_insert_liberado(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
                callableStatement .setString(1,  fecha_puesta );
                callableStatement .setString(2,  fecha );
                callableStatement .setString(3, clasificadora);
                callableStatement .setString(4, nrocarro);
                callableStatement .setString(5, lote);
                callableStatement .setString(6, codigo_borroso);
                callableStatement .setString(7, tipo_maples);
                callableStatement .setString(8, codigo_especial);
                callableStatement .setString(9, "SC");
                callableStatement .setInt(10,   cantidad_unidad_medida  );
                callableStatement .setString(11, "GR");
                callableStatement .setString(12, categoria);
                callableStatement .setString(13, hora_desde);
                callableStatement .setString(14, hora_hasta);            
                callableStatement .setString(15, tipo_aviario);
                callableStatement .setString(16, tipo_almacenamiento);
                callableStatement .setString(17, "");
                callableStatement .setString(18, responsable);
                callableStatement .setString(19, comentario);
                callableStatement .setString(20, liberado);
                callableStatement .setString(21, combobox);
                callableStatement .setString(22, nombre_usuario);
                callableStatement .setString(23, codigo_cepillado);
                callableStatement .setString(24, hora_desde_minutos);
                callableStatement .setString(25, hora_hasta_minutos);
                callableStatement .setString(26, fecha_fin);
                callableStatement .setString(27, aviarios);
                callableStatement .setString(28, fechas_involucradas);
                callableStatement .setString(29, tipo_reco);

                callableStatement.registerOutParameter("estado_registro", java.sql.Types.INTEGER);
                callableStatement.registerOutParameter("mensaje", java.sql.Types.VARCHAR);
                callableStatement.execute();
                tipo_respuesta = callableStatement.getInt("estado_registro");
                mensaje= callableStatement.getString("mensaje");
                if (tipo_respuesta==0)
                {
                    cn.rollback(); 
                }   
                else  
                {
                    cn.commit();
                     //cn.rollback(); 
                }
               
              }
            ob.put("mensaje", mensaje);
            ob.put("tipo_respuesta", tipo_respuesta);
            ob.put("cajones_cargados", table_cuerpo);
          
         } catch (Exception e) 
         {           
            ob.put("mensaje", e.toString());
            ob.put("tipo_respuesta", "0");
            ob.put("cajones_cargados", table_cuerpo);
         }
            cn.close();
            controles .DesconnectarBD();
            out.print(ob); %>
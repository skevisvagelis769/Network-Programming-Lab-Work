<%-- 
    Document   : main.jsp
    Created on : Dec 2, 2025, 5:49:11 PM
    Author     : carabi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%! 
            public boolean isEmpty(String field){
                if(field.equals("")||field.equals(null)){
                    return true;
                }else {return false;}
            }
            public boolean isNum(String field){
                if (isEmpty(field)){return false;}
                try{
                    Float val  = Float.parseFloat(field);
                    return true;
                }catch(Exception e){return false;}
            }
        
        %>
        <% 
            String JDBC_DRIVER= "com.mysql.cj.jdbc.Driver";
            String db_URL = "jdbc:mysql://localhost:3306/dbproducts?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8";
            String dbUSER="proadmin";
            String dbPASS="78910";
            Connection dbConn=null;
            Statement dbStmt=null;
            String option = request.getParameter("option");
            try{
                Class.forName(JDBC_DRIVER);
                dbConn=DriverManager.getConnection(db_URL,dbUSER,dbPASS);
                if(dbConn!=null){
                    System.out.println("connected to the database!");
                    String bar = request.getParameter("bar");
                    String prodname = request.getParameter("prodname");
                    String price = request.getParameter("price");
                    String vat = request.getParameter("vat");
                    String desc = request.getParameter("desc");
                    
                    dbStmt=dbConn.createStatement();
                    if(option.equals("add")){
                        if(isEmpty(bar)||isEmpty(prodname)||isEmpty(price)||isEmpty(vat)||isEmpty(desc)){
                        response.sendRedirect("missingdata.html");
                        return;
                        }
                        if(!isNum(price)||!isNum(vat)||!isNum(bar)){
                            response.sendRedirect("errornumber.html");
                            return;
                        }
                        Float vatf = Float.parseFloat(vat);
                        Float pricef= Float.parseFloat(price);
                        String sql = "insert into products(prodcode,prodname,price,vat,description)" 
                                +"values (" +bar+",'"+prodname+"',"+price+","+vat+",'"+desc+"')";
                        int count = dbStmt.executeUpdate(sql);
                        if(count==1){out.print("New record!");out.print("<a href='index.html'>Go back</a>");}else{out.print("err");}
                        dbConn.close();
                    }else{
                        boolean prodflag=false,barflag=false,descflag=false;
                        if(prodname.equals("")&&bar.equals("")&&desc.equals("")){
                            String sql = "select * from products";
                        }
                        //SELECT * FROM products 
                         //   WHERE description LIKE CONCAT('%', ?, '%');

                        String sql="select * from products";
                        if(!prodname.equals("")){ sql= sql+" where prodname="+"'"+prodname+"'";prodflag=true; }
                        if(!bar.equals("")){ if (prodflag){sql= sql+" or prodcode="+bar;}
                        sql= sql+" where prodcode="+bar;barflag=true;}
                        if(!desc.equals("")){if(barflag){sql= sql+" or description="+"'"+desc+"'";}sql= sql+" where description="+"'"+desc+"'";descflag=true; }
                        ResultSet dbRs = dbStmt.executeQuery(sql);
                        if(!dbRs.isBeforeFirst()){
                            out.print("No records");
                        }
                        else{
                            while(dbRs.next()){
                                int id = dbRs.getInt("id");
                                int prodcode=dbRs.getInt("prodcode"); 
                                String prdname = dbRs.getString("prodname");
                                float prc = dbRs.getFloat("price");
                                float vt = dbRs.getFloat("vat");
                                String descr = dbRs.getString("description");
                                out.print("id: "+String.valueOf(id)+"<br>");
                                out.print("barcode: "+String.valueOf(prodcode)+"<br>");
                                out.print("Product name: "+prdname+"<br>");
                                out.print("Price: "+String.valueOf(prc)+"<br>");
                                out.print("Vat: "+String.valueOf(vt)+"<br>");
                                out.print("Description: "+descr+"<br>");
                                out.print("=====================<br>");
                            }
                            out.print("<a href='index.html'>Go back</a>");
                        }
                        dbConn.close();
                        //TODO search a)b) 
                    }
                    
                }
            }catch(SQLException e){
                    dbConn=null;
                        out.print("SQL EXCEPTION");
                }
        %>
    </body>
</html>

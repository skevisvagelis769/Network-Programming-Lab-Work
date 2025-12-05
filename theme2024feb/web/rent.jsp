<%-- 
    Document   : rent.jsp
    Created on : Dec 4, 2025, 9:12:52 PM
    Author     : carabi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <%!
                public boolean isEmpty(String field){
                    if(field==null||field.equals("")){
                        return true;
                    }else{return false;}
                }
                public boolean isDec(String field){
                    if(isEmpty(field)){return false;}
                    try{
                        Float val = Float.parseFloat(field);
                        if(val>0){return true;}else{return false;}
                    }catch(Exception e){return false;}
                }
                public boolean isInt(String field){
                    if(isEmpty(field)){return false;}
                    try{
                        Integer val = Integer.parseInt(field);
                        if(val>0){return true;}else{return false;}
                    }catch(Exception e){return false;}
                }
                public boolean checkAfm(String field){
                    if(isEmpty(field)){return false;}
                    if(field.length()!=9){return false;}                    
                    try{
                        Integer val = Integer.parseInt(field);
                        if(val>0){return true;}else{return false;}
                    }catch(Exception e){return false;}
                }
            %>
            <%
                int registration = 20;
                   int day_cost=40;
                   float vat = 0.24f,insurance=0.125f;
                   float rent_cost=0,final_cost=0;
                String afm = request.getParameter("afm");
                String rent = request.getParameter("rent");
                String km =  request.getParameter("km");
                if(!isDec(km)){response.sendRedirect("error.html");return;}
                if(!isInt(rent)){response.sendRedirect("error.html");return;}
                if(!checkAfm(afm)){response.sendRedirect("error.html");return;}
                try{
                   int af = Integer.parseInt(afm);
                   int days = Integer.parseInt(rent);
                   Float kms = Float.parseFloat(km);
                   
                   if(kms<=300){
                       rent_cost=(days*day_cost)*1.2f;
                   }else if(kms <=1200 && kms>=301){
                       rent_cost=(days*day_cost)*1.5f;
                       
                   }else {rent_cost=(days*day_cost)*1.8f;}   
                   final_cost=registration+rent_cost+vat*rent_cost+insurance*rent_cost;
                   String filepath=getServletContext().getRealPath("/") + afm + ".txt";
                   out.println("File created at: " + filepath + "<br>");  // ADD THIS LINE
                   FileWriter ot = new FileWriter(filepath);
                   ot.write("<afm>"+afm+"</afm>\n");
                   ot.write("<days>"+days+"</days>");
                   ot.write("<fpa>"+24+"</fpa>");
                   ot.write("<ins>"+12.5+"</ins>");
                   ot.write("<reg>"+20+"</reg>");
                   ot.close();
                }catch(IOException io){
                    response.sendRedirect("diskerror.html");
                }
                catch(Exception e){
                    response.sendRedirect("error.html");
                }
            %>
            <table border="1">
                <tr>
                    <td><label for="cust">Customer</label></td>
                    <td><input type="text" name="cust" value="<%=afm%>" readonly></td>
                    
                </tr>
                <tr>
                    <td><label for="rentc">Rent cost</label></td>
                    <td><input type="text" name="rentc" value="<%=rent_cost%>" readonly></td>
                    
                </tr>
                <tr>
                    <td><label for="vat">VAT</label></td>
                    <td><input type="text" name="vat" value="<%=vat*rent_cost%>" readonly></td>
                    
                </tr>
                <tr>
                    <td><label for="ins">Insurance</label></td>
                    <td><input type="text" name="ins" value="<%=insurance*rent_cost%>" readonly></td>
                    
                </tr>
                <tr>
                    <td><label for="reg">Registration</label></td>
                    <td><input type="text" name="reg" value="<%=registration%>" readonly></td>
                    
                </tr>
                <tr>
                    <td><label for="fnl">Final cost</label></td>
                    <td><input type="text" name="fnl" value="<%=final_cost%>" readonly></td>
                    
                </tr>
                <<tr><td><a href='index.html'>Go back</a></td></tr>
            </table>
    </body>
</html>

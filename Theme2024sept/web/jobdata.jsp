<%-- 
    Document   : jobdata
    Created on : Dec 4, 2025, 10:35:39 PM
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
                if(field==null||field.equals("")){return true;}
                return false;
            }
            public boolean checkErg(String field){
                if(isEmpty(field)){return false;}
                try{
                    int val = Integer.parseInt(field);
                    if (val>0){return true;}else{return false;}
                }catch(Exception e){return false;}
            }
            public boolean checkMonth(String field){
                if(isEmpty(field)){return false;}
                try{
                    Float val = Float.parseFloat(field);
                    if (val>0){return true;}else{return false;}
                }catch(Exception e){return false;}
            }
            public boolean checkAfm(String field){
                if(isEmpty(field)){return false;}
                if(field.length()!=9){return false;}
                try{
                    int val = Integer.parseInt(field);
                    if (val>0){return true;}else{return false;}
                }catch(Exception e){return false;}
            }

        %>
        <form action="savejobs.jsp" method="POST">
        <table>
        <%
            String afm=request.getParameter("afm");
            String prev=request.getParameter("prev");
            System.out.print(afm + " "+prev );
            if(!checkAfm(afm)){response.sendRedirect("error.html");return;}
             if(!checkErg(prev)){response.sendRedirect("error.html");return;}
             try{
                 int af = Integer.parseInt(afm);
                 int mnths = Integer.parseInt(prev);
                 String[] mth = new String[mnths];
                    out.print("<tr><td><label for='afm'>AFM</label></td><td><input type='text' name='afm' value='"+afm+"' readonly></td></tr>");
                    out.print("<tr><td><label for='prev'>Previous Jobs</label></td><td><input type='text' name='prev' value='"+prev+"' readonly></td></tr>");
                    out.print("<tr><th></th><th>Company</th><th>Month duration</th><th>Position</th></tr>");                 
                for(int i = 0; i<mnths ;i++){
                     out.print("<tr>"+"<td><label for='erg"+i+"'>Ergasia "+i+"</label></td>");
                     out.print("<td><input name='erg"+i+"' type='text'></td>");
                     out.print("<td><input name='mnth"+i+"' type='text'></td>");

                     
                     out.print("<td><input name='pos"+i+"'type='text'></td></tr>");
                 }
                 out.print("<tr><td><button type='submit'>Send</button></td></tr>");
             
             }catch(Exception e){response.sendRedirect("error.html");}
        %>
        </table>
        </form>
            
    </body>
</html>

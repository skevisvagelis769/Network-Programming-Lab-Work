<%-- 
    Document   : savejobs
    Created on : Dec 4, 2025, 11:12:07 PM
    Author     : carabi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%><%@page import="java.io.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            
        <%!
            public boolean isEmpty(String field){
                if(field==null||field.equals("")){return true;}
                return false;
            }
        public boolean checkMonth(String field){
                if(isEmpty(field)){return false;}
                try{
                    Float val = Float.parseFloat(field);
                    if (val>0){return true;}else{return false;}
                }catch(Exception e){return false;}
            }
        
        %>
        <%
            String afm = request.getParameter("afm");
            
            String prev = request.getParameter("prev");

            try{
                int size=Integer.parseInt(prev);
                String [] mnth= new String[size];
                String [] name = new String[size];
                String [] pos = new String[size];
                FileWriter ot = new FileWriter("/home/carabi/Documents/5o/NET_PROG/"+afm+".txt");
                for(int i = 0 ; i<size;i++){
                    mnth[i]=request.getParameter("mnth"+i);
                    if(!checkMonth(mnth[i])){response.sendRedirect("error.html");return;}
                    name[i]=request.getParameter("erg"+i);
                    pos[i]=request.getParameter("pos"+i);
                }
                out.print("<h1>data sent</h1>");
                out.print("<tr><td><label for='afm'>AFM</label></td><td><p name='afm'>"+afm+"</p></td></tr>");
                out.print("<tr><td><label for='prev'>PRev</label></td><td><p name='prev'>"+prev+"</p></td></tr>");
                out.print("<th>    </th><th>Company</th><th>Month duration</th><th>Position</th>");
                ot.write("<afm>"+afm+"</afm>\n");
                ot.write("<jobs>"+prev+"</jobs>\n");
                for(int i=0;i<size;i++){
                    out.print("<tr>"+"<td><label for='"+name[i]+"'>Ergasia   "+i+"</label></td>");
                     out.print("<td><p>"+name[i]+"</p></td>");
                     ot.write("<name"+i+">"+name[i]+"</name"+i+">\n");
                     out.print("<td><p>"+mnth[i]+"</p></td>");
                     ot.write("<time"+i+">"+mnth[i]+"</time"+i+">\n");
                     out.print("<td><p>"+pos[i]+"</p></td></tr>");
                     ot.write("<position"+i+">"+pos[i]+"</position"+i+">\n");
                }
                
                ot.close();
            }catch(IOException io){
                response.sendRedirect("error.html");
            }catch(Exception e){
                  response.sendRedirect("error.html");
            }
        %>
        
        </table>
    </body>
</html>

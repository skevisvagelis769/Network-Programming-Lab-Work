<%-- 
    Document   : mobileform.jsp
    Created on : Dec 1, 2025, 11:17:53 PM
    Author     : carabi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%! 
            public boolean isValidProgram(String field){
                if(field.equals(null)|| !field.equals("A") && !field.equals("B")){
                    return false;
                }else{return true;}
            }
            public boolean isValidValue(String field){
                try{
                    Float value = Float.parseFloat(field);
                    if(field.equals(null)|| value<0){
                        return false;
                    }else{return true;}
                }catch(Exception e){return false;}
                
            }
            public float CalcMoney(String program,float min,int sms,float mb){
                float sum=0,extrasms=0,extramin=0,extramb=0;
                if (program.equals("A")){
                    if (min > 500){extramin=(min-500)*60*0.0031f;}
                    if(sms>200){extrasms=(sms-200)*0.5f;}
                    if(mb > 1000){extramb=(mb-1000)*0.03f;}
                    sum=25+extramb+extrasms+extramin;
                }else{
                    if (min > 200){extramin=(min-200)*60*0.0031f;}
                    if(sms>100){extrasms=(sms-100)*0.5f;}
                    if(mb > 500){extramb=(mb-500)*0.03f;}
                    sum = 15+extramb+extrasms+extramin;
                }
                return sum;
            }
        %>
        <% 
            float sum = 0;
            String opt = request.getParameter("opt");
            String min = request.getParameter("min");
            String sms =  request.getParameter("sms");
            String mb = request.getParameter("mb");
            String res = request.getParameter("res");
            if (min!=null){
                
                if (!isValidProgram(opt)){
                    response.sendRedirect("/5th_lab/error3.html");
                    return;
                }
                if(!isValidValue(min)||!isValidValue(sms)||!isValidValue(mb)){
                    response.sendRedirect("/5th_lab/error3.html");
                    return;
                }
                try{
                    Float minF = Float.parseFloat(min);
                    Float mbF = Float.parseFloat(mb);
                    Integer smsI = Integer.parseInt(sms);
                    sum = CalcMoney(opt,minF,smsI,mbF);
                    res=sum+"";

                }catch(Exception e){response.sendRedirect("/5th_lab/error3.html");}
                
            }else{
                if(min == null) min = "";
                if(sms == null) sms = "";
                if(mb == null) mb = "";
            }
            
        %>
        <form action="mobileform.jsp" method="POST" style="text-align: center;">
            <table border="1">
                <tr>
                    <td><label for="opt">Programm</label></td>
                    <td><select name="opt" id="opt">
                            <option value="A">A</option>
                            <option value="B">B</option>
                    </select> </td>
                </tr> 
                <tr>
                    <td><label for="min" >Minutes</label></td>
                    <td><input name="min" type="text" value=""></td>
                    
                </tr>
                <tr>
                    <td><label for="sms" >SMS</label></td>
                    <td><input name="sms" type="text" value=""></td>
                    
                </tr>
                <tr>
                    <td><label for="mb" >MB</label></td>
                    <td><input name="mb" type="text" value=""></td>
                </tr>
                <tr>
                    <td><label for="res" >Result</label></td>
                    <td><input name="mb" type="text" value="<%=sum%>"></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <button type="submit" name="submit">Calculate</button>
                    </td>
                </tr>

            </table>
        </form>
    </body>
</html>

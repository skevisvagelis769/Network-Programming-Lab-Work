<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
        <title>Bill calculator</title>
    </head>
    <body>
        <%! //FUNCTIONS HAVE ! HERE
           public boolean isValidProgram(String field){
                if(field == null || !field.equals("A") && !field.equals("B") ){
                    return false;
                }else{return true;}
           } 
            public boolean isValidValue(String field){
                try{
                    float value = Float.parseFloat(field);
                    if(value<0){
                        return false;
                    }else{
                        return true;
                    }
                }catch(Exception e){
                    return false;
                }
           } 
            
           public float CalcMoney(String program,float min, int sms , float mb){
                
                float sum=0;float extramin=0,extrasms=0,extramb=0;
                if (program.equals("A")){
                    if(min>500){
                        
                        extramin= (min-500)*0.0031f*60;
                    }
                    if (sms>200){
                         extrasms=(sms-200)*0.5f;
                    }
                    if(mb>1000){
                         extramb=(mb-1000)*0.03f;
                    }
                    sum=25+extramb+extrasms+extramin;

                }else{
                     if(min>200){
                        extramin= (min-200)*0.0031f*60;
                    }
                    if (sms>100){
                         extrasms=(sms-100)*0.5f;
                    }
                    if(mb>500){
                         extramb=(mb-500)*0.03f;
                    }
                    sum=15+extramb+extrasms+extramin;
                }
                return sum;
            }

        %>
        <% //REST OF THE PROGRAM DOESNT HAVE !
            
            String option = request.getParameter("opt");
            String min = request.getParameter("min");
            String sms = request.getParameter("sms");
            String mb = request.getParameter("mb");
           
            if(!isValidProgram(option)){
                response.sendRedirect("error.html");
            }
            if(!isValidValue(min)||!isValidValue(sms)||!isValidValue(mb)){
                response.sendRedirect("error.html");

            }
            try{
                Float minF = Float.parseFloat(min);
                Float mbF= Float.parseFloat(mb);
                Integer smsI=Integer.parseInt(sms);
                System.out.print("smsI " +smsI+" mbF "+mbF+ " minF " + minF);
                float sum = CalcMoney(option,minF,smsI,mbF);
               
                out.print("The sum is: "+sum);
                out.println("<br><a href='mobile.html'>Calculate again</a>");  
            }catch(Exception e){
                out.println("<br>Error occurred. <a href='mobile.html'>Return</a>");            
            }
        %>
    </body>
</html>

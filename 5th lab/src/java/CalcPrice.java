/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author carabi
 */
@WebServlet(urlPatterns = {"/CalcPrice"})
public class CalcPrice extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String opt = request.getParameter("opt");
        String min = request.getParameter("min");
        String sms = request.getParameter("sms");
        String mb = request.getParameter("mb");
        
        System.out.println("in the server");
        if(!isValidProgram(opt)){
            response.sendRedirect("/5th_lab/errorserv.html");
            return;
            }
        if(!isValidValue(min)||!isValidValue(sms)||!isValidValue(mb)){
            response.sendRedirect("/5th_lab/errorserv.html");
            return;

        }
        try{
            Float minF = Float.parseFloat(min);
            Integer smsI = Integer.parseInt(sms);
            Float mbF = Float.parseFloat(mb);
            
            float sum = 0;
            sum = CalcMoney(opt,minF,smsI,mbF);
            out.print("This is the result "+sum);
            out.print("<br><a href='/5th_lab/mobileservlet.html'>Return</a>");
           
        }catch(Exception e){
            response.sendRedirect("/5th_lab/errorserv.html");

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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

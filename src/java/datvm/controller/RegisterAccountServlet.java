/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datvm.controller;

import datvm.registration.RegistrationCreateError;
import datvm.registration.RegistrationDAO;
import datvm.registration.RegistrationDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "RegisterAccountServlet", urlPatterns = {"/RegisterAccountServlet"})
public class RegisterAccountServlet extends HttpServlet {
    private final String ERROR_PAGE = "account.jsp";
    private final String LOGIN_PAGE = "login.html";
            
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //1. get user information
        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        String confirmPassword = request.getParameter("txtConfirm");
        String fullname = request.getParameter("txtFullname");
        boolean foundErr = false;
        RegistrationCreateError errors = new RegistrationCreateError();
        String url = ERROR_PAGE;
        
        try {
            //2. check tat ca loi nguoi dung
            if (username.trim().length() < 6 || username.trim().length() > 30){
                foundErr = true;
                errors.setUsernameLengthErr("Username is required from 6 to 30 characters");
            }   
            if (password.trim().length() < 8 || password.trim().length() > 20){
                foundErr = true;
                errors.setPasswordLengthErr("Password is required from 8 to 20 characters");
            }else if(!confirmPassword.trim().equals(password.trim())){
                foundErr = true;
                errors.setConfirmNotMatched("Confirm password not match!");
            }
            if (fullname.trim().length() < 2 || fullname.trim().length() > 40){
                foundErr = true;
                errors.setFullNameLengthErr("Full name is required from 2 to 40 characters");
            }
            if (foundErr) { //error occur
                request.setAttribute("ERROR", errors); //chi can show loi ko can luu
            }else { //no error
                //3. call method cua DAO
                RegistrationDAO dao = new RegistrationDAO();
                RegistrationDTO dto = new RegistrationDTO(username, password, fullname, false);
                boolean result = dao.createAccount(dto);
                //4. process result
                if(result){
                    url = LOGIN_PAGE;
                } //create account successful
            } //no error
        }catch(SQLException ex){
            String msg = ex.getMessage();
            log("CreateAccountServlet _ SQL: " + msg);
            if (msg.contains("duplicate")){
                errors.setUsernameIsExist(username + "is existed");
                request.setAttribute("ERROR", errors);
            }
        }catch(NamingException ex){
            log("CreateAccountServlet _ Naming: " + ex.getMessage());
        }
        finally{
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
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

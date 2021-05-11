package com.Vlxdy.controlador;

import com.Vlxdy.dao.UserDAO;
import com.Vlxdy.dao.UserDAOoperations;
import com.Vlxdy.modelo.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vlxdy Hishikawa
 */
@WebServlet(name = "InicioUser", urlPatterns = {"/InicioUser"})
public class InicioUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            UserDAO dao = new UserDAOoperations();
            int id;
            User us = new User();
            String action = (request.getParameter("action") != null) ? request.getParameter("action"): "view";
            String aux =  (request.getParameter("aux") != null) ? request.getParameter("aux"): "0";
            List<User> bus = new ArrayList<User>();
            switch(action){
                case "add":
                    request.setAttribute("aux", aux);
                    request.setAttribute("user", us);
                    request.getRequestDispatcher("UserForm.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    us = dao.getById(id);
                    System.out.println(us);
                    request.setAttribute("aux", aux);
                    request.setAttribute("user", us);
                    request.getRequestDispatcher("UserForm.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect(request.getContextPath()+"/InicioUser");
                    break;
                case "view":
                    List<User> lista = dao.getAll();
                    request.setAttribute("aux", aux);
                    request.setAttribute("users", lista);
                    request.getRequestDispatcher("MostrarUser.jsp").forward(request, response);
                default:
                    break;
            }
        }catch(Exception ex){
            System.out.println("Error "+ ex.getMessage());
        } 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
         int aux = Integer.parseInt(request.getParameter("aux"));
        
        User us = new User();
        
        us.setId(id);
        us.setUsuario(usuario);
        us.setPassword(password);
        
        if(id == 0){
            try{
                UserDAO   dao  = new UserDAOoperations();
                dao.insert(us);
                if(aux==0){
                    response.sendRedirect(request.getContextPath()+"/InicioUser");
                }else{
                    response.sendRedirect(request.getContextPath()+"/Index.jsp");
                }
                
            }catch (Exception ex){
                System.out.println("Error " + ex.getMessage());
            }
        }else
        {
            try{
                UserDAO dao  = new UserDAOoperations();
                dao.update(us);
                response.sendRedirect(request.getContextPath()+"/Index.jsp");
            }catch (Exception ex){
                System.out.println("Error " + ex.getMessage());
            }
        }
    }

}
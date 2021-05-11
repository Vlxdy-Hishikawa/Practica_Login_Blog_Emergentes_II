package com.Vlxdy.controlador;

import com.Vlxdy.dao.UserDAO;
import com.Vlxdy.dao.UserDAOoperations;
import com.Vlxdy.modelo.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Vlxdy.utiles.ConexionDB;
/**
 *
 * @author Vlxdy Hishikawa
 */
@WebServlet(name = "Session", urlPatterns = {"/Session"})
public class Session extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bandera=1;
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");        
        User us=new User();      
        us.setUsuario(usuario);
        us.setPassword(password);  
        try {
            UserDAO dao=new UserDAOoperations();
            boolean con = dao.comprobar(us);
            if (con==true) { 
                    request.setAttribute("us", us);
                    response.sendRedirect(request.getContextPath()+"/Inicio?u="+usuario+"&p="+password);
                
            }else{
                request.setAttribute("bandera", bandera); 
                request.getRequestDispatcher("Index.jsp").forward(request, response);
            }
            
        } catch (Exception ex) {
            System.out.println("Error " +ex.getMessage());
        }
        
        System.out.println("datos recibidos son usuario: "+usuario+" password: "+password);
    }
}

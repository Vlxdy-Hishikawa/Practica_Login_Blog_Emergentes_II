package com.Vlxdy.controlador;

import com.Vlxdy.dao.PostDAOoperation;
import com.Vlxdy.modelo.Post;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Vlxdy.dao.PostDAO;
import com.Vlxdy.dao.UserDAO;
import com.Vlxdy.dao.UserDAOoperations;
import com.Vlxdy.modelo.User;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vlxdy Hishikawa
 */
@WebServlet(name = "Inicio", urlPatterns = {"/Inicio"})
public class Inicio extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PostDAO dao = new PostDAOoperation();
            UserDAO daou = new UserDAOoperations();
            int id;
            Post po = new Post();
            String action = (request.getParameter("action") != null) ? request.getParameter("action"): "view"; 
            User us = new User(); 
            
            
            switch(action){
                case "add":     ;
                    request.setAttribute("posteo", po);
                    request.getRequestDispatcher("PostForm.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    po = dao.getById(id);
                    System.out.println(po);
                    request.setAttribute("posteo", po);
                    request.getRequestDispatcher("PostForm.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect(request.getContextPath()+"/Inicio");
                    break;
                case "view":
                    String u = request.getParameter("u");
                    String p = request.getParameter("p");
                    List<User> lis= daou.usuario(u,p);
                    List<Post> lista = dao.getAll();
                    request.setAttribute("lis",lis);
                    request.setAttribute("posteos", lista);
                    request.getRequestDispatcher("Post.jsp").forward(request, response);
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
        String fecha = request.getParameter("fecha");
        fecha.toString();
        String titulo = request.getParameter("titulo");
        String contenido = request.getParameter("contenido");
        
        Post po = new Post();
        
        po.setId(id);
        po.setFecha(fecha);
        po.setTitulo(titulo);
        po.setContenido(contenido);
        
        if(id == 0){
            try{
                PostDAO   dao  = new PostDAOoperation();
                dao.insert(po);
                response.sendRedirect(request.getContextPath()+"/Index.jsp");
            }catch (Exception ex){
                System.out.println("Error " + ex.getMessage());
            }
        }else
        {
            try{
                PostDAO dao  = new PostDAOoperation();
                dao.update(po);
                response.sendRedirect(request.getContextPath()+"/Index.jsp");
            }catch (Exception ex){
                System.out.println("Error " + ex.getMessage());
            }
        }
    }

}

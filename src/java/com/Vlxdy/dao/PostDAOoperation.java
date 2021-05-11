package com.Vlxdy.dao;

import com.Vlxdy.modelo.Post;
import com.Vlxdy.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Vlxdy Hishikawa
 */
public class PostDAOoperation extends ConexionDB implements PostDAO {
    
    @Override
    public void insert(Post posteo) throws Exception {
       try{
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement ("INSERT into post (fecha, titulo, contenido) values (?, ?, ? )");
            ps.setString(1, posteo.getFecha());
            ps.setString(2, posteo.getTitulo());
            ps.setString(3, posteo.getContenido());
            ps.executeUpdate();
        }catch(Exception e){
            throw e;
        }finally{
            this.desconectar();
        }  
    }

    @Override
    public void update(Post posteo) throws Exception {
         try{
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement ("UPDATE post set fecha = ?, titulo = ?, contenido = ?  where id = ?");
            ps.setString(1, posteo.getFecha());
            ps.setString(2, posteo.getTitulo());
            ps.setString(3, posteo.getContenido());
            ps.setInt(4, posteo.getId());
            ps.executeUpdate();
        }catch(Exception e){
            throw e;
        }finally{
            this.desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
       try{
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement ("DELETE FROM post WHERE id = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        }catch(Exception e){
            throw e;
        }finally{
            this.desconectar();
        }
    }

    @Override
    public Post getById(int id) throws Exception {
        Post po = new Post();
        try{
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement ("SELECT * FROM post WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                po.setId(rs.getInt("id"));
                po.setFecha(rs.getString("fecha"));
                po.setTitulo(rs.getString("titulo"));
                po.setContenido(rs.getString("contenido"));
            }
        }catch(Exception e){
            throw e;
        }finally{
            this.desconectar();
        }
        return po;
    }

    @Override
    public List<Post> getAll() throws Exception {
         List<Post> lista = null;
        try{
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement ("SELECT * FROM post order by fecha desc");
            ResultSet rs = ps.executeQuery();
            
            lista = new ArrayList<Post>();
            while(rs.next()){
                Post po = new Post();
                po.setId(rs.getInt("id"));
                po.setFecha(rs.getString("fecha"));
                po.setTitulo(rs.getString("titulo"));
                po.setContenido(rs.getString("contenido"));
                
                lista.add(po);
            }
            rs.close();
            ps.close();
        }catch(Exception e){
            throw e;
        }finally{
            this.desconectar();
        }
        return lista;
    } 
}


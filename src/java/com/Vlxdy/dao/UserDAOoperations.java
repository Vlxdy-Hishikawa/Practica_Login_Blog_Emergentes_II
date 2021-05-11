package com.Vlxdy.dao;

import com.Vlxdy.modelo.User;
import com.Vlxdy.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Vlxdy Hishikawa
 */
public class UserDAOoperations extends ConexionDB implements UserDAO {
    
    @Override
    public void insert(User user) throws Exception {
       try{
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement ("INSERT into usuarios (usuario, password) values (?, ?)");
            ps.setString(1, user.getUsuario());
            ps.setString(2, user.getPassword());
            ps.executeUpdate();
        }catch(Exception e){
            throw e;
        }finally{
            this.desconectar();
        }  
    }

    @Override
    public void update(User user) throws Exception {
         try{
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement ("UPDATE usuarios set usuario = ?, password = ? where id = ?");
            ps.setString(1, user.getUsuario());
            ps.setString(2, user.getPassword());
            ps.setInt(3, user.getId());
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
            PreparedStatement ps = this.conn.prepareStatement ("DELETE FROM usuarios WHERE id = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        }catch(Exception e){
            throw e;
        }finally{
            this.desconectar();
        }
    }

    @Override
    public  User getById(int id) throws Exception {
        User us = new User();
        try{
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement ("SELECT * FROM usuarios WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                us.setId(rs.getInt("id"));
                us.setUsuario(rs.getString("usuario"));
                us.setPassword(rs.getString("password"));
            }
        }catch(Exception e){
            throw e;
        }finally{
            this.desconectar();
        }
        return us;
    }
    
    
    @Override
    public boolean comprobar(User user) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT usuario, password FROM usuarios WHERE usuario=? and password=?");
            ps.setString(1, user.getUsuario());
            ps.setString(2, user.getPassword());
            ResultSet rs=ps.executeQuery();
            if (rs.absolute(1)) {
                return true;
            }
        } catch (Exception e) {
            throw e;
        }finally{
            this.desconectar();
        }
        return false;
    }

    @Override
    public List<User> getAll() throws Exception {
         List<User> lista = null;
        try{
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement ("SELECT * FROM usuarios");
            ResultSet rs = ps.executeQuery();
            
            lista = new ArrayList<User>();
            while(rs.next()){
                User us = new User();
                us.setId(rs.getInt("id"));
                us.setUsuario(rs.getString("usuario"));
                us.setPassword(rs.getString("password"));
                lista.add(us);
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
    
    
    @Override
    public List<User> usuario(String u, String p) throws Exception {
        
        List<User> lista = null;
        try{
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement ("SELECT * FROM usuarios where usuario=? and password=?");
            ps.setString(1, u);
            ps.setString(2, p);
            ResultSet rs = ps.executeQuery();
            
            lista = new ArrayList<User>();
            while(rs.next()){
                User us = new User();
                us.setId(rs.getInt("id"));
                us.setUsuario(rs.getString("usuario"));
                us.setPassword(rs.getString("password"));
                lista.add(us);
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
    
    @Override
    public List<User> usua(int idu) throws Exception {
        
        List<User> lista = null;
        try{
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement ("SELECT * FROM usuarios where id=?");
            ps.setInt(1, idu);
            ResultSet rs = ps.executeQuery();
            
            lista = new ArrayList<User>();
            while(rs.next()){
                User us = new User();
                us.setId(rs.getInt("id"));
                us.setUsuario(rs.getString("usuario"));
                us.setPassword(rs.getString("password"));
                lista.add(us);
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
    
    @Override
    public int id(String u, String p) throws Exception {
        int idu=0;
        try{
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement ("SELECT id FROM usuarios where usuario=? and password = ?");
            ps.setString(1, u);
            ps.setString(2, p);
            ResultSet rs = ps.executeQuery();
            idu = rs.getInt("id");
        }catch(Exception e){
            throw e;
        }finally{
            this.desconectar();
        }
        return idu;
    }

}


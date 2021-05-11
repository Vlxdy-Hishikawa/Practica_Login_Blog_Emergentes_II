package com.Vlxdy.dao;

import com.Vlxdy.modelo.User;
import java.util.List;

/**
 *
 * @author Vlxdy Hishikawa
 */
public interface UserDAO {
    public void insert(User user) throws Exception;
    public void update(User user) throws Exception;
    public void delete(int id) throws Exception;
    public User getById(int id) throws Exception;
    public List<User> getAll() throws Exception;
    public boolean comprobar(User user) throws Exception;
    public List<User> usuario(String u, String p) throws Exception;
    public int id(String u, String p) throws Exception;
    public List<User> usua(int id) throws Exception;
}
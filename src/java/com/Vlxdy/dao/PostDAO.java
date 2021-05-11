package com.Vlxdy.dao;

import com.Vlxdy.modelo.Post;
import java.util.List;

/**
 *
 * @author Vlxdy Hishikawa
 */
public interface PostDAO {
    public void insert(Post posteo) throws Exception;
    public void update(Post posteo) throws Exception;
    public void delete(int id) throws Exception;
    public Post getById(int id) throws Exception;
    public List<Post> getAll() throws Exception;
}


package com.test.services;

import java.util.List;

import com.test.models.Blog;


public interface BlogService {
  public List<Blog> getAllBlogs();
  public List<Blog> getiBlogs(int currentid);
  public Blog getsingleBlogs(int ub_id); 
  public void updateBlog(Blog b); 
  public boolean deleteBlog(int bid);
}

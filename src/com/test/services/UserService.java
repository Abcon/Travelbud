package com.test.services;

import java.util.List;

import com.test.models.Blog;
import com.test.models.User;

public interface UserService {

	public void signup(User u);
	public boolean login(String un, String psw);
	public List<User> getAllUsers();
	public User getUserDetails(int id);
	public User idSelect(String username,String password);
	public User updateUser(User u);
	public boolean deleteUser(int uid);
	public void insertBlog(Blog b);
//	public Blog getUserBlogs(int id); //b_id linked id Fkey to use	
}
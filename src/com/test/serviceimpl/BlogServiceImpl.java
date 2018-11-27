package com.test.serviceimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.db.DBConnection;
import com.test.models.Blog;
import com.test.services.BlogService;


public class BlogServiceImpl implements BlogService{
	Connection con = null;

public BlogServiceImpl() {
	
		con=DBConnection.getDBCon();
	}
	@Override
	
		public List<Blog> getAllBlogs() {
			List<Blog> blist = new ArrayList<>();
			String sql = "select * from blog";

			try {
				Statement stm = con.createStatement();
				ResultSet rs = stm.executeQuery(sql);

				while(rs.next()){
					Blog b = new Blog();
					b.setB_id(rs.getInt("b_id"));
					b.setAuthor(rs.getString("author"));
					b.setTitle(rs.getString("title"));
					b.setBody(rs.getString("body"));
					b.setDate(rs.getString("date"));
                    b.setLocation(rs.getString("location"));
                    b.setId(rs.getInt("id"));
                    b.setBimage(rs.getBlob("bimage"));
					blist.add(b);
					
				}
				con.close();
				return blist;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
//			return blist;
		}
	@Override
	public List<Blog> getiBlogs(int currentid) {
		List<Blog> ublist = new ArrayList<>();
		String sql = "select * from blog where id='"+currentid+"'";

		try {
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery(sql);

			while(rs.next()){
				Blog ub = new Blog();
				ub.setB_id(rs.getInt("b_id"));
				ub.setAuthor(rs.getString("author"));
				ub.setTitle(rs.getString("title"));
				ub.setBody(rs.getString("body"));
				ub.setDate(rs.getString("date"));
                ub.setLocation(rs.getString("location"));
                ub.setId(rs.getInt("id"));
				ublist.add(ub);
				
			}
			con.close();
			return ublist;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public Blog getsingleBlogs(int ub_id) {
		try {
			String qry="select * from blog where b_id=?";
			PreparedStatement pst=con.prepareStatement(qry);
			pst.setInt(1,ub_id);
			ResultSet rs=pst.executeQuery();
			
			while(rs.next()){
				Blog singleBlog= new Blog();
				singleBlog.setB_id(rs.getInt("b_id"));
				singleBlog.setAuthor(rs.getString("author"));
				singleBlog.setTitle(rs.getString("title"));
				singleBlog.setBody(rs.getString("body"));
				singleBlog.setDate(rs.getString("date"));
				singleBlog.setLocation(rs.getString("location"));
				singleBlog.setId(rs.getInt("id"));
//				singleBlog.setBimage("bimage");
				return singleBlog;
			}
			con.close(); //not here previously
			
			

		} catch (Exception e) {

			e.printStackTrace();
		}
		return null;

	}
	@Override
	public void updateBlog(Blog b) {
		String sql = "update blog set author=?,title=?,body=?,date=?,location=? where b_id = '"+b.getB_id()+"'";
          System.out.println("UpdateBlog entered");
		try {
			PreparedStatement pstm = con.prepareStatement(sql);

			// arrange in the sequence as typed in String sql above
			pstm.setString(1, b.getAuthor());
			pstm.setString(2, b.getTitle());
			pstm.setString(3, b.getBody());
			pstm.setString(4, b.getDate());
			pstm.setString(5, b.getLocation());
			//			pstm.setInt(7, u.getId());
			pstm.executeUpdate();
						con.close();


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public boolean deleteBlog(int bid) {
		// TODO Auto-generated method stub

		String qry="delete from blog where b_id=?";  //don't use * for all in delete
		try {
			PreparedStatement pst=con.prepareStatement(qry);
			pst.setInt(1,bid); 
			pst.execute();
			con.close();

			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}	

	}


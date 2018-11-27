package com.test.serviceimpl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Part;

import com.test.db.DBConnection;
import com.test.models.Blog;
import com.test.models.User;

import com.test.services.UserService;

public class UserServiceImpl implements UserService{
	Connection con = null;

	public UserServiceImpl() {
		con=DBConnection.getDBCon();
	}
	@Override
	public void signup(User u) {
		String sql = "insert into user(fname,lname,address,username,password,phoneno) values(?,?,?,?,?,?)";
		try {
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setString(1, u.getFname());
			pstm.setString(2, u.getLname());
			pstm.setString(3, u.getAddress());
			pstm.setString(4, u.getUsername());
			pstm.setString(5, u.getPassword());
			pstm.setString(6, u.getPhoneno());
			pstm.execute();
			con.close(); //not here previously
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public boolean login(String un, String psw) {
		String sql="select * from user where username='"+un+"' and password='"+psw+"' ";

		try {
			Statement stm=con.createStatement();
			ResultSet rs=stm.executeQuery(sql);

			if(rs.next()){
				return true;

			}
			con.close(); //not here previously
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		return false;

	}
	@Override
	public List<User> getAllUsers() {
		List<User> ulist = new ArrayList<>();
		String sql = "select * from user";

		try {
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery(sql);

			while(rs.next()){
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setFname(rs.getString("fname"));
				u.setLname(rs.getString("lname"));
				u.setAddress(rs.getString("address"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhoneno(rs.getString("phoneno"));

				ulist.add(u);
			}
			con.close(); //not here previously
			return ulist;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//		return ulist;
		return null;
	}
	@Override
	public User getUserDetails(int id){

		try {
			String qry="select * from user where id=?";
			PreparedStatement pst=con.prepareStatement(qry);
			pst.setInt(1,id);
			ResultSet rs=pst.executeQuery();
			User user = new User();
			while(rs.next()){

				user.setId(rs.getInt("id"));
				user.setUsername("username");
				user.setPassword("password");
				user.setFname("fname");
				user.setLname("lname");
				user.setAddress("address");
				user.setPhoneno("phoneno");
				
			}
			con.close(); //not here previously
			
			return user;

		} catch (Exception e) {

			e.printStackTrace();
		}
		return null;

	}

	@Override
	public User idSelect(String username,String password){

		try{
			String qry="select * from user where username=? and password=?";
			PreparedStatement pst=con.prepareStatement(qry);
			pst.setString(1,username);
			pst.setString(2,password);

			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				User activeUser = new User();

				//should be in order of db column
				activeUser.setId(rs.getInt("id"));
				activeUser.setUsername((rs.getString("username")));
				activeUser.setPassword(rs.getString("password"));			
				activeUser.setFname(rs.getString("fname"));
				activeUser.setLname(rs.getString("lname"));
				activeUser.setAddress((rs.getString("address")));
				activeUser.setPhoneno(rs.getString("phoneno"));

				return activeUser;
			}
			con.close();

		}catch(Exception e){
			e.printStackTrace();

		}

		return null;
	}

	@Override
	public User updateUser(User u) {
		String sql = "update user set username= ?,password= ?,fname= ?,lname= ?,address=?, phoneno=? where id = '"+u.getId()+"'";

		try {
			PreparedStatement pstm = con.prepareStatement(sql);

			// arrange in the sequence as typed in String sql above
			pstm.setString(1, u.getUsername());
			pstm.setString(2, u.getPassword());
			pstm.setString(3, u.getFname());
			pstm.setString(4, u.getLname());
			pstm.setString(5, u.getAddress());
			pstm.setString(6, u.getPhoneno());
			//			pstm.setInt(7, u.getId());
			pstm.executeUpdate();
			//			con.close();
			User user1=new User();
			UserService us =new UserServiceImpl();
			user1=us.idSelect(u.getUsername(), u.getPassword());

			return user1;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	//	@Override
	//	public boolean deleteUser(int uid) {
	//		// TODO Auto-generated method stub
	//		
	//			String sql = "delete from user where id = '" + uid + "'";
	//			// after deletion, auto-increment sequentially again
	//			String minUid = "Select min(id) from user";
	//			String sqlautoinc = "alter table user AUTO_INCREMENT=1";
	//		
	//			try {
	//				Statement stm = con.createStatement();
	//				stm.execute(sql);
	//				
	//				Statement stma = con.createStatement();
	//				stma.execute(minUid);
	//				
	//				Statement stmb = con.createStatement();
	//				stmb.execute(sqlautoinc);
	//		
	//				return true;
	//		
	//			} catch (SQLException e) {
	//				// TODO Auto-generated catch block
	//				e.printStackTrace();
	//			}
	//			return false;
	//	}
	@Override
	public boolean deleteUser(int uid) {
		// TODO Auto-generated method stub

		String qry="delete from user where id=?";  //don't use * for all in delete
		try {
			PreparedStatement pst=con.prepareStatement(qry);
			pst.setInt(1,uid); 
			pst.execute();
			con.close();

			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	//??????????????????BLOGS?????????/
	@Override
	public void insertBlog(Blog b) {
		String sql = "insert into blog(author,title,body,date,location,id) values(?,?,?,?,?,?)";
		try {
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setString(1, b.getAuthor());
			pstm.setString(2, b.getTitle());
			pstm.setString(3, b.getBody());
			pstm.setString(4, b.getDate());
			pstm.setString(5, b.getLocation());
			pstm.setInt(6, b.getId());
//			pstm.setBlob(7, ((Part) b.getBimage()).getInputStream());
			pstm.execute();
			con.close(); //blank previously

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

}


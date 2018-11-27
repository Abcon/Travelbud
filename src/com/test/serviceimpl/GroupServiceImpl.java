package com.test.serviceimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import com.test.db.DBConnection;
import com.test.models.Group;
import com.test.services.GroupService;


public class GroupServiceImpl implements GroupService{
	Connection con = null;
	
	public GroupServiceImpl() {
		// TODO Auto-generated constructor stub
		con=DBConnection.getDBCon();
	}
	@Override
	public void insertGroup(Group g) {

		String sql = "insert into cgroup(gname,destination,gdate,id) values(?,?,?,?)";
		try {
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setString(1, g.getGname());
			pstm.setString(2, g.getDestination());
			pstm.setString(3, g.getDate());
			pstm.setInt(4, g.getId());

			pstm.execute();
			con.close(); //was blank previously
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	@Override
	public List<Group> getNotify(int currentid) {
		List<Group> uglist = new ArrayList<>();
		String sql="select * from cgroup where not(id=?)";

		try {
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1, currentid);
			ResultSet rs=pst.executeQuery();

			
			while(rs.next()){
				Group g = new Group();
				g.setG_id(rs.getInt("g_id"));
				g.setGname(rs.getString("gname"));
				g.setDestination(rs.getString("destination"));
				g.setDate(rs.getString("gdate"));
                g.setId(rs.getInt("id")); //from cgroup
				uglist.add(g);
			}
			con.close();
			return uglist;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
//		return uglist;
	}
	
	

//	@Override
//	public List<Group> getAllgroups() {
//		// TODO Auto-generated method stub
//		return null;
//	}

}

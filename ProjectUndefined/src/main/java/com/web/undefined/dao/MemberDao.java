package com.web.undefined.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import com.web.undefined.entity.Member;
import com.web.undefined.utils.PostgresConnectionUtils;

@Repository
public class MemberDao {

	public void save(Member m) throws ClassNotFoundException, SQLException {
		Connection conn = PostgresConnectionUtils.getDBConnection();
		try {
			
			String sql = "insert into member (name,username,password,address,phone) values (?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, m.getName());
			ps.setString(2, m.getUsername());
			ps.setString(3, m.getPassword());
			ps.setString(4, m.getAddress());
			ps.setString(5, m.getPhone());
			
			int x = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

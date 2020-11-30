package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.project.bean.postVO;
import com.project.common.JDBCUtil;

public class postDAO {
private final String M_INSERT = "insert into teamporject (category, photo, title, writer, detail) values (?,?,?,?,?)";
private final String M_UPDATE = "update teamporject set category=?, photo=?, title=?, writer=?, detail=? where sid=?";
private final String M_DELETE = "delete from teamporject  where sid=?";
private final String M_SELECT = "select * from teamporject  where sid=?";
private final String M_LIST = "select * from teamporject order by sid desc";
Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

public int insertPost(postVO vo) {
	System.out.println("===> JDBC로 insertBoard() 기능 처리");
	try {
		conn = JDBCUtil.getConnection();
		stmt = conn.prepareStatement(M_INSERT);
		stmt.setString(1, vo.getCategory());
		stmt.setString(2, vo.getPhoto());
		stmt.setString(3, vo.getTitle());
		stmt.setString(4, vo.getWriter());
		stmt.setString(5, vo.getDetail());

		stmt.executeUpdate();
		return 1;
	} catch (Exception e) {
		e.printStackTrace();
	}
	return 0;
}

// 글 삭제
public void deletePost(postVO vo) {
	System.out.println("===> JDBC로 deleteBoard() 기능 처리");
	try {
		conn = JDBCUtil.getConnection();
		stmt = conn.prepareStatement(M_DELETE);
		stmt.setInt(1, vo.getSid());
		stmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}
}


public int updatePost(postVO vo) {
	System.out.println("===> JDBC로 updateBoard() 기능 처리");
	try {
		conn = JDBCUtil.getConnection();
		stmt = conn.prepareStatement(M_UPDATE);
		stmt.setString(1, vo.getCategory());
		stmt.setString(2, vo.getPhoto());
		stmt.setString(3, vo.getTitle());
		stmt.setString(4, vo.getWriter());
		stmt.setString(5, vo.getDetail());
		stmt.setInt(6, vo.getSid());
		
		
		stmt.executeUpdate();
		return 1;
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return 0;
}	

public postVO getPost(int seq) {
	postVO one = new postVO();
	System.out.println("===> JDBC로 getBoard() 기능 처리");
	try {
		conn = JDBCUtil.getConnection();
		stmt = conn.prepareStatement(M_SELECT);
		stmt.setInt(1, seq);
		rs = stmt.executeQuery();

		if(rs.next()) {
			one.setSid(rs.getInt("sid"));
			one.setCategory(rs.getString("category"));
			one.setPhoto(rs.getString("photo"));
			one.setTitle(rs.getString("title"));
			one.setWriter(rs.getString("writer"));
			one.setDetail(rs.getString("detail"));
			one.setRegdate(rs.getDate("regdate"));
		}
		rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return one;
}

public List<postVO> getPostList(){
	List<postVO> list = new ArrayList<postVO>();
	System.out.println("===> JDBC로 getBoardList() 기능 처리");
	try {
		conn = JDBCUtil.getConnection();
		stmt = conn.prepareStatement(M_LIST);
		rs = stmt.executeQuery();
		while(rs.next()) {
			postVO one = new postVO();
			one.setSid(rs.getInt("sid"));
			one.setCategory(rs.getString("category"));
			one.setPhoto(rs.getString("photo"));
			one.setTitle(rs.getString("title"));
			one.setWriter(rs.getString("writer"));
			one.setDetail(rs.getString("detail"));
			one.setRegdate(rs.getDate("regdate"));

			list.add(one);
		}
		rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	} 
	return list;
}
public String getPhotoFilename(int sid) {
	String filename = null;
	try {
		conn = JDBCUtil.getConnection();
		stmt = conn.prepareStatement(M_SELECT);
		stmt.setInt(1, sid);
		rs = stmt.executeQuery();
		if(rs.next()) {
			filename = rs.getString("photo");
		}
		rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	System.out.println("===> JDBC로 getPhotoFilename() 기능 처리");
	return filename;
}

}



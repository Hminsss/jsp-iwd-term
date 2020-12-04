package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import dto.Comment_ProtectPet;

public class Comment_ProtectPetDAO {
	private Connection conn;
	private ResultSet rs;
	
	public Comment_ProtectPetDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost/";
			String dbID = "";
			String dbPassword = "";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL ="SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		String SQL ="SELECT cmt_ID FROM comment_ProtectPet ORDER BY cmt_ID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) +1;
			}
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int writeComment(String cmt_cts, String cmtAuthor, int cmtPost) {
		String SQL ="INSERT INTO comment_ProtectPet VALUES(?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()); 
			pstmt.setString(2, cmt_cts); 
			pstmt.setString(3, cmtAuthor); 
			pstmt.setString(4, getDate()); 
			pstmt.setInt(5, cmtPost);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Comment_ProtectPet> getList(int cmtPost){
		String SQL ="SELECT * FROM comment_ProtectPet WHERE cmtPost = ? ORDER BY cmt_ID";
		ArrayList<Comment_ProtectPet> list = new ArrayList<Comment_ProtectPet>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cmtPost);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Comment_ProtectPet cpp = new Comment_ProtectPet();
				cpp.setCmt_ID(rs.getInt(1));
				cpp.setCmt_cts(rs.getString(2));
				cpp.setCmtAuthor(rs.getString(3));
				cpp.setCmtDate(rs.getString(4));
				cpp.setCmtPost(rs.getInt(5));
				list.add(cpp);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Comment_ProtectPet getCPP(int cmt_ID) {
		String SQL ="SELECT * FROM comment_ProtectPet WHERE cmt_ID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cmt_ID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Comment_ProtectPet cpp = new Comment_ProtectPet();
				cpp.setCmt_ID(rs.getInt(1));
				cpp.setCmt_cts(rs.getString(2));
				cpp.setCmtAuthor(rs.getString(3));
				cpp.setCmtDate(rs.getString(4));
				cpp.setCmtPost(rs.getInt(5));	
				return cpp;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public int deleteComment(int Cmt_ID) {
		String SQL = "DELETE FROM comment_ProtectPet where Cmt_ID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Cmt_ID);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	

}

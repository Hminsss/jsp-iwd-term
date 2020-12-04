package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import dto.Comment_FindPet;

public class Comment_FindPetDAO {
	private Connection conn;
	private ResultSet rs;
	
	public Comment_FindPetDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost/gksals4646";
			String dbID = "gksals4646";
			String dbPassword = "Kxkd13579!";
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
		String SQL ="SELECT cmt_ID FROM comment_FindPet ORDER BY cmt_ID DESC";
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
		String SQL ="INSERT INTO comment_FindPet VALUES(?,?,?,?,?)";
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
	
	public ArrayList<Comment_FindPet> getList(int cmtPost){
		String SQL ="SELECT * FROM comment_FindPet WHERE cmtPost = ? ORDER BY cmt_ID";
		ArrayList<Comment_FindPet> list = new ArrayList<Comment_FindPet>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cmtPost);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Comment_FindPet cfp = new Comment_FindPet();
				cfp.setCmt_ID(rs.getInt(1));
				cfp.setCmt_cts(rs.getString(2));
				cfp.setCmtAuthor(rs.getString(3));
				cfp.setCmtDate(rs.getString(4));
				cfp.setCmtPost(rs.getInt(5));
				list.add(cfp);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Comment_FindPet getCFP(int cmt_ID) {
		String SQL ="SELECT * FROM comment_FindPet WHERE cmt_ID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cmt_ID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Comment_FindPet cfp = new Comment_FindPet();
				cfp.setCmt_ID(rs.getInt(1));
				cfp.setCmt_cts(rs.getString(2));
				cfp.setCmtAuthor(rs.getString(3));
				cfp.setCmtDate(rs.getString(4));
				cfp.setCmtPost(rs.getInt(5));	
				return cfp;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public int deleteComment(int Cmt_ID) {
		String SQL = "DELETE FROM comment_FindPet where Cmt_ID=?";
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

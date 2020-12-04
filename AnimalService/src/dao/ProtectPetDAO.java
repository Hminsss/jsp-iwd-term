package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import dto.ProtectPet;

public class ProtectPetDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public ProtectPetDAO() {
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
		String SQL ="SELECT post_ID FROM ProtectPet ORDER BY post_ID DESC";
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
	
	public int writeProtectPet(int done, String age, String name, String breed,String gender, 
			String weight, String color, String catr, String catchDate, 
			String Location1, String Location2, String Location3, 
			String author, String phone, String description, 
			String fileName ) {
		
		String SQL ="INSERT INTO ProtectPet VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()); // post_ID
			pstmt.setString(2, age); // age
			pstmt.setString(3, name); // name
			pstmt.setString(4, breed); 
			pstmt.setString(5, gender);
			pstmt.setString(6, weight);
			pstmt.setString(7, color);
			pstmt.setString(8, catr);
			pstmt.setString(9, catchDate);
			pstmt.setString(10, Location1);
			pstmt.setString(11, Location2);
			pstmt.setString(12, Location3);
			pstmt.setString(13, author);
			pstmt.setString(14, phone);
			pstmt.setString(15, description);
			pstmt.setString(16, fileName);
			pstmt.setString(17, getDate());
			pstmt.setInt(18, done);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<ProtectPet> getList(int pageNumber){
		String SQL ="SELECT * FROM ProtectPet WHERE post_ID < ? ORDER BY post_ID DESC LIMIT 2";
		ArrayList<ProtectPet> list = new ArrayList<ProtectPet>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()- (pageNumber-1)*2);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProtectPet pp = new ProtectPet();
				pp.setPostId(rs.getInt(1));
				pp.setAge(rs.getString(2));
				pp.setName(rs.getString(3));
				pp.setBreed(rs.getString(4));
				pp.setGender(rs.getString(5));
				pp.setWeight(rs.getString(6));
				pp.setColor(rs.getString(7));
				pp.setCatr(rs.getString(8));
				pp.setCatchDate(rs.getString(9));
				pp.setLocation1(rs.getString(10));
				pp.setLocation2(rs.getString(11));
				pp.setLocation3(rs.getString(12));
				pp.setAuthor(rs.getString(13));
				pp.setPhone(rs.getString(14));
				pp.setDescription(rs.getString(15));
				pp.setFileName(rs.getString(16));
				pp.setUploadDate(rs.getString(17));
				pp.setDone(rs.getInt(18));
				list.add(pp);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL ="SELECT * FROM ProtectPet WHERE post_ID < ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()- (pageNumber-1)*2);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
		
	}
	
	public ProtectPet getPP(int post_id) {
		String SQL ="SELECT * FROM ProtectPet WHERE post_ID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, post_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ProtectPet pp = new ProtectPet();
				pp.setPostId(rs.getInt(1));
				pp.setAge(rs.getString(2));
				pp.setName(rs.getString(3));
				pp.setBreed(rs.getString(4));
				pp.setGender(rs.getString(5));
				pp.setWeight(rs.getString(6));
				pp.setColor(rs.getString(7));
				pp.setCatr(rs.getString(8));
				pp.setCatchDate(rs.getString(9));
				pp.setLocation1(rs.getString(10));
				pp.setLocation2(rs.getString(11));
				pp.setLocation3(rs.getString(12));
				pp.setAuthor(rs.getString(13));
				pp.setPhone(rs.getString(14));
				pp.setDescription(rs.getString(15));
				pp.setFileName(rs.getString(16));
				pp.setUploadDate(rs.getString(17));
				pp.setDone(rs.getInt(18));
				return pp;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public int deletePost(int post_id) {
		String SQL = "DELETE FROM ProtectPet where post_ID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, post_id);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	public ArrayList<ProtectPet> getSessionList(int iPostID[]){
		if(iPostID.length == 1) {
			String SQL ="SELECT * FROM ProtectPet WHERE post_ID=?";
			
			ArrayList<ProtectPet> list = new ArrayList<ProtectPet>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, iPostID[0]);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					ProtectPet fp = new ProtectPet();
					fp.setPostId(rs.getInt(1));
					fp.setAge(rs.getString(2));
					fp.setName(rs.getString(3));
					fp.setBreed(rs.getString(4));
					fp.setGender(rs.getString(5));
					fp.setWeight(rs.getString(6));
					fp.setColor(rs.getString(7));
					fp.setCatr(rs.getString(8));
					fp.setCatchDate(rs.getString(9));
					fp.setLocation1(rs.getString(10));
					fp.setLocation2(rs.getString(11));
					fp.setLocation3(rs.getString(12));
					fp.setAuthor(rs.getString(13));
					fp.setPhone(rs.getString(14));
					fp.setDescription(rs.getString(15));
					fp.setFileName(rs.getString(16));
					fp.setUploadDate(rs.getString(17));
					fp.setDone(rs.getInt(18));
					list.add(fp);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		else if(iPostID.length == 2) {
			String SQL ="SELECT * FROM ProtectPet WHERE post_ID=? OR post_ID=?";
			
			ArrayList<ProtectPet> list = new ArrayList<ProtectPet>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, iPostID[0]);
				pstmt.setInt(2, iPostID[1]);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					ProtectPet fp = new ProtectPet();
					fp.setPostId(rs.getInt(1));
					fp.setAge(rs.getString(2));
					fp.setName(rs.getString(3));
					fp.setBreed(rs.getString(4));
					fp.setGender(rs.getString(5));
					fp.setWeight(rs.getString(6));
					fp.setColor(rs.getString(7));
					fp.setCatr(rs.getString(8));
					fp.setCatchDate(rs.getString(9));
					fp.setLocation1(rs.getString(10));
					fp.setLocation2(rs.getString(11));
					fp.setLocation3(rs.getString(12));
					fp.setAuthor(rs.getString(13));
					fp.setPhone(rs.getString(14));
					fp.setDescription(rs.getString(15));
					fp.setFileName(rs.getString(16));
					fp.setUploadDate(rs.getString(17));
					fp.setDone(rs.getInt(18));
					list.add(fp);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		else if(iPostID.length ==3) {
			String SQL ="SELECT * FROM ProtectPet WHERE post_ID=? OR post_ID=? OR post_ID=?";
			
			ArrayList<ProtectPet> list = new ArrayList<ProtectPet>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, iPostID[0]);
				pstmt.setInt(2, iPostID[1]);
				pstmt.setInt(3, iPostID[2]);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					ProtectPet fp = new ProtectPet();
					fp.setPostId(rs.getInt(1));
					fp.setAge(rs.getString(2));
					fp.setName(rs.getString(3));
					fp.setBreed(rs.getString(4));
					fp.setGender(rs.getString(5));
					fp.setWeight(rs.getString(6));
					fp.setColor(rs.getString(7));
					fp.setCatr(rs.getString(8));
					fp.setCatchDate(rs.getString(9));
					fp.setLocation1(rs.getString(10));
					fp.setLocation2(rs.getString(11));
					fp.setLocation3(rs.getString(12));
					fp.setAuthor(rs.getString(13));
					fp.setPhone(rs.getString(14));
					fp.setDescription(rs.getString(15));
					fp.setFileName(rs.getString(16));
					fp.setUploadDate(rs.getString(17));
					fp.setDone(rs.getInt(18));
					list.add(fp);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		else {
			String SQL ="SELECT * FROM ProtectPet WHERE post_ID=? OR post_ID=? OR post_ID=? OR post_ID =?";
			
			ArrayList<ProtectPet> list = new ArrayList<ProtectPet>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, iPostID[0]);
				pstmt.setInt(2, iPostID[1]);
				pstmt.setInt(3, iPostID[2]);
				pstmt.setInt(4, iPostID[3]);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					ProtectPet fp = new ProtectPet();
					fp.setPostId(rs.getInt(1));
					fp.setAge(rs.getString(2));
					fp.setName(rs.getString(3));
					fp.setBreed(rs.getString(4));
					fp.setGender(rs.getString(5));
					fp.setWeight(rs.getString(6));
					fp.setColor(rs.getString(7));
					fp.setCatr(rs.getString(8));
					fp.setCatchDate(rs.getString(9));
					fp.setLocation1(rs.getString(10));
					fp.setLocation2(rs.getString(11));
					fp.setLocation3(rs.getString(12));
					fp.setAuthor(rs.getString(13));
					fp.setPhone(rs.getString(14));
					fp.setDescription(rs.getString(15));
					fp.setFileName(rs.getString(16));
					fp.setUploadDate(rs.getString(17));
					fp.setDone(rs.getInt(18));
					list.add(fp);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
	}
	public int getCount() {
		String SQL ="SELECT COUNT(*) FROM ProtectPet";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}

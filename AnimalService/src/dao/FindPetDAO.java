package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import dto.FindPet;


public class FindPetDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public FindPetDAO() {
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
		String SQL ="SELECT post_ID FROM FindPet ORDER BY post_ID DESC";
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
	
	public int writeFindPet(String age, String name, String breed,String gender, 
			String weight, String color, String catr, String disappearDate, 
			String disappearLocation1, String disappearLocation2, String disappearLocation3, 
			String author, String phone, String description, 
			String fileName ) {
		
		String SQL ="INSERT INTO FindPet VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
			pstmt.setString(9, disappearDate);
			pstmt.setString(10, disappearLocation1);
			pstmt.setString(11, disappearLocation2);
			pstmt.setString(12, disappearLocation3);
			pstmt.setString(13, author);
			pstmt.setString(14, phone);
			pstmt.setString(15, description);
			pstmt.setString(16, fileName);
			pstmt.setString(17, getDate());
			pstmt.setInt(18, 0);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<FindPet> getList(int pageNumber){
		String SQL ="SELECT * FROM FindPet WHERE post_ID < ? ORDER BY post_ID DESC LIMIT 2";
		ArrayList<FindPet> list = new ArrayList<FindPet>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()- (pageNumber-1)*2);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FindPet fp = new FindPet();
				fp.setPostId(rs.getInt(1));
				fp.setAge(rs.getString(2));
				fp.setName(rs.getString(3));
				fp.setBreed(rs.getString(4));
				fp.setGender(rs.getString(5));
				fp.setWeight(rs.getString(6));
				fp.setColor(rs.getString(7));
				fp.setCatr(rs.getString(8));
				fp.setDisappearDate(rs.getString(9));
				fp.setDisappearLocation1(rs.getString(10));
				fp.setDisappearLocation2(rs.getString(11));
				fp.setDisappearLocation3(rs.getString(12));
				fp.setAuthor(rs.getString(13));
				fp.setPhone(rs.getString(14));
				fp.setDescription(rs.getString(15));
				fp.setFileName(rs.getString(16));
				fp.setDate(rs.getString(17));
				fp.setDone(rs.getInt(18));
				list.add(fp);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<FindPet> getList_index(int pageNumber){
		String SQL ="SELECT * FROM FindPet WHERE post_ID < ? ORDER BY post_ID DESC LIMIT 10";
		ArrayList<FindPet> list = new ArrayList<FindPet>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()- (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FindPet fp = new FindPet();
				fp.setPostId(rs.getInt(1));
				fp.setAge(rs.getString(2));
				fp.setName(rs.getString(3));
				fp.setBreed(rs.getString(4));
				fp.setGender(rs.getString(5));
				fp.setWeight(rs.getString(6));
				fp.setColor(rs.getString(7));
				fp.setCatr(rs.getString(8));
				fp.setDisappearDate(rs.getString(9));
				fp.setDisappearLocation1(rs.getString(10));
				fp.setDisappearLocation2(rs.getString(11));
				fp.setDisappearLocation3(rs.getString(12));
				fp.setAuthor(rs.getString(13));
				fp.setPhone(rs.getString(14));
				fp.setDescription(rs.getString(15));
				fp.setFileName(rs.getString(16));
				fp.setDate(rs.getString(17));
				fp.setDone(rs.getInt(18));
				list.add(fp);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL ="SELECT * FROM FindPet WHERE post_ID < ?";
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
	
	public FindPet getFP(int post_id) {
		String SQL ="SELECT * FROM FindPet WHERE post_ID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, post_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				FindPet fp = new FindPet();
				fp.setPostId(rs.getInt(1));
				fp.setAge(rs.getString(2));
				fp.setName(rs.getString(3));
				fp.setBreed(rs.getString(4));
				fp.setGender(rs.getString(5));
				fp.setWeight(rs.getString(6));
				fp.setColor(rs.getString(7));
				fp.setCatr(rs.getString(8));
				fp.setDisappearDate(rs.getString(9));
				fp.setDisappearLocation1(rs.getString(10));
				fp.setDisappearLocation2(rs.getString(11));
				fp.setDisappearLocation3(rs.getString(12));
				fp.setAuthor(rs.getString(13));
				fp.setPhone(rs.getString(14));
				fp.setDescription(rs.getString(15));
				fp.setFileName(rs.getString(16));
				fp.setDate(rs.getString(17));
				fp.setDone(rs.getInt(18));
				return fp;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public int iFindPet(int post_Id) {
		String SQL ="UPDATE FindPet SET done = ? where post_ID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, post_Id);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int deletePost(int post_id) {
		String SQL = "DELETE FROM FindPet where post_ID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, post_id);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	public ArrayList<FindPet> getCookieList(int iPostID[]){
		if(iPostID.length == 1) {
			String SQL ="SELECT * FROM FindPet WHERE post_ID=?";
			
			ArrayList<FindPet> list = new ArrayList<FindPet>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, iPostID[0]);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					FindPet fp = new FindPet();
					fp.setPostId(rs.getInt(1));
					fp.setAge(rs.getString(2));
					fp.setName(rs.getString(3));
					fp.setBreed(rs.getString(4));
					fp.setGender(rs.getString(5));
					fp.setWeight(rs.getString(6));
					fp.setColor(rs.getString(7));
					fp.setCatr(rs.getString(8));
					fp.setDisappearDate(rs.getString(9));
					fp.setDisappearLocation1(rs.getString(10));
					fp.setDisappearLocation2(rs.getString(11));
					fp.setDisappearLocation3(rs.getString(12));
					fp.setAuthor(rs.getString(13));
					fp.setPhone(rs.getString(14));
					fp.setDescription(rs.getString(15));
					fp.setFileName(rs.getString(16));
					fp.setDate(rs.getString(17));
					fp.setDone(rs.getInt(18));
					list.add(fp);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		else if(iPostID.length == 2) {
			String SQL ="SELECT * FROM FindPet WHERE post_ID=? OR post_ID=?";
			
			ArrayList<FindPet> list = new ArrayList<FindPet>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, iPostID[0]);
				pstmt.setInt(2, iPostID[1]);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					FindPet fp = new FindPet();
					fp.setPostId(rs.getInt(1));
					fp.setAge(rs.getString(2));
					fp.setName(rs.getString(3));
					fp.setBreed(rs.getString(4));
					fp.setGender(rs.getString(5));
					fp.setWeight(rs.getString(6));
					fp.setColor(rs.getString(7));
					fp.setCatr(rs.getString(8));
					fp.setDisappearDate(rs.getString(9));
					fp.setDisappearLocation1(rs.getString(10));
					fp.setDisappearLocation2(rs.getString(11));
					fp.setDisappearLocation3(rs.getString(12));
					fp.setAuthor(rs.getString(13));
					fp.setPhone(rs.getString(14));
					fp.setDescription(rs.getString(15));
					fp.setFileName(rs.getString(16));
					fp.setDate(rs.getString(17));
					fp.setDone(rs.getInt(18));
					list.add(fp);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		else if(iPostID.length ==3) {
			String SQL ="SELECT * FROM FindPet WHERE post_ID=? OR post_ID=? OR post_ID=?";
			
			ArrayList<FindPet> list = new ArrayList<FindPet>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, iPostID[0]);
				pstmt.setInt(2, iPostID[1]);
				pstmt.setInt(3, iPostID[2]);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					FindPet fp = new FindPet();
					fp.setPostId(rs.getInt(1));
					fp.setAge(rs.getString(2));
					fp.setName(rs.getString(3));
					fp.setBreed(rs.getString(4));
					fp.setGender(rs.getString(5));
					fp.setWeight(rs.getString(6));
					fp.setColor(rs.getString(7));
					fp.setCatr(rs.getString(8));
					fp.setDisappearDate(rs.getString(9));
					fp.setDisappearLocation1(rs.getString(10));
					fp.setDisappearLocation2(rs.getString(11));
					fp.setDisappearLocation3(rs.getString(12));
					fp.setAuthor(rs.getString(13));
					fp.setPhone(rs.getString(14));
					fp.setDescription(rs.getString(15));
					fp.setFileName(rs.getString(16));
					fp.setDate(rs.getString(17));
					fp.setDone(rs.getInt(18));
					list.add(fp);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		else {
			String SQL ="SELECT * FROM FindPet WHERE post_ID=? OR post_ID=? OR post_ID=? OR post_ID =?";
			
			ArrayList<FindPet> list = new ArrayList<FindPet>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, iPostID[0]);
				pstmt.setInt(2, iPostID[1]);
				pstmt.setInt(3, iPostID[2]);
				pstmt.setInt(4, iPostID[3]);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					FindPet fp = new FindPet();
					fp.setPostId(rs.getInt(1));
					fp.setAge(rs.getString(2));
					fp.setName(rs.getString(3));
					fp.setBreed(rs.getString(4));
					fp.setGender(rs.getString(5));
					fp.setWeight(rs.getString(6));
					fp.setColor(rs.getString(7));
					fp.setCatr(rs.getString(8));
					fp.setDisappearDate(rs.getString(9));
					fp.setDisappearLocation1(rs.getString(10));
					fp.setDisappearLocation2(rs.getString(11));
					fp.setDisappearLocation3(rs.getString(12));
					fp.setAuthor(rs.getString(13));
					fp.setPhone(rs.getString(14));
					fp.setDescription(rs.getString(15));
					fp.setFileName(rs.getString(16));
					fp.setDate(rs.getString(17));
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
		String SQL ="SELECT COUNT(*) FROM FindPet";
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
	
	public int getCountDisappear() {
		String SQL ="SELECT COUNT(*) FROM FindPet WHERE done = 0";
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
	



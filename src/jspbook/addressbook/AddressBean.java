package jspbook.addressbook;

import java.sql.*;
import java.util.*;

public class AddressBean {
	// 연결 : connect()
	// 연결해체 : disconnect()
	// 입력 : boolean insertDB(AddressBook addressbook)
	// 수정 : boolean updateDB(AddressBook addressbook)
	// 삭제 : boolean deleteDB(int id)
	// 특정주소록 읽어오기 : AddressBook getDB(int id)
	// 전체주소록 읽어오기 : ArrayList getDBList()
	
	
	Connection conn = null;
	String url = "jdbc:mysql://localhost:3306/addressbook";
	String user = "root";
	String pass = "mysql";
	PreparedStatement pstmt = null;
	
	 public Connection connect() {
	      try {
	         Class.forName("com.mysql.jdbc.Driver");
	         conn = (Connection)DriverManager.getConnection(url,user,pass);
	      }
	      catch(Exception e) {
	         e.printStackTrace();
	      }
	      return conn;
	   }
	
	
	public void disconnect() {
	      try {
	         if(pstmt !=null) {
	            try {
	               pstmt.close();
	            }catch(Exception e) {
	               e.printStackTrace();
	            }
	         }
	         if(conn !=null) {
	            conn.close();
	         }
	         
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	         conn=null;
	      }
	   }
	
	
	// 입력
	public boolean insertDB(AddressBook addressbook) {
		String query = "insert into book(name,email,comdept,birth,tel,memo) values(?,?,?,?,?,?)";
		connect();
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1,addressbook.getName());
			pstmt.setString(2,addressbook.getEmail());
			pstmt.setString(3,addressbook.getComdept());
			pstmt.setString(4,addressbook.getBirth());
			pstmt.setString(5,addressbook.getTel());
			pstmt.setString(6,addressbook.getMemo());
			
			
			pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	// 수정
	public boolean updateDB(AddressBook addressbook) {
		String query = "update book set name=?,email=?,comdept=?,birth=?,tel=?,memo=? where id=?";
		connect();
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,addressbook.getName());
			pstmt.setString(2,addressbook.getEmail());
			pstmt.setString(3,addressbook.getComdept());
			pstmt.setString(4,addressbook.getBirth());
			pstmt.setString(5,addressbook.getTel());
			pstmt.setString(6,addressbook.getMemo());
			pstmt.setInt(7,addressbook.getId());
			
			pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	//삭제
	public boolean deleteDB(int id) {
		String query = "delete from book where id=?";
		connect();
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,id);	
			pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	//특정주소록
	public AddressBook getDB(int id) {
		AddressBook addressbook = new AddressBook();
		String query = "select * from book where id=?";
				
		connect();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,id);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			
			addressbook.setId(rs.getInt("id"));
			addressbook.setName(rs.getString("name"));
			addressbook.setEmail(rs.getString("email"));
			addressbook.setComdept(rs.getString("comdept"));
			addressbook.setBirth(rs.getString("birth"));
			addressbook.setTel(rs.getString("tel"));
			addressbook.setMemo(rs.getString("memo"));
			
			rs.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return addressbook;
	}
	
	//전체주소
	public ArrayList<AddressBook> getDBList() {
		String query = "select * from book order by id desc";
		ArrayList<AddressBook> datas = new ArrayList<>();
		
		connect();
		
		try {
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AddressBook addressbook = new AddressBook();
				addressbook.setId(rs.getInt("id"));
				addressbook.setName(rs.getString("name"));
				addressbook.setEmail(rs.getString("email"));
				addressbook.setComdept(rs.getString("comdept"));
				addressbook.setBirth(rs.getString("birth"));
				addressbook.setTel(rs.getString("tel"));
				addressbook.setMemo(rs.getString("memo"));
				
				datas.add(addressbook);
			}
			rs.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return datas;
	}
}

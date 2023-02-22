package biz.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import biz.common.JDBCConnection;


public class UserDAO {
	// 로그인 메서드
	public UserVO getUser(String id, String password) {
	      // Connection 객체 선언
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      // 리턴 자바빈 전역변수로 선언
	      UserVO user = null;
	      try {
			// DB 접속
	    	conn = JDBCConnection.getConnection();
	    	// sql
	    	String sql = "select * from ateam_user where id = ? and password = ?";
	    	// ? 객체화
	    	pstmt = conn.prepareStatement(sql);
	    	// ? 매핑
	    	pstmt.setString(1, id);
	    	pstmt.setString(2, password);
	    	// 실행
	    	rs = pstmt.executeQuery();
	    	// 사용
	    	if(rs.next()) {
	    		user = new UserVO();
	    		user.setId(rs.getString("id"));
	    		user.setName(rs.getString("name"));
	    	}
	    	  
	    	  
	    	  
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         JDBCConnection.close(rs,pstmt,conn);
	      }
	      
	      return user;
	}
	
	public Boolean getCheckUser(String id) {
	      // Connection 객체 선언
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      Boolean flag = false;
	      // 리턴 자바빈 전역변수로 선언
	      UserVO user = null;
	      try {
			// DB 접속
	    	conn = JDBCConnection.getConnection();
	    	// sql
	    	String sql = "select * from ateam_user where id = ?";
	    	// ? 객체화
	    	pstmt = conn.prepareStatement(sql);
	    	// ? 매핑
	    	pstmt.setString(1, id);
	    	// 실행
	    	rs = pstmt.executeQuery();
	    	// 사용
	    	if(!rs.next()) {
	    		flag = true;
	    	}
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         JDBCConnection.close(rs,pstmt,conn);
	      }
	      
	      return flag;
	}
	
	
	// 회원가입 메서드
	public void insertMember(UserVO bean) {
	      // Connection 객체 선언
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
		try {
			// DB 접속
			conn = JDBCConnection.getConnection();
			// sql
			String sql = "insert into ateam_user VALUES(?,?,?,?,?)";
			// ? 객체화
			pstmt = conn.prepareStatement(sql);
			// ? 매핑
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPassword());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getTel());
			pstmt.setString(5, bean.getEmail());
			// 실행
			pstmt.executeUpdate();
			// 자원반납
			pstmt.close();
			conn.close();
			
		} catch (ClassNotFoundException e) {
	       e.printStackTrace();
	    } catch (SQLException e) {
	       e.printStackTrace();
	    } finally {
	       JDBCConnection.close(rs,pstmt,conn);
	    }
		System.out.println("DB데이터 처리완료");
	}


	

	      

	
	
	
	
	
}

package biz.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import biz.common.JDBCConnection;





public class BoardDAO {
	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;	
	
	// DB접속 메서드
	public void dbConn() {
		try {
			conn = JDBCConnection.getConnection();
			System.out.println("DB접속 성공!!");			
		} catch (Exception e) {
			 e.printStackTrace();
		}
	}
	
	
	// 글등록
	public void insertBoard(BoardBean bean) {
		// DB 접속
		dbConn();
		// 값 초기화
		int ref = 0;
		int re_step = 1;
		int re_level = 1;
		// 가장 큰 ref값 읽어오기
		try {
			// sql
			String refSQL = "select max(ref) from qna_board";
			// ? 객체화
			pstmt = conn.prepareStatement(refSQL);
			// 실행
			rs = pstmt.executeQuery();
			// 최댓값에1을 더해 새그룹을 만듦
			while(rs.next()) {
				ref = rs.getInt(1)+1;
			}
		// 글쓰기 내용 DB저장(시퀀스)
			// sql
			String sql = "insert into qna_board values(qna_board_seq.nextval,?,?,?,sysdate,?,?,?,0, ?, ?)";
			// ? 객체화
			pstmt = conn.prepareStatement(sql);
			// ? 매핑
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setInt(4, ref);
			pstmt.setInt(5, re_step);
			pstmt.setInt(6, re_level);
			pstmt.setString(7, bean.getContent());
			pstmt.setString(8, bean.getId());
			// 실행
			pstmt.executeUpdate();
			// 자원반납
			conn.close();
			pstmt.close();
			
		} catch (Exception e) {
			 e.printStackTrace();
		}
	}
	
	
	// 모든게시판 글 가져오기
	public ArrayList<BoardBean> getAllBoard(){
		// DB에서 받아올 데이터 타입 선언
		ArrayList<BoardBean> v = new ArrayList<BoardBean>();
		try {
			// DB 연결
			dbConn();
			// sql
			String sql = "select * from qna_board order by ref desc, re_step asc, re_level asc";
			// ? 객체화
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setReg_date(rs.getString(5));
				bean.setRef(rs.getInt(6));
				bean.setRe_step(rs.getInt(7));
				bean.setRe_level(rs.getInt(8));
				bean.setReadcount(rs.getInt(9));
				bean.setContent(rs.getString(10));
				
				v.add(bean);
			}
		} catch (Exception e) {
			 e.printStackTrace();
		}
		
		return v;
	}
	
	// 글 내용 상세보기
	public BoardBean getOneBoard(int num) {
		BoardBean bean = new BoardBean();
		//DB 접속
		dbConn();
		try {
			// sql = 글조회수 증가
			String cnt = "update qna_board set readcount = readcount+1 where num = ?";
			// ? 객체화
			pstmt = conn.prepareStatement(cnt);
			// ? 매핑
			pstmt.setInt(1, num);
			// 실행
			pstmt.executeUpdate();
			
			// sql = 상세글보기
			String sql = "select * from qna_board where num = ?";
			// ? 객체화
			pstmt = conn.prepareStatement(sql);
			// ? 매핑
			pstmt.setInt(1, num);
			// 실행
			rs = pstmt.executeQuery();
			// 사용
			
			while(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setReg_date(rs.getString(5));
				bean.setRef(rs.getInt(6));
				bean.setRe_step(rs.getInt(7));
				bean.setRe_level(rs.getInt(8));
				bean.setReadcount(rs.getInt(9));
				bean.setContent(rs.getString(10));
				bean.setId(rs.getString(11));
			}
			// 자원반납
			rs.close();
			pstmt.close();
			conn.close();
			
			
		} catch (Exception e) {
			 e.printStackTrace();
		}
		
		return bean;
	}
	
	// 최신글 10개를 기준으로 게시판 글 가져오기
	public ArrayList<BoardBean> getAllBoardB(int start, int end){
		// 큰 가방 생성
		ArrayList<BoardBean> b = new ArrayList<>();
		// DB연결
		dbConn();
		try {
			String sql ="";
			// sql
			sql = "select * from (select A.*, Rownum Rnum from (select * from qna_board order by ref desc, re_step asc) A) "
					+ "where Rnum >= ? and Rnum <= ?";
			// ? 객체화
			pstmt = conn.prepareStatement(sql);
			// ? 매핑
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			// 실행 및 저장
			rs = pstmt.executeQuery();
			// 사용
			while(rs.next()) {
				BoardBean bean = new BoardBean();
					bean.setNum(rs.getInt(1));
					bean.setWriter(rs.getString(2));
					bean.setEmail(rs.getString(3));
					bean.setSubject(rs.getString(4));
					bean.setReg_date(rs.getString(5));
					bean.setRef(rs.getInt(6));
					bean.setRe_step(rs.getInt(7));
					bean.setRe_level(rs.getInt(8));
					bean.setReadcount(rs.getInt(9));
					bean.setContent(rs.getString(10));
					bean.setId(rs.getString(11));

					b.add(bean);
				}
				// 자원반납
				rs.close();
				conn.close();
				pstmt.close();

		} catch (Exception e) {
			 e.printStackTrace();
		}
				
		return b;
			}	
	

	
	
	// 글수정 메서드
	public boolean updateBoard(BoardBean bean) {
				// DB 연결
				dbConn();
				try {
					// sql
					String sql = "update qna_board set subject = ?, content= ? where num = ?";
					// ?
					pstmt = conn.prepareStatement(sql);
					// ? 매핑
					pstmt.setString(1, bean.getSubject());
					pstmt.setString(2, bean.getContent());
					pstmt.setInt(3, bean.getNum());
					// 실행
					pstmt.executeUpdate();
					System.out.println("db실행 후");
					// 자원반납
					pstmt.close();
					conn.close();
					return true;
				} catch (Exception e) {
					e.printStackTrace();
					return false;
				}
			}
			
	// 글 수정하기 = 하나의 게시판 글을 가져오는 메서드
	public BoardBean getOneUpdateBoard(int num) {
		BoardBean bean = new BoardBean();
		// DB 접속
		dbConn();
		try {
			// sql
			String sql = "select * from qna_board where num = ?";
			// ?
			pstmt = conn.prepareStatement(sql);
			// ? 매핑
			pstmt.setInt(1, num);
			// 실행
			rs = pstmt.executeQuery();
			// 사용
			while(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setReg_date(rs.getString(5));
				bean.setRef(rs.getInt(6));
				bean.setRe_level(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setReadcount(rs.getInt(9));
				bean.setContent(rs.getString(10));
				bean.setId(rs.getString(11));
			}
			// 자원반납
			rs.close();
			pstmt.close();
			conn.close();
					
		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;
	}

	// 글 삭제
	public boolean deleteBoard(int num) {
		dbConn();
		try {
			// sql
			String sql = "delete from qna_board where num = ?";
			// ?
			pstmt = conn.prepareStatement(sql);
			// ? 매핑
			pstmt.setInt(1, num);
			// 실행
			pstmt.executeUpdate();
			// 자원반납
			pstmt.close();
			conn.close();
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	

	
	
	
	
	
}

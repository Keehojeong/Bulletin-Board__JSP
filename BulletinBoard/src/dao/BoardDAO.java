package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
import vo.BoardVO;

public class BoardDAO {

	public List<BoardVO> selectBoardList(){
		List<BoardVO> resultList = new ArrayList<BoardVO>();
		String sql = "SELECT * FROM board ";
		PreparedStatement pstmt  = null;
		ResultSet rs  = null;
		BoardVO boardVO = null;
		
		try {
			
			pstmt = DBConnection.getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				boardVO = new BoardVO();
				boardVO.setBoard_idx(rs.getString("board_idx"));
				boardVO.setBoard_name(rs.getString("board_name"));
				boardVO.setBoard_email(rs.getString("board_email"));
				boardVO.setBoard_div(rs.getString("board_div"));
				boardVO.setBoard_title(rs.getString("board_title"));
				boardVO.setBoard_content(rs.getString("board_content"));
				boardVO.setBoard_pw(rs.getString("board_pw"));
				boardVO.setBoard_to_date(rs.getString("board_to_date"));
				boardVO.setBoard_from_date(rs.getString("board_from_date"));
				
				resultList.add(boardVO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return resultList;
	}
	
	public BoardVO selectBoardDtl(String board_idx){
		String sql = "SELECT * FROM board WHERE board_idx = ? ";
		PreparedStatement pstmt  = null;
		ResultSet rs  = null;
		BoardVO boardVO = new BoardVO();
		
		try {
			pstmt = DBConnection.getConnection().prepareStatement(sql);
			pstmt.setString(1, board_idx);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				boardVO.setBoard_idx(rs.getString("board_idx"));
				boardVO.setBoard_name(rs.getString("board_name"));
				boardVO.setBoard_email(rs.getString("board_email"));
				boardVO.setBoard_div(rs.getString("board_div"));
				boardVO.setBoard_title(rs.getString("board_title"));
				boardVO.setBoard_content(rs.getString("board_content"));
				boardVO.setBoard_pw(rs.getString("board_pw"));
				boardVO.setBoard_to_date(rs.getString("board_to_date"));
				boardVO.setBoard_from_date(rs.getString("board_from_date"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return boardVO;
	}
	
	public void insertBoard(BoardVO boardVO) {
		String sql = "INSERT INTO board (board_name, board_email, board_title, board_div, board_from_date, board_to_date,  board_content, board_pw) "
				+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?) ";
		PreparedStatement pstmt  = null;
		
		System.out.println(boardVO.toString());
		
		try {
			pstmt = DBConnection.getConnection().prepareStatement(sql);
			pstmt.setString(1, boardVO.getBoard_name());
			pstmt.setString(2, boardVO.getBoard_email());
			pstmt.setString(3, boardVO.getBoard_title());
			pstmt.setString(4, boardVO.getBoard_div());
			pstmt.setString(5, boardVO.getBoard_from_date());
			pstmt.setString(6, boardVO.getBoard_to_date());
			pstmt.setString(7, boardVO.getBoard_content());
			pstmt.setString(8, boardVO.getBoard_pw());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
	}
	
	public void updateBoard(BoardVO boardVO) {
		String sql = "UPDATE board SET board_name = ?, board_email = ?,  board_div = ?, board_title = ?, board_content = ?, board_to_date = ?, board_from_date = ? "
				+ "WHERE board_idx = ? AND board_pw = ? ";
		PreparedStatement pstmt  = null;
		
		System.out.println(boardVO.toString());
		
		try {
			pstmt = DBConnection.getConnection().prepareStatement(sql);
			pstmt.setString(1, boardVO.getBoard_name());
			pstmt.setString(2, boardVO.getBoard_email());
			pstmt.setString(3, boardVO.getBoard_div());
			pstmt.setString(4, boardVO.getBoard_title());
			pstmt.setString(5, boardVO.getBoard_content());
			pstmt.setString(6, boardVO.getBoard_to_date());
			pstmt.setString(7, boardVO.getBoard_from_date());
			pstmt.setString(8, boardVO.getBoard_idx());
			pstmt.setString(9, boardVO.getBoard_pw());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
	}
	
	public void deleteBoard(BoardVO boardVO) {
		String sql = "DELETE FROM board WHERE board_idx = ? AND board_pw = ?";
		PreparedStatement pstmt  = null;
		
		System.out.println(boardVO.toString());
		
		try {
			pstmt = DBConnection.getConnection().prepareStatement(sql);
			pstmt.setString(1, boardVO.getBoard_idx());
			pstmt.setString(2, boardVO.getBoard_pw());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
	}
	
}

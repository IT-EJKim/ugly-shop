package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import model.Cart;
import model.Product;

public class ProductDao {
	
	//DB에 있는 contacts 테이블을 CRUD 하는 클래스
	//DB연결
	private DataSource dataSource; //jdbc/demo 커넥션 풀 연결 객체
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
		
	public ProductDao(DataSource dataSource) {
		this.dataSource = dataSource; // 객체 생성시 커넥션 풀 dataSorce를 입력한다. 
	}
	
	// 모든 장바구니를 리스트로 리턴
	public Product findById(int prodId) {
		
		Product prod = null;
		
		try {
		conn = dataSource.getConnection();
		pstmt = conn.prepareStatement("select * from product where prodID=?");
		pstmt.setInt(1, prodId);
		rs = pstmt.executeQuery();
		
		
		if(rs.next()) {
			prod = new Product();
			prod.setProdID(rs.getInt("prodID"));
			prod.setFarmID(rs.getString("farmID"));
			prod.setProdName(rs.getString("prodName"));
			prod.setProdPrice(rs.getInt("prodPrice"));
			prod.setProdInven(rs.getInt("prodInven"));
			prod.setProdImg(rs.getString("prodImg"));
			prod.setProdInfo(rs.getString("prodInfo"));
			
		}
		
		}catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 에러");
		} finally { //에러에 상관없이 무조건 실행
			//DB연결 객체들을 닫는 과정이 필요하다.
			closeAll();	
		}
		
		return prod;
	}
	

	
	// delete 구문 필요. 장바구니 삭제.
	public boolean deleteCart(int cartId) {
		boolean rowAffected = false;
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("delete from cart where cartID = ?");
			pstmt.setInt(1, cartId);
			
			rowAffected = pstmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 에러");
		} finally { //에러에 상관없이 무조건 실행
			//DB연결 객체들을 닫는 과정이 필요하다.
			closeAll();
		}
		
		return rowAffected;
	}
	

	private void closeAll() {
		
		try {
			// 나중에 생성한 순서부터 닫음 rs => pstmt => conn(풀로 되돌아감)
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			
		} catch (Exception e) {
			System.out.println("DB연결 닫을 때 에러 발생");
		}
		
	}

}

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import dao.ProductDao;
import model.Cart;
import model.Product;
import utills.Json;

@WebServlet("/cart")
public class CartController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private ProductDao productDao;

	@Resource(name = "jdbc/shop")
	private DataSource dataSource;

	@Override
	public void init() throws ServletException {
		productDao = new ProductDao(dataSource);
	}

	@Override
	// 세션에서 리스트 가져오기
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String id = req.getParameter("id");
		int prodId = Integer.parseInt(id);
		Product prod = productDao.findById(prodId); //String을 int로. 파라메터는 string으로만 받아서.
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("userId");
		String farmId = req.getParameter("farmId");
		
		HashMap<Integer, Cart> cartList = null;
		
		if (session.getAttribute("cartList") == null) { //세션에서 장바구니목록을 get해오는데 아무것도 없을 경우, hashmap으로 장바구니에 새로 담는다.
			cartList = new HashMap<>();
			
			
			cartList.put(prodId, new Cart(prodId, prod.getProdName(), prod.getProdPrice(), 1, userId, farmId)); // OrderQuantity 는 당연히 처음 상품을 넣는 거니까 1을 집어넣어줘야겠지 
			session.setAttribute("cartList", cartList); // 세션에 장바구니 목록을 set한다.
		} else { // 세션에 장바구니 목록이 이미 있을경우.
			// 세션에 있던 장바구니 목록을 들고와서(cartId로..) cartList에 담는다.
			cartList = (HashMap<Integer, Cart>) session.getAttribute("cartList");
			
			if (cartList.containsKey(prodId)) { // 장바구니 안에 이미 같은 상품이 있을 경우. ++수량 을 해주고 다시 세션에 집어넣음.
				int qty = cartList.get(prodId).getOrderQuantity();
			
				cartList.put(prodId, new Cart(prodId, prod.getProdName(), prod.getProdPrice(), ++qty, userId, farmId));
				session.setAttribute("cartList", cartList);
			} else { // 장바구니 안에 같은 상품이 없을 경우, 상품 수량은 1을 put해준다.
				cartList.put(prodId, new Cart(prodId, prod.getProdName(), prod.getProdPrice(), 1, userId, farmId));
				session.setAttribute("cartList", cartList);
				//cartList.values();
			}
			
			
		}
		PrintWriter out = resp.getWriter();
		
		for(Cart cart : cartList.values()) {
			out.print(cart.toString());
		}
		
		
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 수량을 - 한다.
		req.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		int prodId = Integer.parseInt(id);
		Product prod = productDao.findById(prodId);
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("userId");
		String farmId = req.getParameter("farmId");

		HashMap<Integer, Cart> cartList = (HashMap<Integer, Cart>) session.getAttribute("cartList");

		

		// 삭제 ---> 다시 보기!!!
		if(req.getParameter("cmd")!=null) {
			String action = req.getParameter("cmd");
			System.out.println(action);
			if(action.equals("delete")) {
				int cartId = Integer.parseInt(id);
				cartList.remove(cartId);				
				return;			
			}
		}
		
		
		int qty = cartList.get(prodId).getOrderQuantity();

		
		// 수량 감소
		if(qty == 1) {
			System.out.println("prodId : "+prodId);
			cartList.remove(prodId);
			
			if(cartList.size() == 0) {
				session.removeAttribute("cartList");
			} else {
				cartList.put(prodId, new Cart(prodId, prod.getProdName(), prod.getProdPrice(), --qty, userId, farmId));
			}
			
			session.setAttribute("cartList", cartList);
		} else {
			cartList.put(prodId, new Cart(prodId, prod.getProdName(), prod.getProdPrice(), --qty, userId, farmId));
			session.setAttribute("cartList", cartList);
		}
		
		
		PrintWriter out = resp.getWriter();
		
		for(Cart cart : cartList.values()) {
			out.print(cart.toString());
		}
	}

}

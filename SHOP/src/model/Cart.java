package model;

public class Cart {

		private static int num;
		private int cartId;
		private int prodId;
		private String prodName; //상품명
		private int prodPrice;
		private int orderQuantity;
		private String userId;
		private String farmId;
		
		public Cart(int prodId, String prodName, int prodPrice, int orderQuantity, String userId,
				String farmId) {
			super();
			this.prodId = prodId;
			this.prodName = prodName;
			this.prodPrice = prodPrice;
			this.orderQuantity = orderQuantity;
			this.userId = userId;
			this.farmId = farmId;
		}

		public int getCartId() {
			return cartId;
		}

		public void setCartId(int cartId) {
			this.cartId = cartId;
		}

		public int getProdId() {
			return prodId;
		}

		public void setProdId(int prodId) {
			this.prodId = prodId;
		}

		public String getProdName() {
			return prodName;
		}

		public void setProdName(String prodName) {
			this.prodName = prodName;
		}

		public int getProdPrice() {
			return prodPrice;
		}

		public void setProdPrice(int prodPrice) {
			this.prodPrice = prodPrice;
		}

		public int getOrderQuantity() {
			return orderQuantity;
		}

		public void setOrderQuantity(int orderQuantity) {
			this.orderQuantity = orderQuantity;
		}

		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}

		public String getFarmId() {
			return farmId;
		}

		public void setFarmId(String farmId) {
			this.farmId = farmId;
		}

		@Override
		public String toString() {
			return "Cart [prodId=" + prodId + ", prodName=" + prodName + ", prodPrice="
					+ prodPrice + ", orderQuantity=" + orderQuantity + ", userId=" + userId + ", farmId=" + farmId
					+ "]";
		} 
		
		
}

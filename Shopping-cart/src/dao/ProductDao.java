package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Cart;
import model.Product;

public class ProductDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	public ProductDao(Connection con) {
		this.con = con;
	}
	
	public List<Product> getAllProduct(){
		List<Product> products = new ArrayList<Product>();
		
		try {
//			query = "select prodno,prodName,prodsortNo,price,ProdPic1 from PRODUCT";
			query = "select * from PRODUCT";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("prodNo"));
				row.setName(rs.getString("ProdName"));
				row.setCategory(rs.getString("prodsortNo"));
				row.setPrice(rs.getInt("price"));
				row.setImages(rs.getString("prodPic1"));
				
				products.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}
	
	public List<Cart> getCartProducts(ArrayList<Cart> cartlist){
		List<Cart> products = new ArrayList<Cart>();
		try {
			if(cartlist.size()<0) {
				for(Cart item:cartlist) {
					query = "select * from PRODUCT where prodNo = ?" ;
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					while(rs.next()) {
						Cart row = new Cart();
						row.setId(rs.getInt("prodNo"));
						row.setName(rs.getString("prodName"));
						row.setCategory(rs.getString("prodsortNo"));
						row.setPrice(rs.getInt("price")*item.getQuantity());
						row.setQuantity(item.getQuantity());
						products.add(row);
					}
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}

}

package com.dao;

import java.util.ArrayList;
import com.dto.Phone;

public class ProductRepository {
	private ArrayList<Phone> listOfProducts = new ArrayList<Phone>();
	
	public ProductRepository() {
		Phone phone1 = new Phone("1","iPhone 6s", 600000,
				"detail1", "애플", "Phone", 100);
		Phone phone2 = new Phone("2","LG PC 그램", 1500000,
				"detail2", "LG", "Phone", 150);
		Phone phone3 = new Phone("3","Galaxy Tab S", 990000,
				"detail3", "삼성", "Phone", 200);
		
		listOfProducts.add(phone1);
		listOfProducts.add(phone2);
		listOfProducts.add(phone3);
	}
	
	public ArrayList<Phone> getAllProducts() {
		return listOfProducts;
	}
	
	public Phone getProductById(String prodId) {
		Phone phone = null;
		for(Phone tmp_prod : listOfProducts) {
			if(tmp_prod.getProdCode().equals(prodId)) {
				phone = tmp_prod;
			}
		}
		return phone;
	}
	
}
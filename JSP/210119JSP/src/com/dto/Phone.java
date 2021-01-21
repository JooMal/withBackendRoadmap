package com.dto;

public class Phone {
	private String prodCode;
	private String prodName;
	private Integer prodPrice;
	private String prodDetail;
	private String prodMake;
	private String prodCat;
	private Integer prodRemain;
	
	
	public Phone(String prodCode, String prodName, Integer prodPrice, String prodDetail, String prodMake,
			String prodCat, Integer prodRemain) {
		super();
		this.prodCode = prodCode;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.prodDetail = prodDetail;
		this.prodMake = prodMake;
		this.prodCat = prodCat;
		this.prodRemain = prodRemain;
	}
	
	public String getProdCode() {
		return prodCode;
	}
	public void setProdCode(String prodCode) {
		this.prodCode = prodCode;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public Integer getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(Integer prodPrice) {
		this.prodPrice = prodPrice;
	}
	public String getProdDetail() {
		return prodDetail;
	}
	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}
	public String getProdMake() {
		return prodMake;
	}
	public void setProdMake(String prodMake) {
		this.prodMake = prodMake;
	}
	public String getProdCat() {
		return prodCat;
	}
	public void setProdCat(String prodCat) {
		this.prodCat = prodCat;
	}
	public Integer getProdRemain() {
		return prodRemain;
	}
	public void setProdRemain(Integer prodRemain) {
		this.prodRemain = prodRemain;
	}
		
}

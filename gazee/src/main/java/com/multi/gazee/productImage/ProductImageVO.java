package com.multi.gazee.productImage;

public class ProductImageVO {
	int productImageId;
	int productId;
	String productImageName;
	
	public int getProductImageId() {
		return productImageId;
	}
	public void setProductImageId(int productImageId) {
		this.productImageId = productImageId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductImageName() {
		return productImageName;
	}
	public void setProductImageName(String productImageName) {
		this.productImageName = productImageName;
	}
	
	@Override
	public String toString() {
		return "ProductImageVO [productImageId=" + productImageId + ", productId=" + productId + ", productImageName="
				+ productImageName + "]";
	}
	
	
}

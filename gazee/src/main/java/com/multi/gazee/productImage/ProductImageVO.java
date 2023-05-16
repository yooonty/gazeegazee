package com.multi.gazee.productImage;

public class ProductImageVO {
	int productImageId;
	int productId;
	String productImageUrl;
	
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
	public String getProductImageUrl() {
		return productImageUrl;
	}
	public void setProductImageUrl(String productImageUrl) {
		this.productImageUrl = productImageUrl;
	}
	
	@Override
	public String toString() {
		return "ProductImageVO [productImageId=" + productImageId + ", productId=" + productId + ", productImageUrl="
				+ productImageUrl + "]";
	}
	
	
	
}

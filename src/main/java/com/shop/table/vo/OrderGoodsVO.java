package com.shop.table.vo;

public class OrderGoodsVO extends OrderInfoVO{
	private String orderNo;
	private String goodsCd;
	private String unitPrice;
	private String buyQty;
	private String ctName;
	private String goodsName;
	private String ivQty;

	
	
	public String getCtName() {
		return ctName;
	}
	public void setCtName(String ctName) {
		this.ctName = ctName;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getIvQty() {
		return ivQty;
	}
	public void setIvQty(String ivQty) {
		this.ivQty = ivQty;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(String goodsCd) {
		this.goodsCd = goodsCd;
	}
	public String getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getBuyQty() {
		return buyQty;
	}
	public void setBuyQty(String buyQty) {
		this.buyQty = buyQty;
	}
	
	
}

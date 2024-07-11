package com.shop.table.vo;

public class DailyOrderInfoVO extends OrderInfoVO{

	private String orderDt; 		//주문날자
	private String GoodsCd; 		//상품코드
	private String sellCnt; 		//판매수량
	private String sellPrice; 		//판매가
	private String regDt; 			//생성날자
	public String getOrderDt() {
		return orderDt;
	}
	public void setOrderDt(String orderDt) {
		this.orderDt = orderDt;
	}
	public String getGoodsCd() {
		return GoodsCd;
	}
	public void setGoodsCd(String goodsCd) {
		GoodsCd = goodsCd;
	}
	public String getSellCnt() {
		return sellCnt;
	}
	public void setSellCnt(String sellCnt) {
		this.sellCnt = sellCnt;
	}
	public String getSellPrice() {
		return sellPrice;
	}
	public void setSellPrice(String sellPrice) {
		this.sellPrice = sellPrice;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	
	

	
}
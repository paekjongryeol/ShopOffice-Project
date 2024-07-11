package com.shop.table.vo;

public class SupplierOrderVO extends SupplierInfoVO{
	private String orderNo;				//발주번호
	private String supplierCd;			//거래처코드
	private String orderPrice;			//발주금액
	private String orderStatus;			//발주상태
	private String regDt;				//입고일
	private String incomeDt;			//발주일
	private String incomeDtFrom;		//발주일from
	private String incomeDtTo;			//발주일to
	
	
	
	public String getIncomeDtFrom() {
		return incomeDtFrom;
	}
	public void setIncomeDtFrom(String incomeDtFrom) {
		this.incomeDtFrom = incomeDtFrom;
	}
	public String getIncomeDtTo() {
		return incomeDtTo;
	}
	public void setIncomeDtTo(String incomeDtTo) {
		this.incomeDtTo = incomeDtTo;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getSupplierCd() {
		return supplierCd;
	}
	public void setSupplierCd(String supplierCd) {
		this.supplierCd = supplierCd;
	}
	public String getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getIncomeDt() {
		return incomeDt;
	}
	public void setIncomeDt(String incomeDt) {
		this.incomeDt = incomeDt;
	}
	
	

	
}

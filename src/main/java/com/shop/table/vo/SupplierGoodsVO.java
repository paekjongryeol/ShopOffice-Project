package com.shop.table.vo;

public class SupplierGoodsVO extends SupplierInfoVO{
	private String orderNo;			//발주번호
	private String goodsCd;			//상품코드
	private String unitPrice;		//발주수량
	private String buyQty;			//발주단가
	private String supplierCd;			//거래처코드
	private String supplierName;		//거래처이름
	private String orderPrice;			//발주금액
	private String orderStatus;			//발주상태
	private String regDt;				//입고일
	private String incomeDt;			//발주일
	private String incomeDtFrom;		//발주일from
	private String incomeDtTo;			//발주일to
	private String goodsName;			//상품이름
	
	
	
	public String getSupplierCd() {
		return supplierCd;
	}
	public void setSupplierCd(String supplierCd) {
		this.supplierCd = supplierCd;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
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
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
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

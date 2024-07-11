package com.shop.table.vo;

import java.util.List;

public class OrderInfoVO extends PageVO{
	private String orderNo;			//주문번호
	private String userId;			//회원ID
	private String userName;		//회원명
	private String orderGoodsName;	//상품명
	private String orderPrice;		//주문금액
	private String orderStatus;		//주문상태
	private String orderDt;			//주문일
	private String receiveName;		//수취인
	private String zipcd;			//우편번호
	private String addr;			//주소
	private String addrDtl;			//주소상세
	private String memo;			//메모
	private String buyQty;			//구매수량
	private String regDt;			//등록일
	private String payment;			//결제수단
	private String phone;			//핸드폰
	private String goodsCd;			
	private String ctCd;
	
	
	private String orderDtFrom;		//주문일 From
	private String orderDtTo;		//주문일 To
	
	private List<String> ordernolist;		//주문번호 리스트.
	
	private List<OrderGoodsVO> goodslist;
	
	
	
	public List<OrderGoodsVO> getGoodslist() {
		return goodslist;
	}
	public void setGoodslist(List<OrderGoodsVO> goodslist) {
		this.goodslist = goodslist;
	}
	public String getCtCd() {
		return ctCd;
	}
	public void setCtCd(String ctCd) {
		this.ctCd = ctCd;
	}
	public String getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(String goodsCd) {
		this.goodsCd = goodsCd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public List<String> getOrdernolist() {
		return ordernolist;
	}
	public void setOrdernolist(List<String> ordernolist) {
		this.ordernolist = ordernolist;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getOrderDtFrom() {
		return orderDtFrom;
	}
	public void setOrderDtFrom(String orderDtFrom) {
		this.orderDtFrom = orderDtFrom;
	}
	public String getOrderDtTo() {
		return orderDtTo;
	}
	public void setOrderDtTo(String orderDtTo) {
		this.orderDtTo = orderDtTo;
	}
	public String getBuyQty() {
		return buyQty;
	}
	public void setBuyQty(String buyQty) {
		this.buyQty = buyQty;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrderGoodsName() {
		return orderGoodsName;
	}
	public void setOrderGoodsName(String orderGoodsName) {
		this.orderGoodsName = orderGoodsName;
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
	public String getOrderDt() {
		return orderDt;
	}
	public void setOrderDt(String orderDt) {
		this.orderDt = orderDt;
	}
	public String getReceiveName() {
		return receiveName;
	}
	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
	}
	public String getZipcd() {
		return zipcd;
	}
	public void setZipcd(String zipcd) {
		this.zipcd = zipcd;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrDtl() {
		return addrDtl;
	}
	public void setAddrDtl(String addrDtl) {
		this.addrDtl = addrDtl;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	
	
}

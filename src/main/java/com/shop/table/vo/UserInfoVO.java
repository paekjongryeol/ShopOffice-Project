package com.shop.table.vo;

import java.util.List;

public class UserInfoVO extends PageVO{
	
	private String userId;		//회원ID	
	private String userName;	//회원명
	private String userPwd;		//패스워드
	private String phone;		//연락처
	private String email;		//이메일
	private String addr;		//주소
	private String addrDtl;		//주소상세
	private String joinDt;		//가입일
	private String withdrawYn;  //탈퇴여부
	private String withdrawDt;  //탈퇴일
	
	//조건추가
	private String joinDtFrom;	//가입일From
	private String joinDtTo;	//가입일To
	
	//주문내역
	private List<OrderInfoVO> orderlist;
	
	//
	private String orderCount;		//총주문횟수
	private String orderPrice;		//총주분금액
	
	
	public String getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(String orderCount) {
		this.orderCount = orderCount;
	}
	public String getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getJoinDtFrom() {
		return joinDtFrom;
	}
	public List<OrderInfoVO> getOrderlist() {
		return orderlist;
	}
	public void setOrderlist(List<OrderInfoVO> orderlist) {
		this.orderlist = orderlist;
	}
	public void setJoinDtFrom(String joinDtFrom) {
		this.joinDtFrom = joinDtFrom;
	}
	public String getJoinDtTo() {
		return joinDtTo;
	}
	public void setJoinDtTo(String joinDtTo) {
		this.joinDtTo = joinDtTo;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
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
	public String getJoinDt() {
		return joinDt;
	}
	public void setJoinDt(String joinDt) {
		this.joinDt = joinDt;
	}
	public String getWithdrawYn() {
		return withdrawYn;
	}
	public void setWithdrawYn(String withdrawYn) {
		this.withdrawYn = withdrawYn;
	}
	public String getWithdrawDt() {
		return withdrawDt;
	}
	public void setWithdrawDt(String withdrawDt) {
		this.withdrawDt = withdrawDt;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	
}

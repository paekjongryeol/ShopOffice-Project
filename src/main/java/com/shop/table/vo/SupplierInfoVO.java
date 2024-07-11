package com.shop.table.vo;

import java.util.List;

public class SupplierInfoVO extends PageVO{
	private String supplierCd;				//거래처코드
	private String supplierName;			//거래처명
	private String supplierCeo;				//대표명
	private String phone;					//전화번호
	private String phone2;
	private String phone3;					
	private String opName;					//담당자명
	private String opPhone;					//담당자연락처
	private String opPhone2;
	private String opPhone3;					
	private String opEmail;
	private String opEmail2;				//담당자이메일
	private String supplierStatus;			//거래처상태
	private String regDt;					//등록일
	
	//주문상품 리스트
	private List<SupplierGoodsVO> goodsorderlist;
		
	public List<SupplierGoodsVO> getGoodsorderlist() {
		return goodsorderlist;
	}
	public void setGoodsorderlist(List<SupplierGoodsVO> goodsorderlist) {
		this.goodsorderlist = goodsorderlist;
	}
	
	private List<OrderGoodsVO> goodslist;		
	
	public List<OrderGoodsVO> getGoodslist() {
		return goodslist;
	}
	public void setGoodslist(List<OrderGoodsVO> goodslist) {
		this.goodslist = goodslist;
	}
	
	private List<SupplierInfoVO> supplierlist;
	
	
	public List<SupplierInfoVO> getSupplierlist() {
		return supplierlist;
	}
	public void setSupplierlist(List<SupplierInfoVO> supplierlist) {
		this.supplierlist = supplierlist;
	}
	
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getOpPhone2() {
		return opPhone2;
	}
	public void setOpPhone2(String opPhone2) {
		this.opPhone2 = opPhone2;
	}
	public String getOpPhone3() {
		return opPhone3;
	}
	public void setOpPhone3(String opPhone3) {
		this.opPhone3 = opPhone3;
	}
	public String getOpEmail2() {
		return opEmail2;
	}
	public void setOpEmail2(String opEmail2) {
		this.opEmail2 = opEmail2;
	}
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
	public String getSupplierCeo() {
		return supplierCeo;
	}
	public void setSupplierCeo(String supplierCeo) {
		this.supplierCeo = supplierCeo;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getOpName() {
		return opName;
	}
	public void setOpName(String opName) {
		this.opName = opName;
	}
	public String getOpPhone() {
		return opPhone;
	}
	public void setOpPhone(String opPhone) {
		this.opPhone = opPhone;
	}
	public String getOpEmail() {
		return opEmail;
	}
	public void setOpEmail(String opEmail) {
		this.opEmail = opEmail;
	}
	public String getSupplierStatus() {
		return supplierStatus;
	}
	public void setSupplierStatus(String supplierStatus) {
		this.supplierStatus = supplierStatus;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	
	
	
	
}

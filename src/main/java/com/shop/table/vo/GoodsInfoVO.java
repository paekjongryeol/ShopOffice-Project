package com.shop.table.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class GoodsInfoVO extends PageVO{
	private String goodsCd;			//상품코드
	private String ctCd;			//카테고리코드
	private String goodsName;		//상품명
	private String normalPrice;		//정상가
	private String sellPrice;		//판매가
	private String ivQty;			//재고수량
	private String goodsStatus;		//상품상태
	private String supplierCd;		//거래처코드
	private String thumnailUrl;		//섬네일이미지
	private String content;			//상세설명
	private String ctName;			//카테고리명
	private String ctLevel;			//레벨
	private String upCtCd;			//상위카테고리코드
	private String regDt;			//등록일
	private String mCtCd;			//대분류
	private String sCtCd;			//중분류
	private String dCtCd;			//소분류
	
	private List<GoodsInfoVO> catelist;		//대분류
	private List<GoodsInfoVO> scatelist;		//중분류
	private List<GoodsInfoVO> dcatelist;		//소분류
	
	private List<SupplierInfoVO> supplist;	//거래처
	

	@JsonIgnore
	private MultipartFile thumnailFile;	//업로드 파일

	@JsonIgnore
	private List<MultipartFile> imgFile; //업로드 파일
	
	
	
	public List<MultipartFile> getImgFile() {
		return imgFile;
	}
	public void setImgFile(List<MultipartFile> imgFile) {
		this.imgFile = imgFile;
	}
	
	
	public MultipartFile getThumnailFile() {
		return thumnailFile;
	}
	public void setThumnailFile(MultipartFile thumnailFile) {
		this.thumnailFile = thumnailFile;
	}
	public String getmCtCd() {
		return mCtCd;
	}
	public void setmCtCd(String mCtCd) {
		this.mCtCd = mCtCd;
	}
	public String getsCtCd() {
		return sCtCd;
	}
	public void setsCtCd(String sCtCd) {
		this.sCtCd = sCtCd;
	}
	public String getdCtCd() {
		return dCtCd;
	}
	public void setdCtCd(String dCtCd) {
		this.dCtCd = dCtCd;
	}
	public List<GoodsInfoVO> getCatelist() {
		return catelist;
	}
	public void setCatelist(List<GoodsInfoVO> catelist) {
		this.catelist = catelist;
	}
	public List<SupplierInfoVO> getSupplist() {
		return supplist;
	}
	public void setSupplist(List<SupplierInfoVO> supplist) {
		this.supplist = supplist;
	}
	public String getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(String goodsCd) {
		this.goodsCd = goodsCd;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getNormalPrice() {
		return normalPrice;
	}
	public void setNormalPrice(String normalPrice) {
		this.normalPrice = normalPrice;
	}
	public String getSellPrice() {
		return sellPrice;
	}
	public void setSellPrice(String sellPrice) {
		this.sellPrice = sellPrice;
	}
	public String getIvQty() {
		return ivQty;
	}
	public void setIvQty(String ivQty) {
		this.ivQty = ivQty;
	}
	public String getGoodsStatus() {
		return goodsStatus;
	}
	public void setGoodsStatus(String goodsStatus) {
		this.goodsStatus = goodsStatus;
	}
	public String getSupplierCd() {
		return supplierCd;
	}
	public void setSupplierCd(String supplierCd) {
		this.supplierCd = supplierCd;
	}
	public String getThumnailUrl() {
		return thumnailUrl;
	}
	public void setThumnailUrl(String thumnailUrl) {
		this.thumnailUrl = thumnailUrl;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCtCd() {
		return ctCd;
	}
	public void setCtCd(String ctCd) {
		this.ctCd = ctCd;
	}
	public String getCtName() {
		return ctName;
	}
	public void setCtName(String ctName) {
		this.ctName = ctName;
	}
	public String getCtLevel() {
		return ctLevel;
	}
	public void setCtLevel(String ctLevel) {
		this.ctLevel = ctLevel;
	}
	public String getUpCtCd() {
		return upCtCd;
	}
	public void setUpCtCd(String upCtCd) {
		this.upCtCd = upCtCd;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public List<GoodsInfoVO> getScatelist() {
		return scatelist;
	}
	public void setScatelist(List<GoodsInfoVO> scatelist) {
		this.scatelist = scatelist;
	}
	public List<GoodsInfoVO> getDcatelist() {
		return dcatelist;
	}
	public void setDcatelist(List<GoodsInfoVO> dcatelist) {
		this.dcatelist = dcatelist;
	}
	
	
}

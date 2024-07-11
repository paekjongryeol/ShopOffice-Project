package com.shop.user.vo;

import java.util.List;

import com.shop.table.vo.InquiryInfoVO;
import com.shop.table.vo.PageVO;

public class InquiryVO extends PageVO{
	
	private List<InquiryInfoVO> inquirylist ;
	
	public List<InquiryInfoVO> getinquirylist() {
		return inquirylist;
	}
	
	public void setInquirylist(List<InquiryInfoVO> inquirylist) {
		this.inquirylist = inquirylist;
	}
	
}

package com.shop.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.table.vo.InquiryInfoVO;
import com.shop.user.dao.InquiryDao;

@Service
public class InquiryService {

	@Autowired
	private InquiryDao inquirydao;
	
	public InquiryInfoVO selectInquiryInfo(InquiryInfoVO vo) throws Exception{
		return inquirydao.selectInquiryInfo(vo);
	}
	
	public InquiryInfoVO updateInquiryInfo(InquiryInfoVO vo) throws Exception{
		return inquirydao.updateInquiryInfo(vo);
	}
	
	public List<InquiryInfoVO> selectInquiryList(InquiryInfoVO vo)throws Exception{
		return inquirydao.selectInquiryList(vo);
	}
	
	public int selectTotalInquiryCount(InquiryInfoVO vo) throws Exception {
		return inquirydao.selectTotalInquiryCount(vo);
	}
}

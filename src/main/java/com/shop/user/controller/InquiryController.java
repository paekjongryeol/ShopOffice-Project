package com.shop.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.table.vo.InquiryInfoVO;
import com.shop.user.service.InquiryService;
import com.shop.user.vo.InquiryVO;

@Controller

public class InquiryController {

	@Autowired
	InquiryService service;
	
	@RequestMapping("/inquiry/list")
	public String inquiryList() throws Exception {
		return "inquiry/list";
	}
	
	@RequestMapping("/inquiry/searchlist")
	@ResponseBody
	public InquiryVO searchlist(@ModelAttribute("InquiryInfoVO") InquiryInfoVO vo) throws Exception {
		
		int totalPage = service.selectTotalInquiryCount(vo); 
		
		List<InquiryInfoVO> list = service.selectInquiryList(vo);
		//3. Client에 넘겨줄 데이터 세팅.
		InquiryVO inquiryvo = new InquiryVO();
				
		inquiryvo.setInquirylist(list);
		inquiryvo.setTotal(totalPage); //총 데이터수.
		inquiryvo.setStartPage(vo.getStartPage()); 
		inquiryvo.setCurrentPage(vo.getCurrentPage());//현재페이지
				return inquiryvo;
	}
	
	@RequestMapping("/inquiry/userdetail")
	@ResponseBody
	public InquiryInfoVO inquirydetail(@ModelAttribute("InquiryInfoVO") InquiryInfoVO vo) throws Exception {
		vo = (InquiryInfoVO) service.selectInquiryInfo(vo);		
	    return vo;
	}
	
	@RequestMapping("/inquiryUp")
	@ResponseBody
	public InquiryInfoVO inquiryUp(@ModelAttribute("InquiryInfoVO") InquiryInfoVO vo) throws Exception {
		vo = (InquiryInfoVO) service.updateInquiryInfo(vo);		
	    return vo;
	}
}

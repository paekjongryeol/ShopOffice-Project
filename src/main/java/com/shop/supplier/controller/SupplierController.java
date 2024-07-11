package com.shop.supplier.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.supplier.service.SupplierService;
import com.shop.supplier.vo.SupplierVO;
import com.shop.table.vo.OrderGoodsVO;
import com.shop.table.vo.SupplierGoodsVO;
import com.shop.table.vo.SupplierInfoVO;

@Controller

public class SupplierController {

	@Autowired
	SupplierService service;
	
	@RequestMapping("/supplier/list")
	public String list() throws Exception {
		return "supplier/list";
	}
	
	@RequestMapping("/supplier/searchlist")
	@ResponseBody
	public SupplierVO searchlist(@ModelAttribute("SupplierInfoVO") SupplierInfoVO vo) throws Exception {
		
		int totalPage = service.selectTotalSupplierCount(vo); 
		
		List<SupplierInfoVO> list = service.selectSupplierList(vo);
		//3. Client에 넘겨줄 데이터 세팅.
		SupplierVO suppliervo = new SupplierVO();
				
		suppliervo.setSupplierlist(list);
		suppliervo.setTotal(totalPage); //총 데이터수.
		suppliervo.setStartPage(vo.getStartPage()); 
		suppliervo.setCurrentPage(vo.getCurrentPage());//현재페이지
				return suppliervo;
	}
	
	@RequestMapping("/supplier/supplierDetail")
	@ResponseBody
	public SupplierInfoVO modalList(@ModelAttribute("SupplierInfoVO") SupplierInfoVO vo) throws Exception {
		vo = service.selectSupplierModalList(vo);
		

		List<SupplierGoodsVO> list = service.selectOrderList(vo);
		
		List<OrderGoodsVO> glist = service.selectGoodsList(vo);
		
		List<SupplierInfoVO> slist = service.selectSupplierNameList();
		
		vo.setGoodsorderlist(list);
		vo.setGoodslist(glist);
		vo.setSupplierlist(slist);
		return vo;
	}
	
	@RequestMapping("/supplier/updateSupplierInfo")
	@ResponseBody
	public int supplierUp(@ModelAttribute("SupplierInfoVO") SupplierInfoVO vo) throws Exception {
		vo.setPhone(vo.getPhone()+"-"+vo.getPhone2()+"-"+vo.getPhone3());
		vo.setOpEmail(vo.getOpEmail()+"@"+vo.getOpEmail2());
		vo.setOpPhone(vo.getOpPhone()+"-"+vo.getOpPhone2()+"-"+vo.getOpPhone3());
		int c = service.updateSupplierInfo(vo);
		return c;
	}
	
	@RequestMapping("/supplier/insertSupplierInfo")
	@ResponseBody
	public int supplierIn(@ModelAttribute("SupplierInfoVO") SupplierInfoVO vo) throws Exception {
		vo.setPhone(vo.getPhone()+"-"+vo.getPhone2()+"-"+vo.getPhone3());
		vo.setOpEmail(vo.getOpEmail()+"@"+vo.getOpEmail2());
		vo.setOpPhone(vo.getOpPhone()+"-"+vo.getOpPhone2()+"-"+vo.getOpPhone3());
		int c = service.insertSupplierInfo(vo);
	    return c;
	}
	
	@RequestMapping("/supplier/orderList")
	public String orderList() throws Exception {
		return "supplier/orderList";
	}
	
	@RequestMapping("/supplier/modalsearch2")
	@ResponseBody
	public SupplierInfoVO modalorderList(@ModelAttribute("SupplierInfoVO") SupplierInfoVO vo) throws Exception {
		
	    return vo;
	}
	@RequestMapping("/supplier/searchOrderList")
	@ResponseBody
	public SupplierVO searchOrderList(@ModelAttribute("SupplierGoodsVO") SupplierGoodsVO vo) throws Exception {
		
		int totalPage = service.selectTotalSupplierOrderCount(vo); 
		
		List<SupplierGoodsVO> list = service.selectSupplierOrderList(vo);
		//3. Client에 넘겨줄 데이터 세팅.
		SupplierVO suppliervo = new SupplierVO();
				
		suppliervo.setSupplierGoodslist(list);
		suppliervo.setTotal(totalPage); //총 데이터수.
		suppliervo.setStartPage(vo.getStartPage()); 
		suppliervo.setCurrentPage(vo.getCurrentPage());//현재페이지
				return suppliervo;
	}
	
	@RequestMapping("/supplier/supplierList")
	@ResponseBody
	public List<SupplierInfoVO> supplierList() throws Exception {
		List<SupplierInfoVO> slist = service.selectSupplierNameList();
	    return slist;
	}
	
	@RequestMapping("/supplier/supplierModalList")
	@ResponseBody
	public SupplierInfoVO supplierModalList(@ModelAttribute("SupplierInfoVO") SupplierInfoVO vo) throws Exception {
		vo = service.selectSupplierModalList(vo);
	    return vo;
	}
	
}
package com.shop.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.order.service.OrderService;
import com.shop.order.vo.OrderVO;
import com.shop.table.vo.OrderGoodsVO;
import com.shop.table.vo.OrderInfoVO;

@Controller

public class OrderController {

	@Autowired
	OrderService service;
	
	@RequestMapping("/order/list")
	public String list() throws Exception {
		return "order/list";
	}
	
	@RequestMapping("/order/searchlist")
	@ResponseBody
	public OrderVO searchlist(@ModelAttribute("OrderInfoVO") OrderInfoVO vo) throws Exception {
		
		int totalPage = service.selectTotalOrderCount(vo); 
		
		List<OrderInfoVO> list = service.selectOrderList(vo);
		//3. Client에 넘겨줄 데이터 세팅.
		OrderVO ordervo = new OrderVO();
				
		ordervo.setOrderlist(list);
		ordervo.setTotal(totalPage); //총 데이터수.
		ordervo.setStartPage(vo.getStartPage()); 
		ordervo.setCurrentPage(vo.getCurrentPage());//현재페이지
				return ordervo;
	}
	
	@RequestMapping("/order/orderUp1")
	@ResponseBody
	public int orderUp1(@ModelAttribute("OrderInfoVO") OrderInfoVO vo) throws Exception {
		int c = service.updateOrderInfo1(vo);		
	    return c;
	}
	
	@RequestMapping("/order/orderUp2")
	@ResponseBody
	public int orderUp2(@ModelAttribute("OrderInfoVO") OrderInfoVO vo) throws Exception {
		int c = service.updateOrderInfo2(vo);		
	    return c;
	}
	
	@RequestMapping("/order/orderdetail")
	@ResponseBody
	public OrderInfoVO orderdetail(@ModelAttribute("OrderInfoVO") OrderInfoVO vo) throws Exception {
		vo = service.selectOrderInfo(vo);
		
		List<OrderGoodsVO> list = service.selectGoodsList(vo);
		
		vo.setGoodslist(list);
	    
		return vo;
	}
}
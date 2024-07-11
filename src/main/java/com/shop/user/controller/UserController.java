package com.shop.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.table.vo.OrderInfoVO;
import com.shop.table.vo.UserInfoVO;
import com.shop.user.service.UserService;
import com.shop.user.vo.UserVO;

@Controller

public class UserController {

	
	@Autowired
	UserService service;
	
	@RequestMapping("/user/list")
	public String list() throws Exception {
		return "user/list";
	}
	
	@RequestMapping("/user/user")
	public String user() throws Exception {
		return "user/user";
	}
	
	@RequestMapping("/user/searchlist")
	@ResponseBody
	public UserVO searchlist(@ModelAttribute("UserInfoVO") UserInfoVO vo) throws Exception {
		//Paging
		//1. 전체 데이터 개수를 조회한다.
		int totalPage = service.selectTotalUserCount(vo); 
		
		List<UserInfoVO> list = service.selectUserList(vo);

		//3. Client에 넘겨줄 데이터 세팅.
		UserVO uservo = new UserVO();
		
		uservo.setUserlist(list);
		uservo.setTotal(totalPage); //총 데이터수.
		uservo.setStartPage(vo.getStartPage()); 
		uservo.setCurrentPage(vo.getCurrentPage());//현재페이지
		return uservo;
	}

	@RequestMapping("/user/userdetail")
	@ResponseBody
	public UserInfoVO userdetail(@ModelAttribute("UserInfoVO") UserInfoVO vo) throws Exception {
		vo = service.selectUserInfo(vo);
		
		List<OrderInfoVO> list = service.selectOrderList(vo);
		
		vo.setOrderlist(list);
		
	    return vo;
	}
}
package com.shop.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.table.vo.OrderInfoVO;
import com.shop.table.vo.UserInfoVO;
import com.shop.user.dao.UserDao;

@Service
public class UserService {

	@Autowired
	private UserDao userdao;
	
	public UserInfoVO selectUserInfo(UserInfoVO vo) throws Exception{
		return userdao.selectUserInfo(vo);
	}

	public List<UserInfoVO> selectUserList(UserInfoVO vo)throws Exception{
		return userdao.selectUserList(vo);
	}
	
	public List<OrderInfoVO> selectOrderList(UserInfoVO vo) throws Exception {
	    return userdao.selectOrderList(vo);
	}

	public int selectTotalUserCount(UserInfoVO vo) throws Exception {
		return userdao.selectTotalUserCount(vo);
	}



}

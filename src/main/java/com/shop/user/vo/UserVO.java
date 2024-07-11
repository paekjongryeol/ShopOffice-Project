package com.shop.user.vo;

import java.util.List;

import com.shop.table.vo.PageVO;
import com.shop.table.vo.UserInfoVO;

public class UserVO extends PageVO {
	 
	private List<UserInfoVO> userlist ;
	
	public List<UserInfoVO> getUserlist() {
		return userlist;
	}
	
	public void setUserlist(List<UserInfoVO> userlist) {
		this.userlist = userlist;
	}
	
}
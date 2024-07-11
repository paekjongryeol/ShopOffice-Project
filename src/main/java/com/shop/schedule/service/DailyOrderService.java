package com.shop.schedule.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.schedule.dao.DailyOrderDao;

@Service 
public class DailyOrderService {

	@Autowired
	private DailyOrderDao dao;

	public int insertOrderList() throws Exception {
		return dao.insertOrderList();
	}
	
	
}

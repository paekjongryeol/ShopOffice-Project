package com.shop.schedule.dao;

import org.mybatis.spring.annotation.MapperScan;

@MapperScan(basePackages="com.shop.schedule.dao")
public interface DailyOrderDao {

	public int insertOrderList()  throws Exception;
	
	
}

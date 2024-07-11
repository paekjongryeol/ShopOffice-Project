package com.shop.order.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.shop.table.vo.OrderGoodsVO;
import com.shop.table.vo.OrderInfoVO;
@MapperScan(basePackages="com.shop.order.dao")
public interface OrderDao {

	public List<OrderInfoVO> selectOrderList(OrderInfoVO vo)  throws Exception;
	
	public int selectTotalOrderCount(OrderInfoVO vo) throws Exception;
	
	public int updateOrderInfo1(OrderInfoVO vo) throws Exception;
	
	public int updateOrderInfo2(OrderInfoVO vo) throws Exception;
			
	public OrderInfoVO selectOrderInfo(OrderInfoVO vo) throws Exception;
	
	public List<OrderGoodsVO> selectGoodsList(OrderInfoVO vo)  throws Exception;
}

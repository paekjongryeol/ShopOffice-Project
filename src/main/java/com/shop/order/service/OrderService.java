package com.shop.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.order.dao.OrderDao;
import com.shop.table.vo.OrderGoodsVO;
import com.shop.table.vo.OrderInfoVO;

@Service
public class OrderService {

	@Autowired
	private OrderDao orderdao;
	
	public List<OrderInfoVO> selectOrderList(OrderInfoVO vo)throws Exception{
		return orderdao.selectOrderList(vo);
	}
	
	public int selectTotalOrderCount(OrderInfoVO vo) throws Exception {
		return orderdao.selectTotalOrderCount(vo);
	}
	
	public int updateOrderInfo1(OrderInfoVO vo) throws Exception {
		return orderdao.updateOrderInfo1(vo);
	}
	
	public int updateOrderInfo2(OrderInfoVO vo) throws Exception {
		return orderdao.updateOrderInfo2(vo);
	}
	
	public OrderInfoVO selectOrderInfo(OrderInfoVO vo) throws Exception {
		return orderdao.selectOrderInfo(vo);
	}
	
	public List<OrderGoodsVO> selectGoodsList(OrderInfoVO vo)throws Exception{
		return orderdao.selectGoodsList(vo);
	}
}

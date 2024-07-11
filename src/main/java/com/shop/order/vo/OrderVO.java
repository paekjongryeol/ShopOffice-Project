package com.shop.order.vo;

import java.util.List;

import com.shop.table.vo.OrderInfoVO;
import com.shop.table.vo.PageVO;

public class OrderVO extends PageVO{
	
private List<OrderInfoVO> orderlist ;

public List<OrderInfoVO> getOrderlist() {
	return orderlist;
}

public void setOrderlist(List<OrderInfoVO> orderlist) {
	this.orderlist = orderlist;
}
	
	
}

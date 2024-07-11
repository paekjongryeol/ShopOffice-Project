package com.shop.goods.vo;

import java.util.List;

import com.shop.table.vo.GoodsInfoVO;
import com.shop.table.vo.PageVO;

public class GoodsVO extends PageVO{
	
	private List<GoodsInfoVO> goodslist ;
	
	public List<GoodsInfoVO> getGoodslist() {
		return goodslist;
	}
	
	public void setGoodslist(List<GoodsInfoVO> goodslist) {
		this.goodslist = goodslist;
	}
	
}

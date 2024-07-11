package com.shop.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.goods.dao.GoodsDao;
import com.shop.table.vo.GoodsImgVO;
import com.shop.table.vo.GoodsInfoVO;
import com.shop.table.vo.SupplierInfoVO;



@Service
public class GoodsService {

	@Autowired
	private GoodsDao goodsdao;
	
	public GoodsInfoVO selectGoodsInfo(GoodsInfoVO vo) throws Exception{
		return goodsdao.selectGoodsInfo(vo);
	}
	
	public List<GoodsInfoVO> selectGoodsList(GoodsInfoVO vo)throws Exception{
		return goodsdao.selectGoodsList(vo);
	}

	public int insertGoodsList(GoodsInfoVO vo)throws Exception{
		return goodsdao.insertGoodsList(vo);
	}
	
	public List<GoodsInfoVO> selectGoodsSearchList(GoodsInfoVO vo)throws Exception{
		return goodsdao.selectGoodsSearchList(vo);
	}
	
	public GoodsInfoVO selectGoodsOrderList(GoodsInfoVO vo)throws Exception{
		return goodsdao.selectGoodsOrderList(vo);
	}
	
	public int updateGoodsInfo(GoodsInfoVO vo)throws Exception{
		return goodsdao.updateGoodsInfo(vo);
	}
	
	public int updateGoodsImg(GoodsImgVO vo)throws Exception{
		return goodsdao.updateGoodsImg(vo);
	}
	
	public int deleteGoodsImg(GoodsImgVO vo)throws Exception{
		return goodsdao.deleteGoodsImg(vo);
	}
	
	public int insertGoodsInfo(GoodsInfoVO vo)throws Exception{
		return goodsdao.insertGoodsInfo(vo);
	}
	
	public int insertGoodsImg(GoodsImgVO vo)throws Exception{
		return goodsdao.insertGoodsImg(vo);
	}
	
	public List<SupplierInfoVO> selectSupplierList() throws Exception{
		return goodsdao.selectSupplierList();
	}
	
	public int selectTotalGoodsCount(GoodsInfoVO vo) throws Exception {
		return goodsdao.selectTotalGoodsCount(vo);
	}
}

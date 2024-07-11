package com.shop.goods.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.shop.table.vo.GoodsImgVO;
import com.shop.table.vo.GoodsInfoVO;
import com.shop.table.vo.SupplierInfoVO;

@MapperScan(basePackages="com.shop.goods.dao")
public interface GoodsDao {

	public GoodsInfoVO selectGoodsInfo(GoodsInfoVO vo) throws Exception;
	
	public List<GoodsInfoVO> selectGoodsList(GoodsInfoVO vo)  throws Exception;
	
	public int insertGoodsList(GoodsInfoVO vo)  throws Exception;
	
	public List<GoodsInfoVO> selectGoodsSearchList(GoodsInfoVO vo)  throws Exception;
	
	public GoodsInfoVO selectGoodsOrderList(GoodsInfoVO vo)  throws Exception;
	
	public int updateGoodsInfo(GoodsInfoVO vo)  throws Exception;
	
	public int updateGoodsImg(GoodsImgVO vo)  throws Exception;
	
	public int insertGoodsInfo(GoodsInfoVO vo)  throws Exception;
	
	public int insertGoodsImg(GoodsImgVO vo)  throws Exception;
	
	public int deleteGoodsImg(GoodsImgVO vo)  throws Exception;

	public List<SupplierInfoVO> selectSupplierList() throws Exception;
	
	public int selectTotalGoodsCount(GoodsInfoVO vo) throws Exception;
	
	public int selectSupplierList(GoodsImgVO vo) throws Exception;
	}
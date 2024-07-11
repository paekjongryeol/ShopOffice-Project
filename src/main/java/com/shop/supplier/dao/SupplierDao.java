package com.shop.supplier.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.shop.table.vo.OrderGoodsVO;
import com.shop.table.vo.SupplierGoodsVO;
import com.shop.table.vo.SupplierInfoVO;

@MapperScan(basePackages="com.shop.supplier.dao")
public interface SupplierDao {

	public List<SupplierInfoVO> selectSupplierList(SupplierInfoVO vo)  throws Exception;
	
	public int selectTotalSupplierCount(SupplierInfoVO vo) throws Exception;
	
	public SupplierInfoVO selectSupplierModalList(SupplierInfoVO vo) throws Exception;
	
	public int updateSupplierInfo(SupplierInfoVO vo) throws Exception;
	
	public int insertSupplierInfo(SupplierInfoVO vo) throws Exception;

	public List<SupplierGoodsVO> selectSupplierOrderList(SupplierGoodsVO vo)  throws Exception;
	
	public int selectTotalSupplierOrderCount(SupplierGoodsVO vo) throws Exception;

	public List<SupplierGoodsVO> selectOrderList(SupplierInfoVO vo)  throws Exception;
	
	public List<OrderGoodsVO> selectGoodsList(SupplierInfoVO vo)  throws Exception;

	public List<SupplierInfoVO> selectSupplierNameList()  throws Exception;
}

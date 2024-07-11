package com.shop.supplier.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.supplier.dao.SupplierDao;
import com.shop.table.vo.OrderGoodsVO;
import com.shop.table.vo.SupplierGoodsVO;
import com.shop.table.vo.SupplierInfoVO;

@Service
public class SupplierService {

	@Autowired
	private SupplierDao supplierdao;
	
	public List<SupplierInfoVO> selectSupplierList(SupplierInfoVO vo)throws Exception{
		return supplierdao.selectSupplierList(vo);
	}
	
	public int selectTotalSupplierCount(SupplierInfoVO vo) throws Exception {
		return supplierdao.selectTotalSupplierCount(vo);
	}
	
	public SupplierInfoVO selectSupplierModalList(SupplierInfoVO vo) throws Exception {
		return supplierdao.selectSupplierModalList(vo);
	}
	
	public int updateSupplierInfo(SupplierInfoVO vo) throws Exception {
		return supplierdao.updateSupplierInfo(vo);
	}
	
	public int insertSupplierInfo(SupplierInfoVO vo) throws Exception {
		return supplierdao.insertSupplierInfo(vo);
	}
	
	public List<SupplierGoodsVO> selectSupplierOrderList(SupplierGoodsVO vo)throws Exception{
		return supplierdao.selectSupplierOrderList(vo);
	}
	
	public int selectTotalSupplierOrderCount(SupplierGoodsVO vo) throws Exception {
		return supplierdao.selectTotalSupplierOrderCount(vo);
	}
	
	public List<SupplierGoodsVO> selectOrderList(SupplierInfoVO vo) throws Exception {
	    return supplierdao.selectOrderList(vo);
	}
	
	public List<OrderGoodsVO> selectGoodsList(SupplierInfoVO vo) throws Exception {
	    return supplierdao.selectGoodsList(vo);
	}
	
	public List<SupplierInfoVO> selectSupplierNameList() throws Exception {
	    return supplierdao.selectSupplierNameList();
	}
}

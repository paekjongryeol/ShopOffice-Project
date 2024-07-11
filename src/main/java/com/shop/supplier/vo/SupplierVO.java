package com.shop.supplier.vo;

import java.util.List;

import com.shop.table.vo.PageVO;
import com.shop.table.vo.SupplierGoodsVO;
import com.shop.table.vo.SupplierInfoVO;

	public class SupplierVO extends PageVO{
		
	private List<SupplierInfoVO> supplierlist ;
	
	public List<SupplierInfoVO> getSupplierlist() {
		return supplierlist;
	}
	
	public void setSupplierlist(List<SupplierInfoVO> supplierlist) {
		this.supplierlist = supplierlist;
	}

	private List<SupplierGoodsVO> supplierGoodslist;

	public List<SupplierGoodsVO> getSupplierGoodslist() {
		return supplierGoodslist;
	}

	public void setSupplierGoodslist(List<SupplierGoodsVO> supplierGoodslist) {
		this.supplierGoodslist = supplierGoodslist;
	}

	
	
}

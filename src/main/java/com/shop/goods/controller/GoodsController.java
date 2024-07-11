package com.shop.goods.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shop.common.service.FileService;
import com.shop.goods.service.GoodsService;
import com.shop.goods.vo.GoodsVO;
import com.shop.table.vo.FileVO;
import com.shop.table.vo.GoodsImgVO;
import com.shop.table.vo.GoodsInfoVO;
import com.shop.table.vo.SupplierInfoVO;

@Controller

public class GoodsController {

	@Autowired
	GoodsService service;
	
	@Autowired
	FileService fileservice;

	
	@RequestMapping("/goods/category")
	public String category() throws Exception {
		return "goods/category";
	}
	
	@RequestMapping("/goods/list")
	public String info() throws Exception {
		return "goods/list";
	}
	
	@RequestMapping("/goods/search")
	@ResponseBody
	public List<GoodsInfoVO> search(@ModelAttribute("GoodsInfoVO") GoodsInfoVO vo) throws Exception {
		List<GoodsInfoVO> list = service.selectGoodsList(vo);
	    return list;
	}
	
	@RequestMapping("/goods/search2")
	@ResponseBody
	public GoodsInfoVO search2(@ModelAttribute("GoodsInfoVO") GoodsInfoVO vo) throws Exception {
		//대분류
		vo.setCtLevel("1");
		List<GoodsInfoVO> list = service.selectGoodsList(vo);
		
		//거래처
		List<SupplierInfoVO> sulist = service.selectSupplierList();
		
		vo.setCatelist(list);
		vo.setSupplist(sulist);
		
	    return vo;
	}
	@RequestMapping("/goods/newUp")
	@ResponseBody
	public int newUp(@ModelAttribute("GoodsInfoVO") GoodsInfoVO vo) throws Exception {
		int c = service.insertGoodsList(vo);
	    return c;
	}
	
	@RequestMapping("/goods/searchlist")
	@ResponseBody
	public GoodsVO searchlist(@ModelAttribute("GoodsInfoVO") GoodsInfoVO vo) throws Exception {
			
			int totalPage = service.selectTotalGoodsCount(vo); 
			
			List<GoodsInfoVO> list = service.selectGoodsSearchList(vo);
			//3. Client에 넘겨줄 데이터 세팅.
			GoodsVO goodsvo = new GoodsVO();
					
			goodsvo.setGoodslist(list);
			goodsvo.setTotal(totalPage); //총 데이터수.
			goodsvo.setStartPage(vo.getStartPage()); 
			goodsvo.setCurrentPage(vo.getCurrentPage());//현재페이지
					return goodsvo;
		}
	
	
	@RequestMapping("/goods/goodsdetail")
	@ResponseBody
	public GoodsInfoVO goodsdetail(@ModelAttribute("GoodsInfoVO") GoodsInfoVO vo) throws Exception {
		//상품정보.
		vo = service.selectGoodsOrderList(vo);
		
		//중분류 list
		vo.setCtLevel("2");
		List<GoodsInfoVO> slist = service.selectGoodsList(vo);
		vo.setScatelist(slist);
		
		//소분류 list
		vo.setCtLevel("3");
		List<GoodsInfoVO> dlist = service.selectGoodsList(vo);
		vo.setDcatelist(dlist);
		
		
	    return vo;
	}
	
	@RequestMapping("/goods/goodsUp")
	@ResponseBody
	public int goodsup(@ModelAttribute("GoodsInfoVO") GoodsInfoVO vo) throws Exception {
		FileVO filevo = new FileVO();
		filevo.setFile(vo.getThumnailFile());
		filevo = fileservice.createFile(filevo);
		vo.setThumnailUrl(filevo.getFilePath());
		int c = service.updateGoodsInfo(vo);
		
		
		
		if(vo.getImgFile()!=null) {
			GoodsImgVO imgvo = new GoodsImgVO();
			imgvo.setGoodsCd(vo.getGoodsCd());
			service.deleteGoodsImg(imgvo);
			for(int i=0;i<vo.getImgFile().size();i++) {
				
				filevo = new FileVO();
				filevo.setFile(vo.getImgFile().get(i));
				filevo = fileservice.createFile(filevo);
				
				imgvo.setGoodsCd(vo.getGoodsCd());
				imgvo.setImgUrl(filevo.getFilePath());
				imgvo.setFileName(filevo.getOrgFileNm());
				service.insertGoodsImg(imgvo);
			}
		}
		return c;
	}
	
	@RequestMapping("/goods/goodsIn")
	@ResponseBody
	public int goodsin(@ModelAttribute("GoodsInfoVO") GoodsInfoVO vo) throws Exception {
		FileVO filevo = new FileVO();
		if(vo.getThumnailFile()!=null) {
			filevo.setFile(vo.getThumnailFile());
			filevo = fileservice.createFile(filevo);
			vo.setThumnailUrl(filevo.getFilePath());
		}
		int c = service.insertGoodsInfo(vo);
		
		if(vo.getImgFile()!=null) {
			GoodsImgVO imgvo = new GoodsImgVO();
			for(int i=0;i<vo.getImgFile().size();i++) {
				filevo = new FileVO();
				filevo.setFile(vo.getImgFile().get(i));
				filevo = fileservice.createFile(filevo);
				
				imgvo.setGoodsCd(vo.getGoodsCd());
				imgvo.setImgUrl(filevo.getFilePath());
				imgvo.setFileName(filevo.getOrgFileNm());
				service.insertGoodsImg(imgvo);
			}
		}
	    return c;
	}
}

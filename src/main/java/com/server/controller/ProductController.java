package com.server.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.server.dto.SCurentPageDTO;
import com.server.dto.SProductLevelDTO;
import com.server.rpc.SProductMsService;

/**  
* 类说明   
*  
* @author zkj  
* @date 2017年4月5日  新建  
*/
@Controller
@RequestMapping("/product")
public class ProductController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private SProductMsService spProductMsService;
 	
	@RequestMapping("/view/{prodId}")
	public ModelAndView productDetail(@PathVariable("prodId") String prodId, ModelAndView modelAndView) {
		logger.info("*******调用产品详情显示控制，prodId={}********", prodId);
		SProductLevelDTO sproductDTO = spProductMsService.getProductDetail(prodId);
		modelAndView.setViewName("/admin/views");
		modelAndView.addObject("productDetail", sproductDTO);
		return modelAndView;
	}
	
	@RequestMapping("/getHotList")
	@ResponseBody
	public List<SProductLevelDTO> getProductHotList(SCurentPageDTO sCurentPageDTO) {
		logger.info("***********获取热门商品列表************");
		logger.info("--------" + sCurentPageDTO.getOrders());
		List<SProductLevelDTO> list = spProductMsService.getProductHot(sCurentPageDTO);
		return list;
	}
	
	@RequestMapping("/getNewList")
	@ResponseBody
	public List<SProductLevelDTO> getProductNewList(SCurentPageDTO sCurentPageDTO) {
		logger.info("***********获取新品商品列表************");
		logger.info("--------" + sCurentPageDTO.getOrders());
		List<SProductLevelDTO> list = spProductMsService.getProductNew(sCurentPageDTO);
		return list;
	}
	
	@RequestMapping("/getBandList/{bandId}")
	@ResponseBody
	public List<SProductLevelDTO> getBandList(@PathVariable("bandId") String bandId, SCurentPageDTO sCurentPageDTO) {
		logger.info("***********获取品牌商品列表************");
		logger.info("*******bandId = {}********", bandId);
		logger.info("--------" + sCurentPageDTO.getOrders());
		List<SProductLevelDTO> list = spProductMsService.getBandList(bandId, sCurentPageDTO);
		return list;
	}
	
	@RequestMapping("/getsortList/{sortId}")
	@ResponseBody
	public List<SProductLevelDTO> getSortList(@PathVariable("sortId") String sortId, SCurentPageDTO sCurentPageDTO) {
		logger.info("***********获取品牌商品列表************");
		logger.info("*******sortId = {}********", sortId);
		logger.info("--------" + sCurentPageDTO.getOrders());
		List<SProductLevelDTO> list = spProductMsService.getSortList(sortId, sCurentPageDTO);
		return list;
	}
	
	
	
}

package com.server.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping("/getHot")
	public ModelAndView getProductHot(ModelAndView modelAndView) {
		
		logger.info("***********获取热门商品************");
		
		return modelAndView;
		
	}
}

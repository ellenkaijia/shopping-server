package com.server.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.server.base.ResultInfo;
import com.server.dto.ShopCartDTO;
import com.server.rpc.ProductLevelMsService;
import com.server.rpc.UserMsService;

/**  
* 类说明   
*  
* @author zkj  
* @date 2017年4月15日  新建  
*/
@Controller
public class ShopCartController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ProductLevelMsService productLevelMsService;
	
	@Autowired
	private UserMsService userMsService;
	
	@RequestMapping("/addShopCart")
	@ResponseBody
	public ResultInfo addShopCart(ShopCartDTO shopCartDTO, HttpSession httpSession) {

		logger.info("******addShopCart方法*****prodId = {}, prodCount = {}", shopCartDTO.getProdId(), shopCartDTO.getProdCount());
		ResultInfo resultInfo = new ResultInfo();
		
		String userId = (String) httpSession.getAttribute("userId");
		logger.info("***********addShopCart获取的session userId={}***********",userId);
		shopCartDTO.setUserId(userId);
		Integer result = userMsService.addShopCart(shopCartDTO);
		if(result == 0) {
			resultInfo.setCode(0);
			resultInfo.setMessage("加入购物车成功");
		} else if(result == -99){
			resultInfo.setCode(-99);
			resultInfo.setMessage("已经加入过购物车");
		} else if(result == -98){
			resultInfo.setCode(-98);
			resultInfo.setMessage("后台服务出错");
		}
		return resultInfo;
	}

	@RequestMapping("/deleteShopCart")
	@ResponseBody
	public ResultInfo deleteShopCart(HttpSession httpSession, @Param("prodId") String prodId) {
		logger.info("******deleteShopCart方法*****prodId = {}", prodId);
		ResultInfo resultInfo = new ResultInfo();
		boolean result = productLevelMsService.deleteShopCart(prodId, (String)httpSession.getAttribute("userId"));
		
		if(result) {
			resultInfo.setCode(0);
			resultInfo.setMessage("请求成功");
		} else {
			resultInfo.setCode(-99);
			resultInfo.setMessage("请求失败");
		}
		return resultInfo;
	}
	
	@RequestMapping("/changeShopCartNum")
	@ResponseBody
	public ResultInfo changeShopCartNum(HttpSession httpSession, @Param("prodId") String prodId, @Param("num") Integer num) {
		logger.info("******changeShopCartNum方法*****prodId = {}, prodCount = {}", prodId, num);
		ResultInfo resultInfo = new ResultInfo();
		boolean result = productLevelMsService.changeShopCartNum(prodId, num, (String)httpSession.getAttribute("userId"));
		
		if(result) {
			resultInfo.setCode(0);
			resultInfo.setMessage("请求成功");
		} else {
			resultInfo.setCode(-99);
			resultInfo.setMessage("请求失败");
		}
		return resultInfo;
	}
	
}

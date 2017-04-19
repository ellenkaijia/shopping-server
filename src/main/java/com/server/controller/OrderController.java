package com.server.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.server.dto.SAddressDTO;
import com.server.dto.SProductLevelDTO;
import com.server.dto.SUserOrderShowDTO;
import com.server.rpc.UserMsService;

/**  
* 类说明   
*  
* @author zkj  
* @date 2017年4月17日  新建  
*/
@Controller
public class OrderController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired 
	private UserMsService userMsService;
	
	@RequestMapping("/userOrder/{status}")
	public ModelAndView getUserOrder(@PathVariable("status") Integer status, HttpSession httpSession) {
		logger.info("*****getUserOrder方法，status={}****", status);
		ModelAndView modelAndView = new ModelAndView();
		String userId = (String) httpSession.getAttribute("userId");
		List<SUserOrderShowDTO> list = userMsService.getUserOrder(userId, status);
		modelAndView.addObject("orders", list);
		modelAndView.setViewName("/admin/order");
		
		return modelAndView;
	}
	
	@RequestMapping("/orderDetail")
	public ModelAndView orderDetail(HttpServletRequest request,HttpServletResponse response,ModelAndView modelAndView,HttpSession httpSession,@RequestParam(value="prodName",required=false) String prodName, @RequestParam(value="prodId",required=false) String prodId, @RequestParam(value="moneySum",required=false) BigDecimal moneySum) {
		if(prodId == null || prodName == null) {
			try {
				response.sendRedirect(request.getContextPath() + "/index");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		
		modelAndView.setViewName("/admin/orderDetail");
		logger.info("*******orderDetail方法，prodName={},prodId={},moneySum={}************",prodName,prodId,moneySum);
		String userId = (String) httpSession.getAttribute("userId");
		List<SProductLevelDTO> productList = userMsService.getOrderByUidPid(userId, prodId);
		SAddressDTO dto = userMsService.getAddressStatusOne(userId);
		modelAndView.addObject("moneySum", moneySum);
		modelAndView.addObject("productList", productList);
		modelAndView.addObject("address", dto);
		
		return modelAndView;
	}
}

package com.server.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.server.base.ResultInfo;
import com.server.dto.UserBuyDTO;
import com.server.rpc.UserMsService;

/**  
* 类说明   
*  
* @author zkj  
* @date 2017年4月17日  新建  
*/
@Controller
public class TradeController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private UserMsService userMsService;
	
	
	
	@RequestMapping("/productBuy")
	@ResponseBody
	public ResultInfo productBuy(UserBuyDTO userBuyDTO, HttpSession httpSession) {
		
		ResultInfo resultInfo = new ResultInfo();
		httpSession.setAttribute("prodName", userBuyDTO.getProdName());
		httpSession.setAttribute("prodId", userBuyDTO.getProdId());
		httpSession.setAttribute("buyCount", userBuyDTO.getBuyCount());
		httpSession.setAttribute("moneySum", userBuyDTO.getMoneySum());
		httpSession.setAttribute("oneAddressId", userBuyDTO.getAddressId());
		
		resultInfo.setCode(0);
		resultInfo.setMessage("成功");
		
		return resultInfo;
	}
	
	@RequestMapping("/trade")
	public ModelAndView trade(ModelAndView modelAndView, HttpSession httpSession) {
		
		logger.info("******trade转发*****");
		modelAndView.addObject("moneySum", httpSession.getAttribute("moneySum"));
		modelAndView.addObject("prodName", httpSession.getAttribute("prodName"));
		modelAndView.setViewName("/trade");
		return modelAndView;
	}
	
	@RequestMapping("/traderesult")
	public ModelAndView traderesult(ModelAndView modelAndView, HttpSession httpSession) {
		logger.info("******traderesult转发*****");
		
		BigDecimal moneySum = (BigDecimal) httpSession.getAttribute("moneySum");
		Integer buyCount = (Integer) httpSession.getAttribute("buyCount");
		String prodId = (String) httpSession.getAttribute("prodId");
		String userId = (String) httpSession.getAttribute("userId");
		Long addressId = (Long) httpSession.getAttribute("oneAddressId");
		
		logger.info("*****traderesult, moneySum={},buyCount={},prodId={},userId={},addressId={}****"
				,moneySum,buyCount,prodId,userId,addressId);
		
		Map<String, String> resultMap = userMsService.tradeIntoOrder(userId, prodId, buyCount, moneySum, addressId);
		String code = resultMap.get("code");
		String orderId = "交易失败";
		if(code.equals("0")) {
			orderId = resultMap.get("orderId");
		}
		
		modelAndView.addObject("moneySum", moneySum);
		modelAndView.addObject("prodName", httpSession.getAttribute("prodName"));
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateStr = simpleDateFormat.format(new Date());
		modelAndView.addObject("nowDate", dateStr);
		modelAndView.addObject("orderId", orderId);
		modelAndView.setViewName("/traderesult");
		return modelAndView;
	}
	
	@RequestMapping("/shopCarToBuy")
	@ResponseBody
	public ResultInfo shopCarToBuy(HttpSession httpSession,@RequestParam(value="prodName",required=false) String prodName,
			@RequestParam(value="prodId",required=false) String prodId, @RequestParam(value="moneySum",required=false) BigDecimal moneySum,
			@RequestParam(value="addressId",required=false) Long addressId) {
		ResultInfo resultInfo = new ResultInfo();
		
		logger.info("*******shopCarToBuy方法，prodName={},prodId={},moneySum={}************",prodName,prodId,moneySum);
		
		httpSession.setAttribute("prodIds", prodId);
		httpSession.setAttribute("prodNames", prodName);
		httpSession.setAttribute("shopcartMoneySum", moneySum);
		httpSession.setAttribute("addressId", addressId);
		
		resultInfo.setCode(0);
		resultInfo.setMessage("成功");
		
		return resultInfo;
	}
	
	@RequestMapping("/shopCartrade")
	public ModelAndView shopCartrade(ModelAndView modelAndView, HttpSession httpSession) {
		
		logger.info("******shopCartrade转发*****");
		modelAndView.addObject("moneySum", httpSession.getAttribute("shopcartMoneySum"));
		modelAndView.addObject("prodName", httpSession.getAttribute("prodNames"));
		modelAndView.setViewName("/shopCarTrade");
		return modelAndView;
	}
	
	@RequestMapping("/shopCartradeResult")
	public ModelAndView shopCartradeResult(ModelAndView modelAndView, HttpSession httpSession) {
		logger.info("******shopCartradeResult转发*****");
		
		BigDecimal moneySum = (BigDecimal) httpSession.getAttribute("shopcartMoneySum");
		String prodIds = (String) httpSession.getAttribute("prodIds");
		String userId = (String) httpSession.getAttribute("userId");
		Long addressId = (Long) httpSession.getAttribute("addressId");
		
		logger.info("*****traderesult, moneySum={},prodId={},userId={},addressId={}****"
				,moneySum,prodIds,userId,addressId);
		
		Map<String, String> resultMap = userMsService.shopCartradeOrder(userId, prodIds, addressId);
		String code = resultMap.get("code");
		String orderId = "交易失败";
		if(code.equals("0")) {
			orderId = resultMap.get("orderId");
		}
		
		modelAndView.addObject("moneySum", moneySum);
		modelAndView.addObject("prodName", httpSession.getAttribute("prodNames"));
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateStr = simpleDateFormat.format(new Date());
		modelAndView.addObject("nowDate", dateStr);
		modelAndView.addObject("orderId", orderId);
		modelAndView.setViewName("/shopCarTradeResult");
		return modelAndView;
	}
	
}

package com.server.controller;

import java.util.List;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.server.base.ResultInfo;
import com.server.dto.SRepairDTO;
import com.server.rpc.UserMsService;

/**  
* 类说明   
*  
* @author zkj  
* @date 2017年4月20日  新建  
*/
@Controller
public class RepairController {

	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private UserMsService userMsService;
	
	@RequestMapping("/repair/{orderId}/{prodId}")
	public ModelAndView repairJSP(ModelAndView modelAndView, @PathVariable("orderId") String orderId, @PathVariable("prodId") String prodId) {
		log.info("******repair填写维修页面*****");
		modelAndView.addObject("orderId", orderId);
		modelAndView.addObject("prodId", prodId);
		modelAndView.setViewName("/admin/repair");
		return modelAndView;
	}
	
	@RequestMapping("/addRepair")
	@ResponseBody
	public ResultInfo addRepair(SRepairDTO sRepairDTO, HttpSession httpSession) {
		
		ResultInfo resultInfo = new ResultInfo();
		log.info("******addRepair方法，prodId={},orderId={}*****",sRepairDTO.getProdId(), sRepairDTO.getOrderId());
		
		if(sRepairDTO.getProdId() == null || sRepairDTO.getOrderId() == null || sRepairDTO.getProdId() == "" || sRepairDTO.getOrderId() == "") {
			resultInfo.setCode(-98);
			resultInfo.setMessage("表单失效");
			return resultInfo;
		}
		
		sRepairDTO.setUserId((String)httpSession.getAttribute("userId"));
		Integer integer = userMsService.addRepair(sRepairDTO);
		if(integer == 0) {
			resultInfo.setCode(0);
			resultInfo.setMessage("成功");
		} else {
			resultInfo.setCode(-99);
			resultInfo.setMessage("失败");
		}
		
		return resultInfo;
	}
	
	
	@RequestMapping("/myRepair")
	public ModelAndView getMyRepair(HttpSession httpSession, ModelAndView modelAndView) {
		
		log.info("******getMyRepair方法*****");
		
		String userId = (String)httpSession.getAttribute("userId");
		List<SRepairDTO> list = userMsService.getMyRepair(userId);
		modelAndView.addObject("repair", list);
		modelAndView.setViewName("/admin/myRepair");
		
		return modelAndView;
	}
	
	@RequestMapping("/noBuyRepair")
	public ModelAndView noBuyRepair(ModelAndView modelAndView) {
		log.info("******addNoBuyRepair填写维修页面*****");
		modelAndView.setViewName("/admin/NoBuyRepair");
		return modelAndView;
	}
	
	@RequestMapping("/addNoBuyRepair")
	@ResponseBody
	public ResultInfo addNoBuyRepair(SRepairDTO sRepairDTO, HttpSession httpSession) {
		log.info("******addNoBuyRepair填写维修页面*****");
		ResultInfo resultInfo = new ResultInfo();
		
		sRepairDTO.setUserId((String)httpSession.getAttribute("userId"));
		Integer integer = userMsService.addNoBuyRepair(sRepairDTO);
		if(integer == 0) {
			resultInfo.setCode(0);
			resultInfo.setMessage("成功");
		} else {
			resultInfo.setCode(-99);
			resultInfo.setMessage("失败");
		}
		
		return resultInfo;
	}
	
}

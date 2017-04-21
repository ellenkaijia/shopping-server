package com.server.controller;

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
import com.server.dto.STalkDTO;
import com.server.rpc.UserMsService;

/**  
* 类说明   
*  
* @author zkj  
* @date 2017年4月20日  新建  
*/
@Controller
public class TalkController {

	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private UserMsService userMsServie;
	
	@RequestMapping("/talk/{orderId}/{prodId}")
	public ModelAndView talkJSP(ModelAndView modelAndView, @PathVariable("orderId") String orderId,@PathVariable("prodId") String prodId) {
		log.info("******talk评论页面*****");
		modelAndView.addObject("orderId", orderId);
		modelAndView.addObject("prodId", prodId);
		modelAndView.setViewName("/admin/talk");
		return modelAndView;
	}
	
	@RequestMapping("/addTalk")
	@ResponseBody
	public ResultInfo addTalk(STalkDTO stalkDTO, HttpSession httpSession) {
		
		ResultInfo resultInfo = new ResultInfo();
		log.info("******addTalk方法，prodId={},orderId={}*****",stalkDTO.getProdId(), stalkDTO.getOrderId());
		
		if(stalkDTO.getProdId() == null || stalkDTO.getOrderId() == null) {
			resultInfo.setCode(-98);
			resultInfo.setMessage("表单失效");
			return resultInfo;
		}
		
		stalkDTO.setUserId((String)httpSession.getAttribute("userId"));
		Integer integer = userMsServie.addTalk(stalkDTO);
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

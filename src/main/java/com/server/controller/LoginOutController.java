package com.server.controller;

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
import com.server.dto.SUserDTO;
import com.server.rpc.UserMsService;

/**  
* 类说明   
*  
* @author zkj  
* @date 2017年4月15日  新建  
*/
@Controller
public class LoginOutController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private UserMsService userMsService;
	
	@RequestMapping("/login")
	public ModelAndView loginGo(ModelAndView modelAndView) {
		logger.info("*********进入到login登录页面控制层********");
		modelAndView.setViewName("/login");
		return modelAndView;
	}
	
	@RequestMapping("/logout")
	@ResponseBody
	public ResultInfo logout(HttpSession httpSession) {
		ResultInfo resultInfo = new ResultInfo();
		try {
			httpSession.invalidate();
			resultInfo.setCode(0);
			resultInfo.setMessage("注销成功");
		} catch(Exception e) {
			logger.error(e.getMessage());
			resultInfo.setCode(-99);
			resultInfo.setMessage("服务器报错");
		}
		return resultInfo;
	}
	
	@RequestMapping("/register")
	public ModelAndView registerGo(ModelAndView modelAndView) {
		logger.info("*********进入到register注册页面控制层********");
		modelAndView.setViewName("/register");
		return modelAndView;
	}
	
	@RequestMapping("/loginGo")
	@ResponseBody
	public ResultInfo toLoginGo(SUserDTO suserDTO, HttpSession httpSession) {
		logger.info("****loginGo = {}****" );
		ResultInfo resultInfo = new ResultInfo();
		Integer result = userMsService.checkPassword(suserDTO);
		String userId = userMsService.queryUserId(suserDTO);
		if(result == 0) {
			httpSession.setAttribute("userId", userId);
			httpSession.setAttribute("userPhone", suserDTO.getUserPhone());
			resultInfo.setCode(0);
			resultInfo.setMessage("成功");
		} else if(result == -98){
			resultInfo.setCode(-98);
			resultInfo.setMessage("密码错误");
		} else if(result == -99) {
			resultInfo.setCode(-99);
			resultInfo.setMessage("验证码错误");
		}
		return resultInfo;
		
	}
	
	@RequestMapping("/registerGo")
	@ResponseBody
	public ResultInfo toRegisterGo(SUserDTO suserDTO) {
		logger.info("****registerGo = {}****");
		ResultInfo resultInfo = new ResultInfo();
		Integer result = userMsService.registerGo(suserDTO);
		if(result == 0) {
			resultInfo.setCode(0);
			resultInfo.setMessage("成功");
		} else if(result == 1) {
			resultInfo.setCode(-99);
			resultInfo.setMessage("验证码错误");
		} else if(result == 2) {
			resultInfo.setCode(-99);
			resultInfo.setMessage("服务器插入数据错误");
		}
		return resultInfo;
		
	}
	
	@RequestMapping("/checkPhone")
	@ResponseBody
	public ResultInfo checkPhone(@RequestParam("phone") String phone) {
		logger.info("****checkPhone = {}****" , phone);
		ResultInfo resultInfo = new ResultInfo();
		boolean result = userMsService.checkPhone(phone);
		if(result) {
			resultInfo.setCode(0);
			resultInfo.setMessage("该手机号码可以登录");
		} else {
			resultInfo.setCode(-99);
			resultInfo.setMessage("该手机号码还没注册");
		}
		return resultInfo;
	}
	
	@RequestMapping("/sendSms")
	@ResponseBody
	public ResultInfo sendSms(@RequestParam("phone") String phone) {
		logger.info("****sendSms = {}****" , phone);
		ResultInfo resultInfo = new ResultInfo();
		boolean result = userMsService.sendSms(phone);
		if(result) {
			resultInfo.setCode(0);
			resultInfo.setMessage("验证码发送成功");
		} else {
			resultInfo.setCode(-99);
			resultInfo.setMessage("验证码发送失败");
		}
		return resultInfo;
	}

}

package com.server.controller;

import java.util.List;

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
import com.server.dto.SAddressDTO;
import com.server.rpc.UserMsService;

/**  
* 类说明   
*  
* @author zkj  
* @date 2017年4月19日  新建  
*/
@Controller
public class AddressController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private UserMsService userMsService;

	@RequestMapping("/address")
	public ModelAndView getAddress(ModelAndView modelAndView, HttpSession httpSession) {
		modelAndView.setViewName("/admin/address");
		return modelAndView;
	}
	
	@RequestMapping("/isHaveAddress")
	@ResponseBody
	public ResultInfo isHaveAddress(HttpSession httpSession) {
		
		logger.info("******isHaveAddress方法，判断是否有地址*******");
		
		ResultInfo resultInfo = new ResultInfo();
		
		String userId = (String) httpSession.getAttribute("userId");
		
		boolean result = userMsService.isHaveAddress(userId);
		if(result) {
			resultInfo.setCode(0);
			resultInfo.setMessage("成功");
		} else {
			resultInfo.setCode(-99);
			resultInfo.setMessage("失败");
		}
		return resultInfo;
		
	}
	
	@RequestMapping("/getAddressList")
	public ModelAndView getAddressList(ModelAndView modelAndView, HttpSession httpSession) {
		modelAndView.setViewName("/admin/address");
		String userId = (String) httpSession.getAttribute("userId");
		List<SAddressDTO> list = userMsService.getAddressList(userId);
		modelAndView.addObject("addressList", list);
		return modelAndView;
	}
	
	@RequestMapping("/addAddress")
	@ResponseBody
	public ResultInfo addAddress(HttpSession httpSession, SAddressDTO sAddressDTO) {
		
		logger.info("******addAddress方法，用户增加新的地址， address={}*******", sAddressDTO.getUserAddress());
		ResultInfo resultInfo = new ResultInfo();
		
		String userId = (String) httpSession.getAttribute("userId");
		
		Integer result = userMsService.addAddress(userId, sAddressDTO);
		if(result == 0) {
			resultInfo.setCode(0);
			resultInfo.setMessage("成功");
		} else {
			resultInfo.setCode(-99);
			resultInfo.setMessage("失败");
		}
		return resultInfo;
		
	}
	
	@RequestMapping("/updateAddressStatus")
	@ResponseBody
	public ResultInfo updateAddressStatus(HttpSession httpSession, @RequestParam("id") Integer id) {
		
		logger.info("******updateAddressStatus方法,id={}*******", id);
		ResultInfo resultInfo = new ResultInfo();
		String userId = (String) httpSession.getAttribute("userId");
		
		Integer result = userMsService.updateAddressStatus(userId,id);
		
		if(result == 0) {
			resultInfo.setCode(0);
			resultInfo.setMessage("成功");
		} else {
			resultInfo.setCode(-99);
			resultInfo.setMessage("失败");
		}
		return resultInfo;
		
	}
	
	@RequestMapping("/deleteAddress")
	@ResponseBody
	public ResultInfo deleteAddress(HttpSession httpSession, @RequestParam("id") Long id) {
		
		logger.info("******deleteAddress方法,id={}*******", id);
		ResultInfo resultInfo = new ResultInfo();
		
		Integer result = userMsService.deleteAddress(id);
		
		if(result == 0) {
			resultInfo.setCode(0);
			resultInfo.setMessage("成功");
		} else {
			resultInfo.setCode(-99);
			resultInfo.setMessage("失败");
		}
		return resultInfo;
		
	}
	
}

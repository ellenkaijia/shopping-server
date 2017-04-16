package com.server.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.server.base.ResultInfo;
import com.server.rpc.UserMsService;

/**  
* 类说明   
*  
* @author zkj  
* @date 2017年4月15日  新建  
*/
@Controller
public class FavorController {

private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private UserMsService userMsService;
	
	@RequestMapping("/addInterest")
	@ResponseBody
	public ResultInfo addInterest(HttpSession httpSession, @RequestParam("prodId") String prodId, @RequestParam("status") Integer status) {
		logger.info("*******进入addInterest方法*******");
		ResultInfo resultInfo = new ResultInfo();
		String userId = (String) httpSession.getAttribute("userId");
		if(status == 1) {  //1是收藏
			boolean result = userMsService.addInterest(userId, prodId);
			if(result) {
				resultInfo.setCode(0);
				resultInfo.setMessage("收藏成功");
				resultInfo.setData(-98);
			} else {
				resultInfo.setCode(-99);
				resultInfo.setMessage("收藏失败");
				resultInfo.setData(-99);
			}
		} else {
			boolean result = userMsService.removeInterest(userId, prodId);
			if(result) {
				resultInfo.setCode(0);
				resultInfo.setMessage("取消成功");
				resultInfo.setData(-99);
			} else {
				resultInfo.setCode(-99);
				resultInfo.setMessage("取消失败");
				resultInfo.setData(-98);
			}
		}
		
		return resultInfo;
		
	}
	
}

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
import com.server.dto.SProductLevelDTO;
import com.server.rpc.UserMsService;

/**
 * 类说明
 * 
 * @author zkj
 * @date 2017年4月17日 新建
 */
@Controller
public class CollectionController {

	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private UserMsService userMsService;

	@RequestMapping("/myCollection")
	public ModelAndView getMyCollection(HttpSession httpSession, ModelAndView modelAndView) {
		List<SProductLevelDTO> list = userMsService.getMyCollectionList((String) httpSession.getAttribute("userId"));
		logger.info("***myCollection方法 获取的list size = {}****", list.size());
		modelAndView.addObject("favor", list);
		modelAndView.setViewName("/admin/favor_list");
		return modelAndView;
	}

	@RequestMapping("/removeCollection")
	@ResponseBody
	public ResultInfo removeCollection(HttpSession httpSession, @RequestParam("prodId") String prodId) {
		ResultInfo resultInfo = new ResultInfo();
		String userId = (String) httpSession.getAttribute("userId");
		boolean result = userMsService.removeCollection(userId, prodId);
		if (result) {
			resultInfo.setCode(0);
			resultInfo.setMessage("成功");
		} else {
			resultInfo.setCode(-99);
			resultInfo.setMessage("删除失败");
		}
		return resultInfo;
	}
}

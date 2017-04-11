package com.server.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.server.base.ProdTypeCodeConstant;
import com.server.dto.SProductLevelDTO;
import com.server.rpc.ProductLevelMsService;
import com.server.util.PropertiesUtil;

/**  
* 类说明   
*  
* @author zkj  
* @date 2017年4月5日  新建  
*/

@Controller
public class IndexResController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ProductLevelMsService productLevelMsService;
	
	@Autowired
	private PropertiesUtil propertiesUtil;
	
	@RequestMapping("/index")
	public ModelAndView indexGo(ModelAndView modelAndView) {
		logger.info("*********进入到index主页面控制层********");
		List<SProductLevelDTO> listDS = productLevelMsService.getProductLevelByCode(ProdTypeCodeConstant.DIANSHI);
		logger.info("listDS的list size：" + listDS.size());
		modelAndView.addObject("dianshi", listDS);
		modelAndView.setViewName("/index");
		return modelAndView;
	}
	
	@RequestMapping("/category")
	public ModelAndView categoryGo(ModelAndView modelAndView) {
		
		modelAndView.setViewName("/admin/category");
		return modelAndView;
	}
	
	@RequestMapping("/getHot")
	public ModelAndView getProductHot(ModelAndView modelAndView) {
		modelAndView.setViewName("/admin/category_list");
		modelAndView.addObject("whatCode", "getHotList");
		return modelAndView;
		
	}
	
	@RequestMapping("/getNew")
	public ModelAndView getProductNew(ModelAndView modelAndView) {
		modelAndView.setViewName("/admin/category_list");
		modelAndView.addObject("whatCode", "getNewList");
		return modelAndView;
		
	}
	
	@RequestMapping("/shopcart")
	public ModelAndView shopcartGo(ModelAndView modelAndView) {
		
		modelAndView.setViewName("/admin/shopcart");
		return modelAndView;
	}
	
	@RequestMapping("/userhome")
	public ModelAndView userhomeGo(ModelAndView modelAndView) {
		
		modelAndView.setViewName("/admin/userhome");
		return modelAndView;
	}
	
	@RequestMapping("/picResource/**")
	public String getResourceStream(HttpServletRequest request, HttpServletResponse response) {
		logger.info("******进入图片的模块*******");
		String pathInfo = request.getServletPath().substring("/picResource".length()); // request.getPathInfo()
		String filePath = propertiesUtil.getProperties().get("product_file_path") + pathInfo;
		File file = new File(filePath);
		logger.info("图片路径为：" + filePath);
		if (file.isFile()) {
			response.setHeader("Content-Type", request.getServletContext().getMimeType(file.getName()));
			response.setHeader("Content-Length", String.valueOf(file.length()));
			response.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");

			OutputStream out = null;
			try {
				out = response.getOutputStream();
				Files.copy(file.toPath(), out);
			} catch (IOException e) {
				logger.error(e.toString(), e);
				response.setStatus(HttpServletResponse.SC_SERVICE_UNAVAILABLE);
			} finally {
				IOUtils.closeQuietly(out);
			}
			return null;
		}
		response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		return "/404.jsp";
	}
	
}

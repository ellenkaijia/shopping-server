package com.server.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.server.base.ProdTypeCodeConstant;
import com.server.base.ResultInfo;
import com.server.dto.SBandShowDTO;
import com.server.dto.SProductLevelDTO;
import com.server.dto.SUserDTO;
import com.server.dto.ShopCarShowDTO;
import com.server.dto.SortShowDTO;
import com.server.rpc.ProductLevelMsService;
import com.server.rpc.UserMsService;
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
	private UserMsService userMsService;
	
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
		List<SBandShowDTO> list = productLevelMsService.getProductBandAll();
		logger.info("SBandShowDTO的list size：" + list.size());
		List<SortShowDTO> sSortDTOs = productLevelMsService.getSortAll();
		logger.info("SSortDTO的list size：" + list.size());
		modelAndView.addObject("band", list);
		modelAndView.addObject("sort", sSortDTOs);
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
	
	@RequestMapping("/getBandCategoryList/{bandId}")
	public ModelAndView getBandList(@PathVariable("bandId") String bandId, ModelAndView modelAndView) {
		modelAndView.addObject("whatCode", "getBandList/" + bandId);
		modelAndView.setViewName("/admin/category_list");
		return modelAndView;
	}
	
	@RequestMapping("/getSortCategoryList/{sortId}")
	public ModelAndView getSortList(@PathVariable("sortId") String sortId, ModelAndView modelAndView) {
		modelAndView.addObject("whatCode", "getsortList/" + sortId);
		modelAndView.setViewName("/admin/category_list");
		return modelAndView;
	}
	
	@RequestMapping("/getBand")
	public ModelAndView getProductBand(ModelAndView modelAndView) {
		List<SBandShowDTO> list = productLevelMsService.getProductBandAll();
		logger.info("listDS的list size：" + list.size());
		modelAndView.addObject("band", list);
		modelAndView.setViewName("/admin/band");
		return modelAndView;
	}
	
	/**
	 * 购物车
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/shopcart")
	public ModelAndView shopcartGo(ModelAndView modelAndView, HttpSession httpSession) {
		String userId = (String) httpSession.getAttribute("userId");
		logger.info("******shopcart请求，shopcartGo方法获取的userId={}**********", userId);
		List<ShopCarShowDTO> list = productLevelMsService.getShopCartList(userId);
		modelAndView.addObject("shopcart", list);
		modelAndView.setViewName("/admin/shopcart");
		return modelAndView;
	}
	
	@RequestMapping("/userhome")
	public ModelAndView userhomeGo(ModelAndView modelAndView, HttpSession httpSession) {
		String userId = (String) httpSession.getAttribute("userId");
		if(userId == null) {
			modelAndView.addObject("favorCount", 0);
			modelAndView.addObject("status", 0);
		} else {
			Integer count = userMsService.getMyFavorCount(userId);
			SUserDTO sUserDTO = userMsService.getUserAllByUid(userId);
			modelAndView.addObject("favorCount",count);
			modelAndView.addObject("status", 1);
			modelAndView.addObject("user",sUserDTO);
		}
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
	
	@RequestMapping("/getBandCategoryList/picResource/**")
	public String getBandListResourceStream(HttpServletRequest request, HttpServletResponse response) {
		logger.info("******进入图片的模块*******");
		String pathInfo = request.getServletPath().substring("/getBandCategoryList/picResource".length()); // request.getPathInfo()
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
	
	@RequestMapping("/getSortCategoryList/picResource/**")
	public String getSortListResourceStream(HttpServletRequest request, HttpServletResponse response) {
		logger.info("******进入图片的模块*******");
		String pathInfo = request.getServletPath().substring("/getSortCategoryList/picResource".length()); // request.getPathInfo()
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
	
	@RequestMapping("/bandPicResource/**")
	public String getResourceBandStream(HttpServletRequest request, HttpServletResponse response) {
		logger.info("******进入图片的模块*******");
		String pathInfo = request.getServletPath().substring("/bandPicResource".length()); // request.getPathInfo()
		String filePath = propertiesUtil.getProperties().get("band_file_path") + pathInfo;
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
	
	@RequestMapping("/sortPicResource/**")
	public String getResourceSortStream(HttpServletRequest request, HttpServletResponse response) {
		logger.info("******进入图片的模块*******");
		String pathInfo = request.getServletPath().substring("/sortPicResource".length()); // request.getPathInfo()
		String filePath = propertiesUtil.getProperties().get("sort_file_path") + pathInfo;
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
	
	@RequestMapping("/myCollection")
	public ModelAndView getMyCollection(HttpSession httpSession, ModelAndView modelAndView) {
		List<SProductLevelDTO> list = userMsService.getMyCollectionList((String)httpSession.getAttribute("userId"));
		logger.info("***myCollection方法 获取的list size = {}****",list.size());
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
		if(result) {
			resultInfo.setCode(0);
			resultInfo.setMessage("成功");
		} else {
			resultInfo.setCode(-99);
			resultInfo.setMessage("删除失败");
		}
		return resultInfo;
	}
	
	
}

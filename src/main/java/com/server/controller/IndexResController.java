package com.server.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	@RequestMapping("/login")
	public ModelAndView loginGo(ModelAndView modelAndView) {
		logger.info("*********进入到login登录页面控制层********");
		modelAndView.setViewName("/login");
		return modelAndView;
	}
	
	@RequestMapping("/register")
	public ModelAndView registerGo(ModelAndView modelAndView) {
		logger.info("*********进入到register注册页面控制层********");
		modelAndView.setViewName("/register");
		return modelAndView;
	}
	
	@RequestMapping("/loginGo")
	@ResponseBody
	public ResultInfo toLoginGo(SUserDTO suserDTO) {
		logger.info("****loginGo = {}****" );
		ResultInfo resultInfo = new ResultInfo();
		Integer result = userMsService.checkPassword(suserDTO);
		if(result == 0) {
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
	
	@RequestMapping("/addShopCart")
	@ResponseBody
	public Map<String, Object> addShopCart(@RequestParam("prodId") String prodId,@RequestParam("prodCount") Integer prodCount) {
		
		logger.info("prodId = {}, prodCount = {}",prodId,prodCount);
		return null;
	}
	
}

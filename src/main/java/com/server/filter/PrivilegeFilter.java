package com.server.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.sf.json.JSONObject;

/**
 * 权限过滤器，主要用于页面访问的权限控制
 * 
 * @author zkj
 */
public class PrivilegeFilter implements Filter {

	Logger log = LoggerFactory.getLogger(PrivilegeFilter.class);

	private String rightConfig;
	// 不做权限校验的页面列表：index.jsp,login.jsp
	private String notPrivilegeControlUrls = null;
	// 静态资源文件不做校验
	private String notPrivilegeStaticFiles;
	// 没有权限时候要跳转到的页面
	private String noPrivilegePage = null;
	// 不做校验的控制器路径
	private String noPrivilegeController = null;

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(false);

		String url = PrivilegeFilter.getRequestUri(req);
		String requestType = req.getHeader("X-Requested-With");// 请求类型
																// 判定是否为ajax请求

		String fileExtensionName = "";
		if (url.indexOf(".") > -1) {
			fileExtensionName = url.substring(url.lastIndexOf("."));
		}

		if ("/".equalsIgnoreCase(url)) {
			// 首页
			log.info("******主页*****");
			req.getRequestDispatcher("/index").forward(req, res);
		} else if ("/index".equalsIgnoreCase(url) || "/index.jsp".equalsIgnoreCase(url)) {
			// 重定向主页
			log.info("******重定向主页*****");
			filterChain.doFilter(req, res);
		} else if (!StringUtils.isEmpty(fileExtensionName) && !StringUtils.isEmpty(notPrivilegeStaticFiles)
				&& notPrivilegeStaticFiles.contains(fileExtensionName)) {
			// 不做权限校验的静态文件(js、css、images等)
			filterChain.doFilter(request, response); // 可以再补权限
		} else if ("/category".equalsIgnoreCase(url)) {
			filterChain.doFilter(req, res);
		} else if ("/userhome".equalsIgnoreCase(url)) {
			filterChain.doFilter(req, res);
		} else if ("/addShopCart".equalsIgnoreCase(url) && requestType.equals("XMLHttpRequest")) {
			log.info("********addShopCart********");
			String userId = (String) session.getAttribute("userId");
			if (userId == null) {
				log.info("********没有登录********");
				Map<String, Object> map = new HashMap<>();
				map.put("status", "OFFLINE");
				res.getWriter().write(JSONObject.fromObject(map).toString());
			} else {
				filterChain.doFilter(request, response);
			}
		} else if ("/shopcart".equalsIgnoreCase(url)) {
			String userId = (String) session.getAttribute("userId");
			if (userId == null) {
				log.info("********没有登录,转发登录页面********");
				res.sendRedirect(req.getContextPath() + "/login");
			} else {
				filterChain.doFilter(request, response);
			}
		} else if ("/addInterest".equalsIgnoreCase(url)) {
			log.info("********addInterest filter********");
			String userId = (String) session.getAttribute("userId");
			if (userId == null) {
				log.info("********没有登录********");
				Map<String, Object> map = new HashMap<>();
				map.put("status", "OFFLINE");
				res.getWriter().write(JSONObject.fromObject(map).toString());
			} else {
				filterChain.doFilter(request, response);
			}
		} else if ("/tryToBuy".equalsIgnoreCase(url)) {
			log.info("********addInterest filter********");
			String userId = (String) session.getAttribute("userId");
			if (userId == null) {
				log.info("********没有登录********");
				Map<String, Object> map = new HashMap<>();
				map.put("status", "OFFLINE");
				res.getWriter().write(JSONObject.fromObject(map).toString());
			} else {
				Map<String, Object> map = new HashMap<>();
				map.put("status", "ONLINE");
				res.getWriter().write(JSONObject.fromObject(map).toString());
			}
		} else if ("/myCollection".equalsIgnoreCase(url)) {
			String userId = (String) session.getAttribute("userId");
			if (userId == null) {
				log.info("********没有登录,转发登录页面********");
				res.sendRedirect(req.getContextPath() + "/login");
			} else {
				filterChain.doFilter(request, response);
			}
		} else if ("/myComment".equalsIgnoreCase(url)) {
			String userId = (String) session.getAttribute("userId");
			if (userId == null) {
				log.info("********没有登录,转发登录页面********");
				res.sendRedirect(req.getContextPath() + "/login");
			} else {
				filterChain.doFilter(request, response);
			}
		}

		else {
			filterChain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.rightConfig = filterConfig.getInitParameter("rightConfig");// rightConfig
		Properties p = new Properties();
		try {
			p.load(this.getClass().getClassLoader().getResourceAsStream(rightConfig));
			this.notPrivilegeControlUrls = p.getProperty("notPrivilegeControlUrls");
			this.notPrivilegeStaticFiles = p.getProperty("notPrivilegeStaticFiles");
			this.noPrivilegePage = p.getProperty("noPrivilegePage");
			this.noPrivilegeController = p.getProperty("noPrivilegeController");
		} catch (IOException e) {
			log.error(e.getMessage(), e);
		}

	}

	/** 获得访问URL的从context后面的字符串，以/开头。 */
	public static String getRequestUri(final HttpServletRequest request) {
		if (request == null) {
			return "";
		}
		try {
			StringBuilder uri = new StringBuilder(request.getRequestURI());
			if (uri != null && uri.length() > 0) {
				uri.delete(0, request.getContextPath().length());
				if (uri.indexOf("?") > 0) {
					uri.delete(uri.indexOf("?"), uri.length());
				}
				if (uri.indexOf(";") > 0) {
					uri.delete(uri.indexOf(";"), uri.length());
				}
			}
			return uri.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public static void main(String args[]) {

	}

}
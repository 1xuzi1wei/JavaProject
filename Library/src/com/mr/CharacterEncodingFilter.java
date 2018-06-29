package com.mr;

import java.io.IOException;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

@WebFilter(
		dispatcherTypes = {
				DispatcherType.REQUEST, 
				DispatcherType.FORWARD
		}
					, 
		urlPatterns = { "/*" }, 
		initParams = { 
				@WebInitParam(name = "encoding", value = "UTF-8")
		})
public class CharacterEncodingFilter implements Filter {

	protected String encoding = null;// 定义编码格式变量
	protected FilterConfig filterConfig = null;// 定义过滤器配置对象
	public void destroy() {
		this.encoding = null;
		this.filterConfig = null;
	}
	public void doFilter(ServletRequest request, ServletResponse response, 
			FilterChain chain) throws IOException, ServletException {

		if (encoding != null) {
			request.setCharacterEncoding(encoding); // 设置请求的编码
			response.setContentType("text/html; charset=" + encoding);// 设置应答对象的内容类型（包括编码格式）
		}
		chain.doFilter(request, response);
	}
	public void init(FilterConfig filterConfig)
			throws ServletException {
		this.filterConfig = filterConfig; // 初始化过滤器配置对象
		this.encoding = filterConfig.getInitParameter("encoding");// 获取配置文件中指定的编码格式
	}

}

package com.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;

public class LocaleAction extends ActionSupport implements ServletRequestAware{
	
	private String language;
	private String userName;
	private String request_locale;
	private String password;
	
	HttpServletRequest request;
	
	
	/**
	 * @return the request_locale
	 */
	public String getRequest_locale() {
		return request_locale;
	}
	/**
	 * @param request_locale the request_locale to set
	 */
	public void setRequest_locale(String request_locale) {
		this.request_locale = request_locale;
	}
	/**
	 * @return the language
	 */
	public String getLanguage() {
		return language;
	}
	/**
	 * @param language the language to set
	 */
	
	
	public void setLanguage(String language) {
		this.language = language;
	}
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	public String execute() {
		 
		String locale = request.getParameter("request_locale");
		if(locale.equals("EN")){
			setLanguage("1");
		}else if(locale.equals("TA")){
			setLanguage("2");
		}
		return "SUCCESS";
	}
	public String start(){
		setLanguage("1");
		return "SUCCESS";
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}

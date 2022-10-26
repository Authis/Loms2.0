package com.action;

import com.bean.LoginBean;
import com.bean.ProductSetBean;
import com.doa.LomsCommonDoa;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;

import java.util.Map;
 

public class LomsCommon extends ActionSupport implements SessionAware {
	
	
	public Map session; // ActionContext.getContext().getSession();
 
	LoginLoms loginLoms = new LoginLoms();
	LoginBean loginbean = new LoginBean();
	String retEmpType = "";  // Variable used to Restricting menu for USER and ADMIN 
	
	String retMsg = "";
	
	LomsCommonDoa lomsCommonDoa = new LomsCommonDoa();
	ProductSetBean productSetBean = new ProductSetBean();
	
	public ProductSetBean getProductSetBean() {
		return productSetBean;
	}



	public void setProductSetBean(ProductSetBean productSetBean) {
		this.productSetBean = productSetBean;
	}



	public String getRetMsg() {
		return retMsg;
	}



	public void setRetMsg(String retMsg) {
		this.retMsg = retMsg;
	}



	public String getRetEmpType() {
		return retEmpType;
	}



	public void setRetEmpType(String retEmpType) {
		this.retEmpType = retEmpType;
	}



	public String editProductSet() {

		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

			//ret = loginLoms.execute(username, password);
			
		}
		if ( loginbean != null) {
			
			productSetBean = lomsCommonDoa.editProductSetDoa(username, password);
			
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	public String updateProdSet() {

		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null) {
			
			retMsg = lomsCommonDoa.updateProdSetDoa(productSetBean,username, password);
			
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	
	
	

	@Override
	public void setSession(Map arg0) {
		this.session = arg0;

	}


}

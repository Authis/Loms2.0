package com.action;

import com.bean.LoginBean;
import com.bean.StdCaseInfoBean;
import com.bean.StdCourtInfoBean;
import com.doa.LawStandardInfoDoa;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;

import java.util.ArrayList;
import java.util.Map;

public class LawStandardInfo extends ActionSupport implements SessionAware {
	public String hidcourtid;
	public String searchPageVar = "";
	public String casetype;
	LoginLoms loginLoms = new LoginLoms();
	LoginBean loginbean = new LoginBean();

	StdCourtInfoBean stdCourtInfoBean;/*
																 * Search Std
																 * Court info
																 */
	LawStandardInfoDoa lawStandardInfoDoa = new LawStandardInfoDoa();
	ArrayList<StdCourtInfoBean> arrStdCourtInfoBean = new ArrayList<StdCourtInfoBean>();
	ArrayList<StdCaseInfoBean> arrStdCaseInfoBean = new ArrayList<StdCaseInfoBean>();
	StdCourtInfoBean addCourtInfoBean = new StdCourtInfoBean(); /*
																 * Add Court
																 * Info
																 */
	StdCourtInfoBean updCourtInfoBean = new StdCourtInfoBean(); /*
																 * Edit Court
																 * Info
																 */
	StdCourtInfoBean newupdCourtInfoBean = new StdCourtInfoBean();
	StdCourtInfoBean oldupdCourtInfoBean = new StdCourtInfoBean();
	
	ArrayList actionList = new ArrayList();
	ArrayList caseList = new ArrayList();
	private Map session;

	public String txtAction;
	public String txtCaseType;
	public String hidcaseid;
	public String retCourtID ="";
//	public String hidMenuID;
//	public String hidSubMenuID1;
//	public String hidSubMenuID2;
	public String hidTxtState;
	String retEmpType = "";  // Variable used to Restricting menu for USER and ADMIN 
	public String getRetEmpType() {
		return retEmpType;
	}

	public void setRetEmpType(String retEmpType) {
		this.retEmpType = retEmpType;
	}

	public String getHidTxtState() {
		return hidTxtState;
	}

	public void setHidTxtState(String hidTxtState) {
		this.hidTxtState = hidTxtState;
	}

	ArrayList<String> stateName = new ArrayList<String>();
	ArrayList<String> disName = new ArrayList<String>();

	public ArrayList<String> getDisName() {
		return disName;
	}

	public void setDisName(ArrayList<String> disName) {
		this.disName = disName;
	}

	public ArrayList<String> getStateName() {
		return stateName;
	}

	public void setStateName(ArrayList<String> stateName) {
		this.stateName = stateName;
	}

//	public String getHidSubMenuID1() {
//		return hidSubMenuID1;
//	}
//
//	public void setHidSubMenuID1(String hidSubMenuID1) {
//		this.hidSubMenuID1 = hidSubMenuID1;
//	}
//
//	public String getHidSubMenuID2() {
//		return hidSubMenuID2;
//	}
//
//	public void setHidSubMenuID2(String hidSubMenuID2) {
//		this.hidSubMenuID2 = hidSubMenuID2;
//	}
//
//	public String getHidMenuID() {
//		return hidMenuID;
//	}
//
//	public void setHidMenuID(String hidMenuID) {
//		this.hidMenuID = hidMenuID;
//	}

	public String getRetCourtID() {
		return retCourtID;
	}

	public void setRetCourtID(String retCourtID) {
		this.retCourtID = retCourtID;
	}

	public StdCourtInfoBean getUpdCourtInfoBean() {
		return updCourtInfoBean;
	}

	public void setUpdCourtInfoBean(StdCourtInfoBean updCourtInfoBean) {
		this.updCourtInfoBean = updCourtInfoBean;
	}

	public String getHidcaseid() {
		return hidcaseid;
	}

	public void setHidcaseid(String hidcaseid) {
		this.hidcaseid = hidcaseid;
	}

	public String getCasetype() {
		return casetype;
	}

	public void setCasetype(String casetype) {
		this.casetype = casetype;
	}

	public String getTxtAction() {
		return txtAction;
	}

	public void setTxtAction(String txtAction) {
		this.txtAction = txtAction;
	}

	public String getTxtCaseType() {
		return txtCaseType;
	}

	public void setTxtCaseType(String txtCaseType) {
		this.txtCaseType = txtCaseType;
	}

	public ArrayList getActionList() {
		return actionList;
	}

	public void setActionList(ArrayList actionList) {
		this.actionList = actionList;
	}

	public ArrayList getCaseList() {
		return caseList;
	}

	public void setCaseList(ArrayList caseList) {
		this.caseList = caseList;
	}

	public StdCourtInfoBean getAddCourtInfoBean() {
		return addCourtInfoBean;
	}

	public void setAddCourtInfoBean(StdCourtInfoBean addCourtInfoBean) {
		this.addCourtInfoBean = addCourtInfoBean;
	}

	public ArrayList<StdCourtInfoBean> getArrStdCourtInfoBean() {
		return arrStdCourtInfoBean;
	}

	public void setArrStdCourtInfoBean(
			ArrayList<StdCourtInfoBean> arrStdCourtInfoBean) {
		this.arrStdCourtInfoBean = arrStdCourtInfoBean;
	}

	public ArrayList<StdCaseInfoBean> getArrStdCaseInfoBean() {
		return arrStdCaseInfoBean;
	}

	public void setArrStdCaseInfoBean(
			ArrayList<StdCaseInfoBean> arrStdCaseInfoBean) {
		this.arrStdCaseInfoBean = arrStdCaseInfoBean;
	}

	public String getHidcourtid() {
		return hidcourtid;
	}

	public void setHidcourtid(String hidcourtid) {
		this.hidcourtid = hidcourtid;
	}

	public StdCourtInfoBean getStdCourtInfoBean() {
		return stdCourtInfoBean;
	}

	public void setStdCourtInfoBean(StdCourtInfoBean stdCourtInfoBean) {
		this.stdCourtInfoBean = stdCourtInfoBean;
	}

	public String getSearchPageVar() {
		return searchPageVar;
	}

	public void setSearchPageVar(String searchPageVar) {
		this.searchPageVar = searchPageVar;
	}
	
	
	
	
	public String lawStandardManagement() {
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null) {
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}

	public String viewStdCourtInfo() {
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null) {
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}

	public String searchStdCourtinfo() {
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
		if (  loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN") || retEmpType.equals("USER"))) {
			setSearchPageVar("value");
			
			if (stdCourtInfoBean == null || stdCourtInfoBean.equals("")) {
				stdCourtInfoBean = (StdCourtInfoBean) session.get("stdCourtInfoBean");
			} else {
				session.put("stdCourtInfoBean", stdCourtInfoBean);
			}
			
			arrStdCourtInfoBean = lawStandardInfoDoa.searchStdCourtinfoDoa(
					stdCourtInfoBean, username, password);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}

	public String viewStdCaseInfo() {
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null) {
			actionList.add("Search");
			actionList.add("Add");

			caseList.add("Suit");
			caseList.add("Appeal");
			caseList.add("Petition");
			caseList.add("Criminal");
			caseList.add("Execution");
			session.put("arrCaseList", caseList);
			session.put("arrActionList", actionList);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}

	public String mngCaseInfo() {
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
		if ( loginbean != null) {
			setSearchPageVar("value");
			caseList = (ArrayList) session.get("arrCaseList");
			actionList = (ArrayList) session.get("arrActionList");
			arrStdCaseInfoBean = lawStandardInfoDoa.mngcaseInfoDoa(txtAction,
					txtCaseType, casetype, username, password);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}

	public String deleteCaseInfo() {
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
		if ( loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN")) ) {
			caseList = (ArrayList) session.get("arrCaseList");
			actionList = (ArrayList) session.get("arrActionList");
			lawStandardInfoDoa.deleteCaseInfoDoa(hidcaseid, txtCaseType,
					username, password);
			mngCaseInfo();
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String addStdCrtInfo() {
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
		if (  loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN"))) {
			stateName = lawStandardInfoDoa.stdCrtInfoState(username, password);
			disName = lawStandardInfoDoa.stdCrtInfoDis(hidTxtState, username,password);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}

	public String addStdCrtInfoSave() {
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
			retCourtID = lawStandardInfoDoa.addStdCrtInfoSaveDoa(
					addCourtInfoBean, username, password);
			stateName = lawStandardInfoDoa.stdCrtInfoState(username, password);
			disName = lawStandardInfoDoa.stdCrtInfoDis(hidTxtState, username,password);
			addCourtInfoBean = new StdCourtInfoBean(); // To clear Add court Info page once values added in data base
			 
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}

	public String updStdCrtInfo() {

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
		if (  loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN"))) {
			stateName = lawStandardInfoDoa.stdCrtInfoState(username, password);
			disName = lawStandardInfoDoa.stdCrtInfoDis(hidTxtState, username,
					password);
			
			 
			 /* For retain Court ID while changing Court State*/
			 if(hidcourtid == null || hidcourtid.equals("")){
				 hidcourtid = (String) session.get("hidcourtid"); 
			 }else{
				session.put("hidcourtid", hidcourtid);		
			 }
			 
			 newupdCourtInfoBean = updCourtInfoBean;
		    String newcourtstate = updCourtInfoBean.courtstate;			 
			updCourtInfoBean = lawStandardInfoDoa.updStdCrtInfo(hidcourtid,username, password);
			String oldcourtstate = updCourtInfoBean.courtstate; 
			oldupdCourtInfoBean = updCourtInfoBean;
			    
			/* For retain Court State while changing Court State*/
			if (oldcourtstate!=null && newcourtstate != null){
			 if (newcourtstate != oldcourtstate  || !newcourtstate.equals(oldcourtstate)){				 
				 updCourtInfoBean = newupdCourtInfoBean;
			 }else{				 
				 updCourtInfoBean = oldupdCourtInfoBean;
			 }
			}
			
			disName = lawStandardInfoDoa.stdCrtInfoDis(updCourtInfoBean.getCourtstate(), username,
					password);
			
			stdCourtInfoBean = (StdCourtInfoBean) session.get("stdCourtInfoBean");
			session.put("stdCourtInfoBean", stdCourtInfoBean);
			
			
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String viewCourtInfo(){
		
		String username = "";
		String password = "";
		
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

		//	ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null) {
			
			updCourtInfoBean = lawStandardInfoDoa.updStdCrtInfo(hidcourtid,username, password);
			
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	public String editCourtInfoSave() {
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
		if ( loginbean != null) {
			retCourtID = lawStandardInfoDoa.editCourtInfoSaveDoa(
					updCourtInfoBean, username, password);
			stateName = lawStandardInfoDoa.stdCrtInfoState(username, password);
			disName = lawStandardInfoDoa.stdCrtInfoDis(hidTxtState, username,
					password);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}

	public String deleteCrtInfo() {

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
		if (  loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN"))) {
			retCourtID = lawStandardInfoDoa.deleteCrtInfoDoa(hidcourtid,
					username, password);
			searchStdCourtinfo();
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}

	@Override
	public void setSession(Map arg0) {
		this.session = arg0;
		// TODO Auto-generated method stub

	}

}
package com.action;

import com.bean.CaseSearchResultBean;
import com.bean.LoginBean;
import com.doa.QuickLinksDoa;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.struts2.interceptor.SessionAware;

import java.io.*;
import java.util.ArrayList;
import java.util.Map;


public class QuickLinks extends ActionSupport implements SessionAware{
	QuickLinksDoa quickLinksDoa = new QuickLinksDoa();
	ArrayList<CaseSearchResultBean>  retCaseHearInfo = new ArrayList<CaseSearchResultBean> ();
    LoginLoms loginLoms = new LoginLoms();
	LoginBean loginbean = new LoginBean();
	
	
	    private File fileUpload;	
		private String fileUploadContentType;
		private String fileUploadFileName;
		private String fileName;
		private InputStream fileInputStream; 	
		public String downloadFileName = "";
		
		
		public File getFileUpload() {
			return fileUpload;
		}

		public void setFileUpload(File fileUpload) {
			this.fileUpload = fileUpload;
		}

		public String getFileUploadContentType() {
			return fileUploadContentType;
		}

		public void setFileUploadContentType(String fileUploadContentType) {
			this.fileUploadContentType = fileUploadContentType;
		}

		public String getFileUploadFileName() {
			return fileUploadFileName;
		}

		public void setFileUploadFileName(String fileUploadFileName) {
			this.fileUploadFileName = fileUploadFileName;
		}

		public String getFileName() {
			return fileName;
		}

		public void setFileName(String fileName) {
			this.fileName = fileName;
		}

		public InputStream getFileInputStream() {
			return fileInputStream;
		}

		public void setFileInputStream(InputStream fileInputStream) {
			this.fileInputStream = fileInputStream;
		}

		public String getDownloadFileName() {
			return downloadFileName;
		}

		public void setDownloadFileName(String downloadFileName) {
			this.downloadFileName = downloadFileName;
		}
		

	public String searchPageVar="";
	public String fromdate;
	public String todate;
	
	public String txtCaseType;
	
	public Map session;
	
	
//	public String hidMenuID;
//	public String hidSubMenuID1;
//	public String hidSubMenuID2;
	String retEmpType = "";  // Variable used to Restricting menu for USER and ADMIN 
	
	public String getTxtCaseType() {
		return txtCaseType;
	}

	public void setTxtCaseType(String txtCaseType) {
		this.txtCaseType = txtCaseType;
	}
	
	
	public String getRetEmpType() {
		return retEmpType;
	}

	public void setRetEmpType(String retEmpType) {
		this.retEmpType = retEmpType;
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
//}
//
//	
//	public String getHidMenuID() {
//		return hidMenuID;
//	}
//
//	public void setHidMenuID(String hidMenuID) {
//		this.hidMenuID = hidMenuID;
//	}
	public String getFromdate() {
		return fromdate;
	}
	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}
	public String getTodate() {
		return todate;
	}
	public void setTodate(String todate) {
		this.todate = todate;
	}
	public ArrayList<CaseSearchResultBean> getRetCaseHearInfo() {
		return retCaseHearInfo;
	}
	public void setRetCaseHearInfo(ArrayList<CaseSearchResultBean> retCaseHearInfo) {
		this.retCaseHearInfo = retCaseHearInfo;
	}
	 
	public String getSearchPageVar() {
		return searchPageVar;
	}
	public void setSearchPageVar(String searchPageVar) {
		this.searchPageVar = searchPageVar;
	}
	
	
	
	public String quickLinksManagement(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		String username = loginbean.getUserName();
		String password = loginbean.getPassWord();
		 
		//ret = loginLoms.execute(username,password);
		
		}
		if( loginbean != null){
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
	}
	
	
	public String viewCase(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		String username = loginbean.getUserName();
		String password = loginbean.getPassWord();
		fromdate = "";
		todate = "";
		
		//ret = loginLoms.execute(username,password);
		
		}
		if(  loginbean != null){
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
	}
	
	
public String searchviewCase(){
		
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		  username = loginbean.getUserName();
		  password = loginbean.getPassWord();
		
		// ret = loginLoms.execute(username,password);
		
		}
		if(  loginbean != null){
			setSearchPageVar("value");
			String viewType = txtCaseType;
			retCaseHearInfo = quickLinksDoa.searchCaseHearInfoDoa(fromdate,todate,viewType,username,password);
			for(int i=0;i<retCaseHearInfo.size();i++){
				String heardate = retCaseHearInfo.get(i).getJudgmntDate();
				if(heardate!=null){
					String year = heardate.substring(0, 4);
					String month = heardate.substring(5, 7);
					String day = heardate.substring(8, 10); 
					
					retCaseHearInfo.get(i).setJudgmntDate(day+"/"+month+"/"+year);
			   }		
			} 	
			 session.put("retCaseHearInfo", retCaseHearInfo);   // Added in session for XLS Download
			
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
	}
	
	public String viewCaseHearInfo(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		String username = loginbean.getUserName();
		String password = loginbean.getPassWord();
		
		//ret = loginLoms.execute(username,password);
		
		}
		if( loginbean != null){
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
		
	}
	
	public String searchCaseHearInfo(){
		
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		  username = loginbean.getUserName();
		  password = loginbean.getPassWord();
		
		// ret = loginLoms.execute(username,password);
		
		}
		if(  loginbean != null){
			setSearchPageVar("value");
			String viewType = "CASE HEARING";
			retCaseHearInfo = quickLinksDoa.searchCaseHearInfoDoa(fromdate,todate,viewType,username,password);
			for(int i=0;i<retCaseHearInfo.size();i++){
				String heardate = retCaseHearInfo.get(i).getJudgmntDate();
				if(heardate!=null){
					String year = heardate.substring(0, 4);
					String month = heardate.substring(5, 7);
					String day = heardate.substring(8, 10); 
					
					retCaseHearInfo.get(i).setJudgmntDate(day+"/"+month+"/"+year);
			   }		
			} 	
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
	}
	
	public String viewSuits(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		String username = loginbean.getUserName();
		String password = loginbean.getPassWord();
		
		// ret = loginLoms.execute(username,password);
		
		}
		if( loginbean != null){
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
		
	}
	
	public String searchSuits(){
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		  username = loginbean.getUserName();
		  password = loginbean.getPassWord();
		
		// ret = loginLoms.execute(username,password);
		
		}
		if(  loginbean != null){
			setSearchPageVar("value");
			String viewType = "SUITE";
			retCaseHearInfo = quickLinksDoa.searchCaseHearInfoDoa(fromdate,todate,viewType,username,password);
			for(int i=0;i<retCaseHearInfo.size();i++){
				String heardate = retCaseHearInfo.get(i).getJudgmntDate();
				if(heardate!=null){
					String year = heardate.substring(0, 4);
					String month = heardate.substring(5, 7);
					String day = heardate.substring(8, 10); 
					
					retCaseHearInfo.get(i).setJudgmntDate(day+"/"+month+"/"+year);
			   }		
			} 	
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
		
	}
	
	public String viewAppeals(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		String username = loginbean.getUserName();
		String password = loginbean.getPassWord();
		
		// ret = loginLoms.execute(username,password);
		
		}
		if(  loginbean != null){
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
	}
	
	public String searchAppeals(){
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		  username = loginbean.getUserName();
		  password = loginbean.getPassWord();
		
		// ret = loginLoms.execute(username,password);
		
		}
		if(  loginbean != null){
			setSearchPageVar("value");
			String viewType = "APPEAL";
			retCaseHearInfo = quickLinksDoa.searchCaseHearInfoDoa(fromdate,todate,viewType,username,password);
			for(int i=0;i<retCaseHearInfo.size();i++){
				String heardate = retCaseHearInfo.get(i).getJudgmntDate();
				if(heardate!=null){
					String year = heardate.substring(0, 4);
					String month = heardate.substring(5, 7);
					String day = heardate.substring(8, 10); 
					
					retCaseHearInfo.get(i).setJudgmntDate(day+"/"+month+"/"+year);
			   }		
			} 		
			
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
		
	}
	
	public String searchPetition(){
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		  username = loginbean.getUserName();
		  password = loginbean.getPassWord();
		
		// ret = loginLoms.execute(username,password);
		
		}
		if(  loginbean != null){
			setSearchPageVar("value");
			String viewType = "PETITION";
			retCaseHearInfo = quickLinksDoa.searchCaseHearInfoDoa(fromdate,todate,viewType,username,password);
			for(int i=0;i<retCaseHearInfo.size();i++){
				String heardate = retCaseHearInfo.get(i).getJudgmntDate();
				if(heardate!=null){
					String year = heardate.substring(0, 4);
					String month = heardate.substring(5, 7);
					String day = heardate.substring(8, 10); 
					
					retCaseHearInfo.get(i).setJudgmntDate(day+"/"+month+"/"+year);
			   }		
			} 		
			
			
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
	}
	
	public String viewPetition(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		String username = loginbean.getUserName();
		String password = loginbean.getPassWord();
		
		// ret = loginLoms.execute(username,password);
		
		}
		if( loginbean != null){
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
	}
	
	
	public String viewCrimCase(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		String username = loginbean.getUserName();
		String password = loginbean.getPassWord();
		
		// ret = loginLoms.execute(username,password);
		
		}
		if(  loginbean != null){
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
		
	}
	
	public String searchCrimeCase(){
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		  username = loginbean.getUserName();
		  password = loginbean.getPassWord();
		
		// ret = loginLoms.execute(username,password);
		
		}
		if(  loginbean != null){
			setSearchPageVar("value");
			String viewType = "CRIMINAL";
			retCaseHearInfo = quickLinksDoa.searchCaseHearInfoDoa(fromdate,todate,viewType,username,password);
			for(int i=0;i<retCaseHearInfo.size();i++){
				String heardate = retCaseHearInfo.get(i).getJudgmntDate();
				if(heardate!=null){
					String year = heardate.substring(0, 4);
					String month = heardate.substring(5, 7);
					String day = heardate.substring(8, 10); 
					
					retCaseHearInfo.get(i).setJudgmntDate(day+"/"+month+"/"+year);
			   }		
			} 	
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
		
	}
	
	
	
	public String downloadQuickFile() throws FileNotFoundException{
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String username = "";
		String password = "";
		String ret = "";
		 String strDirectoy ="C:\\LOMS_IMAGES_DOWNLOAD";
		 downloadFileName = "CaseDetails.xls";
		  boolean success = false;
	   	    boolean exists  = false;
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if ( loginbean != null) {
			retCaseHearInfo = (ArrayList<CaseSearchResultBean>) session.get("retCaseHearInfo");
  		    File file;
       	    file = new File("C://LOMS_IMAGES_DOWNLOAD//"+downloadFileName);			
			
			FileOutputStream fileOut = new FileOutputStream(file);
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet worksheet = workbook.createSheet("Case Details");
			
			HSSFRow row1 = worksheet.createRow((short) 0);
			 
			HSSFCell cellA1 = row1.createCell((short) 0);
			cellA1.setCellValue("SL No");
			
			HSSFCellStyle cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);			  
			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);		 
			cellA1.setCellStyle(cellStyle);
			HSSFFont font = workbook.createFont();
			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			HSSFCell cellB1 = row1.createCell((short) 1);
			cellB1.setCellValue("Case ID");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellB1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);


			HSSFCell cellC1 = row1.createCell((short) 2);
			cellC1.setCellValue("Client ID");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellC1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			HSSFCell cellD1 = row1.createCell((short) 3);
			cellD1.setCellValue("Client Info");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellD1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			HSSFCell cellE1 = row1.createCell((short) 4);
			cellE1.setCellValue("Case Type");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellE1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			HSSFCell cellF1 = row1.createCell((short) 5);
			cellF1.setCellValue("Prime Case No");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellF1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			HSSFCell cellG1 = row1.createCell((short) 6);
			cellG1.setCellValue("Ref Case No");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellG1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font); 
			
			HSSFCell cellH1 = row1.createCell((short) 7);
			cellH1.setCellValue("Court Details");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellH1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			
			HSSFCell cellI1 = row1.createCell((short) 8);
			cellI1.setCellValue("Case Priority");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellI1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			HSSFCell cellJ1 = row1.createCell((short) 9);
			cellJ1.setCellValue("Case Status");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellJ1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			HSSFCell cellK1 = row1.createCell((short) 10);
			cellK1.setCellValue("Hearing Date");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellK1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			

			HSSFCell cellL1 = row1.createCell((short) 11);
			cellL1.setCellValue("Comments");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellL1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
		 
		 
			HSSFRow row = null;
			
			for(int i = 0;i<= retCaseHearInfo.size()-1;i++ ){
				
			 
				 
			 
				   row = worksheet.createRow((short) i+1);
					HSSFCell cellA2 = row.createCell((short) 0);
					cellA2.setCellValue(i+1);
					HSSFCellStyle cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellA2.setCellStyle(cellStyleData);
					
					HSSFCell cellB2 = row.createCell((short) 1);
					cellB2.setCellValue(retCaseHearInfo.get(i).getCaseId());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellB2.setCellStyle(cellStyleData);
					
					HSSFCell cellC2 = row.createCell((short) 2);
					cellC2.setCellValue(retCaseHearInfo.get(i).getClientId());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellC2.setCellStyle(cellStyleData);
					
					
					HSSFCell cellD2 = row.createCell((short) 3);
					cellD2.setCellValue(retCaseHearInfo.get(i).getClientInfo());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellD2.setCellStyle(cellStyleData);

					HSSFCell cellE2 = row.createCell((short) 4);
					cellE2.setCellValue(retCaseHearInfo.get(i).getCaseType());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellE2.setCellStyle(cellStyleData);


					HSSFCell cellF2 = row.createCell((short) 5);
					cellF2.setCellValue(retCaseHearInfo.get(i).getPrimeCaseNo());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellF2.setCellStyle(cellStyleData);


					
					HSSFCell cellG2 = row.createCell((short) 6);
					cellG2.setCellValue(retCaseHearInfo.get(i).getRefCaseNo());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellG2.setCellStyle(cellStyleData);


					
					HSSFCell cellH2 = row.createCell((short) 7);
					cellH2.setCellValue(retCaseHearInfo.get(i).getCourtDetails());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellH2.setCellStyle(cellStyleData);

					HSSFCell cellI2 = row.createCell((short) 8);
					cellI2.setCellValue(retCaseHearInfo.get(i).getCasePriority());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellI2.setCellStyle(cellStyleData);

					HSSFCell cellJ2 = row.createCell((short) 9);
					cellJ2.setCellValue(retCaseHearInfo.get(i).getCaseStatus());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellJ2.setCellStyle(cellStyleData);

					HSSFCell cellK2 = row.createCell((short) 10);
					cellK2.setCellValue(retCaseHearInfo.get(i).getJudgmntDate());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellK2.setCellStyle(cellStyleData);

					HSSFCell cellL2 = row.createCell((short) 11);
					cellL2.setCellValue(retCaseHearInfo.get(i).getCaseComments());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellL2.setCellStyle(cellStyleData);


					 
					 

			}
			try {
				
			    workbook.write(fileOut);
				fileOut.flush();
            	fileOut.close();
				fileInputStream = new FileInputStream(file);


			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
 
			
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
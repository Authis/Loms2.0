package com.action;

import com.bean.IncomeExpenceBean;
import com.bean.LoginBean;
import com.doa.IncomeExpenceDoa;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.struts2.interceptor.SessionAware;

import java.io.*;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Map;

public class IncomeExpence extends ActionSupport implements SessionAware{
	public String searchPageVar="";
	IncomeExpenceDoa incomeExpenceDoa = new IncomeExpenceDoa();
	IncomeExpenceBean incomeExpenceBean = new IncomeExpenceBean();
	ArrayList<IncomeExpenceBean>  retIncomeExpenceBean = new ArrayList<IncomeExpenceBean>();
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
	/*Variable For Search Expense Starts here*/	
	public String caseid = "";
	public String clientid = "";
	public String payType = "";	
	public String fromdate = "";
	public String todate = "";
	public String transactionid = "";
    public String retSucessMsg= "";
//    public String hidMenuID;
//    public String hidSubMenuID1;
//	public String hidSubMenuID2;
	String retEmpType = "";  // Variable used to Restricting menu for USER and ADMIN 
	public double debitAmt = 0;
	public double creditAmt = 0;
	public double totalAmt = 0;
	
	public String strDebitAmt ="";
	public String strCreditAmt = "";
	public String strTotalAmt = "";
	
	public String getStrDebitAmt() {
		return strDebitAmt;
	}

	public void setStrDebitAmt(String strDebitAmt) {
		this.strDebitAmt = strDebitAmt;
	}

	public String getStrCreditAmt() {
		return strCreditAmt;
	}

	public void setStrCreditAmt(String strCreditAmt) {
		this.strCreditAmt = strCreditAmt;
	}

	public String getStrTotalAmt() {
		return strTotalAmt;
	}

	public void setStrTotalAmt(String strTotalAmt) {
		this.strTotalAmt = strTotalAmt;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}
	
	/*public double getTotalAmt() {
		return totalAmt;
	}

	public void setTotalAmt(int totalAmt) {
		this.totalAmt = totalAmt;
	}

	public double getDebitAmt() {
		return debitAmt;
	}

	public void setDebitAmt(int debitAmt) {
		this.debitAmt = debitAmt;
	}

	public double getCreditAmt() {
		return creditAmt;
	}

	public void setCreditAmt(int creditAmt) {
		this.creditAmt = creditAmt;
	}
*/
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
//	}
//
//	
//	public String getHidMenuID() {
//		return hidMenuID;
//	}
//
//	public void setHidMenuID(String hidMenuID) {
//		this.hidMenuID = hidMenuID;
//	}
//	
	public String getRetSucessMsg() {
		return retSucessMsg;
	}
	public void setRetSucessMsg(String retSucessMsg) {
		this.retSucessMsg = retSucessMsg;
	}
	/*Variable For Search Expense Ends here*/
	private Map session;
	public String hidtransid = "";
	
	public String getHidtransid() {
		return hidtransid;
	}
	public void setHidtransid(String hidtransid) {
		this.hidtransid = hidtransid;
	}
	public String getTransactionid() {
		return transactionid;
	}
	public void setTransactionid(String transactionid) {
		this.transactionid = transactionid;
	}
	public String getCaseid() {
		return caseid;
	}
	public void setCaseid(String caseid) {
		this.caseid = caseid;
	}
	public String getClientid() {
		return clientid;
	}
	public void setClientid(String clientid) {
		this.clientid = clientid;
	}
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
	
	public ArrayList<IncomeExpenceBean> getRetIncomeExpenceBean() {
		return retIncomeExpenceBean;
	}
	public void setRetIncomeExpenceBean(
			ArrayList<IncomeExpenceBean> retIncomeExpenceBean) {
		this.retIncomeExpenceBean = retIncomeExpenceBean;
	}
	public IncomeExpenceBean getIncomeExpenceBean() {
		return incomeExpenceBean;
	}
	public void setIncomeExpenceBean(IncomeExpenceBean incomeExpenceBean) {
		this.incomeExpenceBean = incomeExpenceBean;
	}
	public String getSearchPageVar() {
		return searchPageVar;
	}
	public void setSearchPageVar(String searchPageVar) {
		this.searchPageVar = searchPageVar;
	}
	
	public String incExpManagement() {
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();

		//	ret = loginLoms.execute(username, password);
			
		}
		if ( loginbean != null) {
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	public String addIncomeExpDet(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		String username = loginbean.getUserName();
		String password = loginbean.getPassWord();
		
	//	ret = loginLoms.execute(username,password);
		
		}
		if( loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN"))){
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
		
	}
	
	public String addIncExpDetSave(){
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		  username = loginbean.getUserName();
		  password = loginbean.getPassWord();
		
	//	ret = loginLoms.execute(username,password);
		
		}
		if(  loginbean != null){
			retSucessMsg = incomeExpenceDoa.addIncExpDetSaveDoa(incomeExpenceBean,username,password);
			 incomeExpenceBean = new IncomeExpenceBean();  // To clear Add income form date once date added in to database
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
		
	}
	
	public String mngExpanceDetail(){
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
	public String searchManageincomeDet(){
		String username = "";
		String password = "";
		
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		DecimalFormat formatter = new DecimalFormat("#,###.00");
		double amount = 0;
		String ret = "";
		if(loginbean!= null){
		  username = loginbean.getUserName();
		  password = loginbean.getPassWord();
		
	//	ret = loginLoms.execute(username,password);
		
		}
		if(  loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN") || retEmpType.equals("USER"))){
			setSearchPageVar("value");
			/* session.put("caseid",caseid);
			 session.put("clientid",clientid);
			 session.put("payType",payType);
			 session.put("fromdate",fromdate);
			 session.put("todate",todate);
			 session.put("transactionid",transactionid);*/
			retIncomeExpenceBean = incomeExpenceDoa.searchManageincomeDetDoa(transactionid,caseid,clientid,payType,fromdate,todate,username,password);
			for(int i=0;i<retIncomeExpenceBean.size();i++){
				String paiddate = retIncomeExpenceBean.get(i).paidistin;
				if(paiddate!=null){
					String year = paiddate.substring(0, 4);
					String month = paiddate.substring(5, 7);
					String day = paiddate.substring(8, 10); 
					 
					retIncomeExpenceBean.get(i).paidistin = day+"/"+month+"/"+year;
					String payType = retIncomeExpenceBean.get(i).paymnttypein;
					 
					if(payType == "CREDIT" || payType.equals("CREDIT")){					
					  creditAmt  = creditAmt + Double.parseDouble(retIncomeExpenceBean.get(i).paidamtin);
					
 
					}else{
					 debitAmt  = debitAmt + Double.parseDouble(retIncomeExpenceBean.get(i).paidamtin);
					 
					} 
					 
					  amount = Double.parseDouble(retIncomeExpenceBean.get(i).paidamtin);
					
			    retIncomeExpenceBean.get(i).paidamtin  =  formatter.format(amount);
			   }
			
			}
			 session.put("retIncomeExpenceBean",retIncomeExpenceBean); // Added in session for XLS Download
			totalAmt = creditAmt - debitAmt;
			 
			strTotalAmt =  formatter.format(totalAmt);
			
			strCreditAmt =  formatter.format(creditAmt);
			 
			strDebitAmt =  formatter.format(debitAmt);
			 
			 
			
			
			/*caseid = (String) session.get("caseid");
			clientid = (String) session.get("clientid");
			payType = (String) session.get("payType");
			fromdate = (String) session.get("fromdate");
			todate = (String) session.get("todate");
			transactionid = (String) session.get("transactionid"); */
			
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
		
	}
	public String deleteIncExp(){
		String username = "";
		String password ="";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		  username = loginbean.getUserName();
		  password = loginbean.getPassWord();
		
		//ret = loginLoms.execute(username,password);
		
		}
		if(loginbean != null && (retEmpType.equals("GOD"))){
			incomeExpenceDoa.deleteIncExpDoa(hidtransid,username,password);
			searchManageincomeDet();
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
		
		
	}
	
	
	
 
	public String downloadIncxpFile() throws FileNotFoundException{
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String username = "";
		String password = "";
		String ret = "";
		 String strDirectoy ="C:\\LOMS_IMAGES_DOWNLOAD";
		 downloadFileName = "IncExpDetails.xls";
		  boolean success = false;
	   	    boolean exists  = false;
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

		//	ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null) {
			retIncomeExpenceBean = (ArrayList<IncomeExpenceBean>) session.get("retIncomeExpenceBean");
			
		    File file;
       	    file = new File("C://LOMS_IMAGES_DOWNLOAD//"+downloadFileName);			
			
			FileOutputStream fileOut = new FileOutputStream(file);
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet worksheet = workbook.createSheet("Income Expense Details");
			
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
			cellB1.setCellValue("Transaction ID");
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
			cellD1.setCellValue("Case ID");
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
			cellE1.setCellValue("Paid Amount");
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
			cellF1.setCellValue("Payment Type");
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
			cellG1.setCellValue("Paid Date");
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
			cellH1.setCellValue("Comment");
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
			
		 
 
			 
			HSSFRow row = null;
			
			for(int i = 0;i<= retIncomeExpenceBean.size()-1;i++ ){
				
			 
				 
			 
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
					cellB2.setCellValue(retIncomeExpenceBean.get(i).getTransactionid());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellB2.setCellStyle(cellStyleData);
					
					HSSFCell cellC2 = row.createCell((short) 2);
					cellC2.setCellValue(retIncomeExpenceBean.get(i).getClientidin());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellC2.setCellStyle(cellStyleData);
					
					
					HSSFCell cellD2 = row.createCell((short) 3);
					cellD2.setCellValue(retIncomeExpenceBean.get(i).getCaseidin());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellD2.setCellStyle(cellStyleData);

					HSSFCell cellE2 = row.createCell((short) 4);
					cellE2.setCellValue(retIncomeExpenceBean.get(i).getPaidamtin());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellE2.setCellStyle(cellStyleData);
					
					HSSFCell cellF2 = row.createCell((short) 5);
					cellF2.setCellValue(retIncomeExpenceBean.get(i).getPaymnttypein());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellF2.setCellStyle(cellStyleData);



					HSSFCell cellG2 = row.createCell((short) 6);
					cellG2.setCellValue(retIncomeExpenceBean.get(i).getPaidistin());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellG2.setCellStyle(cellStyleData);


					
				

					
					HSSFCell cellH2 = row.createCell((short) 7);
					cellH2.setCellValue(retIncomeExpenceBean.get(i).getCommentsin());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellH2.setCellStyle(cellStyleData);

				 

			 

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
		// TODO Auto-generated method stub
		
	}
}
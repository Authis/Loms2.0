package com.action;

import com.bean.BookBean;
import com.bean.LoginBean;
import com.doa.BookBeanDoa;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.struts2.interceptor.SessionAware;

import java.io.*;
import java.util.ArrayList;
import java.util.Map;

public class Books implements SessionAware {
	
	LoginLoms loginLoms = new LoginLoms();
	LoginBean loginbean = new LoginBean();
	
	public Map session; // ActionContext.getContext().getSession();
	public String retBookId="";
	BookBeanDoa bookBeanDoa = new BookBeanDoa();
	ArrayList<BookBean> retBookBean = new ArrayList<BookBean>();
	BookBean bookBean;
	BookBean searchbookBean;

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

	
	
	
	
	
	
	public BookBean getSearchbookBean() {
		return searchbookBean;
	}

	public void setSearchbookBean(BookBean searchbookBean) {
		this.searchbookBean = searchbookBean;
	}

//	public String hidMenuID;
//	public String hidSubMenuID1;
//	public String hidSubMenuID2;
//	public String getHidMenuID() {
//		return hidMenuID;
//	}
//
//	public void setHidMenuID(String hidMenuID) {
//		this.hidMenuID = hidMenuID;
//	}
//
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

	
	
	String retEmpType = "";  // Variable used to Restricting menu for USER and ADMIN 
	public String getRetEmpType() {
		return retEmpType;
	}

	public void setRetEmpType(String retEmpType) {
		this.retEmpType = retEmpType;
	}
	public String searchPageVar = "";
	
	public String hidbookid = "";
	
	
	public String getHidbookid() {
		return hidbookid;
	}

	public void setHidbookid(String hidbookid) {
		this.hidbookid = hidbookid;
	}

	public String getSearchPageVar() {
		return searchPageVar;
	}

	public void setSearchPageVar(String searchPageVar) {
		this.searchPageVar = searchPageVar;
	}

	public ArrayList<BookBean> getRetBookBean() {
		return retBookBean;
	}

	public void setRetBookBean(ArrayList<BookBean> retBookBean) {
		this.retBookBean = retBookBean;
	}

	
	
	public BookBean getBookBean() {
		return bookBean;
	}

	public void setBookBean(BookBean bookBean) {
		this.bookBean = bookBean;
	}

	public String getRetBookId() {
		return retBookId;
	}

	public void setRetBookId(String retBookId) {
		this.retBookId = retBookId;
	}

	
	
	

	public String bookManagement(){
		loginbean = (LoginBean) session.get("loginbean");
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();
	
		//	ret = loginLoms.execute(username, password);
 		}
		if ( loginbean != null) {
			bookBean = new BookBean();  // To make Add Book page clear while loading
			return "SUCCESS";
		} else {
 			return "FAILURE";
		}		
	}
	
	public String addNewBook(){
		loginbean = (LoginBean) session.get("loginbean");
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();
	
			// ret = loginLoms.execute(username, password);
 		}
		if ( loginbean != null) {
			bookBean = new BookBean();  // To make Add Book page clear while loading
			return "SUCCESS";
		} else {
 			return "FAILURE";
		}
		
	}
	
	public String addBookSave(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		String username = "";
		String password = "";
		if (loginbean != null) {
			    username = loginbean.getUserName();
			   password = loginbean.getPassWord();
	
			// ret = loginLoms.execute(username, password);
 		}
		if ( loginbean != null) {			
			
			retBookId = bookBeanDoa.addBookSaveDoa(bookBean,username,password);
			bookBean = new BookBean(); // To clear the Add Book Form data once added in database
			
			return "SUCCESS";
		} else {
 			return "FAILURE";
		}		
	}
	
	public String manageBooks(){
		
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();
	
		//	ret = loginLoms.execute(username, password);
 		}
		if (  loginbean != null) {
			bookBean = new BookBean();  // To make Search Book page clear while loading
			return "SUCCESS";
		} else {
 			return "FAILURE";
		}
		
		
	}
	
	public String searchBooks(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		String username = "";
		String password = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
	
			// ret = loginLoms.execute(username, password);
 		}
		if (  loginbean != null) {
			
			
			
			setSearchPageVar("value");
			
			if(searchbookBean == null || searchbookBean.equals("")){
				searchbookBean = (BookBean) session.get("searchbookBean"); 
			 }else{
				 session.put("searchbookBean", searchbookBean);
			 }
			 
			retBookBean = bookBeanDoa.searchBookDoa(searchbookBean,username,password);
			
			 session.put("retBookBean", retBookBean); // Added in to session for download as XLS 
		
			session.put("bookBean", searchbookBean);
			return "SUCCESS";
		} else {
 			return "FAILURE";
		}
		
	}
	
	
	public String viewBookInfo(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		String username = "";
		String password = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
	
			// ret = loginLoms.execute(username, password);
			
		}
		if ( loginbean != null) {
			
			setSearchPageVar("value");
			 
			bookBean = bookBeanDoa.viewBookInfoDoa(hidbookid,username,password);
		
		 
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
		
	}
	
	
	
	public String modBookDetail(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		String username = "";
		String password = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
	
			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null) {
			bookBean = new BookBean();   
			searchbookBean = (BookBean) session.get("searchbookBean"); 
			 session.put("searchbookBean", searchbookBean);	
			bookBean =bookBeanDoa.modBookDetailDoa(hidbookid,username,password);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	public String editBookSave(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		String username = "";
		String password = "";
		if (loginbean != null) {
			    username = loginbean.getUserName();
			   password = loginbean.getPassWord();
	
			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null) {		
			//bookBean.bookId = hidbookid;
			retBookId = bookBeanDoa.editBookSaveDoa(bookBean,username,password);
			
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}		
		
	}
	
	public String delBook(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		String username = "";
		String password = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
	
			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null) {
			 
			bookBean = new BookBean();   
			retBookId	= bookBeanDoa.delBookDoa(hidbookid,username,password);
			bookBean = (BookBean) session.get("bookBean");
			searchBooks();
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
		
	}
	
	
	
	 
	public String downloadBookDetailsFile() throws FileNotFoundException{
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String username = "";
		String password = "";
		String ret = "";
		 String strDirectoy ="C:\\LOMS_IMAGES_DOWNLOAD";
		 downloadFileName = "BookShelfDetails.xls";
		  boolean success = false;
	   	    boolean exists  = false;
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null) {
			retBookBean = (ArrayList<BookBean>) session.get("retBookBean");
			
		    File file;
       	    file = new File("C://LOMS_IMAGES_DOWNLOAD//"+downloadFileName);			
			
			FileOutputStream fileOut = new FileOutputStream(file);
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet worksheet = workbook.createSheet("Book Shelf Details");
			
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
			cellB1.setCellValue("Book Title");
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
			cellC1.setCellValue("Rack No");
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
			cellD1.setCellValue("Row No");
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
			cellE1.setCellValue("Book Position");
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
			cellF1.setCellValue("Book Status");
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
			cellG1.setCellValue("Author");
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
			cellH1.setCellValue("Co-Author");
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
			cellI1.setCellValue("Subject");
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
			cellJ1.setCellValue("Type");
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
			cellK1.setCellValue("Year");
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
			
		 
 
			 
			HSSFRow row = null;
			
			for(int i = 0;i<= retBookBean.size()-1;i++ ){
				
			 
				 
			 
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
					cellB2.setCellValue(retBookBean.get(i).getBookTitleIN());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellB2.setCellStyle(cellStyleData);
					
					HSSFCell cellC2 = row.createCell((short) 2);
					cellC2.setCellValue(retBookBean.get(i).getBookRackNoIN());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellC2.setCellStyle(cellStyleData);

					HSSFCell cellD2 = row.createCell((short) 3);
					cellD2.setCellValue(retBookBean.get(i).getBookRowNoIN());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellD2.setCellStyle(cellStyleData);
					
					HSSFCell cellE2 = row.createCell((short) 4);
					cellE2.setCellValue(retBookBean.get(i).getBookNoIN());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellE2.setCellStyle(cellStyleData); 
					
					HSSFCell cellF2 = row.createCell((short) 5);
					cellF2.setCellValue(retBookBean.get(i).getBookStatusIN());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellF2.setCellStyle(cellStyleData); 
					
					HSSFCell cellG2 = row.createCell((short) 6);
					cellG2.setCellValue(retBookBean.get(i).getBookAuthorIN());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellG2.setCellStyle(cellStyleData);



					HSSFCell cellH2 = row.createCell((short) 7);
					cellH2.setCellValue(retBookBean.get(i).getBookCoAuthorIN());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellH2.setCellStyle(cellStyleData);
 
					
					HSSFCell cellI2 = row.createCell((short) 8);
					cellI2.setCellValue(retBookBean.get(i).getBookSubjectIN());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellI2.setCellStyle(cellStyleData);
					
					HSSFCell cellJ2 = row.createCell((short) 9);
					cellJ2.setCellValue(retBookBean.get(i).getBookTypeIN());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellJ2.setCellStyle(cellStyleData);
					
					HSSFCell cellK2 = row.createCell((short) 10);
					cellK2.setCellValue(retBookBean.get(i).getBookYearIN());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellK2.setCellStyle(cellStyleData);

				 

			 

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

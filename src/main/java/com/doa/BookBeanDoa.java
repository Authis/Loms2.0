package com.doa;

import com.action.RakshaDBUtil;
import com.bean.BookBean;
import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
public class BookBeanDoa {
	
	
	public String addBookSaveDoa(BookBean bookBean, String username, String password){
		String retBookId="";
		
		String retClientID = "";
		String retErr = "";
		Connection connection = null;
		try {
			
			connection = RakshaDBUtil.getCon(username, password);
			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_OFFICE_PKG.AddBookInfo(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			callStmt.setString(1, bookBean.getBookNoIN());
			callStmt.setString(2, bookBean.getBookTitleIN());
			callStmt.setString(3, bookBean.getBookAuthorIN());
			callStmt.setString(4, bookBean.getBookCoAuthorIN());
			callStmt.setString(5, bookBean.getBookSubjectIN());
			callStmt.setString(6, bookBean.getBookTypeIN());
			callStmt.setString(7, bookBean.getBookYearIN());
			callStmt.setString(8, bookBean.getBookPublisherIN());
			callStmt.setString(9, bookBean.getBookRackNoIN());
			callStmt.setString(10, bookBean.getBookRowNoIN()); 
			callStmt.setString(11, bookBean.getBookStatusIN()); 
			callStmt.registerOutParameter(12, java.sql.Types.VARCHAR);
			callStmt.registerOutParameter(13, java.sql.Types.VARCHAR);
		 
			callStmt.executeUpdate();

			
			retErr = callStmt.getString(12);
			if (retErr == "E9999" || retErr.equals("E9999")) {
				
				retBookId = "E9999";
			} else {
				retBookId = callStmt.getString(13);
			}
			callStmt.close();
			// connection.close();
		} catch (Exception e) {
			
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	 
		
		return retBookId;
	}

	public ArrayList<BookBean> searchBookDoa(BookBean searchbookBean,
			String username, String password) {
		ArrayList<BookBean> retBookBean = new ArrayList<BookBean>();
		BookBean bookBean;
		Connection connection = null;
		try {
			
			connection = RakshaDBUtil.getCon(username, password);
			ResultSet rs;

			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_OFFICE_PKG.SearchBookInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			callStmt.setString(1, null);
			callStmt.setString(2, searchbookBean.getBookNoIN().trim());
			callStmt.setString(3, searchbookBean.getBookTitleIN().trim());
			callStmt.setString(4, searchbookBean.getBookAuthorIN().trim());
			callStmt.setString(5, searchbookBean.getBookCoAuthorIN().trim());
			callStmt.setString(6, searchbookBean.getBookSubjectIN().trim());
			callStmt.setString(7, searchbookBean.getBookTypeIN().trim());
			callStmt.setString(8, searchbookBean.getBookYearIN().trim());
			callStmt.setString(9, searchbookBean.getBookPublisherIN().trim());
			callStmt.setString(10, searchbookBean.getBookRackNoIN().trim());
			callStmt.setString(11, searchbookBean.getBookRowNoIN().trim());
			callStmt.setString(12, searchbookBean.getBookStatusIN().trim());
			callStmt.registerOutParameter(13, OracleTypes.CURSOR);
			callStmt.registerOutParameter(14, java.sql.Types.VARCHAR);
			callStmt.registerOutParameter(15, java.sql.Types.VARCHAR);
			callStmt.executeUpdate();

			// connection.close();
			rs = ((OracleCallableStatement) callStmt).getCursor(13);
			while (rs.next()) {
				bookBean = new BookBean();
				bookBean.setBookId(rs.getString(1));
				bookBean.setBookNoIN(rs.getString(2));
				bookBean.setBookTitleIN(rs.getString(3));
				bookBean.setBookAuthorIN(rs.getString(4));
				bookBean.setBookCoAuthorIN(rs.getString(5));
				bookBean.setBookSubjectIN(rs.getString(6));
				bookBean.setBookTypeIN(rs.getString(7));
				bookBean.setBookYearIN(rs.getString(8));
				bookBean.setBookPublisherIN(rs.getString(9));
				bookBean.setBookRackNoIN(rs.getString(10));
				bookBean.setBookRowNoIN(rs.getString(11));	
				bookBean.setBookStatusIN(rs.getString(12));
				retBookBean.add(bookBean);
			}
			callStmt.close();
		} catch (Exception e) {
		 
			e.printStackTrace();
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				 
				e.printStackTrace();
			}
		}
		return retBookBean;
	}
	
	public BookBean viewBookInfoDoa(String hidbookid,
			String username, String password) {
	 
		BookBean bookBean = null;
		Connection connection = null;
		try {
			
			connection = RakshaDBUtil.getCon(username, password);
			ResultSet rs;

			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_OFFICE_PKG.SearchBookInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");

			callStmt.setString(1, hidbookid);
			callStmt.setString(2, null);
			callStmt.setString(3, null);
			callStmt.setString(4, null);
			callStmt.setString(5, null);
			callStmt.setString(6, null);
			callStmt.setString(7, null);
			callStmt.setString(8, null);
			callStmt.setString(9, null);
			callStmt.setString(10, null);
			callStmt.setString(11, null);
			callStmt.setString(12, null);
			callStmt.registerOutParameter(13, OracleTypes.CURSOR);
			callStmt.registerOutParameter(14, java.sql.Types.VARCHAR);
			callStmt.registerOutParameter(15, java.sql.Types.VARCHAR);
			callStmt.executeUpdate();

			// connection.close();
			rs = ((OracleCallableStatement) callStmt).getCursor(13);
			while (rs.next()) {
				bookBean = new BookBean();
				bookBean.setBookId(rs.getString(1));
				bookBean.setBookNoIN(rs.getString(2));
				bookBean.setBookTitleIN(rs.getString(3));
				bookBean.setBookAuthorIN(rs.getString(4));
				bookBean.setBookCoAuthorIN(rs.getString(5));
				bookBean.setBookSubjectIN(rs.getString(6));
				bookBean.setBookTypeIN(rs.getString(7));
				bookBean.setBookYearIN(rs.getString(8));
				bookBean.setBookPublisherIN(rs.getString(9));
				bookBean.setBookRackNoIN(rs.getString(10));
				bookBean.setBookRowNoIN(rs.getString(11));		
				bookBean.setBookStatusIN(rs.getString(12));
				 
			}
			callStmt.close();
		} catch (Exception e) {
			
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return bookBean;
	}
	
	

	public BookBean modBookDetailDoa(String hidbookid, String username,
			String password) {
		BookBean bookBean = null;
		Connection connection = null;
		try {
			
			connection = RakshaDBUtil.getCon(username, password);
			ResultSet rs;

			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_OFFICE_PKG.SearchBookInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");

			callStmt.setString(1, hidbookid);
			callStmt.setString(2, null);
			callStmt.setString(3, null);
			callStmt.setString(4, null);
			callStmt.setString(5, null);
			callStmt.setString(6, null);
			callStmt.setString(7, null);
			callStmt.setString(8, null);
			callStmt.setString(9, null);
			callStmt.setString(10, null);
			callStmt.setString(11, null);
			callStmt.setString(12, null);
			callStmt.registerOutParameter(13, OracleTypes.CURSOR);
			callStmt.registerOutParameter(14, java.sql.Types.VARCHAR);
			callStmt.registerOutParameter(15, java.sql.Types.VARCHAR);
			callStmt.executeUpdate();

			// connection.close();
			rs = ((OracleCallableStatement) callStmt).getCursor(13);
			while (rs.next()) {
				bookBean = new BookBean();
				bookBean.setBookId(rs.getString(1));
				bookBean.setBookNoIN(rs.getString(2));
				bookBean.setBookTitleIN(rs.getString(3));
				bookBean.setBookAuthorIN(rs.getString(4));
				bookBean.setBookCoAuthorIN(rs.getString(5));
				bookBean.setBookSubjectIN(rs.getString(6));
				bookBean.setBookTypeIN(rs.getString(7));
				bookBean.setBookYearIN(rs.getString(8));
				bookBean.setBookPublisherIN(rs.getString(9));
				bookBean.setBookRackNoIN(rs.getString(10));
				bookBean.setBookRowNoIN(rs.getString(11));		
				bookBean.setBookStatusIN(rs.getString(12));	
				 
			}
			callStmt.close();
		} catch (Exception e) {
			
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return bookBean;
		
	}

	public String editBookSaveDoa(BookBean bookBean, String username,
			String password) {
		String retBookId="";
		
		String retClientID = "";
		String retErr = "";
		Connection connection = null;
		try {
			 
			connection = RakshaDBUtil.getCon(username, password);
			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_OFFICE_PKG.UpdateBookInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			callStmt.setString(1, bookBean.getBookId());
			callStmt.setString(2, bookBean.getBookNoIN());
			callStmt.setString(3, bookBean.getBookTitleIN());
			callStmt.setString(4, bookBean.getBookAuthorIN());
			callStmt.setString(5, bookBean.getBookCoAuthorIN());
			callStmt.setString(6, bookBean.getBookSubjectIN());
			callStmt.setString(7, bookBean.getBookTypeIN());
			callStmt.setString(8, bookBean.getBookYearIN());
			callStmt.setString(9, bookBean.getBookPublisherIN());
			callStmt.setString(10, bookBean.getBookRackNoIN());
			callStmt.setString(11, bookBean.getBookRowNoIN()); 
			callStmt.setString(12, bookBean.getBookStatusIN()); 
			callStmt.registerOutParameter(13, java.sql.Types.VARCHAR);
			callStmt.registerOutParameter(14, java.sql.Types.VARCHAR);
		 
			callStmt.executeUpdate();

			
			retErr = callStmt.getString(13);
			if (retErr == "E9999" || retErr.equals("E9999")) {
				
				retBookId = "E9999";
			} else {
				retBookId = callStmt.getString(14);
			}
			callStmt.close();
			// connection.close();
		} catch (Exception e) {
			
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	 
		
		return retBookId;
	}

	public String delBookDoa(String hidbookid, String username, String password) {
		 String retVar="";
		 Connection connection = null;
		try {
			
			connection = RakshaDBUtil.getCon(username, password);	 
           
			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_OFFICE_PKG.DeleteBookInfo(?,?,?)}");

			callStmt.setString(1, hidbookid);			
			callStmt.registerOutParameter(2, java.sql.Types.VARCHAR);
			callStmt.registerOutParameter(3, java.sql.Types.VARCHAR);
			callStmt.executeUpdate();
 
			retVar =  callStmt.getString(2);
			callStmt.close();
		} catch (Exception e) {
			
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return retVar;
	}

}

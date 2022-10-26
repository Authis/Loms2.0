package com.doa;

import com.action.RakshaDBUtil;
import com.bean.AddEmpBean;
import com.bean.EmppasschangeBean;
import com.bean.MailDataBean;
import com.bean.SearchEmpIdBean;
import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

import java.sql.*;
import java.util.ArrayList;

public class EmpInfoDoa {
	@SuppressWarnings("rawtypes")


	public String addEmpInfoDoa(AddEmpBean addEmpBean,String username,String password ) {

	 

		String retEmpID = "";
		String retUserId = "";
		String retPassword = "";
		String errMsg = "";
		Connection connection = null;
		try {
			
			connection = RakshaDBUtil.getCon(username, password);
			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_EMP_PKG.AddEmpInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			callStmt.setString(1, addEmpBean.getFirstname());
			callStmt.setString(2, addEmpBean.getLastname());
			callStmt.setString(3, addEmpBean.getGender());
			callStmt.setString(4, addEmpBean.getAddress());
			callStmt.setString(5, addEmpBean.getNationality());
			callStmt.setString(6, addEmpBean.getDateofbirth());
			callStmt.setString(7, addEmpBean.getTelephoneno());
			callStmt.setString(8, addEmpBean.getMobileno());
			callStmt.setString(9, addEmpBean.getComments());
			callStmt.setString(10, addEmpBean.getDateofjoining());
			callStmt.setString(11, addEmpBean.getPanno());
			callStmt.setString(12, addEmpBean.getLicenseno());
			callStmt.setString(13, addEmpBean.getEmpemail());
			callStmt.setString(14, addEmpBean.getUsertype());
			callStmt.setString(15, addEmpBean.getSecquestion1());
			callStmt.setString(16, addEmpBean.getAnswer1());
			callStmt.setString(17, addEmpBean.getSecquestion2());
			callStmt.setString(18, addEmpBean.getAnswer2());
			callStmt.registerOutParameter(19, Types.VARCHAR);
			callStmt.registerOutParameter(20, Types.VARCHAR);
			callStmt.registerOutParameter(21, Types.VARCHAR);
			callStmt.registerOutParameter(22, Types.VARCHAR);
			callStmt.registerOutParameter(23, Types.VARCHAR);
			callStmt.executeUpdate();

			retEmpID = callStmt.getString(19);
			retUserId = callStmt.getString(20);
			retPassword = callStmt.getString(21);
			errMsg = callStmt.getString(22);

			 
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
		return retEmpID + "-" + retUserId + "-" + retPassword + "-" +errMsg;

	}
	
	public String addApplicationMasterInfoDao(AddEmpBean addEmpBean,String smsService,String emailsService, String productId,String activationId) throws SQLException{
		Connection connection = null;
		connection = RakshaDBUtil.getCon();
		CallableStatement callStmt = null;
		String retStr = "";
		try {
			callStmt = connection
					.prepareCall("{call LOMS_SERVICE_PKG.AddApplicationMasterInfo(?,?,?,?,?,?,?,?)}");
			callStmt.setString(1, addEmpBean.getEmpemail());
			callStmt.setString(2, addEmpBean.getEmailpassword());
			callStmt.setString(3, emailsService);
			callStmt.setString(4, smsService);
			callStmt.setString(5, productId);
			callStmt.setString(6, activationId);
			callStmt.registerOutParameter(7, Types.VARCHAR);
			callStmt.registerOutParameter(8, Types.VARCHAR);
			callStmt.executeUpdate();
			retStr = callStmt.getString(7);
		} catch (SQLException e) {
			 
			System.out.println("Exception--->"+e); 
		}finally{
			callStmt.close();
			connection.close();
		}
			return retStr;
		
	}

	public String addGodUserInfoDoa(AddEmpBean addEmpBean) {

		 

		String retClientId = "";
		String retUserId = "";
		String retPassword = "";
		try {
			Connection connection = null;
			connection = RakshaDBUtil.getCon();
			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_EMP_PKG.AddLawyerInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			callStmt.setString(1, addEmpBean.getFirstname());
			callStmt.setString(2, addEmpBean.getLastname());
			callStmt.setString(3, addEmpBean.getGender());
			callStmt.setString(4, addEmpBean.getAddress());
			callStmt.setString(5, addEmpBean.getNationality());
			callStmt.setString(6, addEmpBean.getDateofbirth());
			callStmt.setString(7, addEmpBean.getTelephoneno());
			callStmt.setString(8, addEmpBean.getMobileno());
			callStmt.setString(9, "LOMS");
			callStmt.setString(10, addEmpBean.getEmpemail());
			callStmt.setString(11, addEmpBean.getEmployeeid());
			callStmt.setString(12, addEmpBean.getEmppassword());
			callStmt.setString(13, addEmpBean.getSecquestion1());
			callStmt.setString(14, addEmpBean.getAnswer1());
			callStmt.setString(15, addEmpBean.getSecquestion2());
			callStmt.setString(16, addEmpBean.getAnswer2());
			callStmt.registerOutParameter(17, Types.VARCHAR);
			callStmt.registerOutParameter(18, Types.VARCHAR);
			callStmt.registerOutParameter(19, Types.VARCHAR);
		
			callStmt.executeUpdate();

			retClientId = callStmt.getString(17);
			retUserId = addEmpBean.getEmployeeid();
			retPassword = addEmpBean.getEmppassword();

			 
			callStmt.close();
			connection.close();
		} catch (Exception e) {
			
		}
		return retClientId + "-" + retUserId + "-" + retPassword;

	}
	public String checkProductActive(){
		 ResultSet rs;
		 String proActFlag = "";
		 Connection connection = null;
			connection = RakshaDBUtil.getCon();
			try {                                                                 
				CallableStatement callStmt = connection.prepareCall("{ ? = call LOMS_SERVICE_PKG.CheckIfProductIsActive()}");
				callStmt.registerOutParameter(1, Types.VARCHAR);
				 callStmt.executeUpdate();	 
				 proActFlag = callStmt.getString(1);	 
				 callStmt.close();
				 
				 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				 
			}
		 return proActFlag;
	}
	 
	
	
	public ArrayList<AddEmpBean> searchEmpInfoResultDoa(
			SearchEmpIdBean searchempidbean, String username, String password) {

		ArrayList<AddEmpBean> retAddEmpBean = new ArrayList<AddEmpBean>();
		AddEmpBean addEmpBean;
		Connection connection = null;
		try {
			
			connection = RakshaDBUtil.getCon(username,password);
			ResultSet rs;

			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_EMP_PKG.SearchEmpInfo(?,?,?,?,?,?,?,?,?,?,?)}");

			callStmt.setString(1, searchempidbean.getEmployeeid().trim());
			callStmt.setString(2, searchempidbean.getFirstname().trim());
			callStmt.setString(3, searchempidbean.getLastname().trim());
			callStmt.setString(4, searchempidbean.getDateofbirth().trim());
			callStmt.setString(5, searchempidbean.getMobilenumber().trim());
			callStmt.setString(6, searchempidbean.getDataofjoin().trim());
			callStmt.setString(7, searchempidbean.getPannumber().trim());
			callStmt.setString(8, searchempidbean.getLicensenumber().trim());
			callStmt.registerOutParameter(9, OracleTypes.CURSOR);
			callStmt.registerOutParameter(10, Types.VARCHAR);
			callStmt.registerOutParameter(11, Types.VARCHAR);
			callStmt.executeUpdate();

			 
			rs = ((OracleCallableStatement) callStmt).getCursor(9);
			while (rs.next()) {
				addEmpBean = new AddEmpBean();
				addEmpBean.setEmployeeid(rs.getString(1));
				addEmpBean.setFirstname(rs.getString(2));
				addEmpBean.setLastname(rs.getString(3));
				addEmpBean.setGender(rs.getString(4));
				addEmpBean.setAddress(rs.getString(5));
				addEmpBean.setNationality(rs.getString(6));
				addEmpBean.setDateofbirth(rs.getString(7));
				addEmpBean.setTelephoneno(rs.getString(8));
				addEmpBean.setMobileno(rs.getString(9));
				addEmpBean.setComments(rs.getString(10));
				addEmpBean.setDateofjoining(rs.getString(11));
				addEmpBean.setPanno(rs.getString(12));
				addEmpBean.setLicenseno(rs.getString(13));
				retAddEmpBean.add(addEmpBean);
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

		return retAddEmpBean;
	}

	public AddEmpBean editEmpDetDoa(String hidempid, String username, String password) {

		AddEmpBean addEmpBean = new AddEmpBean();
		Connection connection = null;
		try {
			
			connection = RakshaDBUtil.getCon(username,password);
			ResultSet rs;

			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_EMP_PKG.SearchEmpInfo(?,?,?,?,?,?,?,?,?,?,?)}");

			callStmt.setString(1, hidempid);
			callStmt.setString(2, null);
			callStmt.setString(3, null);
			callStmt.setString(4, null);
			callStmt.setString(5, null);
			callStmt.setString(6, null);
			callStmt.setString(7, null);
			callStmt.setString(8, null);
			callStmt.registerOutParameter(9, OracleTypes.CURSOR);
			callStmt.registerOutParameter(10, Types.VARCHAR);
			callStmt.registerOutParameter(11, Types.VARCHAR);
			callStmt.executeUpdate();

			 
			rs = ((OracleCallableStatement) callStmt).getCursor(9);
			while (rs.next()) {
				addEmpBean.setEmployeeid(rs.getString(1));
				addEmpBean.setFirstname(rs.getString(2));
				addEmpBean.setLastname(rs.getString(3));
				addEmpBean.setGender(rs.getString(4));
				addEmpBean.setAddress(rs.getString(5));
				addEmpBean.setNationality(rs.getString(6));
				addEmpBean.setDateofbirth(rs.getString(7));
				addEmpBean.setTelephoneno(rs.getString(8));
				addEmpBean.setMobileno(rs.getString(9));
				addEmpBean.setComments(rs.getString(10));
				addEmpBean.setDateofjoining(rs.getString(11));
				addEmpBean.setPanno(rs.getString(12));
				addEmpBean.setLicenseno(rs.getString(13));
				addEmpBean.setUsertype(rs.getString(14));
				addEmpBean.setUsertype(rs.getString(15));
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
		 
		return addEmpBean;

	}

	public String delEmpInfoDoa(String hidempid, String username, String password) {
		 

		String retMsg = "";
		Connection connection = null;
		try {			
			connection = RakshaDBUtil.getCon(username,password);
			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_EMP_PKG.DeactivateEmployee(?,?,?)}");
			callStmt.setString(1, hidempid);
			callStmt.registerOutParameter(2, Types.VARCHAR);
			callStmt.registerOutParameter(3, Types.VARCHAR);
			callStmt.executeUpdate();

			retMsg = callStmt.getString(2);

			 
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
		return retMsg;
	}

	public String editEmployeeInfoDoa(AddEmpBean addEmpBean, String username, String password) {
		String retEmpID = "";
		String retErr = "";
		CallableStatement callStmt = null;
		Connection connection = null;
		try {
			
			connection = RakshaDBUtil.getCon(username,password);
			  callStmt = connection
					.prepareCall("{call LOMS_EMP_PKG.UpdateEmpInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			callStmt.setString(1, addEmpBean.getEmployeeid());
			callStmt.setString(2, addEmpBean.getFirstname());
			callStmt.setString(3, addEmpBean.getLastname());
			callStmt.setString(4, addEmpBean.getGender());
			callStmt.setString(5, addEmpBean.getAddress());
			callStmt.setString(6, addEmpBean.getNationality());
			callStmt.setString(7, addEmpBean.getDateofbirth());
			callStmt.setString(8, addEmpBean.getTelephoneno());
			callStmt.setString(9, addEmpBean.getMobileno());			 
			callStmt.setString(10, addEmpBean.getComments());
			callStmt.setString(11, addEmpBean.getDateofjoining());
			callStmt.setString(12, addEmpBean.getPanno());
			callStmt.setString(13, addEmpBean.getLicenseno());
			callStmt.setString(14, addEmpBean.getUsertype());
			callStmt.registerOutParameter(15, Types.VARCHAR);
			callStmt.registerOutParameter(16, Types.VARCHAR);
			callStmt.executeUpdate();

			retErr = callStmt.getString(16);
			if (retErr != "E9999") {
				retEmpID = addEmpBean.getEmployeeid();
			} else {
				retEmpID = "Failer";
			}
			
		} catch (Exception e) {
			
		}finally{
			try {
				callStmt.close();
				 connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return retEmpID;
	}
	public ArrayList<String> chgPwdDoa(String username,String password) {


		ArrayList<String>  retQuestions = new ArrayList<String>();
		Connection connection = null;
		try {
			
			connection = RakshaDBUtil.getCon(username,password);
			ResultSet rs;

			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_EMP_PKG.GetSecurityQuestions(?,?,?,?,?)}");

			callStmt.setString(1, username); 
			callStmt.registerOutParameter(2, Types.VARCHAR);
			callStmt.registerOutParameter(3, Types.VARCHAR);
			callStmt.registerOutParameter(4, Types.VARCHAR);
			callStmt.registerOutParameter(5, Types.VARCHAR);
			callStmt.executeUpdate();
		 
				retQuestions.add(callStmt.getString(2));
				retQuestions.add(callStmt.getString(3));				 
			 
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
	 
		return retQuestions;
		
	}
	
	public ArrayList<String> forgetpassword(String username) {


		ArrayList<String>  retQuestions = new ArrayList<String>();
		Connection connection = null;
		try {
			
			connection = RakshaDBUtil.getCon();
			//ResultSet rs;

			CallableStatement callStmt = connection.prepareCall("{call LOMS_EMP_PKG.GetSecurityQuestions(?,?,?,?,?)}");

			callStmt.setString(1, username); 
			callStmt.registerOutParameter(2, Types.VARCHAR);
			callStmt.registerOutParameter(3, Types.VARCHAR);
			callStmt.registerOutParameter(4, Types.VARCHAR);
			callStmt.registerOutParameter(5, Types.VARCHAR);
			callStmt.executeUpdate();
		 
				retQuestions.add(callStmt.getString(2));
				retQuestions.add(callStmt.getString(3));				 
		 
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
	 
		return retQuestions;
		
	}
	
	
	
	public ArrayList<String> getSecQuestions(String username,String password) {


		ArrayList<String>  retQuestions = new ArrayList<String>();
		Connection connection = null;
		try {
			
			connection = RakshaDBUtil.getCon(username, password);
			
			//ResultSet rs;

			CallableStatement callStmt = connection.prepareCall("{call LOMS_EMP_PKG.GetSecurityQuestions(?,?,?,?,?)}");

			callStmt.setString(1, username); 
			callStmt.registerOutParameter(2, Types.VARCHAR);
			callStmt.registerOutParameter(3, Types.VARCHAR);
			callStmt.registerOutParameter(4, Types.VARCHAR);
			callStmt.registerOutParameter(5, Types.VARCHAR);
			callStmt.executeUpdate();
		 
				retQuestions.add(callStmt.getString(2));
				retQuestions.add(callStmt.getString(3));				 
		 
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
	 
		return retQuestions;
		
	}
	
	
	public String getEmailID(String username,String password){
		Connection connection = null;
		String oldEmailID = "";
		CallableStatement callStmt = null;
		try {
			
			connection = RakshaDBUtil.getCon(username, password);
			
			//ResultSet rs;

			  callStmt = connection.prepareCall("{call LOMS_EMP_PKG.GetEmailID(?,?,?,?)}");

			callStmt.setString(1, username); 
			callStmt.registerOutParameter(2, Types.VARCHAR);
			callStmt.registerOutParameter(3, Types.VARCHAR);
			callStmt.registerOutParameter(4, Types.VARCHAR);
			 
			callStmt.executeUpdate();
		    if(!callStmt.getString(3).equals("E9999")){
			oldEmailID = callStmt.getString(2); 
			}else{
				oldEmailID = callStmt.getString(3);
			}
		 
			
		} catch (Exception e) {
			
		}finally{
			try {
				callStmt.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	 
		return oldEmailID;
		
		
	}
	public String updateEmailID(AddEmpBean addEmpBean,String username,String password){
		Connection connection = null;
		String retErrId = "";
		CallableStatement callStmt = null;
		try {
			
			connection = RakshaDBUtil.getCon(username, password);
			callStmt = connection.prepareCall("{call LOMS_EMP_PKG.UpdateEmailID(?,?,?,?)}");

			callStmt.setString(1, addEmpBean.getUsername()); 
			callStmt.setString(2, addEmpBean.getEmpemail()); 
			callStmt.registerOutParameter(3, Types.VARCHAR);
			callStmt.registerOutParameter(4, Types.VARCHAR);
			callStmt.executeUpdate();					     
			retErrId = callStmt.getString(3);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				callStmt.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	 
		return retErrId;
		
		
	}
	
	
	
	public String updateSecQuestions(AddEmpBean addEmpBean, String username, String password) {
		 
		String retErr = "";
		CallableStatement callStmt = null;
		Connection connection = null;
		try {
			
			connection = RakshaDBUtil.getCon(username,password);
			  callStmt = connection
					.prepareCall("{call LOMS_EMP_PKG.UpdateSecurityInfo(?,?,?,?,?,?,?)}");
			callStmt.setString(1, addEmpBean.getUsername());
			callStmt.setString(2, addEmpBean.getSecquestion1());
			callStmt.setString(3, addEmpBean.getAnswer1());
			callStmt.setString(4, addEmpBean.getSecquestion2());
			callStmt.setString(5, addEmpBean.getAnswer2());			
			callStmt.registerOutParameter(6, Types.VARCHAR);
			callStmt.registerOutParameter(7, Types.VARCHAR);
			callStmt.executeUpdate();

			retErr = callStmt.getString(6);
			 
			
		} catch (Exception e) {
			
		}finally{
			try {
				callStmt.close();
				 connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return retErr;
	}
	
	
	public String updatePasswordDoa(EmppasschangeBean emppasschangeBean, String username, String password) {
		String retMsg = "";
		String retErr = "";
		String retErrMsg = "";
		Connection connection = null;
		try {
			
			connection = RakshaDBUtil.getCon(username,password);
			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_EMP_PKG.ChangePassword(?,?,?,?,?,?,?,?,?)}");
			callStmt.setString(1, emppasschangeBean.getUsername());
			callStmt.setString(2, emppasschangeBean.getOldpassword());
			callStmt.setString(3, emppasschangeBean.getNewpassword());
			callStmt.setString(4, emppasschangeBean.getSecquestion1());
			callStmt.setString(5, emppasschangeBean.getAnswer1());
			callStmt.setString(6, emppasschangeBean.getSecquestion2());		
			callStmt.setString(7, emppasschangeBean.getAnswer2());	
			callStmt.registerOutParameter(8, Types.VARCHAR);
			callStmt.registerOutParameter(9, Types.VARCHAR);
			callStmt.executeUpdate();

			retErr = callStmt.getString(8);
			retErrMsg = callStmt.getString(9);
			if (retErr == "E9999" || retErr.equals("E9999")) {
				retMsg = retErr+"|"+retErrMsg;
				
			} else {
				retMsg = emppasschangeBean.getUsername()+"|"+retErrMsg;
			}
			callStmt.close();
			 connection.close();
		} catch (Exception e) {
			
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return retMsg;
		
	}

	public MailDataBean sendpassmailDoa(EmppasschangeBean emppasschangeBean) {
		 
		String retMsg = "";
		String retErr = "";
		MailDataBean mailDataBean = null;
		Connection connection = null;
		try {
			
			connection = RakshaDBUtil.getCon();
			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_EMP_PKG.ForgotPassword(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			callStmt.setString(1, emppasschangeBean.getUsername()); 
			callStmt.setString(2, emppasschangeBean.getSecquestion1());
			callStmt.setString(3, emppasschangeBean.getAnswer1());
			callStmt.setString(4, emppasschangeBean.getSecquestion2());		
			callStmt.setString(5, emppasschangeBean.getAnswer2());	
			callStmt.registerOutParameter(6,  Types.VARCHAR);
			callStmt.registerOutParameter(7, Types.VARCHAR);
			callStmt.registerOutParameter(8, Types.VARCHAR);
			callStmt.registerOutParameter(9, Types.VARCHAR);
			callStmt.registerOutParameter(10, Types.VARCHAR);
			callStmt.registerOutParameter(11, Types.VARCHAR);
			callStmt.registerOutParameter(12, Types.VARCHAR);
			callStmt.registerOutParameter(13, Types.VARCHAR);
 			
			callStmt.executeUpdate();
			
			mailDataBean = new MailDataBean();	
			mailDataBean.setEmpPass(callStmt.getString(6));
			mailDataBean.setFromEmailIDOUT(callStmt.getString(7));
			mailDataBean.setFromEmailPwdOUT(callStmt.getString(8));
			mailDataBean.setToemailIdOUT(callStmt.getString(9));
			mailDataBean.setEmailSubjectOUT(callStmt.getString(10));				 
			mailDataBean.setEmailMsgOUT(callStmt.getString(11));
			mailDataBean.setErrorCdOUT(callStmt.getString(12));
			mailDataBean.setErrorMsgOUT(callStmt.getString(13));

			
			

			retErr = callStmt.getString(12);
			if (retErr.equals("E9999")) {
				
				mailDataBean.setErrorMsgOUT("Incorrect Answer(s). Please enter the correct answer(s).");
			} else if(callStmt.getString(9) != "" && callStmt.getString(9) != null){
				mailDataBean.setErrorMsgOUT("Password reset Successful!. Please check your E-mail.");
			}else{
				mailDataBean.setErrorMsgOUT("");
			}
			callStmt.close();
			 connection.close();
		} catch (Exception e) {
			
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return mailDataBean;
		
	}

	public MailDataBean sendEmpMail(String retUserName, String username,
			String password) {
		MailDataBean mailDataBean = null;
		Connection connection = null;
		try {
			
			connection = RakshaDBUtil.getCon(username, password);
			ResultSet rs;

			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_EMP_PKG.ComposeEmailToEmployee(?,?,?,?,?,?,?,?,?)}");

			callStmt.setString(1, retUserName);
			callStmt.setString(2, "AddEmpInfo");
			callStmt.registerOutParameter(3, Types.VARCHAR);
			callStmt.registerOutParameter(4, Types.VARCHAR);
			callStmt.registerOutParameter(5, Types.VARCHAR);
			callStmt.registerOutParameter(6, Types.VARCHAR);
			callStmt.registerOutParameter(7, Types.VARCHAR);
			callStmt.registerOutParameter(8, Types.VARCHAR);
			callStmt.registerOutParameter(9, Types.VARCHAR);
			callStmt.executeUpdate();

			
			 
		 
				mailDataBean = new MailDataBean();
				mailDataBean.setClientIDIN(retUserName);
				mailDataBean.setFromEmailIDOUT(callStmt.getString(3));
				mailDataBean.setFromEmailPwdOUT(callStmt.getString(4));
				mailDataBean.setToemailIdOUT(callStmt.getString(5));
				mailDataBean.setEmailSubjectOUT(callStmt.getString(6));				 
				mailDataBean.setEmailMsgOUT(callStmt.getString(7));
				mailDataBean.setErrorCdOUT(callStmt.getString(8));
				mailDataBean.setErrorMsgOUT(callStmt.getString(9));

	 
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
	 
		return mailDataBean;
	}

	public MailDataBean sendChangePassMail(String userID, String username,
			String password) {
		MailDataBean mailDataBean = null;
		Connection connection = null;
		CallableStatement callStmt = null;
		try {
			
			connection = RakshaDBUtil.getCon(username, password);
			ResultSet rs;

			callStmt = connection
					.prepareCall("{call LOMS_EMP_PKG.ComposeEmailToEmployee(?,?,?,?,?,?,?,?,?)}");

			callStmt.setString(1, userID);
			callStmt.setString(2, "ChangePassword");
			callStmt.registerOutParameter(3, Types.VARCHAR);
			callStmt.registerOutParameter(4, Types.VARCHAR);
			callStmt.registerOutParameter(5, Types.VARCHAR);
			callStmt.registerOutParameter(6, Types.VARCHAR);
			callStmt.registerOutParameter(7, Types.VARCHAR);
			callStmt.registerOutParameter(8, Types.VARCHAR);
			callStmt.registerOutParameter(9, Types.VARCHAR);
			callStmt.executeUpdate();

			 
			 
		 
				mailDataBean = new MailDataBean();
				mailDataBean.setClientIDIN(userID);
				mailDataBean.setFromEmailIDOUT(callStmt.getString(3));
				mailDataBean.setFromEmailPwdOUT(callStmt.getString(4));
				mailDataBean.setToemailIdOUT(callStmt.getString(5));
				mailDataBean.setEmailSubjectOUT(callStmt.getString(6));				 
				mailDataBean.setEmailMsgOUT(callStmt.getString(7));
				mailDataBean.setErrorCdOUT(callStmt.getString(8));
				mailDataBean.setErrorMsgOUT(callStmt.getString(9));

	 
			
		} catch (Exception e) {
			
		}finally{
			try {
				callStmt.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	 
		return mailDataBean;
	}

	public AddEmpBean viewEmpInfoDao(String hidempid, String username, String password) {
		AddEmpBean addEmpBean = new AddEmpBean();
		Connection connection = null;
		try {
			
			connection = RakshaDBUtil.getCon(username,password);
			ResultSet rs;

			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_EMP_PKG.SearchEmpInfo(?,?,?,?,?,?,?,?,?,?,?)}");

			callStmt.setString(1, hidempid);
			callStmt.setString(2, null);
			callStmt.setString(3, null);
			callStmt.setString(4, null);
			callStmt.setString(5, null);
			callStmt.setString(6, null);
			callStmt.setString(7, null);
			callStmt.setString(8, null);
			callStmt.registerOutParameter(9, OracleTypes.CURSOR);
			callStmt.registerOutParameter(10, Types.VARCHAR);
			callStmt.registerOutParameter(11, Types.VARCHAR);
			callStmt.executeUpdate();

			// connection.close();
			rs = ((OracleCallableStatement) callStmt).getCursor(9);
			while (rs.next()) {
				addEmpBean.setEmployeeid(rs.getString(1));
				addEmpBean.setFirstname(rs.getString(2));
				addEmpBean.setLastname(rs.getString(3));
				addEmpBean.setGender(rs.getString(4));
				addEmpBean.setAddress(rs.getString(5));
				addEmpBean.setNationality(rs.getString(6));
				addEmpBean.setDateofbirth(rs.getString(7));
				addEmpBean.setTelephoneno(rs.getString(8));
				addEmpBean.setMobileno(rs.getString(9));
				addEmpBean.setComments(rs.getString(10));
				addEmpBean.setDateofjoining(rs.getString(11));
				addEmpBean.setPanno(rs.getString(12));
				addEmpBean.setLicenseno(rs.getString(13));
				addEmpBean.setUsername(rs.getString(14));
				addEmpBean.setUsertype(rs.getString(15));
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
	 
		 
		return addEmpBean;
	}

	 

}
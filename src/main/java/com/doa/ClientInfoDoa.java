package com.doa;

import com.action.RakshaDBUtil;
import com.bean.AddClientBean;
import com.bean.ClientFamilyBean;
import com.bean.MailDataBean;
import com.bean.SearchBean;
import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

import java.sql.*;
import java.util.ArrayList;

public class ClientInfoDoa {
	public String addClientInfo(AddClientBean addClientBean, String username,
			String password) {

		 
		String retClientID = "";
		String retErr = "";
		Connection connection = null;
		try {
 			connection = RakshaDBUtil.getCon(username, password);
			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_OFFICE_PKG.AddClientInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			callStmt.setString(1, addClientBean.getFirstname());
			callStmt.setString(2, addClientBean.getLastname());
			callStmt.setString(3, addClientBean.getTelephoneno());
			callStmt.setString(4, addClientBean.getMobilenumber());
			callStmt.setString(5, addClientBean.getEmailid());
			callStmt.setString(6, addClientBean.getPermanentaddress());
			callStmt.setString(7, addClientBean.getTemporaryaddress());
			callStmt.setString(8, addClientBean.getOrganizationname());
			callStmt.setString(9, addClientBean.getOrganizationaddress());
			callStmt.setString(10, addClientBean.getOrganizationtelephoneno());
			callStmt.setString(11, addClientBean.getOrganizationmobileno());
			callStmt.setString(12, addClientBean.getPannumber());
			callStmt.setString(13, addClientBean.getTinnumber());
			callStmt.setString(14, addClientBean.getProfession());
			callStmt.setString(15, addClientBean.getDateofbirth());
			callStmt.setString(16, addClientBean.getGender());
			callStmt.setString(17, addClientBean.getComments());
			callStmt.registerOutParameter(18, Types.VARCHAR);
			callStmt.registerOutParameter(19, Types.VARCHAR);
			callStmt.registerOutParameter(20, Types.VARCHAR);
			callStmt.executeUpdate();

			
			retErr = callStmt.getString(19);
			if (retErr == "E9999" || retErr.equals("E9999")) {
				 
				retClientID = "E9999";
			} else {
				retClientID = callStmt.getString(18);
			}
			callStmt.close();
			// connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return retClientID;
	}

	public ArrayList<AddClientBean> searchClientInfoDoa(SearchBean searchbean,
			String username, String password) {
		ArrayList<AddClientBean> retAddClientBean = new ArrayList<AddClientBean>();
		AddClientBean addclientbean;
		Connection connection = null;
		try {
		 
			connection = RakshaDBUtil.getCon(username, password);
			ResultSet rs;

			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_OFFICE_PKG.SearchClientInfo(?,?,?,?,?,?,?,?,?)}");

			callStmt.setString(1, searchbean.getClientId().trim());
			callStmt.setString(2, searchbean.getFirstName().trim());
			callStmt.setString(3, searchbean.getLastName().trim());
			callStmt.setString(4, searchbean.getMobNo().trim());
			callStmt.setString(5, searchbean.getPanNo().trim());
			callStmt.setString(6, searchbean.getTinNo().trim());
			callStmt.registerOutParameter(7, OracleTypes.CURSOR);
			callStmt.registerOutParameter(8, Types.VARCHAR);
			callStmt.registerOutParameter(9, Types.VARCHAR);
			callStmt.executeUpdate();

			// connection.close();
			rs = ((OracleCallableStatement) callStmt).getCursor(7);
			while (rs.next()) {
				addclientbean = new AddClientBean();
				addclientbean.setClientid(rs.getString(1));
				addclientbean.setFirstname(rs.getString(2));
				addclientbean.setLastname(rs.getString(3));
				addclientbean.setGender(rs.getString(4));
				addclientbean.setTelephoneno(rs.getString(5));
				addclientbean.setMobilenumber(rs.getString(6));
				addclientbean.setEmailid(rs.getString(7));
				addclientbean.setPermanentaddress(rs.getString(8));
				addclientbean.setTemporaryaddress(rs.getString(9));
				addclientbean.setOrganizationname(rs.getString(10));
				addclientbean.setOrganizationaddress(rs.getString(11));
				addclientbean.setOrganizationtelephoneno(rs.getString(12));
				addclientbean.setOrganizationmobileno(rs.getString(13));
				addclientbean.setPannumber(rs.getString(14));
				addclientbean.setTinnumber(rs.getString(15));
				addclientbean.setProfession(rs.getString(16));
				addclientbean.setDateofbirth(rs.getString(17));
				addclientbean.setComments(rs.getString(18));
				retAddClientBean.add(addclientbean);
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
		return retAddClientBean;
	}

	public AddClientBean updateClientInfo(String hidclientid, String username,
			String password) {
		AddClientBean updateclientbean = new AddClientBean();
		Connection connection = null;
		try {
			 
			connection = RakshaDBUtil.getCon(username, password);
			ResultSet rs;

			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_OFFICE_PKG.SearchClientInfo(?,?,?,?,?,?,?,?,?)}");

			callStmt.registerOutParameter(7, OracleTypes.CURSOR);
			callStmt.registerOutParameter(8, Types.VARCHAR);
			callStmt.registerOutParameter(9, Types.VARCHAR);
			callStmt.setString(1, hidclientid);
			callStmt.setString(2, null);
			callStmt.setString(3, null);
			callStmt.setString(4, null);
			callStmt.setString(5, null);
			callStmt.setString(6, null);
			callStmt.executeUpdate();

			// connection.close();
			rs = ((OracleCallableStatement) callStmt).getCursor(7);
			while (rs.next()) {

				updateclientbean.setClientid(rs.getString(1));
				updateclientbean.setFirstname(rs.getString(2));
				updateclientbean.setLastname(rs.getString(3));
				updateclientbean.setGender(rs.getString(4));
				updateclientbean.setTelephoneno(rs.getString(5));
				updateclientbean.setMobilenumber(rs.getString(6));
				updateclientbean.setEmailid(rs.getString(7));
				updateclientbean.setPermanentaddress(rs.getString(8));
				updateclientbean.setTemporaryaddress(rs.getString(9));
				updateclientbean.setOrganizationname(rs.getString(10));
				updateclientbean.setOrganizationaddress(rs.getString(11));
				updateclientbean.setOrganizationtelephoneno(rs.getString(12));
				updateclientbean.setOrganizationmobileno(rs.getString(13));
				updateclientbean.setPannumber(rs.getString(14));
				updateclientbean.setTinnumber(rs.getString(15));
				updateclientbean.setProfession(rs.getString(16));
				updateclientbean.setDateofbirth(rs.getString(17));
				updateclientbean.setComments(rs.getString(18));

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
		 
		return updateclientbean;

	}

	public String updateSaveClinetInfoDao(AddClientBean addClientBean,
			String username, String password) {
		String retClientID = "";
		Connection connection = null;
		try {
			 
			connection = RakshaDBUtil.getCon(username, password);
			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_OFFICE_PKG.ModifyClientInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			callStmt.setString(1, addClientBean.getClientid());
			callStmt.setString(2, addClientBean.getFirstname());
			callStmt.setString(3, addClientBean.getLastname());
			callStmt.setString(4, addClientBean.getTelephoneno());
			callStmt.setString(5, addClientBean.getMobilenumber());
			callStmt.setString(6, addClientBean.getEmailid());
			callStmt.setString(7, addClientBean.getPermanentaddress());
			callStmt.setString(8, addClientBean.getTemporaryaddress());
			callStmt.setString(9, addClientBean.getOrganizationname());
			callStmt.setString(10, addClientBean.getOrganizationaddress());
			callStmt.setString(11, addClientBean.getOrganizationtelephoneno());
			callStmt.setString(12, addClientBean.getOrganizationmobileno());
			callStmt.setString(13, addClientBean.getPannumber());
			callStmt.setString(14, addClientBean.getTinnumber());
			callStmt.setString(15, addClientBean.getProfession());
			callStmt.setString(16, addClientBean.getDateofbirth());
			callStmt.setString(17, addClientBean.getGender());
			callStmt.setString(18, addClientBean.getComments());
			callStmt.registerOutParameter(19, Types.VARCHAR);
			callStmt.registerOutParameter(20, Types.VARCHAR);
			callStmt.executeUpdate();
			retClientID = addClientBean.getClientid();
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
		return retClientID;
	}

	public ArrayList<ClientFamilyBean> getClientFamilyInfoDoa(
			String hidclientid, String username, String password) {

		 
		ArrayList<ClientFamilyBean> arrClientFambean = new ArrayList<ClientFamilyBean>();
		ClientFamilyBean clientFambean;
		Connection connection = null;
		try {
			 
			connection = RakshaDBUtil.getCon(username, password);
			ResultSet rs;
			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_OFFICE_PKG.SearchClientFamilyInfo(?,?,?,?)}");
			callStmt.registerOutParameter(2, OracleTypes.CURSOR);
			callStmt.registerOutParameter(3, Types.VARCHAR);
			callStmt.registerOutParameter(4, Types.VARCHAR);
			callStmt.setString(1, hidclientid);
			callStmt.executeUpdate();
			// connection.close();
			rs = ((OracleCallableStatement) callStmt).getCursor(2);
			while (rs.next()) {
				clientFambean = new ClientFamilyBean();
				clientFambean.setClientid(rs.getString(1));
				clientFambean.setRelationname(rs.getString(2));
				clientFambean.setRelationtype(rs.getString(3));
				clientFambean.setDateofbirth(rs.getString(4));
				clientFambean.setMobilenumber(rs.getString(5));
				clientFambean.setTelephonenumber(rs.getString(6));
				clientFambean.setAddress(rs.getString(7));
				clientFambean.setGender(rs.getString(8));
				clientFambean.setMaritalstatus(rs.getString(9));
				clientFambean.setMarriagedate(rs.getString(10));
				clientFambean.setComments(rs.getString(11));
				arrClientFambean.add(clientFambean);
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

		return arrClientFambean;
	}

	public String addFamilyInfoDoa(ClientFamilyBean addFamilyInfo,
			String username, String password) {
		String retClientId = "";
		Connection connection = null;
		try {
			 
			connection = RakshaDBUtil.getCon(username, password);
			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_OFFICE_PKG.AddClientFamilyInfo(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			callStmt.setString(1, addFamilyInfo.getClientid());
			callStmt.setString(2, addFamilyInfo.getRelationname());
			callStmt.setString(3, addFamilyInfo.getRelationtype());
			callStmt.setString(4, addFamilyInfo.getDateofbirth());
			callStmt.setString(5, addFamilyInfo.getMobilenumber());
			callStmt.setString(6, addFamilyInfo.getTelephonenumber());
			callStmt.setString(7, addFamilyInfo.getAddress());
			callStmt.setString(8, addFamilyInfo.getGender());
			callStmt.setString(9, addFamilyInfo.getMaritalstatus());
			callStmt.setString(10, addFamilyInfo.getMarriagedate());
			callStmt.setString(11, addFamilyInfo.getComments());
			callStmt.registerOutParameter(12, Types.VARCHAR);
			callStmt.registerOutParameter(13, Types.VARCHAR);
			callStmt.executeUpdate();
			retClientId = addFamilyInfo.getClientid();
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

		return retClientId;
	}

	public String delFamInfoViewDoa(String hidclientid, String hidRelname,
			String hidReltype, String username, String password) {
		String retStr = "";
		Connection connection = null;
		try {
		 
			connection = RakshaDBUtil.getCon(username, password);

			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_OFFICE_PKG.DeleteClientFamilyInfo(?,?,?,?,?)}");
			callStmt.setString(1, hidclientid);
			callStmt.setString(2, hidRelname);
			callStmt.setString(3, hidReltype);
			callStmt.registerOutParameter(4, Types.VARCHAR);
			callStmt.registerOutParameter(5, Types.VARCHAR);

			callStmt.executeUpdate();
			retStr = callStmt.getString(4);
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

		return retStr;
	}

	public AddClientBean viewClientInfoDoa(String hidclientid, String username,
			String password) {
		AddClientBean viewClientBean = new AddClientBean();
		Connection connection = null;
		try {
			 
			connection = RakshaDBUtil.getCon(username, password);
			ResultSet rs;

			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_OFFICE_PKG.SearchClientInfo(?,?,?,?,?,?,?,?,?)}");

			callStmt.setString(1, hidclientid);
			callStmt.setString(2, null);
			callStmt.setString(3, null);
			callStmt.setString(4, null);
			callStmt.setString(5, null);
			callStmt.setString(6, null);
			callStmt.registerOutParameter(7, OracleTypes.CURSOR);
			callStmt.registerOutParameter(8, Types.VARCHAR);
			callStmt.registerOutParameter(9, Types.VARCHAR);
			callStmt.executeUpdate();

			// connection.close();
			rs = ((OracleCallableStatement) callStmt).getCursor(7);
			while (rs.next()) {

				viewClientBean.setClientid(rs.getString(1));
				viewClientBean.setFirstname(rs.getString(2));
				viewClientBean.setLastname(rs.getString(3));
				viewClientBean.setGender(rs.getString(4));
				viewClientBean.setTelephoneno(rs.getString(5));
				viewClientBean.setMobilenumber(rs.getString(6));
				viewClientBean.setEmailid(rs.getString(7));
				viewClientBean.setPermanentaddress(rs.getString(8));
				viewClientBean.setTemporaryaddress(rs.getString(9));
				viewClientBean.setOrganizationname(rs.getString(10));
				viewClientBean.setOrganizationaddress(rs.getString(11));
				viewClientBean.setOrganizationtelephoneno(rs.getString(12));
				viewClientBean.setOrganizationmobileno(rs.getString(13));
				viewClientBean.setPannumber(rs.getString(14));
				viewClientBean.setTinnumber(rs.getString(15));
				viewClientBean.setProfession(rs.getString(16));
				viewClientBean.setDateofbirth(rs.getString(17));
				viewClientBean.setComments(rs.getString(18));

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
		 
		return viewClientBean;

	}

	public MailDataBean sendClientMail(String retClientID, String username,
			String password) {
		MailDataBean mailDataBean = null;
		Connection connection = null;
		try {
			 
			connection = RakshaDBUtil.getCon(username, password);
			ResultSet rs;

			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_OFFICE_PKG.ComposeAddClientEmail(?,?,?,?,?,?,?,?,?,?)}");

			callStmt.setString(1, retClientID);
			callStmt.registerOutParameter(2, Types.VARCHAR);
			callStmt.registerOutParameter(3, Types.VARCHAR);
			callStmt.registerOutParameter(4, Types.VARCHAR);
			callStmt.registerOutParameter(5, Types.VARCHAR);
			callStmt.registerOutParameter(6, Types.VARCHAR);
			callStmt.registerOutParameter(7, Types.VARCHAR);
			callStmt.registerOutParameter(8, Types.VARCHAR);
			callStmt.registerOutParameter(9, Types.VARCHAR);
			callStmt.registerOutParameter(10, Types.VARCHAR);
			callStmt.executeUpdate();

			// connection.close();
			 
		 
				mailDataBean = new MailDataBean();
				mailDataBean.setClientIDIN(retClientID);
				mailDataBean.setFromEmailIDOUT(callStmt.getString(2));
				mailDataBean.setFromEmailPwdOUT(callStmt.getString(3));
				mailDataBean.setToemailIdOUT(callStmt.getString(4));
				mailDataBean.setEmailSubjectOUT(callStmt.getString(5));				 
				mailDataBean.setEmailMsgOUT(callStmt.getString(6));
				mailDataBean.setMobileNoOUT(callStmt.getString(7));				 
				mailDataBean.setSmsMessageOUT(callStmt.getString(8));
				mailDataBean.setErrorCdOUT(callStmt.getString(9));
				mailDataBean.setErrorMsgOUT(callStmt.getString(10));

	 
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

}

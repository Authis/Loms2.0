package com.doa;

import com.action.RakshaDBUtil;
import com.bean.StdCaseInfoBean;
import com.bean.StdCourtInfoBean;
import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LawStandardInfoDoa {

	public ArrayList<StdCourtInfoBean> searchStdCourtinfoDoa(
			StdCourtInfoBean stdCourtInfoBean, String username, String password) {
		ArrayList<StdCourtInfoBean> arrstdCourtInfo = new ArrayList<StdCourtInfoBean>();
		Connection connection = null;

		try {
						connection = RakshaDBUtil.getCon(username, password);
			ResultSet rs;
			StdCourtInfoBean stdCourtInfo;

			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_STD_INFO_PKG.SearchCourtInfo(?,?,?,?,?,?,?,?,?,?)}");

			callStmt.registerOutParameter(8, OracleTypes.CURSOR);
			callStmt.registerOutParameter(9, java.sql.Types.VARCHAR);
			callStmt.registerOutParameter(10, java.sql.Types.VARCHAR);
			callStmt.setString(1, stdCourtInfoBean.getCourtid().trim());
			callStmt.setString(2, stdCourtInfoBean.getCourtname().trim());
			callStmt.setString(3, stdCourtInfoBean.getCourttype().trim());
			callStmt.setString(4, stdCourtInfoBean.getCourtcity().trim());
			callStmt.setString(5, stdCourtInfoBean.getCourtdist().trim());
			callStmt.setString(6, stdCourtInfoBean.getCourtstate().trim());
			callStmt.setString(7, stdCourtInfoBean.getCourtcountry().trim());
			callStmt.executeUpdate();

			// connection.close();
			rs = ((OracleCallableStatement) callStmt).getCursor(8);
			while (rs.next()) {
				stdCourtInfo = new StdCourtInfoBean();
				stdCourtInfo.setCourtid(rs.getString(1));
				stdCourtInfo.setCourtname(rs.getString(2));
				stdCourtInfo.setCourttype(rs.getString(3));
				stdCourtInfo.setCourtaddress(rs.getString(4));
				stdCourtInfo.setCourtcity(rs.getString(5));
				stdCourtInfo.setCourtdist(rs.getString(6));
				stdCourtInfo.setCourtstate(rs.getString(7));
				stdCourtInfo.setCourtcountry(rs.getString(8));
				stdCourtInfo.setComments(rs.getString(9));

				arrstdCourtInfo.add(stdCourtInfo);
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
		return arrstdCourtInfo;
	}

	public String addStdCrtInfoSaveDoa(StdCourtInfoBean addCourtInfoBean,
			String username, String password) {
		String retCourtID = null;
		Connection connection = null;

		try {
			 
			connection = RakshaDBUtil.getCon(username, password);
			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_STD_INFO_PKG.AddCourtInfo(?,?,?,?,?,?,?,?,?,?)}");
			callStmt.setString(1, addCourtInfoBean.getCourtname());
			callStmt.setString(2, addCourtInfoBean.getCourttype());
			callStmt.setString(3, addCourtInfoBean.getCourtaddress());
			callStmt.setString(4, addCourtInfoBean.getCourtcity());
			callStmt.setString(5, addCourtInfoBean.getCourtdist());
			callStmt.setString(6, addCourtInfoBean.getCourtstate());
			callStmt.setString(7, addCourtInfoBean.getCourtcountry());
			callStmt.setString(8, addCourtInfoBean.getComments());
			callStmt.registerOutParameter(9, java.sql.Types.VARCHAR);
			callStmt.registerOutParameter(10, java.sql.Types.VARCHAR);

			callStmt.executeUpdate();
			retCourtID = callStmt.getString(9);
			 
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
		return retCourtID;
	}

	public ArrayList<StdCaseInfoBean> mngcaseInfoDoa(String txtAction,
			String txtCaseType, String casetype, String username,
			String password) {
		 
		Connection connection = null;
		String retErr="";
		connection = RakshaDBUtil.getCon(username, password);
		CallableStatement callStmt = null;
		ResultSet rs;
		ArrayList<StdCaseInfoBean> arrstdCaseInfo = null;
		StdCaseInfoBean stdCaseInfo;

		if (txtAction.equals("Search") && txtCaseType.equals("Suit")) {
			try {

				callStmt = connection
						.prepareCall("{call LOMS_STD_INFO_PKG.GetCivilSuiteType(?,?,?)}");
			} catch (Exception e) {
				
			}
		}
		if (txtAction.equals("Search") && txtCaseType.equals("Appeal")) {
			try {
				callStmt = connection
						.prepareCall("{call LOMS_STD_INFO_PKG.GetCivilAppealType(?,?,?)}");
			} catch (Exception e) {
				
			}

		}
		if (txtAction.equals("Search") && txtCaseType.equals("Petition")) {
			try {
				callStmt = connection
						.prepareCall("{call LOMS_STD_INFO_PKG.GetCivilPetitionType(?,?,?)}");
			} catch (Exception e) {
				
			}
		}
		if (txtAction.equals("Search") && txtCaseType.equals("Criminal")) {
			try {
				callStmt = connection
						.prepareCall("{call LOMS_STD_INFO_PKG.GetCriminalCaseType(?,?,?)}");
			} catch (Exception e) {
				
			}
		}
		if (txtAction.equals("Search") && txtCaseType.equals("Execution")) {
			try {
				callStmt = connection
						.prepareCall("{call LOMS_STD_INFO_PKG.GetCivilExecutionType(?,?,?)}");
			} catch (Exception e) {
				
			}
		}
		if (txtAction.equals("Add") && txtCaseType.equals("Suit")) {
			try {
				callStmt = connection
						.prepareCall("{call LOMS_STD_INFO_PKG.AddCivilSuiteType(?,?,?)}");
			} catch (Exception e) {
				
			}
		}
		if (txtAction.equals("Add") && txtCaseType.equals("Appeal")) {
			try {
				callStmt = connection
						.prepareCall("{call LOMS_STD_INFO_PKG.AddCivilAppealType(?,?,?)}");
			} catch (Exception e) {
				
			}
		}
		if (txtAction.equals("Add") && txtCaseType.equals("Petition")) {
			try {
				callStmt = connection
						.prepareCall("{call LOMS_STD_INFO_PKG.AddCivilPetitionType(?,?,?)}");
			} catch (Exception e) {
				
			}
		}
		if (txtAction.equals("Add") && txtCaseType.equals("Criminal")) {
			try {
				callStmt = connection
						.prepareCall("{call LOMS_STD_INFO_PKG.AddCriminalCaseType(?,?,?)}");
			} catch (Exception e) {
				
			}
		}
		if (txtAction.equals("Add") && txtCaseType.equals("Execution")) {
			try {
				callStmt = connection
						.prepareCall("{call LOMS_STD_INFO_PKG.AddCivilExecutionType(?,?,?)}");
			} catch (Exception e) {
				
			}
		}
		if (txtAction.equals("Search")) {
			try {
				callStmt.registerOutParameter(1, OracleTypes.CURSOR);
				callStmt.registerOutParameter(2, java.sql.Types.VARCHAR);
				callStmt.registerOutParameter(3, java.sql.Types.VARCHAR);
				callStmt.executeUpdate();
				rs = ((OracleCallableStatement) callStmt).getCursor(1);
				arrstdCaseInfo = new ArrayList<StdCaseInfoBean>();
				while (rs.next()) {

					stdCaseInfo = new StdCaseInfoBean();
					stdCaseInfo.setCaseid(rs.getString(1));
					stdCaseInfo.setCasetype(rs.getString(2));
					arrstdCaseInfo.add(stdCaseInfo);
				}
				callStmt.close();
			} catch (Exception e) {
				
			}
		} else if (txtAction.equals("Add")) {
			try {
				callStmt.setString(1, casetype);
				callStmt.registerOutParameter(2, java.sql.Types.VARCHAR);
				callStmt.registerOutParameter(3, java.sql.Types.VARCHAR);
				callStmt.executeUpdate();
				retErr = callStmt.getString(2);
				stdCaseInfo = new StdCaseInfoBean();
				arrstdCaseInfo = new ArrayList<StdCaseInfoBean>();
				stdCaseInfo.setCaseid(retErr);
				arrstdCaseInfo.add(stdCaseInfo);
				callStmt.close();
			} catch (Exception e) {
				
			}
		}

		return arrstdCaseInfo;
	}

	public String deleteCaseInfoDoa(String hidcaseid, String txtCaseType,
			String username, String password) {
		Connection connection = null;
		connection = RakshaDBUtil.getCon(username, password);
		CallableStatement callStmt = null;
		if (txtCaseType.equals("Suit")) {
			try {
				callStmt = connection
						.prepareCall("{call LOMS_STD_INFO_PKG.DeleteSuiteType(?,?,?)}");
			} catch (Exception e) {
				
			}

		}
		if (txtCaseType.equals("Appeal")) {
			try {
				callStmt = connection
						.prepareCall("{call LOMS_STD_INFO_PKG.DeleteCivilAppealType(?,?,?)}");
			} catch (Exception e) {
				
			}

		}
		if (txtCaseType.equals("Petition")) {
			try {
				callStmt = connection
						.prepareCall("{call LOMS_STD_INFO_PKG.DeleteCivilPetitionType(?,?,?)}");
			} catch (Exception e) {
				
			}

		}
		if (txtCaseType.equals("Criminal")) {
			try {
				callStmt = connection
						.prepareCall("{call LOMS_STD_INFO_PKG.DeleteCriminalCaseType(?,?,?)}");
			} catch (Exception e) {
				
			}

		}
		if (txtCaseType.equals("Execution")) {
			try {
				callStmt = connection
						.prepareCall("{call LOMS_STD_INFO_PKG.DeleteCivilExecutionType(?,?,?)}");
			} catch (Exception e) {
				
			}

		}
		try {
			callStmt.setString(1, hidcaseid);
			callStmt.registerOutParameter(2, java.sql.Types.VARCHAR);
			callStmt.registerOutParameter(3, java.sql.Types.VARCHAR);
			callStmt.executeUpdate();

			callStmt.close();
		} catch (Exception e) {
			
		}
		return hidcaseid;
		// TODO Auto-generated method stub

	}

	public StdCourtInfoBean updStdCrtInfo(String hidcourtid, String username,
			String password) {
		StdCourtInfoBean stdCourtInfo = null;
		Connection connection = null;

		try {
			 
			connection = RakshaDBUtil.getCon(username, password);
			ResultSet rs;
			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_STD_INFO_PKG.SearchCourtInfo(?,?,?,?,?,?,?,?,?,?)}");
			callStmt.registerOutParameter(8, OracleTypes.CURSOR);
			callStmt.registerOutParameter(9, java.sql.Types.VARCHAR);
			callStmt.registerOutParameter(10, java.sql.Types.VARCHAR);
			callStmt.setString(1, hidcourtid);
			callStmt.setString(2, null);
			callStmt.setString(3, null);
			callStmt.setString(4, null);
			callStmt.setString(5, null);
			callStmt.setString(6, null);
			callStmt.setString(7, null);
			callStmt.executeUpdate();

			// connection.close();
			rs = ((OracleCallableStatement) callStmt).getCursor(8);
			while (rs.next()) {
				stdCourtInfo = new StdCourtInfoBean();
				stdCourtInfo.setCourtid(rs.getString(1));
				stdCourtInfo.setCourtname(rs.getString(2));
				stdCourtInfo.setCourttype(rs.getString(3));
				stdCourtInfo.setCourtaddress(rs.getString(4));
				stdCourtInfo.setCourtcity(rs.getString(5));
				stdCourtInfo.setCourtdist(rs.getString(6));
				stdCourtInfo.setCourtstate(rs.getString(7));
				stdCourtInfo.setCourtcountry(rs.getString(8));
				stdCourtInfo.setComments(rs.getString(9));
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
		return stdCourtInfo;

	}

	public String editCourtInfoSaveDoa(StdCourtInfoBean updCourtInfoBean,
			String username, String password) {
		String retCourtID = null;
		Connection connection = null;

		try {
			 
			connection = RakshaDBUtil.getCon(username, password);

			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_STD_INFO_PKG.ModifyCourtInfo(?,?,?,?,?,?,?,?,?,?,?)}");
			callStmt.setString(1, updCourtInfoBean.getCourtid());
			callStmt.setString(2, updCourtInfoBean.getCourtname());
			callStmt.setString(3, updCourtInfoBean.getCourttype());
			callStmt.setString(4, updCourtInfoBean.getCourtaddress());
			callStmt.setString(5, updCourtInfoBean.getCourtcity());
			callStmt.setString(6, updCourtInfoBean.getCourtdist());
			callStmt.setString(7, updCourtInfoBean.getCourtstate());
			callStmt.setString(8, updCourtInfoBean.getCourtcountry());
			callStmt.setString(9, updCourtInfoBean.getComments());
			callStmt.registerOutParameter(10, java.sql.Types.VARCHAR);
			callStmt.registerOutParameter(11, java.sql.Types.VARCHAR);

			callStmt.executeUpdate();
			retCourtID = updCourtInfoBean.getCourtid();
		 
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
		return retCourtID;
	}

	public String deleteCrtInfoDoa(String hidcourtid, String username,
			String password) {
		String retCourtID = null;
		Connection connection = null;

		try {
			 
			connection = RakshaDBUtil.getCon(username, password);
			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_STD_INFO_PKG.DeleteCourtInfo(?,?,?)}");
			callStmt.setString(1, hidcourtid);
			callStmt.registerOutParameter(2, java.sql.Types.VARCHAR);
			callStmt.registerOutParameter(3, java.sql.Types.VARCHAR);

			callStmt.executeUpdate();
			retCourtID = hidcourtid;
		 
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
		return retCourtID;

	}

	public ArrayList<String> stdCrtInfoState(String username, String password) {
		ArrayList<String> stateName = new ArrayList<String>();
		Connection connection = null;

		try {
			 
			connection = RakshaDBUtil.getCon(username, password);
			ResultSet rs;
			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_STD_INFO_PKG.GetStateInfo(?,?,?)}");
			callStmt.registerOutParameter(1, OracleTypes.CURSOR);
			callStmt.registerOutParameter(2, java.sql.Types.VARCHAR);
			callStmt.registerOutParameter(3, java.sql.Types.VARCHAR);

			callStmt.executeUpdate();

			// connection.close();
			rs = ((OracleCallableStatement) callStmt).getCursor(1);
			while (rs.next()) {
				stateName.add(rs.getString(1));

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
		return stateName;
	}

	public ArrayList<String> stdCrtInfoDis(String hidTxtState, String username, String password) {
		 
		ArrayList<String> disName = new ArrayList<String>();
		Connection connection = null;

		try {
		 
			connection = RakshaDBUtil.getCon(username, password);
			ResultSet rs;
			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_STD_INFO_PKG.GetDistrictInfo(?,?,?,?)}");
			callStmt.setString(1, hidTxtState);
			callStmt.registerOutParameter(2, OracleTypes.CURSOR);
			callStmt.registerOutParameter(3, java.sql.Types.VARCHAR);
			callStmt.registerOutParameter(4, java.sql.Types.VARCHAR);

			callStmt.executeUpdate();

			// connection.close();
			rs = ((OracleCallableStatement) callStmt).getCursor(2);
			while (rs.next()) {
				disName.add(rs.getString(1));

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
		    return disName;
	   
	}
}
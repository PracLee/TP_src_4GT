package model.userInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.common.DBCP;
import model.userInfo.UserInfoVO;

public class UserInfoDAO {

	// 鍮꾩쫰�땲�뒪 硫붿꽌�뱶
	private static String sql_SELECT_ALL = "SELECT * FROM userInfo";
	private static String sql_SELECT_ONE = "SELECT * FROM userInfo WHERE id=? AND pw=?";
	private static String sql_INSERT = "INSERT INTO userInfo VALUES(?, ?, ?)";
	private static String sql_DELETE = "DELETE FROM userInfo WHERE id=?";
	private static String sql_UPDATE = "UPDATE userInfo SET name=?, pw=? WHERE id=?";

	// �궗�슜�옄 �젙�쓽 �븿�닔 (�븘�씠�뵒/鍮꾨�踰덊샇 李얘린)
	private static String sql_FindID = "SELECT * FROM userInfo WHERE pw=? AND name=?";
	private static String sql_FindPW = "SELECT * FROM userInfo WHERE id=?";


	private static String sql_updateProfile = "UPDATE userinfo SET profile=? WHERE id=?";

	// �궗�슜�옄 �젙�쓽 �븿�닔 (�쉶�썝媛��엯�떆 �븘�씠�뵒 以묐났泥댄겕)
	private static String sql_CheckID = "SELECT * FROM userInfo WHERE id=?";


	// SELECT ALL -> �쟾泥� DB�젙蹂� 異붿텧
	public ArrayList<UserInfoVO> SelectAll(){
		Connection conn = DBCP.connect();
		ArrayList<UserInfoVO> datas = new ArrayList();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql_SELECT_ALL);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				UserInfoVO vo = new UserInfoVO();
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setProfile(rs.getString("profile"));
				datas.add(vo);
			}
			rs.close();
		}
		catch(Exception e) {
			System.out.println("UserDAO SelectAll()�뿉�꽌 異쒕젰");
			e.printStackTrace();
		}
		finally {
			DBCP.disconnect(pstmt, conn);
		}
		return datas;
	}

	// SELECT ONE -> 濡쒓렇�씤 
	public UserInfoVO SelectOne(UserInfoVO vo) {
		Connection conn=DBCP.connect();
		UserInfoVO data=null;
		PreparedStatement pstmt=null;
		try{
			pstmt=conn.prepareStatement(sql_SELECT_ONE);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				data=new UserInfoVO();
				data.setId(rs.getString("id"));
				data.setPw(rs.getString("pw"));
				data.setName(rs.getString("name"));
				data.setProfile(rs.getString("profile"));
			}	
			rs.close();
		}
		catch(Exception e){
			System.out.println("UserDAO SelectOne()�뿉�꽌 異쒕젰");
			e.printStackTrace();
		}
		finally {
			DBCP.disconnect(pstmt,conn);
		}
		return data;
	}

	// INSERT -> �쉶�썝媛��엯
	public boolean InsertDB(UserInfoVO vo) {
		Connection conn=DBCP.connect();
		boolean res = false;
		PreparedStatement pstmt=null;
		try{
			pstmt=conn.prepareStatement(sql_INSERT);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.executeUpdate();
			res=true;
		}
		catch(Exception e){
			System.out.println("UserDAO InsertDB()�뿉�꽌 異쒕젰");
			e.printStackTrace();
			//res=false;
		}
		finally {
			DBCP.disconnect(pstmt,conn);
		}
		return res;
	}

	// DELETE -> �쉶�썝 �깉�눜
	public boolean DeleteDB(UserInfoVO vo) {
		Connection conn=DBCP.connect();
		boolean res=false;
		PreparedStatement pstmt=null;
		try{
			pstmt=conn.prepareStatement(sql_DELETE);
			pstmt.setString(1, vo.getId());
			pstmt.executeUpdate();
			res=true;
		}
		catch(Exception e){
			System.out.println("UserDAO DeleteDB()�뿉�꽌 異쒕젰");
			e.printStackTrace();
			//res=false;
		}
		finally {
			DBCP.disconnect(pstmt,conn);
		}
		return res;
	}

	// UPDATE -> Name, Pw 蹂�寃�
	public boolean UpdateDB(UserInfoVO vo) {
		Connection conn=DBCP.connect();
		boolean res=false;
		PreparedStatement pstmt=null;
		try{
			pstmt=conn.prepareStatement(sql_UPDATE);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getId());
			pstmt.executeUpdate();
			res=true;
		}
		catch(Exception e){
			System.out.println("UserDAO UpdateDB()�뿉�꽌 異쒕젰");
			e.printStackTrace();
			//res=false;
		}
		finally {
			DBCP.disconnect(pstmt,conn);
		}
		return res;
	}

	// �븘�씠�뵒 李얘린
	public UserInfoVO FindID(UserInfoVO vo) {
		Connection conn=DBCP.connect();
		UserInfoVO data=null;
		PreparedStatement pstmt=null;
		try{
			pstmt=conn.prepareStatement(sql_FindID);
			pstmt.setString(1, vo.getPw());
			pstmt.setString(2, vo.getName());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				data=new UserInfoVO();
				data.setId(rs.getString("id"));
				data.setPw(rs.getString("pw"));
				data.setName(rs.getString("name"));
			}	
			rs.close();
		}
		catch(Exception e){
			System.out.println("UserDAO FindID()�뿉�꽌 異쒕젰");
			e.printStackTrace();
		}
		finally {
			DBCP.disconnect(pstmt,conn);
		}
		return data;
	}

	// 鍮꾨�踰덊샇 李얘린
	public UserInfoVO FindPW(UserInfoVO vo) {
		Connection conn=DBCP.connect();
		UserInfoVO data=null;
		PreparedStatement pstmt=null;
		try{
			pstmt=conn.prepareStatement(sql_FindPW);
			pstmt.setString(1, vo.getId());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				data=new UserInfoVO();
				data.setId(rs.getString("id"));
				data.setPw(rs.getString("pw"));
				data.setName(rs.getString("name"));
			}	
			rs.close();
		}
		catch(Exception e){
			System.out.println("UserDAO FindPW()�뿉�꽌 異쒕젰");
			e.printStackTrace();
		}
		finally {
			DBCP.disconnect(pstmt,conn);
		}
		return data;
	}


	public boolean UpdateProfile(UserInfoVO vo) {
		Connection conn=DBCP.connect();
		boolean res=false;
		PreparedStatement pstmt=null;
		try{
			pstmt=conn.prepareStatement(sql_updateProfile);
			pstmt.setString(1, vo.getProfile());
			pstmt.setString(2, vo.getId());
			pstmt.executeUpdate();
			res=true;
		}
		catch(Exception e){
			System.out.println("UserDAO UpdateProfile()�뿉�꽌 異쒕젰");
			e.printStackTrace();
			//res=false;
		}
		return res;
	}
	//�쉶�썝媛��엯�떆 �븘�씠�뵒 以묐났泥댄겕
	public boolean CheckID(String id) {
		Connection conn=DBCP.connect();
		PreparedStatement pstmt=null;
		boolean exist=false;

		try{
			pstmt=conn.prepareStatement(sql_CheckID);
			pstmt.setString(1, id);
			ResultSet rs=pstmt.executeQuery();

			while(rs.next()) {
				exist=true;
			}

			rs.close();
		}
		catch(Exception e){
			System.out.println("UserInfoDAO CheckID()�뿉�꽌 異쒕젰");
			e.printStackTrace();
		}
		finally {
			DBCP.disconnect(pstmt,conn);
		}		
		return exist;
	}



}

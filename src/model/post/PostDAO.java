package model.post;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import model.common.DBCP;

public class PostDAO {
	
	// 비즈니스 메서드 쿼리문
	private static String sql_SELECT_ALL = "SELECT * FROM post ORDER BY pnum DESC";
	private static String sql_SELECT_ONE = "SELECT * FROM post WHERE pnum=?";
	private static String sql_INSERT = 
			"INSERT INTO post (pnum, category, title, content, writer, p_user, path)"
			+ " VALUES((SELECT NVL(MAX(pnum),0) + 1 FROM post), ?, ?, ?, ?, ?, ?)";
	private static String sql_DELETE = "DELETE FROM post WHERE pnum=?";
	private static String sql_UPDATE = "UPDATE post SET category=?, title=?, content=?, writer=?, path=?, pdate=sysdate WHERE pnum=?";
	
	// 사용자 설정 로직 쿼리문
	// 좋아요 업 다운
	private static String sql_ViewsUp = "UPDATE post SET views=views+1 WHERE pnum=?";
	private static String sql_LikesUp = "UPDATE post SET plike=plike+1 WHERE pnum=?";
	private static String sql_LikesDown = "UPDATE post SET plike=plike-1 WHERE pnum=?";
	// 검색기능

	// 카테고리별, 좋아요 정렬 
	private static String sql_SELECT_CATEGORY = "SELECT * FROM post WHERE category=?";
	private static String sql_SELECT_VIEWS = "SELECT * FROM (SELECT * FROM post ORDER BY views DESC) WHERE ROWNUM <= 10";
	
	// 다음에 부여될 pnum 미리 알려주기
	private static String sql_getPnum = "SELECT NVL(MAX(pnum),0) + 1 AS pnum FROM post";
	
	// 글 전체 보기
	public ArrayList<PostVO> SelectAll(){
		Connection conn = DBCP.connect();
		ArrayList<PostVO> datas = new ArrayList<PostVO>();
		PreparedStatement pstmt = null;
		SimpleDateFormat dateFix = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date dateOrigin;
		String dateToStr;
		try {
			pstmt = conn.prepareStatement(sql_SELECT_ALL);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				PostVO vo = new PostVO();
				vo.setPnum(rs.getInt("pnum"));
				vo.setViews(rs.getInt("views"));
				vo.setPlike(rs.getInt("plike"));
				vo.setCategory(rs.getString("category"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setWriter(rs.getString("writer"));
				dateOrigin = rs.getDate("pdate");
				dateToStr = dateFix.format(dateOrigin);
				vo.setPdate(dateToStr);
				vo.setP_user(rs.getString("p_user"));
				vo.setPath(rs.getString("path"));
				vo.setComCnt(rs.getInt("comCnt"));
				datas.add(vo);
			}
			rs.close();
		}
		catch(Exception e) {
			System.out.println("PostDAO SelectAll()에서 출력");
			e.printStackTrace();
		}
		finally {
			DBCP.disconnect(pstmt, conn);
		}
		return datas;
	}

	// showPost - ViewsUp 트랜잭션 처리
	public PostVO SelectOne(PostVO vo) {
	      Connection conn=DBCP.connect();
	      PostVO data=null;
	      PreparedStatement pstmt=null;
	      SimpleDateFormat dateFix = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	      Date dateOrigin;
	      String dateToStr;
	      try{
	         conn.setAutoCommit(false);		// 자동 커밋옵션 끄기
	         // showPost
	         pstmt=conn.prepareStatement(sql_SELECT_ONE);
	         pstmt.setInt(1, vo.getPnum());
	         ResultSet rs=pstmt.executeQuery();
	         if(rs.next()){
	            data=new PostVO();
	            data.setPnum(rs.getInt("pnum"));
	            data.setViews(rs.getInt("views"));
	            data.setPlike(rs.getInt("plike"));
	            data.setCategory(rs.getString("category"));
	            data.setTitle(rs.getString("title"));
	            data.setContent(rs.getString("content"));
	            data.setWriter(rs.getString("writer"));
	            dateOrigin = rs.getDate("pdate");
	            dateToStr = dateFix.format(dateOrigin);
	            data.setPdate(dateToStr);
	            data.setP_user(rs.getString("p_user"));
	            data.setPath(rs.getString("path"));
	            data.setComCnt(rs.getInt("comCnt"));
	         }   
	         rs.close();
	         
	         // ViewsUp
	         pstmt=conn.prepareStatement(sql_ViewsUp); //
	         pstmt.setInt(1, vo.getPnum());
	         pstmt.executeUpdate();
	         conn.commit(); // 트랜잭션 완료 후 커밋
	      }
	      catch(Exception e){
	         System.out.println("PostDAO SelectOne()에서 출력");
	         e.printStackTrace();
	         try {
	            conn.rollback();
	         } catch (SQLException e1) {
	            e1.printStackTrace();
	         }
	      }
	      finally {
	         DBCP.disconnect(pstmt,conn);
	      }
	      return data;
	   }
	
	// InsertPost
	public boolean InsertDB(PostVO vo) {
		Connection conn=DBCP.connect();
		boolean res = false;
		PreparedStatement pstmt=null;
		try{
			pstmt=conn.prepareStatement(sql_INSERT);
			pstmt.setString(1, vo.getCategory());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getWriter());
			pstmt.setString(5, vo.getP_user());
			pstmt.setString(6, vo.getPath());
			pstmt.executeUpdate();
			res=true;
		}
		catch(Exception e){
			System.out.println("PostDAO InsertDB()에서 출력");
			e.printStackTrace();
			//res=false;
		}
		finally {
			DBCP.disconnect(pstmt,conn);
		}
		return res;
	}
	
	// DeletePost
	public boolean DeleteDB(PostVO vo) {
		Connection conn=DBCP.connect();
		boolean res=false;
		PreparedStatement pstmt=null;
		try{
			pstmt=conn.prepareStatement(sql_DELETE);
			pstmt.setInt(1, vo.getPnum());
			pstmt.executeUpdate();
			res=true;
		}
		catch(Exception e){
			System.out.println("PostDAO DeleteDB()에서 출력");
			e.printStackTrace();
			//res=false;
		}
		finally {
			DBCP.disconnect(pstmt,conn);
		}
		return res;
	}

	// EditPost
	public boolean UpdateDB(PostVO vo) {
		Connection conn=DBCP.connect();
		boolean res=false;
		PreparedStatement pstmt=null;
		try{
			pstmt=conn.prepareStatement(sql_UPDATE);
			pstmt.setString(1, vo.getCategory());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getWriter());
			pstmt.setString(5,  vo.getPath());
			pstmt.setInt(6, vo.getPnum());
			pstmt.executeUpdate();
			res=true;
		}
		catch(Exception e){
			System.out.println("PostDAO UpdateDB()에서 출력");
			e.printStackTrace();
			//res=false;
		}
		finally {
			DBCP.disconnect(pstmt,conn);
		}
		return res;
	}
	
	//Condition별 검색
	public ArrayList<PostVO> searchPost(String condition,String text){
		String sql_SearchPost = "SELECT * FROM post WHERE "+condition+" LIKE ? ORDER BY pnum DESC";
		Connection conn = DBCP.connect();
		ArrayList<PostVO> datas = new ArrayList<PostVO>();
		PreparedStatement pstmt = null;
		SimpleDateFormat dateFix = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date dateOrigin;
		String dateToStr;
		try {
			pstmt = conn.prepareStatement(sql_SearchPost);
			pstmt.setString(1, text);
			
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				PostVO vo = new PostVO();
				vo.setPnum(rs.getInt("pnum"));
				vo.setViews(rs.getInt("views"));
				vo.setPlike(rs.getInt("plike"));
				vo.setCategory(rs.getString("category"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setWriter(rs.getString("writer"));
				dateOrigin = rs.getDate("pdate");
				dateToStr = dateFix.format(dateOrigin);
				vo.setPdate(dateToStr);
				vo.setP_user(rs.getString("p_user"));
				System.out.println("DAO 에서 데이터 : "+vo);
				datas.add(vo);
			}
			rs.close();
		}
		catch(Exception e) {
			System.out.println("PostDAO SearchPost()에서 출력");
			e.printStackTrace();
		}
		finally {
			DBCP.disconnect(pstmt, conn);
		}
		System.out.println("DAO에서 datas : "+datas);
		return datas;
	}
	
	
	
	// 카테고리별 출력
    public ArrayList<PostVO> SelectCategory(PostVO vo){
       Connection conn = DBCP.connect();
       ArrayList<PostVO> datas = new ArrayList();
       PreparedStatement pstmt = null;
       SimpleDateFormat dateFix = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
       Date dateOrigin;
       String dateToStr;
       try {
          pstmt = conn.prepareStatement(sql_SELECT_CATEGORY);
          pstmt.setString(1, vo.getCategory());
          ResultSet rs = pstmt.executeQuery();
          while(rs.next()) {
             PostVO data = new PostVO();
             data.setPnum(rs.getInt("pnum"));
             data.setViews(rs.getInt("views"));
             data.setPlike(rs.getInt("plike"));
             data.setCategory(rs.getString("category"));
             data.setTitle(rs.getString("title"));
             data.setContent(rs.getString("content"));
             dateOrigin = rs.getDate("pdate");
             dateToStr = dateFix.format(dateOrigin);
             data.setPdate(dateToStr);
             data.setP_user(rs.getString("p_user"));
             data.setWriter(rs.getString("writer"));
             datas.add(data);
          }
          rs.close();
       }
       catch(Exception e) {
          System.out.println("PostDAO SelectCategory()에서 출력");
          e.printStackTrace();
       }
       finally {
          DBCP.disconnect(pstmt, conn);
       }
       return datas;
    }
    
    // 조회수 정렬
    public ArrayList<PostVO> SelectViews(){
       Connection conn = DBCP.connect();
       ArrayList<PostVO> datas = new ArrayList();
       PreparedStatement pstmt = null;
       SimpleDateFormat dateFix = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
       Date dateOrigin;
       String dateToStr;
       try {
          pstmt = conn.prepareStatement(sql_SELECT_VIEWS);
          ResultSet rs = pstmt.executeQuery();
          while(rs.next()) {
             PostVO vo = new PostVO();
             vo.setPnum(rs.getInt("pnum"));
             vo.setViews(rs.getInt("views"));
             vo.setPlike(rs.getInt("plike"));
             vo.setCategory(rs.getString("category"));
             vo.setTitle(rs.getString("title"));
             vo.setContent(rs.getString("content"));
             dateOrigin = rs.getDate("pdate");
             dateToStr = dateFix.format(dateOrigin);
             vo.setPdate(dateToStr);
             vo.setP_user(rs.getString("p_user"));
             vo.setWriter(rs.getString("writer"));
             datas.add(vo);
          }
          rs.close();
       }
       catch(Exception e) {
          System.out.println("PostDAO SelectViews()에서 출력");
          e.printStackTrace();
       }
       finally {
          DBCP.disconnect(pstmt, conn);
       }
       return datas;
    }
    
    // 다음에 부여될 pnum 미리 알려주기
    public int expectPnum() {
		Connection conn = DBCP.connect();
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql_getPnum);
			ResultSet rs = pstmt.executeQuery();
		
			if(rs.next()) {
				result = rs.getInt("pnum");	
			}
			rs.close();
		}
		catch(Exception e) {
			System.out.println("PostDAO expectPnum()에서 출력");
			e.printStackTrace();
		}
		finally {
			DBCP.disconnect(pstmt, conn);
		}
		return result;
	}
    
 
 	public boolean ViewsUp(PostVO vo) {
 		Connection conn=DBCP.connect();
 		boolean res=false;
 		PreparedStatement pstmt=null;
 		try{
 			pstmt=conn.prepareStatement(sql_ViewsUp);
 			pstmt.setInt(1, vo.getPnum());
 			pstmt.executeUpdate();
 			res=true;
 		}
 		catch(Exception e){
 			System.out.println("PostDAO ViewsUp()에서 출력");
 			e.printStackTrace();
 			//res=false;
 		}
 		finally {
 			DBCP.disconnect(pstmt,conn);
 		}
 		return res;
 	}

 	public boolean LikesUp(PostVO vo) {
 		Connection conn=DBCP.connect();
 		boolean res=false;
 		PreparedStatement pstmt=null;
 		try{
 			pstmt=conn.prepareStatement(sql_LikesUp);
 			pstmt.setInt(1, vo.getPnum());
 			pstmt.executeUpdate();
 			res=true;
 		}
 		catch(Exception e){
 			System.out.println("PostDAO LikesUp()에서 출력");
 			e.printStackTrace();
 			//res=false;
 		}
 		finally {
 			DBCP.disconnect(pstmt,conn);
 		}
 		return res;
 	}
 
 	public boolean LikesDown(PostVO vo) {
 		
 		Connection conn=DBCP.connect();
 		boolean res=false;
 		PreparedStatement pstmt=null;
 		try{
 			pstmt=conn.prepareStatement(sql_LikesDown);
 			pstmt.setInt(1, vo.getPnum());
 			pstmt.executeUpdate();
 			res=true;
 		}
 		catch(Exception e){
 			System.out.println("PostDAO LikesDown()에서 출력");
 			e.printStackTrace();
 			//res=false;
 		}
 		finally {
 			DBCP.disconnect(pstmt,conn);
 		}
 		return res;
 	}
 
	
}

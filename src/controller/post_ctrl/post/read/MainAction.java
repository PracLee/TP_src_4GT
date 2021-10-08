package controller.post_ctrl.post.read;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import controller.ActionForward;
import model.post.Paging;
import model.post.PostDAO;
import model.post.PostVO;

public class MainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward action = new ActionForward();
		PostDAO PDAO = new PostDAO();
		PostVO PVO = new PostVO();
		ArrayList<PostVO> datas = new ArrayList<PostVO>();
		// 페이징 처리 로직
		String url="main.jsp";	
		String indexx=request.getParameter("index");
		int index=1;
		if(indexx!=null){
			index=Integer.parseInt(indexx);
		}
		url= url+ "?index="+index;

		datas = PDAO.SelectAll();
		// System.out.println("datas == "+datas);
		/*ArrayList<CommentsVO> CommentDatas = new ArrayList<CommentsVO>();
		CommentDatas = (ArrayList<CommentsVO>) request.getAttribute("CommentDatas");
		ArrayList<Integer> commentsCnt = new ArrayList<Integer>(); // 포스트 리스트와 같은 크기를 가진 댓글수 AL생성
		for (int i = 0; i < datas.size(); i++) { // 댓글수 AL 0으로 초기화
			commentsCnt.add(i, 0);
		}
		for (int i = 0; i < CommentDatas.size(); i++) {
			int index = (CommentDatas.get(i).getC_post() - 1);
			// System.out.println("index : "+index);
			commentsCnt.add(index, (commentsCnt.get(index) + 1)); // commentsCnt index = postnum - 1
		}*/	// 댓글수 로직 -> 0927 model column 추가로 삭제

		// 한페이지에 들어가는 게시물 수
		int pagingSize = 6;
		// 생성자 순서대로 int pageSize(한페이지 게시물 수), int thisPageNum(현재 페이지 번호), int totalPostCnt(총 포스트 갯수)
		Paging paging = new Paging(pagingSize,index,datas.size());
		paging.makePaging();
		// 페이징 for문으로 표기 할 수 있도록 하기
		ArrayList<Integer> pagingIndex = new ArrayList<Integer>();
		int page = paging.getStartPageNum();
		//					1							5
		for(int i = paging.getStartPageNum();i<=paging.getEndPageNum();i++) {
			pagingIndex.add(page);
			page++;
		}

		// 해당하는 페이지에 데이터만 주기
		ArrayList<PostVO> slicedata = new ArrayList<PostVO>();
		for(int i=(index-1)*6; i<index*6; i++) { // 현재 인덱스에 -1*6~현재인덱스*6 까지의 데이터만 넘겨주기
			PostVO vo = datas.get(i);
			// vo에 있는 pdate
			String pdate = vo.getPdate();
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String today = sdf.format(now);

			// 포스팅 날짜와 오늘 날짜 같은 타입으로 변환
			Date datePdate = null;
			Date dateToday = null;
			try {
				datePdate = sdf.parse(pdate);
				dateToday = sdf.parse(today);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			// 시차 계산
			long diff = dateToday.getTime() - datePdate.getTime();
			long timeDif = diff / (60 * 60 * 1000); 

			vo.setNew(false);	// 디폴트 false
			if(timeDif<24) {	// 현재시간 - pdate 가 24시간 이하면 true
				vo.setNew(true);
			}
			
			// 넘겨줄 날짜 슬라이싱
			SimpleDateFormat sliceDate = new SimpleDateFormat("yyyy-MM-dd");
			pdate = sliceDate.format(datePdate);
			vo.setPdate(pdate);
			System.out.println("slicedata에 들어가는 data = "+vo);
			slicedata.add(vo);
			if(i==datas.size()-1) {
				break;
			}
		}

		request.setAttribute("isLast", paging.isLast());
		request.setAttribute("isFirst", paging.isFirst());
		request.setAttribute("pagingIndex", pagingIndex);
		request.setAttribute("index", index);
		request.setAttribute("PostList", slicedata); // PostList로 SelectAll 데이터를 넘김
		//System.out.println("mainActio 에서 보내주는 datas == "+datas);
		// request.setAttribute("commentsCnt", commentsCnt); // 댓글 수 AL로 넘김 0번 인덱스에 1번 포스트의 댓글 갯수 담겨있음! 댓글수 로직 -> 0927 model column 추가로 삭제
		action.setPath(url);
		action.setRedirect(false);
		return action;
	}

}

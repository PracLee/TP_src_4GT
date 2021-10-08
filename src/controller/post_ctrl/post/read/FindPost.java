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

public class FindPost implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward action = new ActionForward();
		PostDAO PDAO = new PostDAO();
		// �˻� �� ����
		String word = (String)request.getParameter("findWord");
		String find = "%"+word+"%";
		String condition = (String)request.getParameter("condition");
		// �� �׸� ����¡ ó��
		String url="result.jsp";	
		String indexx=request.getParameter("index");
		int index=1;
		if(indexx!=null){
			index=Integer.parseInt(indexx);
		}
		//url �۾�
		url= url+ "?index="+index;
		// ����˻� ���
		ArrayList<PostVO> result = PDAO.searchPost(condition,find);
		ArrayList<PostVO> slicedata=null;
		ArrayList<Integer> pagingIndex = new ArrayList<Integer>();
		Paging paging =null;
		if(result!=null) {
			// ���������� ���� �Խù� ��
			int pagingSize = 6;
			// ������ ������� int pageSize(�������� �Խù� ��), int thisPageNum(���� ������ ��ȣ), int totalPostCnt(�� ����Ʈ ����)
			paging = new Paging(pagingSize,index,result.size());
			paging.makePaging();
			// ����¡ for������ ǥ�� �� �� �ֵ��� �ϱ�
			int page = paging.getStartPageNum();
			//					1							5
			for(int i = paging.getStartPageNum();i<=paging.getEndPageNum();i++) {
				pagingIndex.add(page);
				page++;
			}

			// �ش��ϴ� �������� �����͸� �ֱ�
			slicedata = new ArrayList<PostVO>();
			if(result.size()>0) {
				for(int i=(index-1)*6; i<index*6; i++) { // ���� �ε����� -1*6~�����ε���*6 ������ �����͸� �Ѱ��ֱ�
					PostVO vo = result.get(i);
					// vo�� �ִ� pdate
					String pdate = vo.getPdate();
					Date now = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
					String today = sdf.format(now);

					// ������ ��¥�� ���� ��¥ ���� Ÿ������ ��ȯ
					Date datePdate = null;
					Date dateToday = null;
					try {
						datePdate = sdf.parse(pdate);
						dateToday = sdf.parse(today);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					// ���� ���
					long diff = dateToday.getTime() - datePdate.getTime();
					long timeDif = diff / (60 * 60 * 1000); 

					vo.setNew(false);	// ����Ʈ false
					if(timeDif<24) {	// ����ð� - pdate �� 24�ð� ���ϸ� true
						vo.setNew(true);
					}

					// �Ѱ��� ��¥ �����̽�
					SimpleDateFormat sliceDate = new SimpleDateFormat("yyyy-MM-dd");
					pdate = sliceDate.format(datePdate);
					vo.setPdate(pdate);
					System.out.println("slicedata�� ���� data = "+vo);
					slicedata.add(vo);
					if(i==result.size()-1) {
						break;
					}
				}
			}
		}

		// condition �ѱ�ȭ
		if(condition.equals("title")) {
			condition = "����";
		}else if(condition.equals("writer")) {
			condition = "�ۼ���";
		}else if(condition.equals("content")) {
			condition = "����";
		}
		request.setAttribute("isLast", paging.isLast());
		request.setAttribute("isFirst", paging.isFirst());
		request.setAttribute("pagingIndex", pagingIndex);
		request.setAttribute("index", index);
		request.setAttribute("PostList", slicedata);
		request.setAttribute("condition", condition);
		request.setAttribute("word", word);
		action.setPath("result.jsp");
		action.setRedirect(false);
		return action;
	}

}

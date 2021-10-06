package controller.post_ctrl.post.read;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Paginator {

	// ����
	private int pagesPerBlock;
	private int postsPerPage;
	private int totalPostCount;

	private int totalLastPageNum;

	public Paginator(int pagesPerBlock, int postsPerPage, int totalPostCount) {
		this.pagesPerBlock = pagesPerBlock;
		this.postsPerPage = postsPerPage;
		this.totalPostCount = totalPostCount;

		this.setTotalLastPageNum();
	}

	public int getPagesPerBlock() {
		return pagesPerBlock;
	}

	public int getPostsPerPage() {
		return postsPerPage;
	}

	public int getTotalPostCount() {
		return totalPostCount;
	}

	public int getTotalLastPageNum() {
		return this.totalLastPageNum;
	}

	public void setPagesPerBlock(int pagesPerBlock) {
		this.pagesPerBlock = pagesPerBlock;
	}

	public void setPostsPerPage(int postsPerPage) {
		this.postsPerPage = postsPerPage;
		this.setTotalLastPageNum();
	}

	public void setTotalPostCount(int totalPostCount) {
		this.totalPostCount = totalPostCount;
		this.setTotalLastPageNum();
	}

	private void setTotalLastPageNum() {
		// �� �Խñ� ���� �������� �� ������ ������ ��ȣ ���
		// totalPostCount �� 0�� ��� 1�������� ����
		if(totalPostCount == 0) {
			this.totalLastPageNum = 1;
		} else {
			this.totalLastPageNum = (int) (Math.ceil((double)totalPostCount / postsPerPage));
		}
	}

	private Map<String, Object> getBlock(Integer currentPageNum,
			Boolean isFixed) {

		if(pagesPerBlock % 2 == 0 && !isFixed) {
			throw new IllegalStateException("getElasticBlock: pagesPerBlock�� Ȧ���� �����մϴ�.");
		}

		if(currentPageNum > totalLastPageNum && totalPostCount != 0) {
			throw new IllegalStateException("currentPage�� �� ������ ����(" + totalLastPageNum + ") ���� Ů�ϴ�.");
		}

		// ���� ù��°, ������ ������ ��ȣ ���
		Integer blockLastPageNum = totalLastPageNum;
		Integer blockFirstPageNum = 1;

		// ���� ���� ���, 1������ ��ȯ.
		if(isFixed) {

			Integer mod = totalLastPageNum % pagesPerBlock;
			if(totalLastPageNum - mod >= currentPageNum) {
				blockLastPageNum = (int) (Math.ceil((float)currentPageNum / pagesPerBlock) * pagesPerBlock);
				blockFirstPageNum = blockLastPageNum - (pagesPerBlock - 1);
			} else {
				blockFirstPageNum = (int) (Math.ceil((float)currentPageNum / pagesPerBlock) * pagesPerBlock)
						- (pagesPerBlock - 1);
			}

			// assert blockLastPageNum % pagesPerBlock == 0;
			// assert (blockFirstPageNum - 1) % pagesPerBlock == 0;
		} else {
			// ����� �Ѱ�� ��� (��: 5->2, 9->4)
			Integer mid = pagesPerBlock / 2;

			// ���� ù��°, ������ ������ ��ȣ ���
			if(currentPageNum <= pagesPerBlock) {
				blockLastPageNum = pagesPerBlock;
			} else if(currentPageNum < totalLastPageNum - mid) {
				blockLastPageNum = currentPageNum + mid;
			}

			blockFirstPageNum = blockLastPageNum - (pagesPerBlock - 1);

			if(totalLastPageNum < pagesPerBlock) {
				blockLastPageNum = totalLastPageNum;
				blockFirstPageNum = 1;
			}
			// assert blockLastPageNum == currentPageNum + mid;
			// assert (blockFirstPageNum - 1) % pagesPerBlock == 0;
		}

		// ������ ��ȣ �Ҵ�
		List<Integer> pageList = new ArrayList<>();
		for(int i = 0, val = blockFirstPageNum; val <= blockLastPageNum; i++, val++) {
			pageList.add(i, val);
		}


		Map<String, Object> result = new HashMap<>();
		result.put("isPrevExist", (int)currentPageNum > (int)pagesPerBlock);
		result.put("isNextExist", blockLastPageNum != 1 ? (int)blockLastPageNum != (int)totalLastPageNum : false);
		result.put("totalLastPageNum", totalLastPageNum);
		result.put("blockLastPageNum", blockLastPageNum);
		result.put("blockFirstPageNum", blockFirstPageNum);
		result.put("currentPageNum", currentPageNum);
		result.put("totalPostCount", totalPostCount);
		result.put("pagesPerBlock", pagesPerBlock);
		result.put("postsPerPage", postsPerPage);
		result.put("pageList", pageList);

		return result;
	}

	public Map<String, Object> getElasticBlock(Integer currentPageNum) {
		return this.getBlock(currentPageNum, false);
	}

	public Map<String, Object> getFixedBlock(Integer currentPageNum) {
		return this.getBlock(currentPageNum, true);
	}

}


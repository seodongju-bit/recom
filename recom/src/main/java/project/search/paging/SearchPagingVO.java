package project.search.paging;

public class SearchPagingVO {
	
	private int page;		//현재 페이지 번호
	private int perPageNum;		//한 페이지당 보여줄 게시글의 갯수
	private int rowStart;
	private int rowEnd;
	
	//처음 게시판 목록에 들어왔을때를 대비하여 반드시 기본 세팅을 해야함
		//현재 페이지를 1페이지로, 페이지당 보여줄 게시글의 갯수를 10개로
	public SearchPagingVO() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public void setPage(int page) {
		
		if(page <= 0) {
			this.page = 1;
			return;
		}
			this.page = page;
	}

	 public void setPerPageNum(int perPageNum) {
	  
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum =10;
			return;
		}
			this.perPageNum = perPageNum;
	 }

	 public int getPage() {
		 return page;
	 }

	 public int getPageStart() {
		 return (this.page - 1) * perPageNum;
	 }

	 public int getPerPageNum() {
		 return this.perPageNum;
	 }

	 @Override
	 public String toString() {
		 return "SearchPagingVO [page=" + page + ", perPageNum=" + perPageNum + ""
				 + ", rowStart=" +  getRowStart() + ", rowEnd=" + getRowEnd()
				 + "]";
	 }
	 public int getRowStart() {
		 rowStart = ((page - 1) * perPageNum) + 1;
		 return rowStart;
	 }

	 public int getRowEnd() {
		 rowEnd = rowStart + perPageNum - 1;
		 return rowEnd;
	 }
	
}
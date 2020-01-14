package project.C.P001.vo;

public class Search extends PagingVO {
	
	private String searchType;

	private String keyword;

	

			

	public String getSearchType() {

		return searchType;

	}

	

	public void setSearchType(String searchType) {

		this.searchType = searchType;

	}

	

	public String getKeyword() {

		return keyword;

	}



	public void setKeyword(String keyword) {

		this.keyword = keyword;

	}



	public void pageInfo(int nowPage, int cntPerPage, int listCnt) {
		
	}

}



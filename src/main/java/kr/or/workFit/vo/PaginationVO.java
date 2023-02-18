package kr.or.workFit.vo;

import java.util.List;

public class PaginationVO<T> {
	
	private int totalRecord;			// 총 게시글 수
	private int totalPage;				// 총 페이지 수
	private int currentPage;			// 현재 페이지
	private int screenSize = 10;		// 페이지 당 게시글 수
	private int blockSize = 5;			// 페이지 블록 수
	private int startRow;				// 시작 row
	private int endRow;					// 끝 row
	private int startPage;				// 시작 페이지
	private int endPage;				// 끝 페이지
	private List<T> dataList;			// 결과를 넣을 데이터 리스트
	private String searchType;			// 검색 타입
	private String searchWord;			// 검색 단어
	
	public PaginationVO() {
		super();
	}
	// PaginationInfoVO 객체를 만들 때, 한 페이지당 게시글 수와 페이지 블록 수를 원하는 값으로 초기화 할 수 있다.
	public PaginationVO(int screenSize, int blockSize) {
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}
	
	public int getTotalRecord() {
		return totalRecord;
	}
	
	public void setTotalRecord(int totalRecord) {
		// 총 게시물이 134개
		// screenSize 10개
		// totalPage = 13+1(게시물 4개를 포함하고 있는 페이지)
		this.totalRecord = totalRecord;
		totalPage = (int) Math.ceil(totalRecord / (double)screenSize);
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		endRow = currentPage * screenSize;
		startRow = endRow - (screenSize - 1);
		endPage = (currentPage + (blockSize - 1)) / blockSize * blockSize;
		startPage = endPage - (blockSize - 1);
	}
	public int getScreenSize() {
		return screenSize;
	}
	public void setScreenSize(int screenSize) {
		this.screenSize = screenSize;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public List<T> getDataList() {
		return dataList;
	}
	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	public String getPagingHTML() {
		StringBuffer html = new StringBuffer();

		html.append("<ul class='pagination'>");
		if (startPage > 1) {
			html.append(
					"	<li class='paginate_button page-item previous disabled'><a href='' class='page-link' tabindex='-1' data-page='"
							+ (startPage - blockSize) + "'>Prev</a></li>");
		}
		for (int i = startPage; i <= (endPage < totalPage ? endPage : totalPage); i++) {
			if (i == currentPage) {
				html.append(
						"<li class='paginate_button page-item'><font href='' aria-controls='dataTable' class='page-link'>"
								+ i + "</font></li>");
			} else {
				html.append(
						"<li class='paginate_button page-item'><a href='' aria-controls='dataTable' class='page-link' data-page='"
								+ i + "'>" + i + "</a></li>");
			}
		}
		if (endPage < totalPage) {
			html.append("	<li class='paginate_button page-item next'><a href='' class='page-link' data-page='"
					+ (endPage + 1) + "'>Next</a></li>");
		}
		html.append("	</ul>");

		return html.toString();
	}
}

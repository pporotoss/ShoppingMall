package common.page;

public class PagingBean {
	private int currentPage;		
	private int totalRecord;
	private int pageSize;	
	private int blockSize;
	private int totalPage;	
	private int firstPage;
	private int lastPage;	
	private int curPos;
	private int num;
	
	public void init(int currentPage, int totalRecord, int pageSize, int blockSize){	// 게시물이 변경될때마다 초기화
		
		this.currentPage = currentPage;
		this.totalRecord = totalRecord;
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		
		this.totalPage = (int)Math.ceil((float)totalRecord/pageSize);
		this.firstPage = currentPage-((currentPage-1)%blockSize);
		this.lastPage = firstPage+(blockSize-1);
		this.curPos = (currentPage-1)*pageSize;
		this.num = totalRecord-curPos;
	}
	
	// get
	public int getCurrentPage() {
		return currentPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public int getPageSize() {
		return pageSize;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public int getFirstPage() {
		return firstPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public int getCurPos() {
		return curPos;
	}
	public int getNum() {
		return num;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public void setCurPos(int curPos) {
		this.curPos = curPos;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
}

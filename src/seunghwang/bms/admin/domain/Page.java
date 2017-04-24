package seunghwang.bms.admin.domain;

public class Page {
    protected int currentPage; // 현재 페이지
    private int rowCnt;        // 글개수/화면
    private String serchType; //가져갈 값
    private String serchValue; //들어 갈 값
    
    public Page(){
        this(1, 10);
    }
    
    public Page(int currentPage){        
        this(currentPage, 10);
    }
    
    public Page(int currentPage, int rowCnt){
        this.currentPage = currentPage;
        this.rowCnt = rowCnt;
    }
 
    public int getCurrentPage() {
        return currentPage;
    }
 
    public int getRowCnt() {
        return rowCnt;
    }
 
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
 
    public void setRowCnt(int rowCnt) {
        this.rowCnt = rowCnt;
    }

	public String getSerchType() {
		return serchType;
	}

	public void setSerchType(String serchType) {
		this.serchType = serchType;
	}

	public String getSerchValue() {
		return serchValue;
	}

	public void setSerchValue(String serchValue) {
		this.serchValue = serchValue;
	}



}

package seunghwang.bms.admin.service;

import seunghwang.bms.admin.dao.AdminDao;
import seunghwang.bms.admin.dao.AdminDaoImpl;
import seunghwang.bms.admin.domain.Page;
import seunghwang.bms.login.dao.LoginDao;
import seunghwang.bms.login.dao.LoginDaoImpl;

public class PageService {
	   private AdminDao adminDao;
	   private LoginDao loginDao;
	    private int startPage;   // 시작 페이지 번호
	    private int endPage;     // 끝 페이지 번호
	    private boolean prev;    // 시작 페이지 번호가 1이 아닐 때, 이전 링크
	    private boolean next;    // 끝 페이지 번호 후에 글이 더 있을 때, 다음 링크
	    private int totRowCnt;   // 전체 글 개수
	    private int pageNumCnt;  // 페이지 번호 개수/화면
	    private Page page;
	    
	    public PageService(int pageNumCnt, Page page){
	        this.adminDao = new AdminDaoImpl();
	        this.loginDao = new LoginDaoImpl();
	        this.totRowCnt = getTotRowCnt();
	        this.pageNumCnt = pageNumCnt;
	        this.page = page;
	        init();
	    }
	    
	    private int getTotRowCnt(){
	        return loginDao.getTotRowCnt();
	    }
	    
	    private void init() {
	        // 한 화면에서 끝 페이지
	        endPage = (int)(Math.ceil(page.getCurrentPage()/(double)pageNumCnt)*pageNumCnt);
	        // 한 화면에서 시작 페이지
	        startPage = (endPage-pageNumCnt)+1;
	        // 마지막 화면에서 끝 페이지
	        int lastEndPage = (int)(Math.ceil(totRowCnt/(double)page.getRowCnt()));
	 
	        if (endPage > lastEndPage) endPage = lastEndPage;
	 
	        prev = startPage==1?false:true;
	        next = endPage*page.getRowCnt() >= totRowCnt?false:true;
	    }
	    
	    public void resultInit() {
	    	
	    }
	    
	    public Page getPage() {
	        return page;
	    }
	 
	    public boolean isPrev() {
	        return prev;
	    }
	 
	    public boolean isNext() {
	        return next;
	    }    
	 
	    public int getStartPage() {
	        return startPage;
	    }
	 
	    public int getEndPage() {
	        return endPage;
	    }
}


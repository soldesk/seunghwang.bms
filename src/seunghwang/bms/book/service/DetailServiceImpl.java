package seunghwang.bms.book.service;

import seunghwang.bms.book.dao.DetailDao;
import seunghwang.bms.book.domain.Detail;

public class DetailServiceImpl implements DetailService{
	private DetailDao detailDao;
	
	public DetailServiceImpl(){}
	
	public DetailServiceImpl(DetailDao detailDao){
		this.detailDao = detailDao;
	}
	
	public Detail searchDetail(String bookId){
		return detailDao.searchDetail(bookId);
	}
	public void insertDetail(Detail detail){
		detailDao.insertDetail(detail);
	}
	public void updateDetail(Detail detail){
		detailDao.updateDetail(detail);
	}
	public void deleteDetail(String bookId){
		detailDao.deleteDetail(bookId);
	}
}

package seunghwang.bms.book.dao;

import seunghwang.bms.book.dao.mapper.DetailMapper;
import seunghwang.bms.book.domain.Detail;

public class DetailDaoImpl implements DetailDao{
	private DetailMapper detailMapper;
	
	public DetailDaoImpl(){}
	
	public DetailDaoImpl(DetailMapper detailMapper) {
		this.detailMapper = detailMapper;
	}
	
	public Detail searchDetail(String bookId) {
		return detailMapper.searchDetail(bookId);
	}
	public void insertDetail(Detail detail){
		detailMapper.insertDetail(detail);
	}
	public void updateDetail(Detail detail){
		detailMapper.updateDetail(detail);
	}
	public void deleteDetail(String bookId){
		detailMapper.deleteDetail(bookId);
	}
}

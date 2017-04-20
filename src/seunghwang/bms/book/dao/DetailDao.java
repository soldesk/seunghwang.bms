package seunghwang.bms.book.dao;

import seunghwang.bms.book.domain.Detail;

public interface DetailDao {
	Detail searchDetail(String bookId);
	void insertDetail(Detail detail);
	void updateDetail(Detail detail);
	void deleteDetail(String bookId);
}

package seunghwang.bms.book.dao.mapper;

import seunghwang.bms.book.domain.Detail;

public interface DetailMapper {
	Detail searchDetail(String bookId);
	void insertDetail(Detail detail);
	void updateDetail(Detail detail);
	void deleteDetail(String bookId);
}

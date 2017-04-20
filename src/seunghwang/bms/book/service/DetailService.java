package seunghwang.bms.book.service;

import seunghwang.bms.book.domain.Detail;

public interface DetailService {
	Detail searchDetail(String bookId);
	void insertDetail(Detail detail);
	void updateDetail(Detail detail);
	void deleteDetail(String bookId);
}

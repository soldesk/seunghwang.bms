package seunghwang.bms.book.service;

import seunghwang.bms.book.domain.Category;

public interface CategoryService {
	String insertBookId(String categoryId);
	Category findCategory(String categoryId);
}

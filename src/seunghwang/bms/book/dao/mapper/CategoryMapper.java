package seunghwang.bms.book.dao.mapper;

import seunghwang.bms.book.domain.Category;

public interface CategoryMapper {
	String insertBookId(String categoryId);
	Category findCategory(String categoryId);
}

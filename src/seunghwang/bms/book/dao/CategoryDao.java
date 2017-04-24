package seunghwang.bms.book.dao;

import seunghwang.bms.book.domain.Category;

public interface CategoryDao {
	public String insertBookId(String categoryId);
	public Category findCategory(String categoryId);
}

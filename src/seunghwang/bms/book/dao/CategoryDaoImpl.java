package seunghwang.bms.book.dao;

import seunghwang.bms.book.dao.mapper.CategoryMapper;
import seunghwang.bms.book.domain.Category;

public class CategoryDaoImpl implements CategoryDao{
	private CategoryMapper categoryMapper;
	
	public CategoryDaoImpl(){}
	
	public CategoryDaoImpl(CategoryMapper categoryMapper){
		this.categoryMapper = categoryMapper;
	}
	
	public Category findCategory(String categoryId) {
		return categoryMapper.findCategory(categoryId);
	}
	public String insertBookId(String categoryId) {
		return categoryMapper.insertBookId(categoryId);
	}
}

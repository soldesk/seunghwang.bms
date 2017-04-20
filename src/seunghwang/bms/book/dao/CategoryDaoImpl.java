package seunghwang.bms.book.dao;

import seunghwang.bms.book.dao.mapper.CategoryMapper;

public class CategoryDaoImpl implements CategoryDao{
	private CategoryMapper categoryMapper;
	
	public CategoryDaoImpl(){}
	
	public CategoryDaoImpl(CategoryMapper categoryMapper){
		this.categoryMapper = categoryMapper;
	}
	
	public String insertBookId(String categoryId) {
		return categoryMapper.insertBookId(categoryId);
	}
}

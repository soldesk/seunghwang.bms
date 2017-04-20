package seunghwang.bms.book.service;

import seunghwang.bms.book.dao.CategoryDao;
import seunghwang.bms.book.domain.Category;

public class CategoryServiceImpl implements CategoryService{
	private CategoryDao categoryDao;
	
	public CategoryServiceImpl(){}
	
	public CategoryServiceImpl(CategoryDao categoryDao){
		this.categoryDao = categoryDao;
	}
	
	public String insertBookId(String categoryId){
		String category = "";
		switch(categoryId) {
		case "NK": category = categoryId + String.format("%06d",++Category.nkCnt); break;
		case "NA": category = categoryId + String.format("%06d",++Category.naCnt); break;
		case "NJ": category = categoryId + String.format("%06d",++Category.njCnt); break;
		case "NF": category = categoryId + String.format("%06d",++Category.nfCnt); break;
		case "NC": category = categoryId + String.format("%06d",++Category.ncCnt); break;
		case "MG": category = categoryId + String.format("%06d",++Category.mgCnt); break;
		case "MT": category = categoryId + String.format("%06d",++Category.mtCnt); break;
		case "BM": category = categoryId + String.format("%06d",++Category.bmCnt); break;
		case "EG": category = categoryId + String.format("%06d",++Category.egCnt); break;
		case "ET": category = categoryId + String.format("%06d",++Category.etCnt); break;
		case "CE": category = categoryId + String.format("%06d",++Category.ceCnt); break;
		case "HP": category = categoryId + String.format("%06d",++Category.hpCnt); break;
		case "HPD":category = categoryId + String.format("%06d",++Category.hpdCnt); break;
		case "HPS":category = categoryId + String.format("%06d",++Category.hpsCnt); break;
		case "HG": category = categoryId + String.format("%06d",++Category.hgCnt); break;
		case "HSG":category = categoryId + String.format("%06d",++Category.hsgCnt); break;
		case "HWH":category = categoryId + String.format("%06d",++Category.hwhCnt); break;
		case "HOH":category = categoryId + String.format("%06d",++Category.hohCnt); break;
		case "HKH":category = categoryId + String.format("%06d",++Category.hkhCnt); break;
		case "HM": category = categoryId + String.format("%06d",++Category.hmCnt); break;
		case "PP": category = categoryId + String.format("%06d",++Category.ppCnt); break;
		case "PA": category = categoryId + String.format("%06d",++Category.paCnt); break;
		case "PD": category = categoryId + String.format("%06d",++Category.pdCnt); break;
		case "PL": category = categoryId + String.format("%06d",++Category.plCnt); break;
		case "PS": category = categoryId + String.format("%06d",++Category.psCnt); break;
		case "AG": category = categoryId + String.format("%06d",++Category.agCnt); break;
		case "AA": category = categoryId + String.format("%06d",++Category.aaCnt); break;
		case "AC": category = categoryId + String.format("%06d",++Category.acCnt); break;
		case "AD": category = categoryId + String.format("%06d",++Category.adCnt); break;
		case "AF": category = categoryId + String.format("%06d",++Category.afCnt); break;
		case "ST": category = categoryId + String.format("%06d",++Category.stCnt); break;
		case "SR": category = categoryId + String.format("%06d",++Category.srCnt); break;
		case "SP": category = categoryId + String.format("%06d",++Category.spCnt); break;
		case "SC": category = categoryId + String.format("%06d",++Category.scCnt); break;
		case "SB": category = categoryId + String.format("%06d",++Category.sbCnt); break;
		case "SE": category = categoryId + String.format("%06d",++Category.seCnt); break;
		case "CC": category = categoryId + String.format("%06d",++Category.ccCnt); break;
		case "CO": category = categoryId + String.format("%06d",++Category.coCnt); break;
		case "CN": category = categoryId + String.format("%06d",++Category.cnCnt); break;
		case "CD": category = categoryId + String.format("%06d",++Category.cdCnt); break;
		case "CS": category = categoryId + String.format("%06d",++Category.csCnt); break;
		case "CW": category = categoryId + String.format("%06d",++Category.cwCnt); break;
		
		}
		return category;
	}
}

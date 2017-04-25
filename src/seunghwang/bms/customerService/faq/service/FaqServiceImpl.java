package seunghwang.bms.customerService.faq.service;

import java.util.List;

import seunghwang.bms.customerService.faq.dao.FaqDao;
import seunghwang.bms.customerService.faq.domain.Faq;

public class FaqServiceImpl implements FaqService{
	private FaqDao faqDao;
	
	public FaqServiceImpl(){}
	
	public FaqServiceImpl(FaqDao faqDao){
		this.faqDao = faqDao;
	}
	
	@Override
	public boolean addFaq(Faq faq){
		return faqDao.addFaq(faq)>0;
	}

	@Override
	public List<Faq> listFaqs() {
		return faqDao.getFaqs();
	}

	@Override
	public Faq getFaq(int faqId) {
		return faqDao.getFaq(faqId);
	}

	@Override
	public int visitCnt(Faq faq) {
		return faqDao.visitCnt(faq);
	}

	@Override
	public List<Faq> userFaqs() {
		return faqDao.userFaqs();
	}

	@Override
	public List<Faq> orderFaqs() {
		return faqDao.orderFaqs();
	}

	@Override
	public List<Faq> bookFaqs() {
		return faqDao.bookFaqs();
	}

	@Override
	public List<Faq> systemFaqs() {
		return faqDao.systemFaqs();
	}

	@Override
	public boolean delFaq(int faqId) {
		return faqDao.delFaq(faqId)>0;
	}

	@Override
	public boolean modFaq(Faq faq) {
		return faqDao.modFaq(faq)>0;
	}

	@Override
	public List<Faq> searchFaqs(String faqTitle) {
		return faqDao.searchFaqs(faqTitle);
	}
}
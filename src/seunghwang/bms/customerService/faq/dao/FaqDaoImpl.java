package seunghwang.bms.customerService.faq.dao;

import java.util.List;

import seunghwang.bms.config.Configuration;
import seunghwang.bms.customerService.faq.dao.mapper.FaqMapper;
import seunghwang.bms.customerService.faq.domain.Faq;

public class FaqDaoImpl implements FaqDao{
	private FaqMapper faqMapper;
	
	public FaqDaoImpl(){
		this.faqMapper = Configuration.getMapper(FaqMapper.class);
	}
	
	public FaqDaoImpl(FaqMapper faqMapper){
		this.faqMapper = faqMapper;
	}
	
	@Override
	public int addFaq(Faq faq) {
		return faqMapper.addFaq(faq);
	}

	@Override
	public List<Faq> getFaqs() {
		return faqMapper.getFaqs();
	}

	@Override
	public Faq getFaq(int faqId) {
		return faqMapper.getFaq(faqId);
	}

	@Override
	public int visitCnt(Faq faq) {
		return faqMapper.visitCnt(faq);
	}

	@Override
	public List<Faq> userFaqs() {
		return faqMapper.userFaqs();
	}

	@Override
	public List<Faq> orderFaqs() {
		return faqMapper.orderFaqs();
	}

	@Override
	public List<Faq> bookFaqs() {
		return faqMapper.bookFaqs();
	}

	@Override
	public List<Faq> systemFaqs() {
		return faqMapper.systemFaqs();
	}

	@Override
	public int delFaq(int faqId) {
		return faqMapper.delFaq(faqId);
	}

	@Override
	public int modFaq(Faq faq) {
		return faqMapper.modFaq(faq);
	}

	@Override
	public List<Faq> searchFaqs(String faqTitle) {
		return faqMapper.searchFaqs(faqTitle);
	}
}
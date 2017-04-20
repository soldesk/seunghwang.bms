package seunghwang.bms.customerService.faq.dao;

import java.util.List;

import seunghwang.bms.customerService.faq.domain.Faq;

public interface FaqDao {
	List<Faq> getFaqs();
	List<Faq> userFaqs();
	List<Faq> orderFaqs();
	List<Faq> bookFaqs();
	List<Faq> systemFaqs();
	Faq getFaq(int faqId);
	int addFaq(Faq faq);
	int modFaq(Faq faq);
	int delFaq(int faqId);	
	int visitCnt(Faq faq);
}

package seunghwang.bms.customerService.faq.service;

import java.util.List;

import seunghwang.bms.customerService.faq.domain.Faq;

public interface FaqService {
	List<Faq> listFaqs();
	List<Faq> userFaqs();
	List<Faq> orderFaqs();
	List<Faq> bookFaqs();
	List<Faq> systemFaqs();
	Faq getFaq(int faqId);
	boolean addFaq(Faq faq);
	boolean modFaq(Faq faq);
	boolean delFaq(int faqId);
	int visitCnt(Faq faq);
}

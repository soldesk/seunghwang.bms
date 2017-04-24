package seunghwang.bms.customerService.faq.dao.mapper;

import java.util.List;
import seunghwang.bms.customerService.faq.domain.Faq;

public interface FaqMapper {
	List<Faq> getFaqs();
	List<Faq> searchFaqs(String faqTitle);
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

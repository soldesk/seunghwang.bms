package seunghwang.bms.customerService.inquiry.dao;

import java.util.List;

import seunghwang.bms.customerService.inquiry.domain.Inquiry;

public interface InquiryDao {
	List<Inquiry> getInquiries();
	int addInquiry(Inquiry inquiry);
	int modInquiry(Inquiry inquiry);
	int delInquiry(int inquiryId);
	int answerInquiry(Inquiry inquiry);
}

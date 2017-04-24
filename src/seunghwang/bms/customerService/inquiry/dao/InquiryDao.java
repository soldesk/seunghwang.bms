package seunghwang.bms.customerService.inquiry.dao;

import java.util.List;

import seunghwang.bms.customerService.inquiry.domain.Inquiry;

public interface InquiryDao {
	List<Inquiry> getInquiries();
	List<Inquiry> searchInquiries(String inquiryTitle);
	List<Inquiry> userInquiries(String userId);
	int addInquiry(Inquiry inquiry);
	int modInquiry(Inquiry inquiry);
	int delInquiry(int inquiryId);
	int answerInquiry(Inquiry inquiry);
}

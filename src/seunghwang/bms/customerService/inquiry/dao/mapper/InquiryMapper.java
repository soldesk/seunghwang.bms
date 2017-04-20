package seunghwang.bms.customerService.inquiry.dao.mapper;

import java.util.List;

import seunghwang.bms.customerService.inquiry.domain.Inquiry;

public interface InquiryMapper {
	List<Inquiry> getInquiries();
	int addInquiry(Inquiry inquiry);
	int modInquiry(Inquiry inquiry);
	int delInquiry(int inquiryId);
	int answerInquiry(Inquiry inquiry);
}

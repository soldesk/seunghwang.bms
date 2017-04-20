package seunghwang.bms.customerService.inquiry.service;

import java.util.List;

import seunghwang.bms.customerService.inquiry.domain.Inquiry;

public interface InquiryService {
	List<Inquiry> listInquiries();
	boolean addInquiry(Inquiry inquiry);
	boolean modInquiry(Inquiry inquiry);
	boolean delInquiry(int inquiryId);
	boolean answerInquiry(Inquiry inquiry);
}

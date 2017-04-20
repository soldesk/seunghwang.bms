package seunghwang.bms.customerService.inquiry.service;

import java.util.List;

import seunghwang.bms.customerService.inquiry.dao.InquiryDao;
import seunghwang.bms.customerService.inquiry.domain.Inquiry;

public class InquiryServiceImpl implements InquiryService{
	private InquiryDao inquiryDao;	
	
	public InquiryServiceImpl(){}
			
	public InquiryServiceImpl(InquiryDao inquiryDao){
		this.inquiryDao=inquiryDao;
	}
	
	@Override
	public boolean addInquiry(Inquiry inquiry) {
		return inquiryDao.addInquiry(inquiry)>0;
	}

	@Override
	public List<Inquiry> listInquiries() {
		return inquiryDao.getInquiries();
	}

	@Override
	public boolean delInquiry(int inquiryId) {
		return inquiryDao.delInquiry(inquiryId)>0;
	}

	@Override
	public boolean modInquiry(Inquiry inquiry) {
		return inquiryDao.modInquiry(inquiry)>0;
	}

	@Override
	public boolean answerInquiry(Inquiry inquiry) {
		return inquiryDao.answerInquiry(inquiry)>0;
	}
}
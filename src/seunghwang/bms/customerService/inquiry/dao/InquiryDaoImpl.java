package seunghwang.bms.customerService.inquiry.dao;

import java.util.List;

import seunghwang.bms.config.Configuration;
import seunghwang.bms.customerService.inquiry.dao.mapper.InquiryMapper;
import seunghwang.bms.customerService.inquiry.domain.Inquiry;

public class InquiryDaoImpl implements InquiryDao{
	private InquiryMapper inquiryMapper;
	
	public InquiryDaoImpl(){
		this.inquiryMapper=Configuration.getMapper(InquiryMapper.class);
	}

	public InquiryDaoImpl(InquiryMapper inquiryMapper){
		this.inquiryMapper=inquiryMapper;
	}
	
	@Override
	public int addInquiry(Inquiry inquiry) {
		return inquiryMapper.addInquiry(inquiry);
	}

	@Override
	public List<Inquiry> getInquiries() {
		return inquiryMapper.getInquiries();
	}

	@Override
	public int delInquiry(int inquiryId) {
		return inquiryMapper.delInquiry(inquiryId);
	}

	@Override
	public int modInquiry(Inquiry inquiry) {
		return inquiryMapper.modInquiry(inquiry);
	}

	@Override
	public int answerInquiry(Inquiry inquiry) {
		return inquiryMapper.answerInquiry(inquiry);
	}

	@Override
	public List<Inquiry> searchInquiries(String inquiryTitle) {
		return inquiryMapper.searchInquiries(inquiryTitle);
	}

	@Override
	public List<Inquiry> userInquiries(String userId) {
		return inquiryMapper.userInquiries(userId);
	}
}
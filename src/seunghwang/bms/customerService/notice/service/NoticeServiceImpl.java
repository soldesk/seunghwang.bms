package seunghwang.bms.customerService.notice.service;

import java.util.List;

import seunghwang.bms.customerService.notice.dao.NoticeDao;
import seunghwang.bms.customerService.notice.domain.Notice;

public class NoticeServiceImpl implements NoticeService{
	private NoticeDao noticeDao;
	
	public NoticeServiceImpl(){}
	
	public NoticeServiceImpl(NoticeDao noticeDao){
		this.noticeDao=noticeDao;
	}
	
	@Override
	public List<Notice> listNotices() {
		return noticeDao.getNotices();
	}

	@Override
	public boolean addNotice(Notice notice) {
		return noticeDao.addNotice(notice)>0;
	}

	@Override
	public int visitCnt(Notice notice) {
		return noticeDao.visitCnt(notice);
	}

	@Override
	public boolean delNotice(int noticeId) {
		return noticeDao.delNotice(noticeId)>0;
	}

	@Override
	public boolean modNotice(Notice notice) {
		return noticeDao.modNotice(notice)>0;
	}

	@Override
	public List<Notice> searchNotices(String noticeTitle) {
		return noticeDao.searchNotices(noticeTitle);
	}
}

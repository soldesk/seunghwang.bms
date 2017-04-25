package seunghwang.bms.customerService.notice.service;

import java.util.List;

import seunghwang.bms.customerService.notice.domain.Notice;

public interface NoticeService {
	List<Notice> listNotices();
	List<Notice> searchNotices(String noticeTitle);
	boolean addNotice(Notice notice);
	boolean delNotice(int noticeId);
	boolean modNotice(Notice notice);
	int visitCnt(Notice notice);
}

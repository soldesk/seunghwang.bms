package seunghwang.bms.customerService.notice.dao;

import java.util.List;

import seunghwang.bms.customerService.notice.domain.Notice;

public interface NoticeDao {
	List<Notice> getNotices();
	List<Notice> searchNotices(String noticeTitle);
	int addNotice(Notice notice);
	int delNotice(int noticeId);
	int modNotice(Notice notice);
	int visitCnt(Notice notice);
}

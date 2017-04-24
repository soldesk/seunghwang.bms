package seunghwang.bms.customerService.notice.dao.mapper;

import java.util.List;

import seunghwang.bms.customerService.notice.domain.Notice;

public interface NoticeMapper {
	List<Notice> getNotices();
	List<Notice> searchNotices(String noticeTitle);
	int addNotice(Notice notice);
	int delNotice(int noticeId);
	int modNotice(Notice notice);
	int visitCnt(Notice notice);
}
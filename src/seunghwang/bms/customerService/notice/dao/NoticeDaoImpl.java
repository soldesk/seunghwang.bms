package seunghwang.bms.customerService.notice.dao;

import java.util.List;

import seunghwang.bms.config.Configuration;
import seunghwang.bms.customerService.notice.dao.mapper.NoticeMapper;
import seunghwang.bms.customerService.notice.domain.Notice;

public class NoticeDaoImpl implements NoticeDao{
	private NoticeMapper noticeMapper;
	
	public NoticeDaoImpl(){
		this.noticeMapper=Configuration.getMapper(NoticeMapper.class);
	}
	
	public NoticeDaoImpl(NoticeMapper noticeMapper){
		this.noticeMapper=noticeMapper;
	}
	
	@Override
	public List<Notice> getNotices() {
		return noticeMapper.getNotices();
	}

	@Override
	public int addNotice(Notice notice) {
		return noticeMapper.addNotice(notice);
	}

	@Override
	public int visitCnt(Notice notice) {
		return noticeMapper.visitCnt(notice);
	}

	@Override
	public int delNotice(int noticeId) {
		return noticeMapper.delNotice(noticeId);
	}

	@Override
	public int modNotice(Notice notice) {
		return noticeMapper.modNotice(notice);
	}

}

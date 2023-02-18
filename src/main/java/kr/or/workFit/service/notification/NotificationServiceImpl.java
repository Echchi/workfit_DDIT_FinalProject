package kr.or.workFit.service.notification;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.workFit.mapper.notification.NotificationMapper;
import kr.or.workFit.vo.ApprovalDocVO;
import kr.or.workFit.vo.NotificationVO;

@Service
public class NotificationServiceImpl implements NotificationService {
	
	@Inject
	private NotificationMapper mapper;
	
	@Override
	public ApprovalDocVO selectDocInfo(String docCode) {
		// TODO Auto-generated method stub
		return mapper.selectDocInfo(docCode);
	}

	@Override
	public void insertNotification(NotificationVO notiVO) {
		// TODO Auto-generated method stub
		mapper.insertNotification(notiVO);
	}

	@Override
	public List<NotificationVO> selectReceivedNotification(String memId) {
		// TODO Auto-generated method stub
		return mapper.selectReceivedNotification(memId);
	}

	@Override
	public String selectSenderProfile(String notSender) {
		// TODO Auto-generated method stub
		return mapper.selectSenderProfile(notSender);
	}

	@Override
	public void updateReadState(String notNum) {
		// TODO Auto-generated method stub
		mapper.updateReadState(notNum);
		
	}

	@Override
	public void deleteNotification(String notNum) {
		// TODO Auto-generated method stub
		mapper.deleteNotification(notNum);
		
	}

}

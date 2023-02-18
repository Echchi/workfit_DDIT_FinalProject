package kr.or.workFit.service.notification;

import java.util.List;

import kr.or.workFit.vo.ApprovalDocVO;
import kr.or.workFit.vo.NotificationVO;

public interface NotificationService {

	public ApprovalDocVO selectDocInfo(String docCode);

	public void insertNotification(NotificationVO notiVO);

	public List<NotificationVO> selectReceivedNotification(String memId);

	public String selectSenderProfile(String notSender);

	public void updateReadState(String notNum);

	public void deleteNotification(String notNum);

}

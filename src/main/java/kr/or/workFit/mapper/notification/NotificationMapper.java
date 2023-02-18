package kr.or.workFit.mapper.notification;

import java.util.List;

import kr.or.workFit.vo.ApprovalDocVO;
import kr.or.workFit.vo.NotificationVO;

public interface NotificationMapper {

	public ApprovalDocVO selectDocInfo(String docCode);

	public void insertNotification(NotificationVO notiVO);

	public List<NotificationVO> selectReceivedNotification(String memId);

	public String selectSenderProfile(String notSender);

	public void updateReadState(String notNum);

	public void deleteNotification(String notNum);

}

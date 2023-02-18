package kr.or.workFit.vo.sserepository;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.or.workFit.vo.NotificationVO;

public class EmitterRepository {
	private static EmitterRepository instance = null;

	private EmitterRepository() {
	}

	public static EmitterRepository getInstance() {
		if (instance == null)
			instance = new EmitterRepository();
		return instance;
	}

	// key값은 emitterID, value는 SseEmitter으로 갖는 Map
	private Map<String, SseEmitter> emitters = new ConcurrentHashMap<>();
	// key값은 eventID, value는 Notification으로 갖는 Map
	private Map<String, Object> eventCache = new ConcurrentHashMap<>();

	// Emitter를 저장한다.
	public SseEmitter save(String emitterId, SseEmitter sseEmitter) {
		emitters.put(emitterId, sseEmitter);
		return sseEmitter;
	}

	public void saveEventCache(String eventCacheId, NotificationVO notification) {
		eventCache.put(eventCacheId, notification);
	}

	// 해당 회원과 관련된 모든 Emitter를 찾는다.
	public Map<String, SseEmitter> findAllEmitterStartWithByMemberId(String memberId) {
		return emitters.entrySet().stream().filter(entry -> entry.getKey().startsWith(memberId))
				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
	}

	// 해당 회원과 관련된 모든 이벤트를 찾는다.
	public Map<String, Object> findAllEventCacheStartWithByMemberId(String memberId) {

		return eventCache.entrySet().stream().filter(entry -> entry.getKey().startsWith(memberId))
				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
	}
	
	public boolean isContainEmitterId(String emitterId) {
		return emitters.containsKey(emitterId);
	}
	
	public void deleteEmitter(String emitterId) {
		emitters.remove(emitterId);
	}
	
	public SseEmitter getOneEmitter(String emitterId) {
		return emitters.get(emitterId);
	}

}

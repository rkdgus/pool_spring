package com.dgit.restcontroller;

import java.io.UnsupportedEncodingException;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.NoticeBoardVO;
import com.dgit.service.AndroidPushNotificationsService;
import com.dgit.service.NoticeBoardService;

@RestController
@RequestMapping("/messaging/*")
public class WebController {

	private final String TOPIC = "pool";
	
	@Autowired
	AndroidPushNotificationsService androidPushNotificationsService;
	
	@Autowired
	private NoticeBoardService service;

	@RequestMapping(value = "/send", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<String> send(String text) throws JSONException {

		JSONObject body = new JSONObject();
		body.put("to", "/topics/" + TOPIC);
		body.put("priority", "high");

		JSONObject notification = new JSONObject();
		
		notification.put("title", "DGIT수영장  긴급공지");
		notification.put("body", text);
		notification.put("sound", "default");
		notification.put("icon", "logo_white");
		notification.put("color", "#4374D9");
		
		
		
		
		JSONObject data = new JSONObject();
		data.put("Key-1", "JSA Data 1");
		data.put("Key-2", "JSA Data 2");

		body.put("notification", notification);      
		body.put("data", data);

		try {                                
			HttpEntity<byte[]> request = new HttpEntity<>(body.toString().getBytes("UTF-8"));
			CompletableFuture<String> pushNotification = androidPushNotificationsService.send(request);
			CompletableFuture.allOf(pushNotification).join();
			
			String firebaseResponse = pushNotification.get();
			NoticeBoardVO vo = new NoticeBoardVO();
			vo.setContent(text);
			vo.setTitle("DGIT수영장  긴급공지");
			service.create(vo);                     
			
			return new ResponseEntity<>("success", HttpStatus.OK);
			
		} catch (UnsupportedEncodingException e) {
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		} catch (InterruptedException e) {
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		} catch (ExecutionException e) {
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}
}

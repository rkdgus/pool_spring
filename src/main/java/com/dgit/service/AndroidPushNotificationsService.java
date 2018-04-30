package com.dgit.service;

import java.util.ArrayList;
import java.util.concurrent.CompletableFuture;

import org.springframework.http.HttpEntity;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;



@Service
public class AndroidPushNotificationsService {

	private static final String FIREBASE_SERVER_KEY = "AAAAP5Eg1Ck:APA91bGZ0nLBpkLhJFi_ti5xeOhjHqf-tTmUfxKyXsAqEDqEhVWTpWsZyRuJgG16Is07rQTvT-NMQtta9idROHP-wGUSGGCook6mSmBbR3PKzxPcZHPTCifbK0x8btNZNCkf--6CXiNV";
	private static final String FIREBASE_API_URL = "https://fcm.googleapis.com/fcm/send";
	
	@Async
	public CompletableFuture<String> send(HttpEntity<byte[]> request) {

		RestTemplate restTemplate = new RestTemplate();

		ArrayList<ClientHttpRequestInterceptor> interceptors = new ArrayList<>();
		interceptors.add(new HeaderRequestInterceptor("Authorization", "key=" + FIREBASE_SERVER_KEY));
		interceptors.add(new HeaderRequestInterceptor("Content-Type", "application/json; charset=UTF-8"));
		restTemplate.setInterceptors(interceptors);

		String firebaseResponse = restTemplate.postForObject(FIREBASE_API_URL, request, String.class);

		return CompletableFuture.completedFuture(firebaseResponse);
	}
}

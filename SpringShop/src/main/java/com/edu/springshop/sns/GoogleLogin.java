package com.edu.springshop.sns;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;

import lombok.Data;

// 이 객체를 사용하기 위해서 빈 등록하기!
@Data
public class GoogleLogin {
	// 스프링이 지원하는 구글 객체들을 사용하기
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters oAuth2Parameters;

	
	// 사용자가 보게 될 로그인 인증 화면의 주소
	public String handle() {
		OAuth2Operations operation=googleConnectionFactory.getOAuthOperations();
		String url=operation.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
		
		return url;
	}
	
}

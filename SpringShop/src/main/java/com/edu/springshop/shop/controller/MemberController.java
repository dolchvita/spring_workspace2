package com.edu.springshop.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.springshop.sns.GoogleLogin;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private GoogleLogin googleLogin;
	
	@GetMapping("/joinform")
	public ModelAndView getJoinForm() {
		ModelAndView mav=new ModelAndView("shop/member/joinform");
		return mav;
	}
	
	
	// 구글 로그인 폼 요청
	@GetMapping("/authform/google")
	public ModelAndView getAuthForm() {
		String url=googleLogin.handle();
		
		ModelAndView mav=new ModelAndView("shop/member/loginform");
		mav.addObject("url", url);
		return mav;
	}
	
	
	/*======================
	 * 	구글 로그인 관련 메서드들 !
	 * ======================*/
	
	// 사용자가 동의하면 호출되는 콜백함수!
	@GetMapping("/auth/google")
	public ModelAndView callback(HttpServletRequest request) {
		String code=request.getParameter("code");
		
		// 클라이언트 ID와 Secret 을 함쳐 보내면 토큰을 발급 받는다.
		OAuth2Operations operation=googleLogin.getGoogleConnectionFactory().getOAuthOperations();
		
		AccessGrant accessGrant=operation.exchangeForAccess(code, googleLogin.getOAuth2Parameters().getRedirectUri(), null);
		String token=accessGrant.getAccessToken();
		
		
		ModelAndView mv=new ModelAndView();
		return null;
	}
	
	
	
	/*======================
	 * 	구글 맵과 관련된 메서드!
	 * ======================*/
	
	@GetMapping("/google/map")
	public ModelAndView getMap(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView("google/map");
		return mv;
	}
	

	
	
}

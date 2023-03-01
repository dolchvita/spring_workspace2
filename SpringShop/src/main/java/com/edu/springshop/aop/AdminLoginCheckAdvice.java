package com.edu.springshop.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;

import com.edu.springshop.exception.AdminException;

public class AdminLoginCheckAdvice {

	// 세션에 Admin이 담겨 있는지(=로그인 성공) 체크
	public Object sessionCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		
		// 	1-1) 타겟이 될 메서드들의 매개변수 조사
		Object[] args=joinPoint.getArgs();
		
		/* 뽀인트 !
			이 proxy(대리객체)가 우리의 횡단적 관심 사항 코드를 대신 해주어야 한다.
			여기서 cross cutting concern은?
				HttpServletRequest 를 매개변수로 갖는 매서드가
				session에 admin을 담았는지 확인하기!
		*/
		
		// 1-2) 조사할 객체
		HttpServletRequest request=null;
		HttpSession session=null;		// args 배열에 들어있는 request를 통해서 반환받을 세션!
		
		Object result=null;
		
		for(int i=0; i<args.length; i++) {
			
			// 지역화되지 않게 반환받기!
			if(args[i] instanceof HttpServletRequest) {
				request=(HttpServletRequest)args[i];
			}
		}
		
		
		// 1-3) 로그인 시도 자체에 들어가는 메서드들은 제외시켜주기!
		// 		   그러기 위해선? request로부터 uri 조사!
		String uri=request.getRequestURI();
		if(
			uri.equals("/admin/loginform")||
			uri.equals("/admin/rest/login/admin")
		) {
			result=joinPoint.proceed();		// try-catch 대신 throws
			
			// 1-4) 기존 메서드를 진행시키면 반환값이 있다! (자료형이 뭐가 될진 모르지만,)
			// 결과를 담아서 최종적으로 반환하기!!!
		
		}else {
			
			// 1-5) 권한이 필요한 메서드들은 세션 체크하기!
			session=request.getSession();
			
			if(session.getAttribute("admin")==null) {
				throw new AdminException("로그인이 필요한 서비스입니다");
			}else {
				result=joinPoint.proceed();
			}
		}
		
		return result;
	}
	
}

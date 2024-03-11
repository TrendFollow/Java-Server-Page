package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {
	// 명시한 이름, 값, 유지기간 조건으로 새로운 쿠키를 생성합니다.
	public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime) {
			Cookie cookie = new Cookie(cName, cValue);
			cookie.setPath("/");
			cookie.setMaxAge(cTime);
			response.addCookie(cookie);
	}//makeCookie
	
	// 쿠키의 이름을 넣으면 이름의 값 반환
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue="";
		Cookie[] cookies= request.getCookies();
		if(cookies!=null) {
			for(Cookie c : cookies) {
				String cookieName = c.getName();
				if(cookieName.equals(cName)) {
					cookieValue=c.getValue();
				}//if
			}//for
		}//if
		return cookieValue;
	}//readCookie
	
	// 명시한 이름의 쿠키 삭제
	public static void deleteCookie(HttpServletResponse response, String cName) {
		makeCookie(response, cName, "", 0);
	}
}

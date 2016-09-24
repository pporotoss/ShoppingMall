package common.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


/* 로그인 안한거 체크하기 */
public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	
	// 메서드 실행전에 검사하기
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) 	throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session != null){
			Object admin = session.getAttribute("admin");
			if(admin != null){	// 세션에 넣은 값이 존재하면,
				return true;	// 리턴값이 true이면 메서드 실행.
			}
		}
		response.sendRedirect(request.getContextPath()+"/admin/index.jsp");	// 서버에 등록된 Context 경로/admin/index.jsp로 이동.
		
		return false; // 리턴값이 false이면 메서드 실행 안함.
	}
}

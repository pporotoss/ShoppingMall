package common.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


/* �α��� ���Ѱ� üũ�ϱ� */
public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	
	// �޼��� �������� �˻��ϱ�
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) 	throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session != null){
			Object admin = session.getAttribute("admin");
			if(admin != null){	// ���ǿ� ���� ���� �����ϸ�,
				return true;	// ���ϰ��� true�̸� �޼��� ����.
			}
		}
		response.sendRedirect(request.getContextPath()+"/admin/index.jsp");	// ������ ��ϵ� Context ���/admin/index.jsp�� �̵�.
		
		return false; // ���ϰ��� false�̸� �޼��� ���� ����.
	}
}

package sec02;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init 메소드 호출됨");	
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		System.out.println("destroy 메소드 호출됨");	
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// 전송되는 데이터는 인코딩
//		// request.setCharacterEncoding("utf-8");
//		
//		String userId = request.getParameter("user_id");
//		String userPw = request.getParameter("user_pw");
//		
//		// 전송된 값을 콘솔에 출력 
//		System.out.println("아이디 : " + userId);
//		System.out.println("비밀번호 : " + userPw);
//	}
//
//} 

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// 전송되는 데이터는 인코딩
	// request.setCharacterEncoding("utf-8");
	
	String userId = request.getParameter("user_id");
	String userPW = request.getParameter("user_pw");
	
	
	
	// 전송된 값을 콘솔에 출력 
	System.out.println("도서번호 : " + userId);
	System.out.println("도서명 : " + userPW);
}

}

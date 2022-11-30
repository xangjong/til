package sec02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginResServlet
 */
@WebServlet("/loginres")
public class LoginResServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginResServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		(1) 클라이언트에서 전송 받음 : 요청 처리 
//		전송되는 데이터 인코딩

			request.setCharacterEncoding("utf-8");
			
			String userId = request.getParameter("user_id");
			String userPw = request.getParameter("user_pw");
			
//		(2) 클라이언트로 전송 : 응답 처리
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			// html 문서 형식으로 데이터 작성해서 전송
			out.println("<html><head></head></body>");
			out.println(" 아이디 : " +  userId + "<br>");
			out.println(" 비밀번호 : " +  userPw + "<br>");
			out.println("</body></html>");
	}

}

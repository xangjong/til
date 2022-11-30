package sec03;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FirstServlet04
 */
@WebServlet("/first04")
public class FirstServlet04 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FirstServlet04() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// redirect 방식으로 전송
		
		response.setContentType("text/html;charset=utf-8");
		
		// name = value 쌍으로 전송
		// response.sendRedirect("second04?name=kim");
		
		// 변수 사용할 경우
		// String myName = "park";
		// response.sendRedirect("second04?name=" + myName);
		
		// 한글인 경우 : 포워딩할 경우 한글 깨짐
		String myName = "홍"; // 인코딩 : URLEncoder.encode() 사용
		String encodedName = URLEncoder.encode(myName, "UTF-8");
		response.sendRedirect("second04?name=" + encodedName);
	}

}

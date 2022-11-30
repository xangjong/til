package sec03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SecondServlet06
 */
@WebServlet("/second06")
public class SecondServlet06 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SecondServlet06() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		// 바인딩된 데이터 추출
		String name = (String)request.getAttribute("name");
		String address = (String)request.getAttribute("address");
		
		// 클라이언트 웹 페이지로 출력
		PrintWriter out = response.getWriter();
		
		out.println("<html><body>");
		out.println("이름 : " + name +"<br>");
		out.println("주소 : " + address);
		out.println("<br> dispatch를 이용한 바인딩" );
		out.println("</body></html>");
	}

}

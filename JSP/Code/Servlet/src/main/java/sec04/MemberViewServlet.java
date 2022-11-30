package sec04;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberViewServlet
 */
@WebServlet("/memView")
public class MemberViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		// 바인딩 된 값 추출 : 비즈니스 로직 처리
		ArrayList<MemberVO> memList = (ArrayList<MemberVO>)request.getAttribute("memList");		
		
		// 응답 처리 : 클라이언트에게 결과 전송 (웹 브라우저에 출력 : 테이블 형태)
		PrintWriter out = response.getWriter();
		
		out.print("<html><head></head><body>");
		out.print("<table border=1><tr align='center' bgcolor='gold'>");
		out.print("<th>아이디</th><th>비밀번호</th><th>이름</th>"
				+ "<th>이메일</th><th>삭제</th>");
		
		// 각 행 출력
		// 각 행의 데이터 추출 : MemberVO 객체의 Getter 사용
		for(int i=0; i<memList.size(); i++) {
			MemberVO vo = (MemberVO)memList.get(i);
			String id = vo.getId();
			String pwd = vo.getPwd();
			String name = vo.getName();
			String email = vo.getEmail();
			
			// 한 행씩 출력
			out.print("<tr><td>" + id + "</td><td>" +
												     pwd + "</td><td>" +
												     name + "</td><td>" +
												     email + "</td><td>" +
												     "<a  href='/Servlet01/memberDelete?id=" + id + "' >삭제</a></td></tr>");
			
		}
		
		out.print("</table></body></html>");			
	}


}









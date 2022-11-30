package sec04;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberBindingServlet
 */
@WebServlet("/MemberBindingServlet")
public class MemberBindingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberBindingServlet() {
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
		// DB의 member 테이블에서 데이터를 select 해와서 ArrayLisst에 저장한다고 가정
		MemberVO vo1 = new MemberVO("kim", "1234", "김길동", "kim@naver.com");
		MemberVO vo2 = new MemberVO("lee", "1111", "이몽룡", "lee@naver.com");
		MemberVO vo3 = new MemberVO("park", "2222", "박길동", "park@naver.com");
		
		ArrayList<MemberVO> memList = new ArrayList<MemberVO>();
		memList.add(vo1);
		memList.add(vo2);
		memList.add(vo3);
		
		// 데이터 바인딩
		request.setAttribute("memList", memList);
		
		// 포워딩
		RequestDispatcher dispatch = request.getRequestDispatcher("memView");
		dispatch.forward(request, response);		
	}

}








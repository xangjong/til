package sec02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NewMemberServlet
 */
@WebServlet("/newMember")
public class NewMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String hp = request.getParameter("hp1") +  "-" + request.getParameter("hp2") +  "-" + request.getParameter("hp3");
		String year = request.getParameter("year");
		String[] interests = request.getParameterValues("interest");
		String department = request.getParameter("department");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html><head></head></body>");
		out.println(" 성명 : " +  name + "<br>");
		out.println(" ID : " +  id + "<br>");
		out.println(" ID : " +  pwd + "<br>");
		out.println(" 휴대폰 번호 : " + hp + "<br>");
		out.println(" 학년 : " +  year + "<br>");
		out.print(" 관심분야 : ");
		for(String interest : interests) {
			out.println(interest + "");
		}
		out.println("<br>");
		out.println(" 학과 : " +  department );
		out.println("</body></html>");
		
	}

}

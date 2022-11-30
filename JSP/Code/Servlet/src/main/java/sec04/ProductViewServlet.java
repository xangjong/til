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
 * Servlet implementation class ProductViewServlet
 */
@WebServlet("/prdView")
public class ProductViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductViewServlet() {
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
		// TODO Auto-generated method stub
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		ArrayList<ProductVO> prdList = (ArrayList<ProductVO>) request.getAttribute("prdList");
		
		PrintWriter out = response.getWriter();
		
		out.print("<html><head></head><body>");
		out.print("<table border=1><tr align='center' bgcolor='lightgreen'>");
		out.print("<th>상품이름</th><th>상품번호</th><th>가격</th><th>수량</th>"
				+ "<th>삭제</th>");
		
		for(int i=0; i<prdList.size(); i++) {
			ProductVO vo = (ProductVO)prdList.get(i);
			String name = vo.getPrdName();
			int num = vo.getPrdNo();
			int price = vo.getPrdPrice();
			int Qty = vo.getPrdQty();
			
			out.print("<tr><td>" + name + "</td><td>" + num + "</td><td>" +
					price + "</td><td>" +
					Qty + "</td><td>" +
				     "<a  href='/Servlet01/ProductDelete?id=" + num + "' >삭제</a></td></tr>");
		}
		out.print("</table></body></html>");			

	}

}

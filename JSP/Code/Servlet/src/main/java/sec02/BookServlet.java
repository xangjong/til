package sec02;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class bookServlet
 */
@WebServlet("/bookInsert")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookServlet() {
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookNo = request.getParameter("book_no");
		String bookName = request.getParameter("book_name");
		String bookAuthor = request.getParameter("book_author");
		String bookPrice = request.getParameter("book_price");
		String bookYear = request.getParameter("book_year");
		String bookMonth = request.getParameter("book_month");
		String bookDay = request.getParameter("book_day");
		String bookQty = request.getParameter("book_qty");
		String bookPubno = request.getParameter("book_pubno");
		
		// 전송된 값을 콘솔에 출력 
		System.out.println("도서번호 : " + bookNo);
		System.out.println("도서명 : " + bookName);
		System.out.println("저자 : " + bookAuthor);
		System.out.println("가격 : " + bookPrice);
		System.out.println("발행일 : " + bookYear + "년" + bookMonth +"월" + bookDay +"일");
		System.out.println("재고 : " + bookQty);
		System.out.println("출판사번호 : " + bookPubno);
		
		
		System.out.println("재고액 : " + Integer.parseInt(bookPrice) * Integer.parseInt(bookQty));
		

	}

}

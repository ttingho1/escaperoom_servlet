package view.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.jasper.tagplugins.jstl.core.Out;

import biz.user.UserDAO;
import biz.user.UserVO;

@WebServlet("/LoginCtrl.do")
public class LoginCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGetPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGetPost(request, response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		// 폼 데이터
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		// DAO 클래스로 처리
		UserDAO udao = new UserDAO();
		// id, pw 가져오는 메서드 호출하여 DB의 데이터 가져와서 변수 할당
		UserVO user = udao.getUser(id, password);

		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("id", user.getId());
			session.setAttribute("name", user.getName());
			/* session.setAttribute("email", user.getEmail()); */
			response.sendRedirect("index.jsp");
		} else {
			out.println("<script>alert('아이디 또는 비밀번호가 틀렸습니다.'); location.href = '/escaperoom/login.jsp';</script>");	
			//response.sendRedirect("login.jsp");
		}
	}

}

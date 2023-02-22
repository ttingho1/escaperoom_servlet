package view.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.user.UserDAO;
import biz.user.UserVO;


@WebServlet("/SignupCtrl.do")
public class SignupCtrl extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
		
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println("한글처리완료");
		// 폼 데이터 받기
		String id = request.getParameter("id");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String name = request.getParameter("name");
		//배열데이터 받기
		String[] arr = request.getParameterValues("phone");
		String data = "";
		for(String phone: arr) {
			data += phone + " ";
		}
		String email = request.getParameter("email");
		System.out.println("데이터받기 완료");
		UserDAO userDAO = new UserDAO();
		// 자바빈에 묶어서 입력받은ㄷ 데이터 넣어주기
		UserVO bean = new UserVO();
		bean.setId(id);
		bean.setPassword(password1);
		bean.setPassword(password2);
		bean.setName(name);
		bean.setTel(data);
		bean.setEmail(email);
        if(userDAO.getCheckUser(id)) {
			// 비밀번호 일치여부
			if(password1.equals(password2)) {
				UserDAO udao = new UserDAO();
				udao.insertMember(bean);
				System.out.println("가입완료");
				out.println("<script>alert('가입이 완료되었습니다. 로그인 페이지로 이동합니다.'); location.href = '/escaperoom/login.jsp';</script>");
		        out.flush();
		        return;
			}else {
				out.println("<script>alert('문제가 발생했습니다.'); location.href = '/escaperoom/signup.jsp';</script>");
		        out.flush();
		        return;
			}
        }
        
		out.println("<script>alert('중복된 아이디 입니다.'); location.href = '/escaperoom/signup.jsp';</script>");
        out.flush();
        

     
		
	}

}

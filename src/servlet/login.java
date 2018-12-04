package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import org.json.JSONException;
import org.json.JSONObject;

import back.Login;
import base.StringRandom;

@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        JSONObject jsonObject=new JSONObject();
		String account=request.getParameter("account");
		String password=request.getParameter("password");
		System.out.println(account);
		
		try {
			String backMsg=new Login().login(account, password);
			if (backMsg.equals("success")) {
				String sessionid=new StringRandom().getStringRandom(12);
				Cookie cookie=new Cookie(account, sessionid);
				request.getSession().setAttribute("sessionid", sessionid);//…Ë÷√session
				request.getSession().setAttribute(account, sessionid);//…Ë÷√session
				Cookie[] cookies = request.getCookies();
				for(Cookie cookie2:cookies) {
					if (cookie2.getName().equals("username")) {
						System.out.println(cookie2.getValue());
					}
				}
				cookie.setMaxAge(3000);
				//System.out.println();
				jsonObject.put("code", 1);
				jsonObject.put("username", account);
				response.addCookie(cookie);
			}else {
				jsonObject.put("code", 2);
			}
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter printWriter=response.getWriter();
		printWriter.print(jsonObject);
	}

}

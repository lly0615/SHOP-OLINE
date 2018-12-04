package back;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class Getorder
 */
@WebServlet("/Getorder")
public class Getorder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        response.setCharacterEncoding("utf-8");
		
        String sessiont="";
        Cookie[] cookies = request.getCookies();
		for(Cookie cookie2:cookies) {
			if (cookie2.getName().equals("sessionid")) {
				System.out.println("获取用户名"+cookie2.getValue());
				sessiont=cookie2.getValue();
			}
		}
        JSONObject jsonObject=new JSONObject();
        String sessionid=request.getParameter("sessionid");
     
        PrintWriter printWriter=response.getWriter();
        if (sessionid.equals(sessiont)) {
			JSONArray jsonArray=new GetService().getInfo();
			printWriter.println(jsonArray);
		}else {
			try {
				jsonObject.put("code", 1);
				jsonObject.put("msg", "请重新登陆!");
				jsonObject.put("status", 202);
				printWriter.println(jsonObject);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        response.setCharacterEncoding("utf-8");
		
        String sessiont="";
        Cookie[] cookies = request.getCookies();
		for(Cookie cookie2:cookies) {
			if (cookie2.getName().equals("sessionid")) {
				System.out.println("获取用户名"+cookie2.getValue());
				sessiont=cookie2.getValue();
			}
		}
        JSONObject jsonObject=new JSONObject();
        String sessionid=request.getParameter("sessionid");
     
        PrintWriter printWriter=response.getWriter();
        if (sessionid.equals(sessiont)) {
			JSONArray jsonArray=new GetService().getInfo();
			printWriter.println(jsonArray);
		}else {
			try {
				jsonObject.put("code", 1);
				jsonObject.put("msg", "请重新登陆!");
				jsonObject.put("status", 202);
				printWriter.println(jsonObject);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
        
	}

}

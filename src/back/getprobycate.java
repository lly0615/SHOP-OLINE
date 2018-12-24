package back;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import base.Shops;

/**
 * Servlet implementation class getprobycate
 */
@WebServlet("/getprobycate")
public class getprobycate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getprobycate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int status=Integer.parseInt(request.getParameter("status"));
		System.out.println(status);
		response.setContentType("application/json;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        System.out.println("÷¥––¡À"+status);
        PrintWriter out = response.getWriter();
        JSONArray jsonArray=new Shops().selectShops(status);
        System.out.println(jsonArray);
        out.println(jsonArray);
	}

}

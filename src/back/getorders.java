package back;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.sun.org.apache.bcel.internal.generic.NEW;

/**
 * Servlet implementation class getorders
 */
@WebServlet("/getorders")
public class getorders extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getorders() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int status=Integer.parseInt(request.getParameter("status"));
		System.out.println(status);
		response.setContentType("application/json;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        
        PrintWriter out = response.getWriter();
		switch (status) {
		case 1:
			System.out.println(new SelectPaid().getCart());
			JSONArray jsonArray=new SelectPaid().getCart();
			out.print(jsonArray);
			break;
		case 2:
			System.out.println(new SelectPaid().getPaid());
			JSONArray jsonArray2=new SelectPaid().getPaid();
			out.print(jsonArray2);
			break;

		default:
			break;
		}
	}

}

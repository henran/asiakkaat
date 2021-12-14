package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Asiakas;
import model.dao.Dao;

/**
 * Servlet implementation class MuutaAsiakas
 */
@WebServlet("/muutaasiakas")
public class MuutaAsiakas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MuutaAsiakas() {
        super();
        // TODO Auto-generated constructor stub
        System.out.println("MuutaAsiakas.MuutaAsiakas()");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("MuutaAsiakas.doGet()");
		String asiakas_id = request.getParameter("asiakas_id");
		Dao dao = new Dao();
		Asiakas asiakas = dao.etsiAsiakas(asiakas_id);
		request.setAttribute("asiakas", asiakas);
		String jsp ="/muutaasiakas.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
		dispatcher.forward(request,  response);
			
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		System.out.println("MuutaAsiakas.doPost()");
		Asiakas asiakas = new Asiakas();
		asiakas.setAsiakas_id(Integer.parseInt(request.getParameter("asiakas_id")));
		asiakas.setEtunimi(request.getParameter("etunimi"));
		asiakas.setSukunimi(request.getParameter("sukunimi"));
		asiakas.setPuhelin(request.getParameter("puhelin"));
		asiakas.setSposti(request.getParameter("sposti"));
		Dao dao = new Dao();
		dao.muutaAsiakas(asiakas, request.getParameter("vanhaAsId"));
		response.sendRedirect("haeasiakkaat?hakusana=" + asiakas.getAsiakas_id());
	}

}

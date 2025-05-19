package com.catchme.booking;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.catchme.dao.busDao;
import com.catchme.model.*;
import java.util.ArrayList;
import java.util.List;



@WebServlet("/webBusListServlet")
public class webBusListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			busDao busdao= new busDao();
			List<Bus> busList= busdao.getAllBus();
			
			if(busList!=null && !busList.isEmpty()) {
				request.setAttribute("busList", busList);
			}else {
				System.out.println("no buses found");
			}
			
			RequestDispatcher rd= request.getRequestDispatcher("book.jsp");
			rd.forward(request, response);	
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

	

}

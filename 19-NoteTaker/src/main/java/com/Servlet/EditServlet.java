package com.Servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Entities.Note;
import com.Factory.Factory;

@WebServlet("/editServlet")
public class EditServlet extends HttpServlet {


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String title=req.getParameter("title");
			String content=req.getParameter("content");
			
			int id=Integer.parseInt(req.getParameter("noteId"));
			//Save the data in database
			
			Session session=Factory.getFactory().openSession();
			
			Transaction tx=session.beginTransaction();
			
			Note note=session.get(Note.class, id);
			
			note.setTitle(title);
			note.setContent(content);
			note.setDate(new Date());
			tx.commit();
			session.close();
			
			resp.sendRedirect("showNotes.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
		
	}
	}

}

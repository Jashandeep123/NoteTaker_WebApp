package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Entities.Note;
import com.Factory.Factory;

@WebServlet("/deleteServlet")
public class DeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("note_id"));
		Session session=Factory.getFactory().openSession();
		Transaction tx=session.beginTransaction();
		Note note=session.get(Note.class,id);
		
		session.delete(note);
		tx.commit();
		session.close();
		
		resp.sendRedirect("showNotes.jsp");
	}

}

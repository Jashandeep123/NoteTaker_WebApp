package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/addNotes")
public class AddNoteServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title=req.getParameter("title");
		String content=req.getParameter("content");

		Note note=new Note(title, content, new Date());
		
		//Save the data in database
		
		Session session=Factory.getFactory().openSession();
		
		Transaction tx=session.beginTransaction();
		session.save(note);
		tx.commit();
		session.close();
		
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		
		out.print("<h1 style='text-align:center;'>Your notes has been added.</h1>");
		out.print("<h3 style='text-align:center;'><a href='showNotes.jsp'>View all notes</a></h3>");
	}

}

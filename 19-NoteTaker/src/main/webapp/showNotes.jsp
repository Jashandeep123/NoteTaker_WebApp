<%@ page import="org.hibernate.Query"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="com.Factory.Factory"%>
<%@ page import="java.util.*"%>
<%@ page import="com.Entities.Note"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Show Notes</title>
<%@include file="../Component/AllCSS.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
	<div class="container m=10">
	<h1 class="text-center">All Notes</h1>
	
	<div class="row">
	<div class="col-12 ">
	<%
		Session s=Factory.getFactory().openSession();
		Query q=s.createQuery("from Note");
		List<Note> note=q.list();
		for(Note not:note){
		
	%>
			<div class="card  mt-2">
				<div class="card-body border-1 border-dark">
					<h5 class="card-title"><%=not.getTitle()%></h5>
					<p class="card-text"><%=not.getContent()%></p>
					<a href="deleteServlet?note_id=<%=not.getId() %>" class="btn btn-danger">Delete</a>
					<%-- <a href="editServlet?note_id=<%=not.getId() %>" class="btn btn-primary">update</a> --%>
					<a href="editNotes.jsp?note_id=<%= not.getId() %>" class="btn btn-primary">Edit</a>
				</div>
			</div>

			<%	
		}
		s.close();
	%>
	</div>
	</div>
	</div>
	
</body>
</html>
<%@ page import="org.hibernate.Query"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="com.Factory.Factory"%>
<%@ page import="java.util.*"%>
<%@ page import="com.Entities.Note"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Notes</title>
<%@include file="Component/AllCSS.jsp"%>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<div class="container m-40">
		
		<h1 class="text-center">Edit Your Notes Here !!!</h1>
	
		<%
			int noteId = Integer.parseInt(request.getParameter("note_id"));
		Session s = Factory.getFactory().openSession();
		Note note = (Note) s.get(Note.class, noteId);
		%>
		
		<form action="editServlet" method="post">

			<input value="<%=note.getId()%>" name="noteId" type="hidden" />

			<div class="mb-3">
				<label for="title"><h4>Title</h4></label> <input name="title" required
					type="text" class="form-control border-2 border-dark" id="title"
					aria-describedby="emailHelp" placeholder="Enter here"
					value="<%=note.getTitle()%>" />

			</div>

			<div class="mb-3 w-100">
				<label for="content"><h4>Content</h4></label>
				<textarea name="content" required id="content"
					placeholder="Enter your content here" class="form-control border-2 border-dark"
					style="height: 300px;"><%=note.getContent()%>
					</textarea>
			</div>

			<div class="container mt-2 text-center">
				<button type="submit" class="btn btn-success"><h4>Save</h4></button>
			</div>

		</form>

	</div>
</body>
</html>
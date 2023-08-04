<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Notes</title>
<%@include file="Component/AllCSS.jsp"%>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="container m-40">

		<h1 class="text-center">Add Your Notes Here !!!</h1>

		<form action="addNotes" method="post">
			<div class="mb-3">
				<label for="titleInput" class="form-label"><h4>Title</h4></label> <input
					required type="text" class="form-control border-2 border-dark"
					id="title" name="title">
			</div>
			<div class="mb-3 w-100">
				<label for="contentInput" class="form-label"><h4>Content</h4></label>
				<textarea required id="content"
					class="form-control border-2 border-dark"
					placeholder="Enter your content here" style="height: 300px"
					name="content"></textarea>
			</div>
			<div class="container mt-2 text-center">
				<button type="submit" class="btn btn-success">
					<h4>Add</h4>
				</button>
			</div>
		</form>

	</div>
</body>
</html>
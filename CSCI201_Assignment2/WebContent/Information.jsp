<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	html, body {
		margin: 0;
		padding: 0;
		background-color: rgb(81, 214, 156);
		color: black;
		font-family: sans-serif;
	}
	.table {
		padding-left: 10px;
		padding-right: 10px;
	}
	#search1 {
		display: inline-block;
		width: 600px;
		height: 35px;
		font-size: 25px;
		color: black;
		border: 1px solid white;
	}
	#icon {
		display: inline-block;
		float: right;
		height: 39px;
		width: 39px;
		font-size: 25px;
		background-color: white;
		border: 1px solid white;
	}
	#main-table {
		margin-left: auto;
		margin-right: auto;
		padding-top: 15px;
		padding-bottom: 10px;
		font-family: sans-serif;
	}
	#title {
		font-size: 40px;
		font-style: Arial;
		-webkit-text-stroke-color: black;
		-webkit-text-stroke-width: 2px;
		color: white;
		font-style: sans-serif;
		text-decoration: none;
		font-weight: bold;
	}
	#photo {
		float: left;
		min-height: 101%;
		margin-left: 20px;
		margin-right: 20px;
		margin-top: 10px;
		margin-bottom: 10px;
		width: 500px;
		height: 100vh;
		background-position: 50% 50%;
		background-repeat: no-repeat;
		background-size: cover;
	}
	#pic {
		height: 400px;
		width: 250px;
		margin-left: 100px;
		margin-top: 40px;
	}
	#div-info {
		margin: 0;
		background-color: rgb(52, 160, 237);
		position: absolute;
		top: 80px;
		left: 0px;
		right: 0px;
		bottom: 0px;
		overflow-y: scroll;
	}
	#info {
		font-weight: bold;
		font-size: 20px;
		margin-top: 50px;
	}
	.head {
		color: white;
		-webkit-text-stroke-width: 2px;
		-webkit-text-stroke-color: black;
		font-size: 55px;
		margin: 0;
	}
	.foot {
		color: white;
		-webkit-text-stroke-width: 2px;
		-webkit-text-stroke-color: black;
		font-size: 30px;
	}
	#auth {
		font-size: 40px;
		padding: 0px;
		margin: 0px;
	}
	#rate:before {
		content: '★★★★★';
		color: lightgray;
		
	}
	#rate:before {
		content: '★★★★★';
		color: gold;
		
	}
</style>
</head>
<body>

<%
System.out.println("Hello there");
	String[] title = request.getParameterValues("title");
	String[] author = request.getParameterValues("author");
	String[] publisher = request.getParameterValues("publisher");
	String[] description = request.getParameterValues("description");
	String[] rating = request.getParameterValues("rating");
	String[] image = request.getParameterValues("image");
	String which = request.getParameter("which");
	int percent = 0;
	int number = -1;
	String zach = "2";
	double tit = 0.0;
	if ("0".equals(request.getParameter("which"))) {
		number = 0;
	}
	else if ("1".equals(request.getParameter("which"))) {
		number = 1;
	}
	else if ("2".equals(request.getParameter("which"))) {
		number = 2;
	}
	else if ("3".equals(request.getParameter("which"))) {
		number = 3;
	}
	else if ("4".equals(request.getParameter("which"))) {
		number = 4;
		System.out.println("bl4");
	}
	else if ("5".equals(request.getParameter("which"))) {
		number = 5;
	}
	else if ("6".equals(request.getParameter("which"))) {
		number = 6;
		System.out.println("bl6");
	}
	else if ("7".equals(request.getParameter("which"))) {
		number = 7;
	}
	else if ("8".equals(request.getParameter("which"))) {
		number = 8;
	}
	else if ("9".equals(request.getParameter("which"))) {
		number = 9;
	}
	
	if("0.5".equals(rating[number])) {
		tit = 0.0;
	}
	else if("1.0".equals(rating[number])) {
		tit = 1.0;
	}
	else if("1.5".equals(rating[number])) {
		tit = 1.5;
	}
	else if("2.0".equals(rating[number])) {
		tit = 2.0;
	}
	else if("2.5".equals(rating[number])) {
		tit = 2.5;
	}
	else if("3.0".equals(rating[number])) {
		tit = 3.0;
	}
	else if("3.5".equals(rating[number])) {
		tit = 3.5;
	}
	else if("4.0".equals(rating[number])) {
		tit = 4.0;
	}
	else if("4.5".equals(rating[number])) {
		tit = 4.5;
	}
	else if("5.0".equals(rating[number])) {
		tit = 5.0;
	}
	
	System.out.println("Title: " + title[number]);
	System.out.println("Author: " + author[number]);
	System.out.println("Publisher: " + publisher[number]);
	System.out.println("Description: " + description[number]);
	System.out.println("Rating: " + rating[number]);
	System.out.println("Image: " + image[number]);
	System.out.println("Which: " + which);
%>
	<form name="myform" method="GET" action="Form.jsp" onsubmit="return validate();">
		<div id="search">
			<table id="main-table">
				<tr>
					<td class="table"><a href="ajaxform.html" id="title">LibraMate</a></td>
					<td class="table"><input type="text" name="search" id="search1" placeholder="<%= title[number]%>"/>
					<button id="icon"><i class="fas fa-search"></i></button></td>
					<td class="table"><input type="radio" name="choices" id="choices1" value="intitle" checked/>
					<label for="choices1">Title</label><br />
					<input type="radio" name="choices" id="choices2" value="isbn"/>
					<label for="choices2">ISBN</label>
					<td class="table"><input type="radio" name="choices" id="choices3" value="inauthor"/>
					<label for="choices3">Author</label><br />
					<input type="radio" name="choices" id="choices4" value="subject"/>
					<label for="choices4">Genre</label></td>
				</tr>
			</table>
		</div>
	</form> 
	
	<div id="div-info">
		<div id="photo">
			<img id="pic" src="<%=image[number] %>">
		</div>
		<div id="info">
			<p class="head"><%=title[number] %></p>
			<p class="head" id="auth">by <%=author[number] %></p>
			<p><span class="foot">Publisher: </span><%=publisher[number] %></p>
			<p><span class="foot">Description: <br /></span><%=description[number] %></p>
			<p><span class="foot">Rating: <br /></span><%=tit %></p>
		</div>
	</div>
</body>
</html>
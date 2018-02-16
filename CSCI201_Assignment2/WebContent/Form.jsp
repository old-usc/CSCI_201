<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%>

<%@ page import="com.google.api.client.googleapis.javanet.GoogleNetHttpTransport"%>
<%@ page import="com.google.api.client.json.JsonFactory"%>
<%@ page import="com.google.api.client.json.jackson2.JacksonFactory"%>
<%@ page import="com.google.api.services.books.Books"%>
<%@ page import="com.google.api.services.books.Books.Volumes.List"%>
<%@ page import="com.google.api.services.books.model.Volume"%>
<%@ page import="com.google.api.services.books.model.Volumes"%>
<%@ page import="com.google.api.services.books.BooksRequestInitializer"%>

<%@ page import="java.io.IOException"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.text.NumberFormat"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Form Data Processing</title>
<style>
	html, body {
		margin: 0;
		padding: 0;
		background-color: rgb(81, 214, 156);
		color: black;
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
	#main-table {
		margin-left: auto;
		margin-right: auto;
		padding-top: 15px;
		padding-bottom: 10px;
		font-family: sans-serif;
	}
	#search {
		margin-bottom: 10px;
	}
	#div-results {
		margin: 0;
		background-color: rgb(52, 160, 237);
		position:absolute;
		top: 80px;
		left:0px;
		right:0px;
		bottom:0px;
		overflow-y:scroll;
	}
	#table-results {
		margin-left: auto;
		margin-right: auto;
		table-layout: fixed;
		min-height: 101%;
	}
	.post {
		width: 25%;
		text-align: center;
	}
	.up {
		font-size: 20px;
		margin: 0;
	}
	.down {
		font-size: 15px;
		margin: 0;
	}
	.image {
		margin-top: 30px;
		margin-bottom: 10px;
		width: 150px;
		height: 250px;
		background-position: 50% 50%;
		background-repeat: no-repeat;
		background-size: cover;
	}
	
</style>
</head>
<body>
<%
System.out.println("Right here");
	String api = "AIzaSyA57XRUheSNFXLZWzxkDdSgg_dilKNaC3E";
	String title = request.getParameter("search");
	String type = request.getParameter("choices");
	String pref = "intitle:";
	String keep = title;
	if ("inauthor:".equals(type)) {
		pref = "inauthor:";
	}
	else if ("intitle:".equals(type)) {
		pref = "intitle:";
	}
	else if ("isbn:".equals(type)) {
		pref = "ISBN:";
	}
	else if ("subject:".equals(type)) {
		pref = "subject:";
	}
	title = pref + title;
	
	final JsonFactory jsonFactory = JacksonFactory.getDefaultInstance();
	final Books books = new Books.Builder(GoogleNetHttpTransport.newTrustedTransport(), jsonFactory, null)
			.build();
	
	System.out.println("Right here 2");
	List volumesList = books.volumes().list(title);
	volumesList.setKey(api);
	Volumes volumes = volumesList.execute();
	int size = volumes.getTotalItems();
	System.out.println("Right here 3");
	
	String titles[] = new String[10];
	String images[] = new String[10];
	String authors[] = new String[10];
	String publishers[] = new String[10];
	double ratings[] = new double[10];
	String descriptions[] = new String[10];
	int count = 0;
	int skip = -1;
	int real = 0;
	String writer = "";
	for (Volume volume : volumes.getItems()) {
		Volume.VolumeInfo volumeInfo = volume.getVolumeInfo();
		if (volumeInfo.getTitle() != null) {
			titles[count] = volumeInfo.getTitle();
		}
		else {
			titles[count] = "";
		}
	
		if (volumeInfo.getDescription() != null) {
			descriptions[count] = volumeInfo.getDescription();
		}
		else {
			descriptions[count] = "";
		}
	
		if (volumeInfo.getPublisher() != null) {
			publishers[count] = volumeInfo.getPublisher();
		}
		else {
			publishers[count] = "";
		}
		Volume.VolumeInfo.ImageLinks imageLinks = volumeInfo.getImageLinks();
		if (imageLinks.getThumbnail() != null) {
			images[count] = imageLinks.getThumbnail();
		}
		else {
			images[count] = "";
		}
		if (volumeInfo.getAverageRating() != null) {
			ratings[count] = volumeInfo.getAverageRating();
		}
		else {
			ratings[count] = 0.0;
		}
		java.util.List<String> author = volumeInfo.getAuthors();
		if ((author != null) && (!author.isEmpty())) {
			for (int i = 0; i < author.size(); ++i) {
				writer = writer + author.get(i);
				if (i < author.size() - 1) {
					writer = writer + ", ";
				}
			} 
		}
		else {
			writer = "";
		}
		authors[count] = writer;
		writer = "";
		if ((titles[count] == "") && (authors[count] == "") && (publishers[count] == "") && (descriptions[count] == "") && (images[count] == "") && (ratings[count] == 0.0)) {
		skip = count;
		}
		count++;
	}
	if ((skip > 0) && (skip < 9)) {
		real = skip;
	}
	else if (skip == 9) {
		real = count;
	}
	
%>
	
	<form name="myform" method="GET" action="Validation" onsubmit="return validate();">
		<div id="search">

			<table id="main-table">
				<tr>
					<td class="table"><a href="ajaxform.html" id="title">LibraMate</a></td>
					<td class="table"><input type="text" name="search" id="search1" placeholder="<%= keep%>"/>
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
	
	
	<form name="myform" method="GET" action="Information.jsp">
		<div id="div-results">
			<table id="table-results">
				<tr>
					<td class="post">
					
						<input type="hidden" name="title" value="<%=titles[0] %>">
						<input type="hidden" name="author" value="<%=authors[0] %>">
						<input type="hidden" name="publisher" value="<%=publishers[0] %>"> 
						<input type="hidden" name="description" value="<%=descriptions[0] %>">
						<input type="hidden" name="rating" value="<%=ratings[0] %>"> 
						<input type="hidden" name="image" value="<%=images[0] %>">
						<input class="image" type="image" name="which" src="<%=images[0]%>" value="0" alt="Submit">
						<p class="up"><%=titles[0]%></p>
						<p class="down">by <%=authors[0]%></p>
					</td>
					<td class="post">
						<input type="hidden" name="title" value="<%=titles[1] %>">
						<input type="hidden" name="author" value="<%=authors[1] %>">
						<input type="hidden" name="publisher" value="<%=publishers[1] %>"> 
						<input type="hidden" name="description" value="<%=descriptions[1] %>">
						<input type="hidden" name="rating" value="<%=ratings[1] %>"> 
						<input type="hidden" name="image" value="<%=images[1] %>">   
						<input class="image" type="image" name="which" src="<%=images[1]%>" value="1" alt="Submit">
						<p class="up"><%=titles[1]%></p>
						<p class="down">by <%=authors[1]%></p>
					</td>
					<td class="post">      
						<input type="hidden" name="title" value="<%=titles[2] %>">
						<input type="hidden" name="author" value="<%=authors[2] %>"> 
						<input type="hidden" name="publisher" value="<%=publishers[2] %>"> 
						<input type="hidden" name="description" value="<%=descriptions[2] %>">
						<input type="hidden" name="rating" value="<%=ratings[2] %>">
						<input type="hidden" name="image" value="<%=images[2] %>">
						<input class="image" type="image" name="which" src="<%=images[2]%>" value="2" alt="Submit">
						<p class="up"><%=titles[2]%></p>
						<p class="down">by <%=authors[2]%></p>
					</td>
					<td class="post">      
						<input type="hidden" name="title" value="<%=titles[3] %>">
						<input type="hidden" name="author" value="<%=authors[3] %>"> 
						<input type="hidden" name="publisher" value="<%=publishers[3] %>"> 
						<input type="hidden" name="description" value="<%=descriptions[3] %>">
						<input type="hidden" name="rating" value="<%=ratings[3] %>">
						<input type="hidden" name="image" value="<%=images[3] %>">
						<input class="image" type="image" name="which" src="<%=images[3]%>" value="3" alt="Submit">
						<p class="up"><%=titles[3]%></p>
						<p class="down">by <%=authors[3]%></p>
					</td>
				</tr>
				<tr>
					<td class="post">      
						<input type="hidden" name="title" value="<%=titles[4] %>">
						<input type="hidden" name="author" value="<%=authors[4] %>"> 
						<input type="hidden" name="publisher" value="<%=publishers[4] %>"> 
						<input type="hidden" name="description" value="<%=descriptions[4] %>">
						<input type="hidden" name="rating" value="<%=ratings[4] %>">
						<input type="hidden" name="image" value="<%=images[4] %>">
						<input class="image" type="image" name="which" src="<%=images[4]%>" value="4" alt="Submit">
						<p class="up"><%=titles[4]%></p>
						<p class="down">by <%=authors[4]%></p>
					</td>
					<td class="post">      
						<input type="hidden" name="title" value="<%=titles[5] %>">
						<input type="hidden" name="author" value="<%=authors[5] %>"> 
						<input type="hidden" name="publisher" value="<%=publishers[5] %>"> 
						<input type="hidden" name="description" value="<%=descriptions[5] %>">
						<input type="hidden" name="rating" value="<%=ratings[5] %>">
						<input type="hidden" name="image" value="<%=images[5] %>">
						<input class="image" type="image" name="which" src="<%=images[5]%>" value="5" alt="Submit">
						<p class="up"><%=titles[5]%></p>
						<p class="down">by <%=authors[5]%></p>
					</td>
					<td class="post">      
						<input type="hidden" name="title" value="<%=titles[6] %>">
						<input type="hidden" name="author" value="<%=authors[6] %>"> 
						<input type="hidden" name="publisher" value="<%=publishers[6] %>"> 
						<input type="hidden" name="description" value="<%=descriptions[6] %>">
						<input type="hidden" name="rating" value="<%=ratings[6] %>">
						<input type="hidden" name="image" value="<%=images[6] %>">
						<input class="image" type="image" name="which" src="<%=images[6]%>" value="6" alt="Submit">
						<p class="up"><%=titles[6]%></p>
						<p class="down">by <%=authors[6]%></p>
					</td>
					<td class="post">      
						<input type="hidden" name="title" value="<%=titles[7] %>">
						<input type="hidden" name="author" value="<%=authors[7] %>"> 
						<input type="hidden" name="publisher" value="<%=publishers[7] %>"> 
						<input type="hidden" name="description" value="<%=descriptions[7] %>">
						<input type="hidden" name="rating" value="<%=ratings[7] %>">
						<input type="hidden" name="image" value="<%=images[7] %>">
						<input class="image" type="image" name="which" src="<%=images[7]%>" value="7" alt="Submit">
						<p class="up"><%=titles[7]%></p>
						<p class="down">by <%=authors[7]%></p>
					</td>
				</tr>
				<tr>
					<td class="post">      
						<input type="hidden" name="title" value="<%=titles[8] %>">
						<input type="hidden" name="author" value="<%=authors[8] %>"> 
						<input type="hidden" name="publisher" value="<%=publishers[8] %>"> 
						<input type="hidden" name="description" value="<%=descriptions[8] %>">
						<input type="hidden" name="rating" value="<%=ratings[8] %>">
						<input type="hidden" name="image" value="<%=images[8] %>">
						<input class="image" type="image" name="which" src="<%=images[8]%>" value="8" alt="Submit">
						<p class="up"><%=titles[8]%></p>
						<p class="down">by <%=authors[8]%></p>
					</td>
					<td class="post">      
						<input type="hidden" name="title" value="<%=titles[9] %>">
						<input type="hidden" name="author" value="<%=authors[9] %>">
						<input type="hidden" name="publisher" value="<%=publishers[9] %>">
						<input type="hidden" name="description" value="<%=descriptions[9] %>">
						<input type="hidden" name="rating" value="<%=ratings[9] %>">
						<input type="hidden" name="image" value="<%=images[9] %>">
						<input class="image" type="image" name="which" src="<%=images[9]%>" value="9" alt="Submit">
						<p class="up"><%=titles[9]%></p>
						<p class="down">by <%=authors[9]%></p>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
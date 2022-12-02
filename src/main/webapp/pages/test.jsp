<h1> I am test page </h1>

welcome ${data}

<br>

<%
	out.println(request.getAttribute("data"));
%>
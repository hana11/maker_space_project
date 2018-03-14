<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary" id="">
		<%
			if (session.getAttribute("name") != null) {
		%>
		<a class="navbar-brand" href="mainService.jsp">MakerSpace</a>
		<%
			} else {
		%>
		<a class="navbar-brand" href="index.jsp">MakerSpace</a>
		<%
			}
		%>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
         data-target="#navbarColor01" aria-controls="navbarColor01"
         aria-expanded="false" aria-label="Toggle navigation"></button>
      <div class="collapse navbar-collapse" id="navbarColor01">
         <ul class="navbar-nav mr-auto">
         </ul>
         <%@include file="./loginInfo.jsp"%>
      </div>
   </nav>
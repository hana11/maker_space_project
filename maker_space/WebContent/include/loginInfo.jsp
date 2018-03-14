<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
			<% if(session.getAttribute("grade").equals("G") && session.getAttribute("name")!=null) { %>
			<body3><h8 class="navbar-brand2"><%=session.getAttribute("company")%> <%=session.getAttribute("name")%></h8></body3>
			<% 	}else if(session.getAttribute("grade").equals("A") && session.getAttribute("name")!=null) { %>
			<body3><h8 class="navbar-brand2">관리자 <%=session.getAttribute("name")%></h8></body3>
			<%	} else {}  %>
			&nbsp;&nbsp;
			<% if(session.getAttribute("name")!=null) { %>
			<form method="post" action="membercontroller"class="form-inline my-2 my-lg-0">
         	<input type="hidden" name="action" value="logout">
            <button type="submit" class="btn btn-secondary my-2 my-sm-0">로그아웃</button>
            </form>
			<% 	}else { %>
			<form class="form-inline my-2 my-lg-0">
				<button type="button" class="btn btn-secondary my-2 my-sm-0"
					onclick="location.href='login.jsp'">로그인</button>
			</form>
			&nbsp; &nbsp;
			<form class="form-inline my-2 my-lg-0">
				<button type="button" class="btn btn-secondary my-2 my-sm-0"
					onclick="location.href='register.jsp'">회원가입</button>
			</form>
			<%	}  %>

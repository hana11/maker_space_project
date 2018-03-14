<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<ul class="nav nav-pills flex-column">
	<li class="nav-item"><a class="nav-link active">아이디어</a></li>
	<li class="table-active"><a class="nav-link" href="boardcontroller?action=getBoards&category=it">정보기술</a></li>
	<li class="table-active"><a class="nav-link"
		href="boardcontroller?action=getBoards&category=market">영업 & 마케팅</a></li>
	<li class="table-active"><a class="nav-link"
		href="boardcontroller?action=getBoards&category=media">미디어</a></li>
	<li class="table-active"><a class="nav-link"
		href="boardcontroller?action=getBoards&category=etc">기타</a></li>
	<li class="table-active"><a class="nav-link" href="boardcontroller?action=getBoards&category=myIdea" >나의 아이디어</a></li>
	
	<br>
	<li class="nav-item"><a class="nav-link active">꿀팁</a></li>
	<li class="table-active"><a class="nav-link" href="tipboardcontroller?action=getTipBoards&category=tips">팁</a></li>
	<li class="table-active"><a class="nav-link" href="tipboardcontroller?action=getTipBoards&category=myTips">나의 팁</a></li>
	<li class="table-active"><a class="nav-link" href="myScraps.jsp">나의 팁 스크랩</a></li>
	<br>
  
  	<li class="nav-item"><a class="nav-link active">나의 페이지</a>
	
	<li class="nav-item dropdown">
    <a class ="nav-link" class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">아이디어 채택 현황</a>
    <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 48px, 0px); top: 0px; left: 0px; will-change: transform;">
      <a class="dropdown-item" href="boardcontroller?action=getBoards&category=select">채택 대기 아이디어</a>
      <a class="dropdown-item" href="#">승인 대기 아이디어</a>
      <a class="dropdown-item" href="#">채택완료 아이디어</a>
      </div>
  	</li>
	<li class="table-active"><a class="nav-link" href="membercontroller?action=getMyInfo">나의 계정</a> </li> <br>
	<%
if(session.getAttribute("grade").equals("A")) {
%>
	<li class="nav-item"><a class="nav-link active">관리자 메뉴</a></li>
	<li class="table-active"><a class="nav-link"
		href="membercontroller?action=getAllInfoByAdmin">회원 정보 관리</a></li><br>
	<%
} else {}
%>
</ul>
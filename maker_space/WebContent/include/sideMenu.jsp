<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<ul class="nav nav-pills flex-column">
	<li class="nav-item"><a class="nav-link active">���̵��</a></li>
	<li class="table-active"><a class="nav-link" href="boardcontroller?action=getBoards&category=it">�������</a></li>
	<li class="table-active"><a class="nav-link"
		href="boardcontroller?action=getBoards&category=market">���� & ������</a></li>
	<li class="table-active"><a class="nav-link"
		href="boardcontroller?action=getBoards&category=media">�̵��</a></li>
	<li class="table-active"><a class="nav-link"
		href="boardcontroller?action=getBoards&category=etc">��Ÿ</a></li>
	<li class="table-active"><a class="nav-link" href="boardcontroller?action=getBoards&category=myIdea" >���� ���̵��</a></li>
	
	<br>
	<li class="nav-item"><a class="nav-link active">����</a></li>
	<li class="table-active"><a class="nav-link" href="tipboardcontroller?action=getTipBoards&category=tips">��</a></li>
	<li class="table-active"><a class="nav-link" href="tipboardcontroller?action=getTipBoards&category=myTips">���� ��</a></li>
	<li class="table-active"><a class="nav-link" href="myScraps.jsp">���� �� ��ũ��</a></li>
	<br>
  
  	<li class="nav-item"><a class="nav-link active">���� ������</a>
	
	<li class="nav-item dropdown">
    <a class ="nav-link" class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">���̵�� ä�� ��Ȳ</a>
    <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 48px, 0px); top: 0px; left: 0px; will-change: transform;">
      <a class="dropdown-item" href="boardcontroller?action=getBoards&category=select">ä�� ��� ���̵��</a>
      <a class="dropdown-item" href="#">���� ��� ���̵��</a>
      <a class="dropdown-item" href="#">ä�ÿϷ� ���̵��</a>
      </div>
  	</li>
	<li class="table-active"><a class="nav-link" href="membercontroller?action=getMyInfo">���� ����</a> </li> <br>
	<%
if(session.getAttribute("grade").equals("A")) {
%>
	<li class="nav-item"><a class="nav-link active">������ �޴�</a></li>
	<li class="table-active"><a class="nav-link"
		href="membercontroller?action=getAllInfoByAdmin">ȸ�� ���� ����</a></li><br>
	<%
} else {}
%>
</ul>
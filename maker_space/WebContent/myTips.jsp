<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<head>
<title>MakerSpace</title>
<link rel="stylesheet" href="./Resource/mms/vendor/bootstrap/css/my.css" />
<!-- Bootstrap core CSS -->
<link href="./Resource/mms/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap side-bar menu -->
<link href="./Resource/mms/vendor/bootstrap/css/shop-homepage.css"
	rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="./Resource/mms/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="./Resource/mms/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link href="./Resource/mms/vendor/simple-line-icons/css/my.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template -->
<link href="./Resource/mms/css/landing-page.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<style>
.a {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.writeBtnLoca {
	text-algin: right;
}

.floatRight {
	float: right;
}
</style>
</head>
<body>
<%
      String CONTEXT_PATH = application.getContextPath();
%>
   <!-- Navigation -->
  <!-- Navigation -->
    <!-- Navigation -->
	
	<%@include file="./include/topMenu.jsp"%>
   <!-- Page Content -->
   <div class="container">
      <div class="row">
         <!-- Side Menu -->
         <div class="col-lg-3">
           <h1 class="my-4">&nbsp;</h1>
            <%@include file="./include/sideMenu.jsp"%>
         </div>
			
			<!-- Table -->
			<div class="col-lg-9">
				<h1 class="my-4">&nbsp;</h1>
			<div class="container">
			<ol class="breadcrumb">
            	<li class="breadcrumb-item">나의 팁</li>
            </ol>
            </div>
            
				<div class="container">
					<table class="table table-hover" style="border: solid 2px #cccccc">
						<thead>
							<tr class="table-active">
								<th scope="col"> </th>
								<th scope="col">제 목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
								<th scope="col">조회수</th>
								<th scope="col">스크랩수</th>
							</tr>
						</thead>

						<c:if test="${tipMap.lists.size()==0 }">
							<tfoot>
								<tr align="center">
									<td width="5"></td>
									<td width="250">현재 게시글이 존재하지 않습니다!</td>
									<td width="50"></td>
									<td width="10"></td>
									<td width="5"></td>
								</tr>
							</tfoot>
						</c:if>
						<tbody>
							<c:forEach items="${tipMap.lists}" var="dto" varStatus="status">
								<tr>
									<td width="5"><c:out value="${tipMap.pageTotalCount - status.index}" /></td>
									<td width="240"><a
										href="boardcontroller?action=getTipBoard&category=myTips&tipBoardsIndex=${dto.tipIdx}"><c:out
												value="${dto.title}" /></a></td>
									<td width="50"><c:out value="${dto.name}" /></td>
									<td width="10"><c:out value="${dto.writeDate}" /></td>
									<td width="5"><c:out value="${dto.hits}" /></td>
									<td width="5"><c:out value="${dto.scraps}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div align="center">
					<!-- Paginatoin -->
					<div style="display: inline-block; vertical-align: middle;">
						<ul class="pagination">
							<c:if test="${tipMap.prevPage <= 0}">
								<li class="page-item disabled"><a class="page-link">&laquo;</a>
								</li>
							</c:if>
							<c:if test="${tipMap.prevPage > 0}">
								<li class="page-item"><a class="page-link"
									href="boardcontroller?action=getTipBoards&page=${tipMap.prevPage}&category=myTips&field=${tipMap.field }">&laquo;</a>
								</li>
							</c:if>
							<c:if test="${tipMap.pageCount <= 5}">
								<c:forEach begin="${tipMap.beginPage}"
									end="${tipMap.beginPage + tipMap.pageCount - 1}" var="page">
									<c:choose>
										<c:when test="${tipMap.currentPage == page}">
											<li class="page-item active"><a class="page-link"
												href="#">${page}</a>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="boardcontroller?action=getTipBoards&page=${page}&field=${tipMap.field}&category=myTips">${page}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:if>
							<c:if test="${tipMap.pageCount > 5}">
								<c:forEach begin="${tipMap.beginPage}" end="${tipMap.endPage}"
									var="page">
									<c:choose>
										<c:when test="${tipMap.currentPage == page}">
											<li class="page-item active"><a class="page-link"
												href="#">${page}</a>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="boardcontroller?action=getTipBoards&page=${page}&field=${tipMap.field}&category=myTips">${page}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:if>
							<c:if test="${tipMap.nextPage <= 0}">
								<li class="page-item disabled"><a class="page-link">&raquo;</a>
								</li>
							</c:if>
							<c:if test="${tipMap.nextPage > 0}">
								<li class="page-item"><a class="page-link"
									href="boardcontroller?action=getTipBoards&page=${tipMap.nextPage}&field=${tipMap.field }&category=myTips">&raquo;</a>
								</li>
							</c:if>
						</ul>
					</div>
           
         </div>
      </div>
   </div>
   </div>

</body>
</html>
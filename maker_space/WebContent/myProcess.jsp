<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% int flag =0 ; %>   
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

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
					<div class="container">
              	 <ol class="breadcrumb">
                  <li class="breadcrumb-item">���̵�� ä����Ȳ</li>
               </ol>
			</div>
            </div>

				<div class="container">
					<table class="table table-hover" style="border: solid 2px #cccccc">
						<thead>
							<tr class="table-active">
								<th scope="col"></th>
								<th scope="col">�� ��</th>
								<th scope="col">�ۼ���</th>
								<th scope="col">�ۼ���</th>
								<th scope="col">��ȸ��</th>
							</tr>
						</thead>

						<c:if test="${map.lists.size()==0 }">
							<tfoot>
								<tr align="center">
									<td width="5"></td>
									<td width="250">���� �Խñ��� �������� �ʽ��ϴ�!</td>
									<td width="50"></td>
									<td width="10"></td>
									<td width="5"></td>
								</tr>
							</tfoot>
						</c:if>
						<tbody>
							<c:forEach items="${map.lists}" var="dto" varStatus="status">
								<tr>
									<td width="5"><c:out
											value="${map.pageTotalCount - status.index}" /></td>
									<td width="250"><a
										href="boardcontroller?action=getBoard&category=select&boardIndex=${dto.businessIdx}"><c:out
												value="${dto.title}" /></a></td>
									<td width="50"><c:out value="${dto.name}" /></td>
									<td width="10"><c:out value="${dto.writeDate}" /></td>
									<td width="5"><c:out value="${dto.hits}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div align="center">
					<!-- Paginatoin -->
					<div style="display: inline-block; vertical-align: middle;">
						<ul class="pagination">
							<c:if test="${map.prevPage <= 0}">
								<li class="page-item disabled"><a class="page-link">&laquo;</a>
								</li>
							</c:if>
							<c:if test="${map.prevPage > 0}">
								<li class="page-item"><a class="page-link"
									href="boardcontroller?action=getBoard&page=${map.prevPage}&category=select&field=${map.field }">&laquo;</a>
								</li>
							</c:if>
							<c:if test="${map.pageCount <= 5}">
								<c:forEach begin="${map.beginPage}"
									end="${map.beginPage + map.pageCount - 1}" var="page">
									<c:choose>
										<c:when test="${map.currentPage == page}">
											<li class="page-item active"><a class="page-link"
												href="#">${page}</a>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="boardcontroller?action=getBoard&page=${page}&field=${map.field}&category=select">${page}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:if>
							<c:if test="${map.pageCount > 5}">
								<c:forEach begin="${map.beginPage}" end="${map.endPage}"
									var="page">
									<c:choose>
										<c:when test="${map.currentPage == page}">
											<li class="page-item active"><a class="page-link"
												href="#">${page}</a>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="boardcontroller?action=getBoard&page=${page}&field=${map.field}&category=select">${page}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:if>
							<c:if test="${map.nextPage <= 0}">
								<li class="page-item disabled"><a class="page-link">&raquo;</a>
								</li>
							</c:if>
							<c:if test="${map.nextPage > 0}">
								<li class="page-item"><a class="page-link"
									href="boardcontroller?action=getBoard&page=${map.nextPage}&field=${map.field }&category=select">&raquo;</a>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
		</div>
	</div>
</div>
	<%@include file="./include/footer.jsp" %>

	<!-- Bootstrap core JavaScript -->
	<script src="./Resource/mms/vendor/jquery/jquery.min.js"></script>
	<script src="./Resource/mms/vendor/jquery/jquery.slim.min.js"></script>
	<script
		src="./Resource/mms/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="./Resource/mms/vendor/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

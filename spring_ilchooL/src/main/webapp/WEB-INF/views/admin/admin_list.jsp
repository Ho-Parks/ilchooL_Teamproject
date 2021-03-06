<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,
  maximum-scale=1.0,user-scalable=no">
<title>Admin</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/ico/favicon.png" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath }/assets/ico/apple-touch-icon-144-precomposed.png" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../assets/css/admin_header.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
* {
	font-family: NanumGothic;
}

body {
	padding-top: 50px;
}

.navbar-fixed-top {
	border: 0;
}

.sidebar {
	display: none;
}

@media ( min-width : 768px) {
	.sidebar {
		position: fixed;
		top: 51px;
		bottom: 0;
		left: 0;
		z-index: 1000;
		display: block;
		padding: 20px;
		overflow-x: hidden;
		overflow-y: auto;
		background-color: #f5f5f5;
		border-right: 1px solid #eee;
	}
}

.nav-sidebar {
	margin-right: -21px;
	margin-bottom: 20px;
	margin-left: -20px;
}

.nav-sidebar>li>a {
	padding-right: 20px;
	padding-left: 20px;
}

.nav-sidebar>.active>a, .nav-sidebar>.active>a:hover, .nav-sidebar>.active>a:focus
	{
	color: #fff;
	background-color: #428bca;
}

.main {
	padding: 20px;
}

@media ( min-width : 768px) {
	.main {
		padding-right: 40px;
		padding-left: 40px;
	}
}

.main .page-header {
	margin-top: 0;
}

.main {
	color: #333;
}

input {
	display: inline-block;
	height: 33px;
	font-size: 13px;
	color: #000;
	border: 2px solid#87CEFA;
	border-radius: 4px;
	vertical-align: middle;
	padding: 5px 10px ;
	outline: 0;
	-webkit-appearance: none;
	background-color: transparent;
}
</style>
</head>

<body>

	<%@include file="admin_header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="${pageContext.request.contextPath}/admin/admin_dashboard.do"><span
							class="glyphicon glyphicon-th"></span> ????????????</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/admin/admin_list.do"><span
							class="glyphicon glyphicon-user"></span> ?????????</a></li>
				</ul>
			</div>
			<!-- contents -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h2 class="page-header">?????? ?????????</h2>

				<div class="table-responsive">
   <!-- ????????? -->
    <form method="get" action="${pageContext.request.contextPath}/admin/admin_list.do">
        <label for="keyword" class="search">??????: </label>
        <input type="search" name="keyword" id="keyword" placeholder="?????? ??????" value="${keyword}" />
        <button type="submit" class="btn btn-info outline">??????</button>
    </form>

    <hr />

    <!-- ?????? ?????? ?????? -->
    <table class="table table-hover">
        <thead>
            <tr>
                <th class="text-center">#</th>
                <th class="text-center">?????????</th>
                <th class="text-center">??????</th>
                <th class="text-center">?????????</th>
                <th class="text-center">??????</th>
                <th class="text-center">??????</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <%-- ??????????????? ?????? ?????? --%>
                <c:when test="${output == null || fn:length(output) == 0}">
                    <tr>
                        <td colspan="3" align="center">??????????????? ????????????.</td>
                    </tr>
                </c:when>
                <%-- ??????????????? ??????  ?????? --%>
                <c:otherwise>
                    <%-- ?????? ????????? ?????? ?????? ?????? --%>
                    <c:forEach var="item" items="${output}" varStatus="status">
                        <%-- ????????? ?????? ????????? ??????????????? ?????? --%>
                        <c:set var="user_id" value="${item.user_id}" />
                        <c:set var="user_name" value="${item.user_name}" />
                        <c:set var="email" value="${item.email}" />
                        <c:set var="phone" value="${item.phone}" />

                        <%-- ???????????? ?????????? --%>
                        <c:if test="${keyword != ''}">
                            <%-- ???????????? <mark> ????????? ???????????? ????????? ?????? ?????? --%>
                            <c:set var="mark" value="<mark>${keyword}</mark>" />
                            <%-- ????????? ?????? ????????? ??????????????? ???????????? ???????????? ???????????? ????????? ????????? ????????? ?????? --%>
                            <c:set var="user_id" value="${fn:replace(user_id, keyword, mark)}" />
                            <c:set var="user_name" value="${fn:replace(user_name, keyword, mark)}" />
                            <c:set var="email" value="${fn:replace(email, keyword, mark)}" />
                            <c:set var="phone" value="${fn:replace(phone, keyword, mark)}" />
                        </c:if>
                        
                        <tr>
                            <td class="text-center">${item.id}</td>
                            <td class="text-center">${user_id}</td>
                            <td class="text-center">${user_name}</td>
                            <td class="text-center">${email}</td>
                            <td class="text-center">${phone}</td>
                            <td class="text-center"><a href="${pageContext.request.contextPath}/admin/admin_modify.do?id=${item.id}" class="btn btn-primary outline btn-sm">??????</a>
                            <a href="${pageContext.request.contextPath}/admin/delete_ok.do?id=${item.id}" class="btn btn-danger outline btn-sm">??????</a>
                            <a href="${pageContext.request.contextPath}/admin/admin_log.do?id=${item.id}" class="btn btn-success outline btn-sm">??????</a></td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
    
        <!-- ????????? ?????? ?????? -->
    <%-- ?????? ????????? ?????? ?????? --%>
    <c:choose>
        <%-- ?????? ???????????? ?????? ???????????????? --%>
        <c:when test="${pageData.prevPage > 0}">
            <%-- ????????? URL ?????? --%>
            <c:url value="/admin/admin_list.do" var="prevPageUrl">
                <c:param name="page" value="${pageData.prevPage}" />
                <c:param name="keyword" value="${keyword}" />
            </c:url>
            <a href="${prevPageUrl}">[??????]</a>
        </c:when>
        <c:otherwise>
            [??????]
        </c:otherwise>
    </c:choose>
    
    <%-- ????????? ?????? (?????? ????????? ?????? ??? ??????????????? ??????) --%>
    <c:forEach var="i" begin="${pageData.startPage}" end="${pageData.endPage}" varStatus="status">
        <%-- ????????? URL ?????? --%>
        <c:url value="/admin/admin_list.do" var="pageUrl">
            <c:param name="page" value="${i}" />
            <c:param name="keyword" value="${keyword}" />
        </c:url>
        
        <%-- ????????? ?????? ?????? --%>
        <c:choose>
            <%-- ?????? ????????? ?????? ????????? ????????? ????????? ?????? ?????? ?????? ?????? --%>
            <c:when test="${pageData.nowPage == i}">
                <strong>[${i}]</strong>
            </c:when>
            <%-- ????????? ???????????? ?????? ?????? ????????? --%>
            <c:otherwise>
                <a href="${pageUrl}">[${i}]</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    
    <%-- ?????? ????????? ?????? ?????? --%>
    <c:choose>
        <%-- ?????? ???????????? ?????? ???????????????? --%>
        <c:when test="${pageData.nextPage > 0}">
            <%-- ????????? URL ?????? --%>
            <c:url value="/admin/admin_list.do" var="nextPageUrl">
                <c:param name="page" value="${pageData.nextPage}" />
                <c:param name="keyword" value="${keyword}" />
            </c:url>
            <a href="${nextPageUrl}">[??????]</a>
        </c:when>
        <c:otherwise>
            [??????]
        </c:otherwise>
    </c:choose>

				</div>
			</div>
			<!-- contents -->
		</div>
	</div>
	<div class="modal fade" id="delete_user">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">?????? ?????? ??????</h4>
				</div>
				<div class="modal-body">
					<p>?????? ????????? ?????????????????????????</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">??????</button>
				</div>
			</div>
		</div>
	</div>
	<footer>
        <div class="container-fluid">
            <div class="col-md-12 text-right">
                <p>&copy;2021 <span class="text-primary">ilchooL.</span> All Rights Reserved.</p>
            </div>
        </div>
    </footer>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>

</html>
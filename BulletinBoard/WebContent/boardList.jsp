<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dao.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.BoardVO"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>  
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
	<body>
	<%-- 게시판 출력 --%>
	<jsp:include page="header.jsp" flush="true"/>
	<%!
		//변수 선언
		int size = 0;
		List<BoardVO> resultList = new ArrayList<BoardVO>();
		BoardDAO boardDAO = new BoardDAO();
	%>
	<%
		resultList = boardDAO.selectBoardList();
		size = resultList.size();
		pageContext.setAttribute("resultList", resultList);
	%>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>분류</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty resultList}">
						<tr>
							<td colspan="5">데이터 없음.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${resultList}" var="result" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${result.board_div}</td>
								<td><a href="boardDtl.jsp?board_idx=${result.board_idx}">${result.board_title}</a></td>
								<td>${result.board_name}</td>
								<td>${result.board_content}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
<%-- 				<% for(int i=0; i<size; i++){ %> --%>
<!-- 				<tr> -->
<%-- 					<td><%=resultList.get(i).getBoard_idx()%></td> --%>
<%-- 					<td><%=resultList.get(i).getBoard_div().equals("0001") ? "공지사항" : "자유게시판"%></td> --%>
<%-- 					<td><a href="boardDtl.jsp?board_idx=<%=resultList.get(i).getBoard_idx()%>"><%=resultList.get(i).getBoard_title()%></a></td> --%>
<%-- 					<td><%=resultList.get(i).getBoard_name()%></td> --%>
<%-- 					<td><%=resultList.get(i).getBoard_content()%></td> --%>
<!-- 				</tr> -->
<%-- 				<%} %> --%>
			</tbody>
		</table>
		<hr/>
		<button type="button" class="btn btn-primary pull-right" onclick="javascript:location.href='boardReg.jsp';">글쓰기</button>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
	</script>
	</body>
</html>
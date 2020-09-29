<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@page import="dao.BoardDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<jsp:useBean id="boardVO" class="vo.BoardVO" />
	<jsp:setProperty property="*" name="boardVO" />
	<%
		//캐릭터셋 설정
		BoardDAO boardDAO = new BoardDAO();
		boardDAO.insertBoard(boardVO);
	%>
	<!-- 데이터 등록 이후 리스트페이지 이동 -->
	<jsp:forward page="boardList.jsp" />
</body>
</html>
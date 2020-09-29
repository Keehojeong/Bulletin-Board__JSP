<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>  
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
	<body>
	<%-- 게시판 출력 --%>
	<jsp:include page="header.jsp" flush="true"/>
	<jsp:useBean id="boardDAO" class="dao.BoardDAO" />
	<jsp:useBean id="boardVO" class="vo.BoardVO" />
	<jsp:setProperty property="*" name="boardVO" />
	<%
		//캐릭터셋 설정
		String board_idx = request.getParameter("board_idx");
		
		boardVO = boardDAO.selectBoardDtl(board_idx);
		pageContext.setAttribute("boardVO", boardVO);
	%>
		<form id="detailForm" name="detailForm" action="boardDtlProc.jsp" method="post">
			<%-- board 테이블 PK값 --%>
			<input type="hidden" id="board_idx" name="board_idx" value="${boardVO.board_idx}" />
			<table class="table table-striped">
				<thead>
					<tr>
						<th>이름</th>
						<td>${boardVO.board_name}</td>
						<th>전자메일</th>
						<td>${boardVO.board_email}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td  colspan="3">${boardVO.board_title}</td>
					</tr>
					<tr>
						<th>종류</th>
						<td colspan="3">
							<c:if test="${boardVO.board_div eq '0001'}">공지사항</c:if>
							<c:if test="${boardVO.board_div eq '0002'}">자유게시판</c:if>
						</td>
					</tr>
					<tr>
						<th>게시글 시작일</th>
						<td>${boardVO.board_from_date}</td>
						<th>게시글 종료일</th>
						<td>${boardVO.board_to_date}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
							<textarea id="board_content" name="board_content" readonly="readonly" style="width:90%; height:200px;">${boardVO.board_content}</textarea>
						</td>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<hr/>
			비밀번호 : <input type="password" id="board_pw" name="board_pw" value="" />
			<button type="button" class="btn btn-success pull-right" onclick="javascript:location.href='boardUpd.jsp?board_idx=<%=boardVO.getBoard_idx()%>'">수정</button>
			<button type="submit" class="btn btn-danger pull-right">삭제</button>
			<button type="button" class="btn btn-info pull-right" onclick="javascript:location.href='boardList.jsp'">목록보기</button>
			<button type="button" class="btn btn-warning pull-right" onclick="javascript:history.back();">취소</button>
		</form>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
	</script>
	</body>
</html>
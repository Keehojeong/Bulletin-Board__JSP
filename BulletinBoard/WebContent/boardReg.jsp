<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<form id="insertForm" name="insertForm" action="boardRegProc.jsp" method="post">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>이름</th>
						<td><input type="text" id="board_name" name="board_name" value="" /></td>
						<th>전자메일</th>
						<td><input type="text" id="board_email" name="board_email" value="" /></td>
					</tr>
					<tr>
						<th>제목</th> 
						<td colspan="3"><input type="text" id="board_title" name="board_title" value="" style="width:90%;"/></td>
					</tr>
					<tr>
						<th>종류</th>
						<td colspan="3">
							<select id="board_div" name="board_div">
								<option value="0001">공지사항</option>
								<option value="0002">자유게시판</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>게시글 시작일</th>
						<td><input type="text" id="board_from_date" name="board_from_date" value="" /></td>
						<th>게시글 종료일</th>
						<td><input type="text" id="board_to_date" name="board_to_date" value="" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
							<textarea id="board_content" name="board_content" style="width:90%; height:200px;"></textarea>
						</td>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<hr/>
			비밀번호 : <input type="password" id="board_pw" name="board_pw" value="" />
			<button type="submit" class="btn btn-success pull-right">저장</button>
			<button type="button" class="btn btn-warning pull-right" onclick="javascript:history.back();">취소</button>
		</form>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/bootstrap.min.js"></script>
	</body>
</html>
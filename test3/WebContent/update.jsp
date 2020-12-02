<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

int num = Integer.parseInt(request.getParameter("num"));
System.out.println(num);
String user = "kosea";
String password = "1234";
String uri = "jdbc:oracle:thin:@localhost:1521:xe";
String sql = "select * from member_tbl_02 where custno =" + num;
System.out.println("select * from member_tbl_02 where custno = " + num);
Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection(uri, user, password);
stmt = conn.createStatement();
rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="updateAction.jsp" method="post">
		<%@include file="header.jsp"%>
		<hr>
		<%@include file="nav.jsp"%>
		<hr>
		<div align="center">
			<h3>홈쇼핑 회원 정보 수정</h3>
			<table border="1">
			<%
			try {
				while(rs.next()) {
					out.println("<input type='hidden' name='custnov' value='" + rs.getInt("custno") + "'>");
					out.println("<tr>");
					out.println("<td>회원번호(자동생성)</td>");
					out.println("<td><input type='text' name='custno' value='" + rs.getInt("custno") + "'></td>");
					out.println("</tr>");
					out.println("<tr>");
					out.println("<td>회원성명</td>");
					out.println("<td><input type='text' name='custname' value='" + rs.getString("custname") + "'></td>");
					out.println("</tr>");
					out.println("<tr>");
					out.println("<td>회원전화</td>");
					out.println("<td><input type='text' name='phone' value='" + rs.getString("phone") + "'></td>");
					out.println("</tr>");
					out.println("<tr>");
					out.println("<td>회원주소</td>");
					out.println("<td><input type='text' name='address' value='" + rs.getString("address") + "'></td>");
					out.println("</tr>");
					out.println("<tr>");
					out.println("<td>가입일자</td>");
					out.println("<td><input type='text' name='joindate' value='" + rs.getDate("joindate") + "'></td>");
					out.println("</tr>");
					out.println("<tr>");
					out.println("<td>고객등급(A:VIP, B:일반, C:직원)</td>");
					out.println("<td><input type='text' name='grade' value='" + rs.getString("grade") + "'></td>");
					out.println("</tr>");
					out.println("<tr>");
					out.println("<td>도시코드</td>");
					out.println("<td><input type='text' name='city' value='" + rs.getInt("city") + "'></td>");
					out.println("</tr>");
					} 	
				}catch(Exception e) {
					e.printStackTrace();
				}
			%>
			</table>
			<input type="submit" value="수정" onClick ="return real();">
			<a href="show.jsp"><input type="button" value="조회"></a>
		</div>
	</form>
	<script type="text/javascript">
	function real() {
		var result = confirm("정말 수정하시겠습니까?");
		if(result){
			return true;
		}else{
			return false;
		}
	}
	</script>
</body>
</html>
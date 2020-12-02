<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String user = "kosea";
	String password = "1234";
	String uri = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "select * from member_tbl_02";
	
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
<%@include file="header.jsp" %>
<hr>
<%@include file="nav.jsp" %>
<hr>
<div align="center">
<h3>회원목록조회/수정</h3>
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>고객등급</th>
			<th>거주지역</th>
		</tr>
		<%	
			try{
				while(rs.next()) {
					out.println("<tr>");
					out.println("<td>" + "<a href='update.jsp?num=" +rs.getInt("custno") + "'>" + rs.getInt("custno") + "</a></td>");
					out.println("<td>" + rs.getString("custname") + "</td>");
					out.println("<td>" + rs.getString("phone") + "</td>");
					out.println("<td>" + rs.getString("address") + "</td>");
					out.println("<td>" + rs.getDate("joindate") + "</td>");
					if(rs.getString("grade").equals("A")) {
						out.println("<td>" + "VIP" + "</td>");	
					} else if(rs.getString("grade").equals("B")) {
						out.println("<td>" + "일반" + "</td>");
					} else if(rs.getString("grade").equals("C")) {
						out.println("<td>" + "직원" + "</td>");
					}
					out.println("<td>" + rs.getString("city") + "</td>");
					out.println("</tr>");
				}		
		} catch(Exception e) {
			e.printStackTrace();
		}
		%>
	</table>
</div>
</body>
</html>
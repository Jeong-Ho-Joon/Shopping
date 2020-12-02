<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	Date d = new Date();
	
	String date = sdf.format(d);
	int custno = 0;
	
	String user = "kosea";
	String password = "1234";
	String uri = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "select custno from member_tbl_02";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(uri, user, password);
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	try {
		while(rs.next()) {
			custno = rs.getInt("custno");
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="addAction.jsp" method="post">
<%@include file="header.jsp" %>
<hr>
<%@include file="nav.jsp" %>
<hr>
<div align="center">
<h3>홈쇼핑 회원등록</h3>
<table border="1">
	<tr>
		<td>회원번호(자동생성)</td>
		<td><input type="text" name="custno" value="<%=custno + 1%>" readOnly></td>
	</tr>
	<tr>
		<td>회원성명</td>
		<td><input type="text" name="custname"></td>
	</tr>
	<tr>
		<td>회원전화</td>
		<td><input type="text" name="phone"></td>
	</tr>
	<tr>
		<td>회원주소</td>
		<td><input type="text" name="address"></td>
	</tr>
	<tr>
		<td>가입일자</td>
		<td><input type="text" name="joindate" value="<%= date%>" readOnly></td>
	</tr>
	<tr>
		<td>고객등급(A:VIP, B:일반, C:직원)</td>
		<td><input type="text" name="grade"></td>
	</tr>
	<tr>
		<td>도시코드</td>
		<td><input type="text" name="city"></td>
	</tr>
</table>
<input type="submit" value="등록">
<a href="show.jsp"><input type="button" value="조회"></a>
</div>
</form>
</body>
</html>
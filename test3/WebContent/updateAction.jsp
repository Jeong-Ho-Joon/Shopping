<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String custnov = request.getParameter("custnov");
	System.out.println(custnov);

	Connection conn = null;
	PreparedStatement pstmt = null;

	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");

	System.out.println(custno);
	System.out.println(custname);
	System.out.println(phone);
	System.out.println(address);
	System.out.println(joindate);
	System.out.println(grade);
	System.out.println(city);

	String user = "kosea";
	String password = "1234";
	String uri = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "update member_tbl_02 set custno=?, custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?";

	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(uri, user, password);
	pstmt = conn.prepareStatement(sql);
	try {
		pstmt.setInt(1, Integer.parseInt(custno));
		pstmt.setString(2, custname);
		pstmt.setString(3, phone);
		pstmt.setString(4, address);
		pstmt.setString(5, joindate);
		pstmt.setString(6, grade);
		pstmt.setString(7, city);
		pstmt.setString(8, custnov);
		pstmt.executeUpdate();
	} catch (Exception e) {
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
	<script>
		location.href = "show.jsp";
	</script>
</body>
</html>
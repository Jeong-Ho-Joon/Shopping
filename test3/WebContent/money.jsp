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
	String sql = "select mm.custno, mm.custname, mm.grade, sum(price) from member_tbl_02 mm, money_tbl_02 mn where mm.custno = mn.custno group by mm.custno, mm.custname, mm.grade order by sum(price) desc";
	
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
<h3>ȸ��������ȸ</h3>
	<table border="1">
		<tr>
			<th>ȸ����ȣ</th>
			<th>ȸ������</th>
			<th>�����</th>
			<th>����</th>
		</tr>
		<%	
			try{
				while(rs.next()) {
					out.println("<tr>");
					out.println("<td>" + rs.getInt("custno") + "</td>");
					out.println("<td>" + rs.getString("custname") + "</td>");
					if(rs.getString("grade").equals("A")) {
						out.println("<td>" + "VIP" + "</td>");	
					} else if(rs.getString("grade").equals("B")) {
						out.println("<td>" + "�Ϲ�" + "</td>");
					} else if(rs.getString("grade").equals("C")) {
						out.println("<td>" + "����" + "</td>");
					}
					out.println("<td>" + rs.getString("sum(price)") + "</td>");
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBConn.jsp" %>
<%
request.setCharacterEncoding("utf-8");
String custno=request.getParameter("custno");
String custname=request.getParameter("custname");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String joindate=request.getParameter("joindate");
String grade=request.getParameter("grade");
String city=request.getParameter("city");

PreparedStatement pstmt=null;
try{
	String sql="insert into member1026 values(mem_seq.nextval,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	/* pstmt.setString(1,custno); */
	pstmt.setString(1,custname);
	pstmt.setString(2,phone);
	pstmt.setString(3,address);
	pstmt.setString(4,joindate);
	pstmt.setString(5,grade);
	pstmt.setString(6,city);
	pstmt.executeUpdate();
	%>
	<script>
	alert("등록이 완료되었습니다.")
	location.href="select.jsp"
	</script>
	<%
}catch(Exception e){
	System.out.println("등록이 완료되지 않았습니다.");
	e.printStackTrace();
}
%>

</body>
</html>
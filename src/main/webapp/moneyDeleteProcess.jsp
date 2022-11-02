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
PreparedStatement pstmt=null;
String custno=request.getParameter("custno");
String salenol=request.getParameter("salenol");
System.out.println("custno : "+custno);
System.out.println("salenol: "+salenol);

try{
	String sql="delete from money1026 where custno=? and salenol=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, custno);
	pstmt.setString(2, salenol);
	pstmt.executeUpdate();
	%>
	<script>
	alert("삭제완료");
	location.href="order_money.jsp";
	</script>
	<% 
	}catch(Exception e){
		System.out.println("데이터베이스오류");
		e.printStackTrace();
	}
			

%>

</body>
</html>
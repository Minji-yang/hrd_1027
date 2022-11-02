<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section>
<%@include file="DBConn.jsp"%>
<h3> 회원 목록 조회 / 수정</h3>
<table border=1 id="tab2">
<tr>
<th>상품코드</th>
<th>상품명</th>	
<th>단가</th>
<th>재고수량</th>
</tr>
<%
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	String sql="select pcode,pname,price,stockQty from product1026";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String pcode=rs.getString(1);
		String pname=rs.getString(2);
		String price=rs.getString(3);
		String stockQty=rs.getString(4);
	%>
	
<tr>
<td><%=pcode %></td>
<td><%=pname %></td>
<td><%=price %></td>
<td><%=stockQty %></td>
</tr>	

<%
	}
}catch(Exception e){
	System.out.println("조회실패");
	e.printStackTrace();
	
}  
%>
</table>
</section>
<footer>
<%@include file="footer.jsp" %>
</footer>
</body>
</html>
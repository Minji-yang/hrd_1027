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
<h3>회원 매출 정보 목록(상품명)</h3>

<table border=1 id="tab3">
<tr>
<th>no</th>
<th>상품코드</th>
<th>상품명</th>
<th>매출</th>
</tr>

<%
PreparedStatement pstmt=null;
ResultSet rs=null;
int no=0;
try{
	String sql="select a.pcode,b.pname,sum(a.price)from money1026 a,product1026 b where a.pcode=b.pcode group by a.pcode,b.pname order by a.pcode";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String pcode=rs.getString(1);
		String pname=rs.getString(2);
		String price=rs.getString(3);
		no++;
		%>
	
<tr>
<td><%=no%></td>
<td><%=pcode%></td>
<td><%=pname%></td>
<td><%=price%></td>
</tr>
<%}
	}catch(Exception e){System.out.println("데이터베이스 오류");
	e.printStackTrace();
	}
%>

</table>
</section>

<%@include file="footer.jsp" %>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order_goods</title>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section>
<h3> 회원 매출 정보 목록</h3>
<p>총 건의 매출정보가 있습니다.</p>
<table border=1 id="tab4">
<%@include file="DBConn.jsp"%>
<tr>
<th>no</th>
<th>회원번호</th>
<th>회원이름</th>
<th>판매번호</th>
<th>단가</th>
<th>수량</th>
<th>가격</th>
<th>상품코드</th>
<th>상품명</th>
<th>판매일자</th>

</tr>
<%
int no=0;
PreparedStatement pstmt=null;
ResultSet rs=null;
try{
	String sql="select a.custno,a.custname,b.salenol,b.pcost,b.amount,to_char(b.price,'999,999,999'),b.pcode,to_char(b.sdate,'YYYY-MM-DD'),c.pname from member1026 a,money1026 b,product1026 c where a.custno=b.custno and b.pcode=c.pcode order by pname";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String custno=rs.getString(1);
		String custname=rs.getString(2);
		String salenol=rs.getString(3);
		String pcost=rs.getString(4);
		String amount=rs.getString(5);
		String price=rs.getString(6);
		String pcode=rs.getString(7);
		String sdate=rs.getString(8);
		String pname=rs.getString(9);
		no++;
		%>
	
<tr>
<td><%=no%></td>
<td><%=custno%></td>
<td><%=custname %></td>
<td><%=salenol%></td>
<td><%=pcost%></td>
<td><%=amount%></td>
<td><%=price%></td>
<td><%=pcode%></td>
<td><%=pname %></td>
<td><%=sdate%></td>

</tr>
<%	}}catch(Exception e){System.out.println("조회실패");
	e.printStackTrace();
	}
%>

</table>
</section>

<%@include file="footer.jsp" %>
</body>
</html>
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
<h3>회원 매출 정보 목록(이름)</h3>
<%
PreparedStatement pstmt=null;
ResultSet rs=null;
int cnt=0;
try{
	String sql="select count(*) from money1026";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(Exception e){
	System.out.println("db에러");
	e.printStackTrace();
}
%>

<p>총<%=cnt%>건의 매출정보가 있습니다.</p>
<table border=1 id="tab4">
<tr>
<th>no</th>
<th>회원번호</th>
<th>회원이름</th>
<th>판매번호</th>
<th>단가</th>
<th>수량</th>
<th>가격</th>
<th>상품코드</th>
<th>판매일자</th>
</tr>


<%
int no=0;
try{
	String sql="select a.custno,b.custname,a.salenol,to_char(a.pcost,'999,999,999'),a.amount,to_char(a.price,'999,999,999'),a.pcode,to_char(a.sdate,'YYYY-MM-DD') from money1026 a,member1026 b where a.custno=b.custno";
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
		no++;
		%>
	
<tr>
<td><%=no%></td>
<td><%=custno%></td>
<td><%=custname%></td>
<td><%=salenol%></td>
<td><%=pcost%></td>
<td><%=amount%></td>
<td><%=price%></td>
<td><%=pcode%></td>
<td><%=sdate%></td>
</tr>
<%	}
	}catch(Exception e){System.out.println("데이터베이스 오류");
	e.printStackTrace();
	}
%>

</table>
</section>

<%@include file="footer.jsp" %>	
</body>
</html>
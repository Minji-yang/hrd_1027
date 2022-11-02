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
<h3>회원 매출 정보 목록</h3>
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

<p>총 <%=cnt%>건의 매출정보가 있습니다.</p>
<table border=1 id="tab4">
<tr>
<th>no</th>
<th>회원번호</th>
<th>판매번호</th>
<th>단가</th>
<th>수량</th>
<th>가격</th>
<th>상품코드</th>
<th>판매일자</th>
<th>구분</th>
</tr>


<%
int no=0;
try{
	String sql="select custno,salenol,to_char(pcost,'999,999,999'),amount,to_char(price,'999,999,999'),pcode,to_char(sdate,'YYYY-MM-DD') from money1026";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String custno=rs.getString(1);
		String salenol=rs.getString(2);
		String pcost=rs.getString(3);
		String amount=rs.getString(4);
		String price=rs.getString(5);
		String pcode=rs.getString(6);
		String sdate=rs.getString(7);
		no++;
		%>
	
<tr>
<td><%=no%></td>
<td><a href="moneyupdate.jsp?custno=<%=custno%>"><%=custno%></a></td>
<td><%=salenol%></td>
<td><%=pcost%></td>
<td><%=amount%></td>
<td><%=price%></td>
<td><%=pcode%></td>
<td><%=sdate%></td>
<td><a href="moneyDeleteProcess.jsp?custno=<%=custno%>&salenol=<%=salenol%>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false">삭제</a></td>
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
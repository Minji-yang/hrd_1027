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
<th>회원번호</th>
<th>회원성명</th>
<th>전화번호</th>
<th>주소</th>
<th>가입일자</th>
<th>고객등급</th>
<th>거주지역</th>
</tr>
<%PreparedStatement pstmt=null;
ResultSet rs=null;
try{
	String sql="select custno,custname,phone,address,to_char(joindate,'YYYY-MM-DD'),grade,city from member1026";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String custno=rs.getString(1);
		String custname=rs.getString(2);
		String phone=rs.getString(3);
		String address=rs.getString(4);
		if(address.equals("01")){address="서울";}
		else if(address.equals("02")){address="경기";}
		else if(address.equals("10")){address="대전";}
		else if(address.equals("20")){address="부산";}
		else if(address.equals("30")){address="광주";}
		else if(address.equals("40")){address="울산";}
		else if(address.equals("50")){address="대구";}
		else if(address.equals("60")){address="강원";}
		else if(address.equals("70")){address="경상";}
		else if(address.equals("80")){address="충청";}
		else if(address.equals("90")){address="제주";}
		String joindate=rs.getString(5);
		String grade=rs.getString(6);
		if(grade.equals("A")){grade="VIP";}
		else if(grade.equals("B")){grade="일반";}
		else if(grade.equals("C")){grade="직원";}
		String city=rs.getString(7);
		%>
<tr>
<td><a href="update.jsp?custno=<%=custno%>"><%=custno %></a></td>
<td><%=custname %></td>
<td><%=phone %></td>
<td><%=address %></td>
<td><%=joindate %></td>
<td><%=grade%></td>
<td><%=city %></td>
</tr>
<%
	}
}catch(Exception e){
	System.out.println("조회 실패"); 
	e.printStackTrace();
}


%>

</table>
</section>
<%@include file="footer.jsp" %>
</body>
</html>
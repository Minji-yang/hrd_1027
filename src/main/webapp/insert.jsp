<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
/* 	if(document.form.custno.value==""){
		alert("회원번호를 입력하세요")} */
	if(document.form.custname.value=="")
		{alert("회원이름을 입력하세요");
		document.form.custname.focus();}
	 else{document.form.submit();} }
</script>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section>
<h3>홈쇼핑 회원 등록</h3>
<form name="form" method="post" action="insertprocess.jsp">
<table border=1 id="tab1">
<tr>
<th>회원번호</th>
<%@include file="DBConn.jsp" %>
<%-- <%
PreparedStatement pstmt=null;
ResultSet rs=null;
/* String sql="select max(custno) from member1026"; */
String sql="select mem_seq.nextval from dual";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();
int no=0;
if(rs.next()){
	no=rs.getInt(1);    //+1;
}else{no=1;} %> --%>
<td><input type="text" name="custno" value=""></td>
</tr>
<tr>
<th>회원성명</th>
<td><input type="text" name="custname"></td>
</tr>
<tr>
<th>회원전화</th>
<td><input type="text" name="phone"></td>
</tr>
<tr>
<th>회원주소</th>
<td><input type="text" name="address"></td>
</tr>
<tr>
<th>가입일자</th>
<td><input type="text" name="joindate"></td>
</tr>
<tr>
<th>고객등급[A:VIP,B:일반,C:직원]</th>
<td>
<select name="grade" class="opt">
<option>A:VIP</option>
<option>B:일반</option>
<option>C:직원</option>
</select>
</td>
</tr>
<tr>
<th>도시코드</th>
<td>
<select name="city" class="opt">
<option>01:서울</option>
<option>02:경기</option>
<option>10:대전</option>
<option>20:부산</option>
<option>30:광주</option>
<option>40:울산</option>
<option>50:대구</option>
<option>60:강원</option>
<option>70:경상</option>
<option>80:충청</option>
<option>90:제주</option>
</select></td>
</tr>
<tr>
<th colspan="2">
<input class="btn1" type="button" value="등록" onclick="check()">
<input class="btn2" type="button" name="select" value="조회">
</th>
</tr>
</table>

</form>
</section>
<%@include file="footer.jsp" %>

</body>
</html>
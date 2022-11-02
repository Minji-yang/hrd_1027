<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.form.pcode.value==""){
		alert("상품코드를 입력하세요")}
	 else{document.form.submit();} }
</script>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section>
<h3>상품 등록 화면</h3>
<form name="form" method="post" action="goodsprocess.jsp">
<table border=1 id="tab3">
<tr>
<th>상품코드</th>
<td><input type="text" name="pcode"></td>
</tr>
<tr>
<th>상품명</th>
<td><input type="text" name="pname"></td>
</tr>
<tr>
<th>단가</th>
<td><input type="text" name="price"></td>
</tr>
<tr>
<th>재고수량</th>
<td><input type="text" name="stockQty"></td>
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
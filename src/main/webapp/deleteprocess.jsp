<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBConn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
		String sql="select name from person1024 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			String NAME=rs.getString(1);       
		/* 	DB조회한 이름 */
			if(name.equals(NAME)){
				sql="delete from person1024 where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,id);
				pstmt.executeUpdate();
				%>
				<script>
				alert("삭제 성공");
				location.href="select.jsp";
				</script>
				<%
			}else{
			 %>
			    <script>
			     alert("이름이 다릅니다");
			     history.back(-1);
			    </script>
			 <%
 
				}
		}else{ 
			%>
			<script>
			alert("등록되지 않은 사번입니다");
			history.back(-1);     
			/* 폼으로 되돌아가기 */
  			</script>
	<%
		}
		
	}catch(Exception e){
		System.out.println("Database 오류");
		e.printStackTrace();
	}  %>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		 var userEmail = "${userEmail}"; 
		alert('이메일 인증이 완료되었습니다. 이제 로그인이 가능합니다.');
	
		window.open('','_self','');
		window.close();
	</script>


</body>
</html>
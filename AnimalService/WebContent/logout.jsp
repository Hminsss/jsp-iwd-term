<%@ page contentType="text/html; charset=utf-8"%>
<%
	session.invalidate();

	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
	for (int i = 0; i < cookies.length; i++) {
		cookies[i].setMaxAge(0);
		response.addCookie(cookies[i]);
	}
}
%>
<script>
	alert('로그아웃 완료!');
	location.href = 'index.jsp';
</script>

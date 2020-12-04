<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.FindPet"%>
<%@ page import="dao.FindPetDAO"%>
<%@ page import="java.io.PrintWriter"%>
<html>
<head>
</head>
<body>
	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해야 글을 쓸 수 있습니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	} else {
		int id = 0;
		if (request.getParameter("id") != null) {
			id = Integer.parseInt(request.getParameter("id"));
		}
		if (id == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		FindPet fp = new FindPetDAO().getFP(id);
		if (!userID.equals(fp.getAuthor())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			FindPetDAO fpDAO = new FindPetDAO();
			int result = fpDAO.iFindPet(id);
			if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류입니다.')");
		script.println("history.back()");
		script.println("</script>");
			} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('축하합니다! 애완동물을 앞으로도 소중히 다뤄주세요!')");
		script.println("location.href = 'findPet.jsp'");
		script.println("</script>");
			}
		}

	}
	%>
</body>
</html>


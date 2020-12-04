<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dao.Comment_ProtectPetDAO"%>
<%@ page import="dto.Comment_ProtectPet"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="func.Location"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

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
		script.println("alert('로그인을 해야 댓글을 쓸 수 있습니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	} else {
		String cmtPost = request.getParameter("id");
		int cmtPost1 = Integer.parseInt(cmtPost);
		String cmt_cts = request.getParameter("comment");
		String cmtAuthor = userID;
		Comment_ProtectPet cpp = new Comment_ProtectPet();
		cpp.setCmtPost(cmtPost1);
		cpp.setCmt_cts(cmt_cts);
		cpp.setCmtAuthor(cmtAuthor);
		if (cpp.getCmt_cts() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글을 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			Comment_ProtectPetDAO cppDAO = new Comment_ProtectPetDAO();
			int result = cppDAO.writeComment(cpp.getCmt_cts(), cpp.getCmtAuthor(), cpp.getCmtPost());
			if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('댓글쓰기에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
			} else {
		PrintWriter script = response.getWriter();
		response.sendRedirect("protectPet_detail.jsp?id=" + cpp.getCmtPost());
			}

		}

	}
	%>


</body>
</html>
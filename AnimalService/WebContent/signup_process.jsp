<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dao.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="dto.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userPhone" />
<html>
<head>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
		userID= (String)session.getAttribute("userID");
		}
		if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비정상적인 접근입니다.')");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		}
		String password = user.getUserPassword();
		String re_password = request.getParameter("re_password");
		if(user.getUserID() == null || user.getUserPassword() == null ||user.getUserName() == null ||user.getUserPhone() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모든 항목을 입력해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			
			
				UserDAO userDAO = new UserDAO();
				int result = userDAO.join(user);
				if (result ==-1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('중복된 아이디입니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('회원가입 완료!')");
					script.println("location.href = 'login.jsp'");
					script.println("</script>");
				}

		}
		
		%>
</body>
</html>
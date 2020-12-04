<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dao.FindPetDAO"%>
<%@ page import="dto.FindPet"%>
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
		script.println("alert('로그인을 해야 글을 쓸 수 있습니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	} else {
		FindPet findPet = new FindPet();
		String filename = "";
		String path = application.getRealPath("/img/upload/");
		int maxSize = 15 * 1024 * 1024;
		String encType = "utf-8";
		MultipartRequest multi = new MultipartRequest(request, path, maxSize, encType, new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		
		
		String age = multi.getParameter("age");
		String disappearLocation1 = multi.getParameter("disappearLocation1");
		String disappearLocation2 = multi.getParameter("disappearLocation2");
		String disappearLocation3 = multi.getParameter("disappearLocation3");
		String disappearDate = multi.getParameter("disappearDate");
		String breed = multi.getParameter("breed");
		String weight = multi.getParameter("weight");
		String color = multi.getParameter("color");
		String catr = multi.getParameter("catr");
		String description = multi.getParameter("description");
		String gender = multi.getParameter("gender");
		String userPhone = (String) session.getAttribute("userPhone");

		Location lct = new Location();
		lct.putting();
		String dl1 = lct.putHash(disappearLocation1);
		String dl2 = lct.putHash(disappearLocation2);

		findPet.setAge(age);
		findPet.setBreed(breed);
		findPet.setGender(gender);
		findPet.setWeight(weight);
		findPet.setColor(color);
		findPet.setCatr(catr);
		findPet.setDisappearDate(disappearDate);
		findPet.setDisappearLocation1(dl1);
		findPet.setDisappearLocation2(dl2);
		findPet.setDisappearLocation3(disappearLocation3);
		findPet.setAuthor(userID);
		findPet.setPhone(userPhone);
		findPet.setDescription(description);
		findPet.setFileName(fileName);
		if (fileName == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('사진을 넣어주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}

		if (findPet.getDisappearLocation1() == null || findPet.getDisappearLocation2() == null
		|| findPet.getDisappearLocation3() == null || findPet.getColor() == null || findPet.getCatr() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모든항목을 꼭 입력해주세요.')");
			script.println("history.back()");
			script.println("</script>");
			String a = findPet.getFileName();
			System.out.println(a);

		} else {

			FindPetDAO fpd = new FindPetDAO();
			int result = fpd.writeFindPet(findPet.getAge(), findPet.getName(), findPet.getBreed(), findPet.getGender(),
			findPet.getWeight(), findPet.getColor(), findPet.getCatr(), findPet.getDisappearDate(),
			findPet.getDisappearLocation1(), findPet.getDisappearLocation2(), findPet.getDisappearLocation3(),
			findPet.getAuthor(), findPet.getPhone(), findPet.getDescription(), findPet.getFileName());
			if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓰기에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
			} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'findPet.jsp'");
		script.println("</script>");
			}

		}

	}
	%>
</body>
</html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dao.ProtectPetDAO"%>
<%@ page import="dto.ProtectPet"%>
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
		ProtectPet protectPet = new ProtectPet();
		Location lct = new Location();
		String filename = "";
		String path = application.getRealPath("/img/upload2/");
		int maxSize = 15 * 1024 * 1024;
		String encType = "utf-8";
		MultipartRequest multi = new MultipartRequest(request, path, maxSize, encType, new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);

		String sdone = multi.getParameter("done");

		int done = Integer.parseInt(sdone);
		String catchDate = multi.getParameter("catchDate");
		String location1 = multi.getParameter("disappearLocation1");
		String location2 = multi.getParameter("disappearLocation2");
		String location3 = multi.getParameter("disappearLocation3");
		lct.putting();
		String dl1 = lct.putHash(location1);
		String dl2 = lct.putHash(location2);

		String breed = multi.getParameter("breed");
		String gender = multi.getParameter("gender");
		String age = multi.getParameter("age");
		String weight = multi.getParameter("weight");
		String color = multi.getParameter("color");
		String catr = multi.getParameter("catr");
		String description = multi.getParameter("description");
		String userPhone = (String) session.getAttribute("userPhone");

		protectPet.setDone(done);
		protectPet.setCatchDate(catchDate);
		protectPet.setLocation1(dl1);
		protectPet.setLocation2(dl2);
		protectPet.setLocation3(location3);
		protectPet.setBreed(breed);
		protectPet.setGender(gender);
		protectPet.setAge(age);
		protectPet.setWeight(weight);
		protectPet.setColor(color);
		protectPet.setCatr(catr);
		protectPet.setDescription(description);
		protectPet.setPhone(userPhone);
		protectPet.setFileName(fileName);
		protectPet.setAuthor(userID);

		if (fileName == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('사진을 넣어주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}

		if (protectPet.getLocation1() == null || protectPet.getLocation2() == null || protectPet.getLocation3() == null
		|| protectPet.getColor() == null || protectPet.getCatr() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모든항목을 꼭 입력해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else {

			ProtectPetDAO ppd = new ProtectPetDAO();
			int result = ppd.writeProtectPet(protectPet.getDone(), protectPet.getAge(), protectPet.getName(),
			protectPet.getBreed(), protectPet.getGender(), protectPet.getWeight(), protectPet.getColor(),
			protectPet.getCatr(), protectPet.getCatchDate(), protectPet.getLocation1(), protectPet.getLocation2(),
			protectPet.getLocation3(), protectPet.getAuthor(), protectPet.getPhone(), protectPet.getDescription(),
			protectPet.getFileName());
			if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓰기에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
			} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'protectPet.jsp'");
		script.println("</script>");
			}

		}

	}
	%>
</body>
</html>
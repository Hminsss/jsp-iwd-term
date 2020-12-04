<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html class="no-js" lang="zxx">
<head>
<fmt:setLocale value='<%=request.getParameter("language")%>' />
<fmt:setBundle basename="bundle.donation" />
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title><fmt:message key="thank" /></title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="manifest" href="site.webmanifest"> -->

<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/gijgo.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/slicknav.css">
<link rel="stylesheet" href="css/style.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>

<body>
	<%@ include file="header.jsp"%>
	<%
	String Name = request.getParameter("Name");
	String Tel = request.getParameter("Tel");
	String Email = request.getParameter("Email");
	String Price = request.getParameter("Price");

	if (Name == "" || Tel == "" || Email == "" || Price == "") {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		if (request.getParameter("language").equals("en")) {
			script.println("alert('Please enter all entries.')");
		} else if (request.getParameter("language").equals("ch")) {
			script.println("alert('请输入所有项目。')");
		} else {
			script.println("alert('모든항목을 입력해주세요.')");
		}
		script.println("history.back()");
		script.println("</script>");
	}
	%>
	<div class="bradcam_area breadcam_bg" style="margin-bottom: 3%;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="bradcam_text text-center">
						<h3>
							<fmt:message key="thank" />
						</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<blockquote
		class="text-center g-color-primary g-font-size-18 g-font-size-24--md g-line-height-1_4 g-mt-20 g-mb-10">
		<span style="font-size: 30px; color: #585858;">“</span> <span
			style="font-size: 20px; color: #B45F04;"><fmt:message key="m3" /></span>
		<span style="font-size: 30px; color: #585858;">”</span>
	</blockquote>
	<p class="text-center">
		<fmt:message key="m2" />
	</p>

	<div class="container">
		<div class="form-group row g-mb-25">
			<label class="col-sm-3 col-form-label g-mb-10"><strong
				class="g-color-black"><fmt:message key="name" /></strong></label>
			<div class="col-sm-9">
				<div class="input-group g-brd-primary--focus">
					<label class="form-control"><%=Name%></label>
				</div>
			</div>
		</div>
		<div class="form-group row g-mb-25">
			<label class="col-sm-3 col-form-label g-mb-10"><strong
				class="g-color-black"><fmt:message key="tel" /></strong></label>
			<div class="col-sm-9">
				<div class="input-group g-brd-primary--focus">
					<label class="form-control"><%=Tel%></label>
				</div>
			</div>
		</div>
		<div class="form-group row g-mb-25">
			<label class="col-sm-3 col-form-label g-mb-10"><strong
				class="g-color-black"><fmt:message key="email" /></strong></label>
			<div class="col-sm-9">
				<div class="input-group g-brd-primary--focus">
					<label class="form-control"><%=Email%></label>
				</div>
			</div>
		</div>
		<hr class="g-brd-gray-light-v4 g-mx-minus-30">
		<div class="form-group row g-mb-25">
			<label class="col-sm-3 col-form-label g-mb-10"><strong
				class="g-color-black"><fmt:message key="pay" /></strong></label>
			<div class="col-sm-9">
				<label class="form-control"><%=Price%> <fmt:message
						key="won" /></label>
			</div>
		</div>
		<hr class="g-brd-gray-light-v4 g-mx-minus-30">
		<br>
	</div>
	<div class="container" style="margin-top: 3%;">
		<div class="row g-my-50">
			<div class="col-md-6">
				<img src="img/donation/add-1.jpg" class="img-fluid w-100 g-mt-10">
				<h3
					class="font-weight-bold g-color-gray-dark-v2 g-font-size-18 g-my-10">
					<fmt:message key="a1" />
					<span class="g-color-primary"></span>
				</h3>
				<p>
					<fmt:message key="a11" />
				</p>
			</div>
			<div class="col-md-6">
				<img src="img/donation/add-2.jpg" class="img-fluid w-100 g-mt-10">
				<h3
					class="font-weight-bold g-color-gray-dark-v2 g-font-size-18 g-my-10">
					<fmt:message key="a2" />
					<span class="g-color-primary"></span>
				</h3>
				<p>
					<fmt:message key="a22" />
				</p>
			</div>
			<div class="col-md-6">
				<img src="img/donation/add-3.jpg" class="img-fluid w-100 g-mt-10">
				<h3
					class="font-weight-bold g-color-gray-dark-v2 g-font-size-18 g-my-10">
					<fmt:message key="a3" />
					<span class="g-color-primary"></span>
				</h3>
				<p>
					<fmt:message key="a33" />
				</p>
			</div>
			<div class="col-md-6">
				<img src="img/donation/add-4.jpg" class="img-fluid w-100 g-mt-10">
				<h3
					class="font-weight-bold g-color-gray-dark-v2 g-font-size-18 g-my-10">
					<fmt:message key="a4" />
					<span class="g-color-primary"></span>
				</h3>
				<p>
					<fmt:message key="a44" />
				</p>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
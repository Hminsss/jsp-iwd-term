<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<fmt:setLocale value='<%=request.getParameter("language")%>' />
<fmt:setBundle basename="bundle.donation" />
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title><fmt:message key="title" /></title>
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
	<div class="bradcam_area breadcam_bg" style="margin-bottom: 3%;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="bradcam_text text-center">
						<h3>
							<fmt:message key="title2" />
						</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<blockquote
		class="text-center g-color-primary g-font-size-18 g-font-size-24--md g-line-height-1_4 g-mt-20 g-mb-10">
		<p>
			<span class="badge badge-primary"><a href="?language=ko"
				style="color: white;">한국어</a></span>|<span class="badge badge-warning"><a
				href="?language=en" style="color: white;">English</a></span>|<span
				class="badge badge-danger"><a href="?language=ch"
				style="color: white;">汉语</a></span>
		</p>
		<span style="font-size: 30px; color: #585858;">“</span> <span
			style="font-size: 20px; color: #B45F04;"><fmt:message key="m1" /></span>
		<span style="font-size: 30px; color: #585858;">”</span>
	</blockquote>
	<p class="text-center">
		<fmt:message key="m2" />
	</p>
	<i class="fa-flag-korea"></i>
	<div class="container">
		<form id="validate-form"
			class="g-brd-around g-brd-gray-light-v4 g-pa-30 g-mb-30"
			action="donate_thank.jsp?language=<%=request.getParameter("language")%>"
			method="post" novalidate="novalidate">
			<div class="form-group row g-mb-25">
				<label class="col-sm-3 col-form-label g-mb-10"><strong
					class="g-color-black"><fmt:message key="name" /></strong></label>
				<div class="col-sm-9">
					<div class="input-group g-brd-primary--focus">
						<div class="input-group-prepend">
							<span
								class="input-group-text rounded-0 g-bg-white g-color-gray-light-v1"><i
								class="fa fa-users"></i></span>
						</div>
						<input type="text"
							class="form-control form-control-md border-left-0 rounded-0 pl-0"
							id="Name" name="Name" value="">
					</div>
				</div>
			</div>
			<div class="form-group row g-mb-25">
				<label class="col-sm-3 col-form-label g-mb-10"><strong
					class="g-color-black"><fmt:message key="tel" /></strong></label>
				<div class="col-sm-9">
					<div class="input-group g-brd-primary--focus">
						<div class="input-group-prepend">
							<span
								class="input-group-text rounded-0 g-bg-white g-color-gray-light-v1"><i
								class="fa fa-phone-square"></i></span>
						</div>
						<input
							class="form-control form-control-md border-left-0 rounded-0 pl-0"
							type="text" placeholder="" id="Tel" name="Tel">
					</div>
				</div>
			</div>
			<div class="form-group row g-mb-25">
				<label class="col-sm-3 col-form-label g-mb-10"><strong
					class="g-color-black"><fmt:message key="email" /></strong></label>
				<div class="col-sm-9">
					<div class="input-group g-brd-primary--focus">
						<div class="input-group-prepend">
							<span
								class="input-group-text rounded-0 g-bg-white g-color-gray-light-v1"><i
								class="fa fa-envelope"></i></span>
						</div>
						<input
							class="form-control form-control-md border-left-0 rounded-0 pl-0"
							type="email" placeholder="" id="Email" name="Email">
					</div>
				</div>
			</div>
			<hr class="g-brd-gray-light-v4 g-mx-minus-30">
			<div class="form-group row g-mb-25">
				<label class="col-sm-3 col-form-label g-mb-10"><strong
					class="g-color-black"><fmt:message key="pay" /></strong></label>
				<div class="col-sm-9">
					<div class="input-group g-brd-primary--focus">
						<input class="form-control form-control-md rounded-0" type="text"
							placeholder="" id="Price" name="Price">
					</div>
				</div>
			</div>
			<hr class="g-brd-gray-light-v4 g-mx-minus-30">
			<div style="text-align: center;">
				<button type="submit" id="submit-form"
					class="btn btn-md u-btn-primary g-btn-hover-reset rounded-0 g-mr-10">
					<fmt:message key="title" />
				</button>
			</div>
			<br>
		</form>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page isErrorPage="true"%>
<html>s
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>404</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Detail페이지 url 잘못된 접속 방지를 위한 404 에러페이지 -->

<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
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
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
#main {
	height: 40vh;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="d-flex justify-content-center align-items-center" id="main">
		<h1
			class="mr-3 pr-3 align-top border-right inline-block align-content-center">404</h1>
		<div class="inline-block align-middle">
			<h2 class="font-weight-normal lead" id="desc">페이지를 찾을 수 없습니다.</h2>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
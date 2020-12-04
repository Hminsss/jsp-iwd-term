<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.FindPet"%>
<%@ page import="dao.FindPetDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="dao.Comment_FindPetDAO"%>
<%@ page import="dto.Comment_FindPet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page errorPage="404error.jsp"%>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>실종 게시글</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
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
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<%@ include file="header.jsp"%>
	<%
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

	Cookie[] cookiess = request.getCookies();
	for (int i = 0; i < cookiess.length; i++) {
		if (cookiess[i].getName().equals(request.getParameter("id"))) {
			cookiess[i].setMaxAge(0);
			response.addCookie(cookiess[i]);
			Cookie cookie = new Cookie(request.getParameter("id"), request.getParameter("id"));
			cookie.setMaxAge(60 * 60);
			response.addCookie(cookie);

		} else {
			Cookie cookie = new Cookie(request.getParameter("id"), request.getParameter("id"));
			cookie.setMaxAge(60 * 60);
			response.addCookie(cookie);
		}
	}
	%>

	<!-- bradcam_area_start -->
	<div class="bradcam_area breadcam_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="bradcam_text text-center">
						<h3>실종 게시글</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bradcam_area_end -->

	<!--================Blog Area =================-->
	<section class="blog_area single-post-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post">
						<div class="feature-img">
							<%
								if (fp.getFileName() == null) {
							%>
							<img class="card-img rounded-0" src="img/post/noimage2.png"
								alt="">
							<%
								} else {
							%>
							<img class="card-img rounded-0"
								src="img/upload/<%=fp.getFileName()%>" alt="">
							<%
								}
							%>
						</div>
						<div class="blog_details">
							<%
								if (fp.getDone() == 0) {
							%>
							<label class="btn btn-danger">실종 </label>
							<%
								} else {
							%>
							<label class="btn btn-info">귀가</label>
							<%
								}
							%>
							<h2 style="display: inline; margin-left: 1%;"><%=fp.getBreed()%></h2>
							<ul class="blog-info-link mt-3 mb-4">
								<li><i class="fa fa-user"></i> <%=fp.getAuthor()%></li>
								<li style="color: orange;"><i class="fa fa-comments"></i> <%=fp.getPhone()%></li>
							</ul>
							<p>
								-성 별 :
								<%=fp.getGender()%><br> -몸무게 :
								<%=fp.getWeight()%><br> -털 색 :
								<%=fp.getColor()%><br> -특 징 :
								<%=fp.getCatr()%><br> -실종일 :
								<%=fp.getDisappearDate()%><br> -실종장소:
								<%=fp.getDisappearLocation1()%>
								<%=fp.getDisappearLocation2()%>
								<%=fp.getDisappearLocation3()%></p>

							<p class="excert">
								<%=fp.getDescription()%>
							</p>

							<div style="text-align: right;">
								<%
									if (fp.getAuthor().equals(userID)) {
									if (fp.getDone() == 1) {
								%>
								<span class="badge badge-danger"><a
									href="FindPet_delete.jsp?id=<%=fp.getPostId()%>"
									style="color: white;">글 삭제하기</a></span>

								<%
									} else {
								%>
								<span class="badge badge-info"><a
									href="iFindPet.jsp?id=<%=fp.getPostId()%>"
									style="color: white;">찾았어요!</a></span>|<span
									class="badge badge-danger"><a
									href="FindPet_delete.jsp?id=<%=fp.getPostId()%>"
									style="color: white;">글 삭제하기</a></span>
								<%
									}
								}
								%>
								<br>

							</div>
						</div>
					</div>


					<div class="comments-area">
						<%
							Comment_FindPetDAO cfpDAO = new Comment_FindPetDAO();
						ArrayList<Comment_FindPet> list2 = cfpDAO.getList(fp.getPostId());
						%>
						<h4><%=list2.size()%>개의 댓글이 있습니다.
						</h4>
						<%
							for (int i = 0; i < list2.size(); i++) {
						%>
						<div class="comment-list">
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="desc">
										<p class="comment">
											<%=list2.get(i).getCmt_cts()%>
										</p>
										<div class="d-flex justify-content-between">
											<div class="d-flex align-items-center">
												<h5>
													<a href="#"><%=list2.get(i).getCmtAuthor()%></a>
												</h5>
												<p class="date"><%=list2.get(i).getCmtDate()%>
													<%
														if (userID != null && userID.equals(list2.get(i).getCmtAuthor())) {
													%>
													<span class="badge badge-danger"><a
														href="delete_Comment_FindPet.jsp?id=<%=list2.get(i).getCmt_ID()%>"
														style="color: white;">삭제</a></span>
												</p>
												<%
													}
												%>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>

					<div class="comment-form">
						<h4>댓글달기</h4>
						<form class="form-contact comment_form"
							action="comment_PetFind_process.jsp" id="commentForm"
							method="post">
							<div class="row">
								<div class="col-12">
									<div class="form-group">
										<textarea class="form-control w-100" name="comment"
											id="comment" cols="30" rows="9" placeholder="Write Comment"></textarea>
										<input type="hidden" name="id" value="<%=fp.getPostId()%>">
									</div>
								</div>
							</div>
							<div class="form-group">
								<button type="submit"
									class="button button-contactForm btn_1 boxed-btn">댓글
									달기</button>
							</div>
						</form>
					</div>
				</div>

				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<%
								if (userID == null) {
							%>
							<button
								class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
								onclick="location.href = 'login.jsp'">로 그 인</button>
							<%
								} else {
							%>
							<button
								class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
								onclick="location.href = 'addFindPet.jsp'">글 쓰 기</button>
							<%
								}
							%>
						</aside>
						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">Recent Post</h3>
							<%
								Cookie[] cookies = request.getCookies(); //request로 쿠키를 받음
							int iPostId[] = new int[4];
							int k = 0;
							int pd = 0;
							if (cookies.length < 5) {
								for (int j = 0; j < cookies.length; j++) {
									if (cookies[j].getName().equals("JSESSIONID")) {

									} else {
								try {
									String sPostId = cookies[j].getValue();
									pd = Integer.parseInt(sPostId);
									iPostId[k] = pd;
									k++;
								} catch (Exception e) {

								}

									}
								}
							} else if (cookies.length > 4) {
								for (int j = cookies.length - 4; j < cookies.length; j++) {
									if (cookies[j].getName().equals("JSESSIONID")) {

									} else {
								try {
									String sPostId = cookies[j].getValue();
									pd = Integer.parseInt(sPostId);
									iPostId[k] = pd;
									k++;
								} catch (Exception e) {

								}

									}
								}
							} else if (cookies.length == 1) {

							}
							FindPetDAO fpdao = new FindPetDAO();
							ArrayList<FindPet> list3 = fpdao.getCookieList(iPostId);
							for (int j = 0; j < list3.size(); j++) {
							%>
							<div class="media post_item">
								<img src="img/upload/<%=list3.get(j).getFileName()%>"
									style="width: 80px; height: 80px;" alt="post">
								<div class="media-body">
									<a href="findPet_detail.jsp?id=<%=list3.get(j).getPostId()%>">
										<h3><%=list3.get(j).getBreed()%></h3>
									</a>
									<p><%=list3.get(j).getDate()%></p>
								</div>
							</div>
							<%
								}
							%>
						</aside>
						<aside class="single_sidebar_widget newsletter_widget">
							<h4 class="widget_title">Donation</h4>
							<button
								class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
								type="submit" onclick="location='donation.jsp'">후원하러가기</button>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ Blog Area end =================-->
	<%@ include file="footer.jsp"%>


	<!-- JS here -->
	<script src="js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>
	<script src="js/ajax-form.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/imagesloaded.pkgd.min.js"></script>
	<script src="js/scrollIt.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/nice-select.min.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/gijgo.min.js"></script>

	<!--contact js-->
	<script src="js/contact.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>

	<script src="js/main.js"></script>
	<script>
		$('#datepicker').datepicker({
			iconsLibrary : 'fontawesome',
			disableDaysOfWeek : [ 0, 0 ],
		//     icons: {
		//      rightIcon: '<span class="fa fa-caret-down"></span>'
		//  }
		});
		$('#datepicker2').datepicker({
			iconsLibrary : 'fontawesome',
			icons : {
				rightIcon : '<span class="fa fa-caret-down"></span>'
			}

		});
		var timepicker = $('#timepicker').timepicker({
			format : 'HH.MM'
		});
	</script>
</body>

</html>
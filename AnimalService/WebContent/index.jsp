<%@ page import="dao.ProtectPetDAO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.FindPet"%>
<%@ page import="dao.FindPetDAO"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>우리 강아지 찾아주세요! 애니펫</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">


<!-- CSS-->
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
<link rel="stylesheet" href="css/responsive.css">
</head>

<body>
	<%@ include file="header.jsp"%>
	<!-- slider_area_start -->
	<div class="slider_area">
		<div class="single_slider slider_bg_1 d-flex align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-lg-5 col-md-6">
						<div class="slider_text">
							<h3>
								우리강아지 <br> <span>찾아주세요!</span>
							</h3>
							<div style="margin-left: 3%;">
								<p>
									잃어버린 애완동물을 찾는<br> 커뮤니티 사이트 애니펫 입니다.
									
								</p>
								<br> <a href="findPet.jsp" class="boxed-btn4">만나러 가기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="dog_thumb d-none d-lg-block">
				<img src="img/banner/dog.png" alt="강아지">
			</div>
		</div>
	</div>
	<!-- slider_area_end -->

	<!-- adapt_area_start  -->
	<div class="adapt_area">
		<div class="container">
			<div class="row justify-content-between align-items-center">
				<div class="col-lg-5">
					<div class="adapt_help">
						<div class="section_title">
							<h3>
								<span>버려진 동물들에게</span> 도움을 주세요.
							</h3>
							<p>
								"살아 있는 모든 피조물을 향한 사랑은 <br>인간의 가장 고결한 특징이다." <br>
								<찰스 다윈>
							</p>
							<a href="donation.jsp" class="boxed-btn3">후원하기</a>
						</div>
					</div>
				</div>

				<%
                	FindPetDAO fpdaoo = new FindPetDAO();
                	ProtectPetDAO ppdaoo = new ProtectPetDAO();
                	int fpNum = fpdaoo.getCount();
                	int fpNumd = fpdaoo.getCountDisappear();
                	int ppNum = ppdaoo.getCount();
                %>
				<div class="col-lg-6">
					<div class="adapt_about">
						<div class="row align-items-center">
							<div class="col-lg-6 col-md-6">
								<div class="single_adapt text-center">
									<img src="img/adapt_icon/1.png" alt="">
									<div class="adapt_content">
										<h3 class="counter"><%=fpNum + ppNum%></h3>
										<p>등록된 동물들</p>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-6">
								<div class="single_adapt text-center">
									<img src="img/adapt_icon/3.png" alt="">
									<div class="adapt_content">
										<h3>
											<span class="counter"><%=fpNumd %></span>
										</h3>
										<p>실종된 동물들</p>
									</div>
								</div>
								<div class="single_adapt text-center">
									<img src="img/adapt_icon/2.png" alt="">
									<div class="adapt_content">
										<h3>
											<span class="counter"><%=ppNum %></span>
										</h3>
										<p>
											목격/보호중인 <br> 동물들
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- adapt_area_end  -->



	<!-- testmonial_area_start  -->
	<div class="testmonial_area">
		<div style="text-align: center;">
			<span class="badge badge-danger" style="font-size: 30px;"> 최근
				올라온 글 </span>
		</div>
		<br>
		<div class="container">

			<div class="row justify-content-center">
				<div class="col-lg-10">
					<div class="textmonial_active owl-carousel">

						<%
 							int pages = 1;
 							FindPetDAO fpDAO = new FindPetDAO();
							ArrayList<FindPet> list = fpDAO.getList_index(pages);
							if (list.size()<1){
								out.println("등록된 글이 없습니다.");
							}else{
							for(int i = 0; i<list.size(); i++){ %>
						<div class="testmonial_wrap">
							<div class="single_testmonial d-flex align-items-center">
								<div class="test_thumb">
									<img src="img/upload/<%=list.get(i).getFileName() %>"
										style="width: 200px; height: 150px;" alt="">
								</div>
								<div class="test_content">
									<a href="findPet_detail.jsp?id=<%=list.get(i).getPostId() %>"><h4><%=list.get(i).getBreed() %>
											|
											<%=list.get(i).getAge() %>
											|
											<%= list.get(i).getGender()%></h4></a> <span><%=list.get(i).getDisappearLocation1() %>
										<%=list.get(i).getDisappearLocation2() %></span>
									<p><%=list.get(i).getDescription() %></p>
								</div>
							</div>
						</div>
						<%
								}
							}
                            %>

					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- testmonial_area_end  -->
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

</body>

</html>
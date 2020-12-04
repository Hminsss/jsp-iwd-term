<%@ page contentType="text/html; charset=utf-8"%>
<%
	String userID = null;
	
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
		
	}
%>
<header>
	<div class="header-area ">
		<div id="sticky-header" class="main-header-area">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-xl-3 col-lg-3">
						<div class="logo">
							<a href="index.jsp"> <img src="img/logo.png" alt="">
							</a>
						</div>
					</div>
					<div class="col-xl-9 col-lg-9">
						<div class="main-menu  d-none d-lg-block">
							<nav>
								<ul id="navigation">
									<li><a href="index.jsp">홈</a></li>
									<li><a href="findPet.jsp">실종 </a>
									<li><a href="protectPet.jsp">목격/보호</a></li>
									<li><a href="donation.jsp">후원하기</a></li>
									<%
                                        	if (userID == null){
                                        %>
									<li><a href="login.jsp">로그인</a></li>
									<%
                                        	}else{
                                        %>
									<li><a href="logout.jsp">로그아웃</a></li>
									<%
                                        	}
                                        %>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col-12">
						<div class="mobile_menu d-block d-lg-none"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
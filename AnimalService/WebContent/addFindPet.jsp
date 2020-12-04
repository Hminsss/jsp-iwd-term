<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.FindPet"%>
<%@ page import="java.util.Collections"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>실종 게시글 등록</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

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

<style>
label {
	margin-top: 0.8%;
}
</style>

</head>

<body>
	<%@ include file="header.jsp"%>
	<!-- bradcam_area_start -->
	<div class="bradcam_area breadcam_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="bradcam_text text-center">
						<h3>실종 게시글 등록</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<!-- bradcam_area_end -->
	<div class="container">
		<form name="newFindPetPost" action="./addFindPet_process.jsp"
			class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="alert alert-danger" role="alert"
				style="text-align: center;">
				<h4 style="margin-top: 1%;">기본정보</h4>
			</div>
			<div class="form-group row">
				<label class="col-2">날짜</label>
				<div class="col">
					<input type='date' id='disappearDate' name="disappearDate"
						class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">지역</label>
				<div class="col">
					<select name="disappearLocation1" class="form-control"
						onChange="cat1_change(this.value,disappearLocation2)"
						style="display: inline;">
						<option selected>-선택-</option>
						<option value='1'>서울</option>
						<option value='2'>부산</option>
						<option value='3'>대구</option>
						<option value='4'>인천</option>
						<option value='5'>광주</option>
						<option value='6'>대전</option>
						<option value='7'>울산</option>
						<option value='8'>강원</option>
						<option value='9'>경기</option>
						<option value='10'>경남</option>
						<option value='11'>경북</option>
						<option value='12'>전남</option>
						<option value='13'>전북</option>
						<option value='14'>제주</option>
						<option value='15'>충남</option>
						<option value='16'>충북</option>
					</select>
				</div>
				<div class="col">
					<select name="disappearLocation2" class="form-control"></select>
				</div>
				<div class="col">
					<input type="text" name="disappearLocation3" class="form-control"
						placeholder="구체적인 장소를 적어주세요.">
				</div>
			</div>
			<div class="alert alert-danger" role="alert"
				style="text-align: center;">
				<h4 style="margin-top: 1%;">동 물 정 보</h4>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">품종</label>
				<div class="col">
					<input type="text" id="breed" name="breed" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">성별</label>
				<div class="col">
					<label class="badge"> <input type="radio" name="gender"
						value="성별 미확인" checked> 성별 미확인
					</label> <label class="badge"> <input type="radio" name="gender"
						value="수컷"> 수컷
					</label> <label class="badge"> <input type="radio" name="gender"
						value="암컷"> 암컷
					</label>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">나이</label>
				<div class="col">
					<select name="age" class="form-control">
						<option value="나이 모름" selected>나이 모름</option>
						<option value="1년 미만">1년 미만</option>
						<option value="1살">1살</option>
						<option value="2살">2살</option>
						<option value="3살">3살</option>
						<option value="4살">4살</option>
						<option value="5살">5살</option>
						<option value="6살">6살</option>
						<option value="7살">7살</option>
						<option value="8살">8살</option>
						<option value="9살">9살</option>
						<option value="10살">10살</option>
						<option value="11살">11살</option>
						<option value="12살">12살</option>
						<option value="13살">13살</option>
						<option value="14살">14살</option>
						<option value="15살">15살</option>
						<option value="16살">16살</option>
						<option value="17살">17살</option>
						<option value="18살">18살</option>
						<option value="19살">19살</option>
						<option value="20살 이상">20살 이상</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">몸무게</label>
				<div class="col">
					<select name="weight" class="form-control">
						<option value="몸무게 모름" selected>몸무게 모름</option>
						<option value="1kg 미만">1kg 미만</option>
						<option value="1~5kg">1~5kg</option>
						<option value="6~10kg">6~10kg</option>
						<option value="11~15kg">11~15kg</option>
						<option value="16~20kg">16~20kg</option>
						<option value="21~25kg">21~25kg</option>
						<option value="26~30kg">26~30kg</option>
						<option value="31~35kg">31~35kg</option>
						<option value="35~40kg">35~40kg</option>
						<option value="41kg 이상">41kg 이상</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">털색</label>
				<div class="col">
					<input type="text" name="color" class="form-control"
						placeholder="무늬나 털색을 적어주세요.">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">특징</label>
				<div class="col">
					<input type="text" name="catr" class="form-control"
						placeholder="눈에 띄는 특징을 적어주세요.">
				</div>
			</div>


			<div class="form-group row">
				<label class="col-sm-2">상세한 내용</label>
				<div class="col">
					<textarea name="description" cols="50" rows="2"
						class="form-control" placeholder="상세한 내용을 작성해주세요."></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">사진</label>
				<div class="col">
					<input type="file" name="fileName" class="form-control"
						placeholder="눈에 띄는 특징을 적어주세요.">
				</div>
			</div>

			<div style="text-align: center;">
				<button type="submit" class="genric-btn primary-border circle"
					style="margin-top: 3%; margin-bottom: 5%; text-align: center;">작성하기</button>
			</div>
		</form>
	</div>
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
	<script>
		document.getElementById('disappearDate').value = new Date()
				.toISOString().substring(0, 10);
		;
	</script>
	<script language=javascript>
		var cat1_num = new Array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
				15, 16);
		var cat1_name = new Array('서울', '부산', '대구', '인천', '광주', '대전', '울산',
				'강원', '경기', '경남', '경북', '전남', '전북', '제주', '충남', '충북');
		var cat2_num = new Array();
		var cat2_name = new Array();
		cat2_num[1] = new Array(17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28,
				29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41);
		cat2_name[1] = new Array('강남구', '강동구', '강북구', '강서구', '관악구', '광진구',
				'구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구',
				'서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구',
				'중구', '중랑구');
		cat2_num[2] = new Array(42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53,
				54, 55, 56, 57);
		cat2_name[2] = new Array('강서구', '금정구', '남구', '동구', '동래구', '부산진구', '북구',
				'사상구', '사하구', '서구', '수영구', '연제구', '영도구', '중구', '해운대구', '기장군');
		cat2_num[3] = new Array(58, 59, 60, 61, 62, 63, 64, 65);
		cat2_name[3] = new Array('남구', '달서구', '동구', '북구', '서구', '수성구', '중구',
				'달성군');
		cat2_num[4] = new Array(66, 67, 68, 69, 70, 71, 72, 73, 74, 75);
		cat2_name[4] = new Array('계양구', '남구', '남동구', '동구', '부평구', '서구', '연수구',
				'중구', '강화군', '옹진군');
		cat2_num[5] = new Array(76, 77, 78, 79, 80);
		cat2_name[5] = new Array('광산구', '남구', '동구', '북구', '서구');
		cat2_num[6] = new Array(81, 82, 83, 84, 85);
		cat2_name[6] = new Array('대덕구', '동구', '서구', '유성구', '중구');
		cat2_num[7] = new Array(86, 87, 88, 89, 90);
		cat2_name[7] = new Array('남구', '동구', '북구', '중구', '울주군');
		cat2_num[8] = new Array(91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101,
				102, 103, 104, 105, 106, 107, 108);
		cat2_name[8] = new Array('강릉시', '동해시', '삼척시', '속초시', '원주시', '춘천시',
				'태백시', '고성군', '양구군', '양양군', '영월군', '인제군', '정선군', '철원군', '평창군',
				'홍천군', '화천군', '횡성군');
		cat2_num[9] = new Array(109, 110, 111, 112, 113, 114, 115, 116, 117,
				118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129,
				130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141,
				142, 143, 144, 145, 146, 147, 148);
		cat2_name[9] = new Array('고양시 덕양구', '고양시 일산구', '과천시', '광명시', '광주시',
				'구리시', '군포시', '김포시', '남양주시', '동두천시', '부천시 소사구', '부천시 오정구',
				'부천시 원미구', '성남시 분당구', '성남시 수정구', '성남시 중원구', '수원시 권선구',
				'수원시 장안구', '수원시 팔달구', '시흥시', '안산시 단원구', '안산시 상록구', '안성시',
				'안양시 동안구', '안양시 만안구', '오산시', '용인시', '의왕시', '의정부시', '이천시',
				'파주시', '평택시', '하남시', '화성시', '가평군', '양주군', '양평군', '여주군', '연천군',
				'포천군');
		cat2_num[10] = new Array(149, 150, 151, 152, 153, 154, 155, 156, 157,
				158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168);
		cat2_name[10] = new Array('거제시', '김해시', '마산시', '밀양시', '사천시', '양산시',
				'진주시', '진해시', '창원시', '통영시', '거창군', '고성군', '남해군', '산청군', '의령군',
				'창녕군', '하동군', '함안군', '함양군', '합천군');
		cat2_num[11] = new Array(169, 170, 171, 172, 173, 174, 175, 176, 177,
				178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189,
				190, 191, 192);
		cat2_name[11] = new Array('경산시', '경주시', '구미시', '김천시', '문경시', '상주시',
				'안동시', '영주시', '영천시', '포항시 남구', '포항시 북구', '고령군', '군위군', '봉화군',
				'성주군', '영덕군', '영양군', '예천군', '울릉군', '울진군', '의성군', '청도군', '청송군',
				'칠곡군');
		cat2_num[12] = new Array(193, 194, 195, 196, 197, 198, 199, 200, 201,
				202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214);
		cat2_name[12] = new Array('광양시', '나주시', '목포시', '순천시', '여수시', '강진군',
				'고흥군', '곡성군', '구례군', '담양군', '무안군', '보성군', '신안군', '영광군', '영암군',
				'완도군', '장성군', '장흥군', '진도군', '함평군', '해남군', '화순군');
		cat2_num[13] = new Array(215, 216, 217, 218, 219, 220, 221, 222, 223,
				224, 225, 226, 227, 228, 229);
		cat2_name[13] = new Array('군산시', '김제시', '남원시', '익산시', '전주시 덕진구',
				'전주시 완산구', '정읍시', '고창군', '무주군', '부안군', '순창군', '완주군', '임실군',
				'장수군', '진안군');
		cat2_num[14] = new Array(230, 231, 232, 233);
		cat2_name[14] = new Array('서귀포시', '제주시', '남제주군', '북제주군');
		cat2_num[15] = new Array(234, 235, 236, 237, 238, 239, 240, 241, 242,
				243, 244, 245, 246, 247, 248);
		cat2_name[15] = new Array('공주시', '논산시', '보령시', '서산시', '아산시', '천안시',
				'금산군', '당진군', '부여군', '서천군', '연기군', '예산군', '청양군', '태안군', '홍성군');
		cat2_num[16] = new Array(249, 250, 251, 252, 253, 254, 255, 256, 257,
				258, 259, 260);
		cat2_name[16] = new Array('제천시', '청주시 상당구', '청주시 흥덕구', '충주시', '괴산군',
				'단양군', '보은군', '영동군', '옥천군', '음성군', '진천군', '청원군');
		function cat1_change(key, sel) {
			if (key == '')
				return;
			var name = cat2_name[key];
			var val = cat2_num[key];

			for (i = sel.length - 1; i >= 0; i--)
				sel.options[i] = null;
			sel.options[0] = new Option('-선택-', '', '', 'true');
			for (i = 0; i < name.length; i++) {
				sel.options[i + 1] = new Option(name[i], val[i]);
			}
		}
	</script>
</body>
</html>
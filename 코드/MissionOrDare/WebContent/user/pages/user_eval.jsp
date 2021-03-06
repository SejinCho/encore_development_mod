<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="user_settings.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Link CSS -->
<link type="text/css" rel="stylesheet" href="${project}asset/user.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Link JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="${project}asset/script.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://kit.fontawesome.com/23971e572d.js"></script>
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

	.swiper-container{
		text-align: center;
		position: relative;
		top: -40px;
		height: 60%;
	}
	.img-rounded{
		width: 200px;
		height: 180px;
	}
	video{
		width: 200px;
		height: 180px;
	}
</style>
<body>
	<div class="container">
		<c:if test="${result eq 0}">
            <ol class="data-none eval-none">
               <li>미션이 평가할게 없습니다!</li>
               <li>본인이 직접 미션을 인증해보시지!</li>
               <li><img src="${project}images/mission_none.png"></li>
            </ol>
       </c:if>

		
       <c:if test="${result ne 0}">
		<article>
       <input id="mission_status_id" name="mission_status_id" type="hidden" value="test">
		<div class="divdiv">	
		 	<div>
                <span>${userMissionsDto.large_category}/${userMissionsDto.small_category}</span><br>
          	</div>
         	 <div>
                <span>${userMissionsDto.mission_title}</span><br>
           	</div>
           	<div id="profile" class="content-profile" onclick="location.href='user_anotherUser.jsp'">
                <img class="img-circle" src="${profile_picture}" onerror="this.src='${project}images/erroruser.png'">
                <span>${userMissionsDto.user_nickname}</span><br>
           	</div>
        </div>
		<div class="swiper-container">
	          <div class="swiper-button-prev"></div>
	               <div class="swiper-wrapper">
	                 <c:forEach var="content" items="${contents}">
	                 <div class="swiper-slide">
                		<c:if test="${fn:contains(content, '.mp4') or fn:contains(content, '.avi')}">
                			<video muted autoplay="autoplay" class="img-rounded">
								<source src="/upload/${content}">
							</video>
                		</c:if>
                		<c:if test="${!fn:contains(content, '.mp4') and !fn:contains(content, '.avi')}">
                			<img src="/upload/${content}" class="img-rounded"/>
                			
                		</c:if>
	               	</div>
					</c:forEach>
	    		  </div>
	   	<div class="swiper-button-next"></div>
		</div>
		<div class="eval-btn-line">
			<input class="successbtn" type="button" value="성공" name="pass" onclick="GoSuccessProPage('${userMissionsDto.mission_state_id}')"/>
			<input class="deletebtn" type="button"  value="실패" name="fail" onclick="GoFailureProPage('${userMissionsDto.mission_state_id}')"/>
		</div>
		</article>
		</c:if>
		

	</div>
		
   	 <nav>
            <ul>
                <li onclick="GoMainPage()">
                    <img class="nav-home" src="${project}images/blackMy.PNG" alt="logo">
                    <span>홈</span>
                </li>
                <li onclick="GoEvalPage()">
                    <img src="${project}images/dotbogi.PNG" alt="eval-icon">
                    <span>평가</span>
                </li>
                <li onclick="GoPidPage()">
                    <img src="${project}images/blackfeed.PNG" alt="pid-icon">
                    <span>피드</span>
                </li>
                <li onclick="GoMyPage()">
                    <img src="${project}images/blackMyPage.PNG" alt="my-icon">
                    <span>마이</span>
                </li>
            </ul>
        </nav>
      
    
     
     
<script>
//<--
/*
var swiper = new Swiper('.swiper-container', {
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
});
*/
var swiper =  new Swiper('.swiper-container', {
	pagination : { // 페이징 설정
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션 설정
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});

//-->
</script>
</body>
</html>
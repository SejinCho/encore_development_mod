<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="user_settings.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="stylesheet" href="${project}asset/user.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script src="${project}asset/script.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/23971e572d.js" crossorigin="anonymous"></script>
    <title>유저 성공 게시판</title>
</head>
<body style="overflow:hidden;">
    <div class="container">
        <header class="successBoard-header">
            <div class="search-bar">
                <i class="fas fa-search"></i>
                <input id="search_input" type="search" name="pidSearch" placeholder="검색" onkeydown="OnSearch()">
                <input id="opt" type="hidden" value="user">
            </div>
         	
         	<!-- 게시글 검색 -->
            <div id="search_result" class="search-result" style="display: none">
                
            </div>
        </header>
        <article class="boardArticle">
        	
        	<!-- 리스트 정렬 -->
            <section class="line-up">
            	<input id="cc" type="hidden" value="${option}">
            	<span class="unsel" onclick="location.href='user_successBoard.do'">최신순</span>
                <span class="sel" onclick="location.href='user_successBoard.do?option=popularity'">인기순</span>
			</section>
			
			<!-- 게시글리스트 -->
            <section class="board">
                <div class="list">
                	<c:forEach var="content" items="${contents}">
                		<c:if test="${fn:contains(content.contents, '.mp4') or fn:contains(content.contents, '.avi')}">
                			<video muted autoplay="autoplay" loop="loop" height="132px" class="img-rounded" width="33%" onclick="location.href='user_content.do?success_board_id=${content.success_board_id}'">
								<source src="/upload/${content.contents}">
							</video>
                		</c:if>
                		<c:if test="${!fn:contains(content.contents, '.mp4') and !fn:contains(content.contents, '.avi')}">
                			<img src="/upload/${content.contents}" height="132px" class="img-rounded" alt="thumbnail" onclick="location.href='user_content.do?success_board_id=${content.success_board_id}'"/>
                		</c:if>
                	</c:forEach>
                </div>
            </section>
        </article>
        
        
        <nav>
            <ul>
                <li onclick="GoMainPage()">
                    <img class="nav-home" src="${project}images/blackMy.PNG" alt="logo">
                    <span>홈</span>
                </li>
                <li onclick="GoEvalPage()">
                    <img src="${project}images/blackdotbogi.PNG" alt="eval-icon">
                    <span>평가</span>
                </li>
                <li onclick="GoPidPage()">
                    <img src="${project}images/feed.PNG" alt="pid-icon">
                    <span>피드</span>
                </li>
                <li onclick="GoMyPage()">
                    <img src="${project}images/blackMyPage.PNG" alt="my-icon">
                    <span>마이</span>
                </li>
            </ul>
        </nav>
    </div>
    
<script type="text/javascript">
	//<!--
	$(document).ready( function() {
		$('#search_input').on('keyup',function(event) {
			var tete = $('#search_input').val();
			if(tete==null || tete==''){
				$('#search_result').css('display','none');
			}
			
			$.ajax(
				{
					type : 'POST',
					url : 'search_successBoard.do',
					data : {
						search_input : $('#search_input').val(),
						option : $('#opt').val()
					},
					dataType : 'text',
					async : false,
					success : function(data) {
						$('#search_result').empty();
						$('#search_result').append('<div class="user">계정</div><div class="content">카테고리</div><br>');
						data = eval('(' + data +')');
						// 검색결과 출력
						if($('#opt').val() == 'user') {
							for(var i=0; i<data.usersDtos.length; i++){
								$('#search_result').append('<div class="searchUser">'+data.usersDtos[i].user_nickname+'</div>');
							}
						} else if($('#opt').val() == 'content'){
							for(var i=0; i<data.largeCategoryDtos.length; i++){
								$('#search_result').append('<div class="searchCategory">'+data.largeCategoryDtos[i].large_category+'</div>');
							}
							for(var i=0; i<data.categoryDtos.length; i++){
								$('#search_result').append('<div class="searchCategory">'+data.categoryDtos[i].large_category+ '/' + data.categoryDtos[i].small_category+ '</div>');
							}
							for(var i=0; i<data.smallCategoryDtos.length; i++){
								$('#search_result').append('<div class="searchCategory">'+ data.smallCategoryDtos[i].large_category + '/' + data.smallCategoryDtos[i].small_category+'</div>');
							}
						} 
						$(document).on('click', '.searchUser', function(event){
							location.href='user_successBoard.do?searchUser=' + $(this).text();
						});
						$(document).on('click', '.searchCategory', function(event){
							location.href='user_successBoard.do?searchCategory=' + $(this).text();
						});
						
						
						
						// 게시글 검색
						$(document).on('click', '.content', function(event) {
							$('#opt').val('content');
							$('#search_result').empty();
							$('#search_result').append('<div class="user">계정</div><div class="content">카테고리</div><br>');
							$('#search_input').focus();
							$('.content').css({
								'background': 'black',
								'color' : 'white'
							});
							$('.user').css({
								'background': 'white',
								'color' : 'black'
							});	
						});
						// 유저 검색
						$(document).on('click', '.user', function(event) {
							$('#opt').val('user');
							$('#search_result').empty();
							$('#search_result').append('<div class="user">계정</div><div class="content">카테고리</div><br>');
							$('#search_input').focus();
							$('.user').css({
								'background': 'black',
								'color' : 'white'
							});
							$('.content').css({
								'background': 'white',
								'color' : 'black'
							});
						});
						
						if($('#opt').val() == 'content'){
							$('.content').css({
								'background': 'black',
								'color' : 'white'
							});
							$('.user').css({
								'background': 'white',
								'color' : 'black'
							});	
						}else{
							$('.content').css({
								'background': 'white',
								'color' : 'black'
							});
							$('.user').css({
								'background': 'black',
								'color' : 'white'
							});	
						}
					},
					error : function(e){
						
					}
				}
			);
		});
	});
	
	//-->
</script>

<script>

	$(document).ready(function(){
		if( ($('#cc').val() == 'popularity') ){
			$('.sel').css({
				'background': '#F60170',
				'color': 'white',
			});
			$('.unsel').css('background','white');
		}else{
			$('.sel').css('background','white');
			$('.unsel').css({
				'background': '#F60170',
				'color': 'white',
			});
		}
	});
</script>
</body>
</html>



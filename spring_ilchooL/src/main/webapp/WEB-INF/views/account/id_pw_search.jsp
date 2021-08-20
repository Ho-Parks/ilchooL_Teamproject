<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/assets/css/id_pw_search.css">
<c:import url="../assets/head.jsp" />
<style type="text/css">

   * { margin: 0; padding: 0; }
   html, body { height: 100%; }

   .main { padding: 20px 0; min-height: 100%; margin: 0 auto -200px; }
   
   /* 메뉴바 색상 변경 */
   .nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover { background-color: #428bca !important; }

   /* 내용 div 정렬 */
   .input_label label { margin: 0 10px; }

   /* content 영역 스타일 */
   .content_area { font-size: 20px; }
   .content_area a { color: #428bca; }

   /* footer 처리 */
   .footer, .push { height: 200px; }
</style>
</head>
<body>
   <!-- header 파일 -->
   <div class="wrapper">
      <c:import url="../assets/header.jsp" />
      <div class="row">
      <div class="container">
   
   <!-- Modal -->
   <div id="Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header" style="text-align: center">
               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
               <h4 class="modal-title" id="ModalLabel">회원 정보 확인</h4>
            </div>
            <div class="modal-body" style="text-align: center">
               <h4>회원정보가 확인되었습니다.</h4>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
               <button type="button" class="btn btn-success" data-dismiss="modal" id="success_search">확인</button>
            </div>
         </div>
      </div>
   </div>

   <div class="id_pw">
      <hr/>
      <!-- 메뉴바 영역 (tab) -->
      <nav class="navbar" role="navigation">
         <ul class="nav nav-pills nav-justified">
            <li class="active"><a href="#id_search" data-toggle="tab">아이디</a></li>
            <li><a href="#pw_search" data-toggle="tab">비밀번호</a></li>
         </ul>
      </nav>

      <!-- 메뉴바 컨텐츠 영역 -->
      <div class="tab-content">
         <!-- 아이디 찾기 -->
         <div class="tab-pane fade in active" id="id_search">
            <div class="id_pw_box">
               <div class="content_box">
                  <form class="form-horizontal" name="id_pw_form" id="id_pw_form" action="${pageContext.request.contextPath}/account/id_search.do" method="post">
                     <div style="padding-top: 40px;">
                        <h2>아이디 찾기</h2>
                        <hr/>
                     </div>
                     
                     <div>
                        <div class="search">
                           <label for="name">이름</label>
                        </div>
                        <span class="box new_id">
                           <input type="text" name="user_name" class="new" placeholder="한글로 입력해주세요!" maxlength="20" />
                        </span>
                        <span class="error_next_box"></span>
                     </div>
                     <div>
						<div class="search">
							<label for="birthday">생년월일</label>
						</div>
						<span class="box birthday"> 
	                        <input type="date" name="birthday" class="new" id="birthday" />
	                    </span>
	                </div>
	                
	                <div>
                        <div class="search">
                           <label for="name">이메일</label>
                        </div>
                        <span class="box new_id">
                           <input type="text" name="email" id="email" class="new" placeholder="이메일을 입력해주세요!" maxlength="50" />
                        </span>
                        <span class="error_next_box"></span>
                     </div>
            
                     <div class="btn_area">
                        <button type="submit" id="btnJoin_id">
                           <span>검색하기</span>
                        </button>
                     </div>
                  </form>
                  <div class="content_area col-md-12" id="result"></div>
               </div>
            </div>
         </div>
         
         <!-- 비밀번호 초기화 -->
         <div class="tab-pane fade" id="pw_search">
            <div class="id_pw_box">
               <div class="content_box">
                  <form class="form-horizontal" name="id_pw_form" id="id_pw_form" action="${pageContext.request.contextPath}/account/pw_search.do" method="post">
                     <div style="padding-top: 40px;">
                        <h2>비밀번호 초기화</h2>
                        <hr/>
                     </div>
                     <div>
                        <div class="search">
                           <label for="name">아이디</label>
                        </div>
                        <span class="box new_id">
                           <input type="text" name="user_id" id="id" class="new" placeholder="아이디를 입력해주세요!" maxlength="50" />
                        </span>
                        <span class="error_next_box"></span>
                     </div>
                     <div>
                        <div class="search">
                           <label for="name">이메일</label>
                        </div>
                        <span class="box new_id">
                           <input type="text" name="email" id="email" class="new" placeholder="이메일을 입력해주세요!" maxlength="50" />
                        </span>
                        <span class="error_next_box"></span>
                     </div>
                     <div class="btn_area">
                        <button type="submit" id="btnJoin">
                           <span>초기화 하기</span>
                        </button>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
      <!-- <div class="push"></div> -->
   </div>
   </div>
   </div>
   </div>
   <div class="footer">
      <c:import url="../assets/footer.jsp" />
   </div>
   
   <script type="text/javascript">
   
   
      
      $(function(){
    	  function getContextPath() {
    	      var hostIndex = location.href.indexOf(location.host)
    	            + location.host.length;
    	      var contextPath = location.href.substring(hostIndex, location.href
    	            .indexOf('/', hostIndex + 1));
    	      return contextPath;
    	   }
    	  
         $("#btnJoin").click(function(){
            $.ajax({
               url : "/ilchooL/account/pw_search.do",
               type : "POST",
               dataType : 'text',
               data : {
            	  user_id : $("#id").val(),
                  email : $("#email").val()
               },
               success : function(result) {
            	   swal({
						title: '알림',
						text: '비밀번호를 초기화 하시겠습니까?',
						type: 'question',
						confirmButtonText: 'Yes', // 확인버튼 표시 문구
						showCancelButton: true, // 취소버튼 표시 여부
						cancelButtonText: 'No' // 취소버튼 표시 문구
					}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
						if (result.value) { // 확인 버튼이 눌러진 경우
							swal('초기화', '성공적으로 초기화 되었습니다.', 'success');
			            	   window.location.href = getContextPath() + "/account/id_pw_search.do";
						} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
							swal('초기화', '초기화가 취소되었습니다.', 'error');
			     		}
     				});
     			},
     		});
     	});
     });
      
   $("#btnJoin_id").click(function() {
	  if ('${success}' == "T") {
		  alert('${user_name}' + ' 님의 아이디는' + '${user_id}' + '입니다.');
		  
	  } else if('${success}' == "F") {
		  alert('아이디 찾기에 실패했습니다.');
	  }
   });

   </script>
</body>
</html>
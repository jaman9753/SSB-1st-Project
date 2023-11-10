<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <title>Item Management</title>


<!-----------------------------------  현정씨 ▼ ---------------------------------------------->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
<meta name="author" content="AdminKit">
<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="shortcut icon" href="img/icons/icon-48x48.png" />
<link rel="canonical" href="https://demo-basic.adminkit.io/" />

<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/app.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">    
<!-----------------------------------  현정씨 ▲ ---------------------------------------------->



<!--------  jQuery  --------->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="crossorigin="anonymous"></script>

<!------- common CSS  ------->
<link rel="stylesheet" href="${pageContext.request.contextPath}/adItem/css/itemMgt.css">


</head>
<body>


  <div class="wrapper">
	
  <!-- 사이드바 시작 -->
  <nav id="sidebar" class="sidebar js-sidebar">
  	<div class="sidebar-content js-simplebar">
	  <a class="sidebar-brand" href="./AdminMain.ad">
        <span class="align-middle">SSB</span>
      </a>

	  <ul class="sidebar-nav">
		<li class="sidebar-header">
			게시판 관리
		</li>

		<li class="sidebar-item">
			<a class="sidebar-link" href="./NoticeList.no">
              <i class="align-middle" data-feather=""></i> 
			  <span class="align-middle">공지사항</span>
            </a>
		</li>
		<li class="sidebar-item">
			<a class="sidebar-link" href="./InquiryList.iq">
              <i class="align-middle" data-feather=""></i> 
               <span class="align-middle">Q&A</span>
            </a>
		</li>				

		<li class="sidebar-header">
		</li>

		<li class="sidebar-item">
			<a class="sidebar-link" href="#">
              <i class="align-middle" data-feather=""></i> 
              <span class="align-middle">회원관리</span>
           	</a>
		</li>
		<li class="sidebar-item">
			<a class="sidebar-link" href="#">
              <i class="align-middle" data-feather=""></i> 
              <span class="align-middle">주문관리</span>
            </a>
		</li>
		<li class="sidebar-item">
			<a class="sidebar-link" href="./ItemMgt.it">
              <i class="align-middle" data-feather=""></i> 
              <span class="align-middle">상품관리</span>
            </a>
		</li>
					
	  </ul>
  	</div>
  </nav>
  <!-- 사이드바 끝 -->
		
  <!-- 메인 시작 -->
  <div class="main">
	<header class="navbar navbar-expand navbar-light navbar-bg">
		<a class="sidebar-toggle js-sidebar-toggle">
          <i class="hamburger align-self-center"></i>
        </a>       
    		<a href="./Main.in">
			  <img class="home" alt="home" src="./adImg/icons/home.png" width="22" height="22">
 			</a>    
		<c:if test="${sessionScope.userId == null }">
    		<a href="./AdminLogin.ad">
			  <img class="log-button" alt="login" src="./adImg/icons/login.png" width="25" height="25">
 			</a>    
		</c:if>
		<c:if test="${sessionScope.userId != null }">
    		<a href="./AdminLogout.ad">
			  <img class="log-button" alt="logout" src="./adImg/icons/logout.png" width="25" height="25">
 			</a>   
    	</c:if>	
	</header>
<!-----------------------------------  현정씨 ▲ ---------------------------------------------->

    <main id="item">
        <section class="list">
            <span>
                <h1>상품 관리</h1>
                <%-- 검색창 --%>
                <span class="search-bar">
                    <input type="text" id="searchInput" placeholder="   상품명을 입력해 주세요">
                    <button id="searchButton">검색</button>
                      <button id="addButton" onclick="location.href='./itemAddForm.it';">상품 등록</button>
					  <!-- <input type="button" value="상품 등록" class="addButton" onclick="location.href='./itemAddForm.it';"> -->
                    
                    <button id="editButton">상품 수정</button>
                </span>
            </span>
            <table class="sort">
                <%-- 체크박스 / 상품ID / 상품명(썸네일+제목) / 판매가 / 카테고리 / 옵션 / 재고 --%>
                <colgroup>
                    <col style="width: 3%" />
                    <col style="width: 5%" />
                    <col style="width: 7%" />
                    <col style="width: 15%" />
                    <col style="width: 7%" />
                    <col style="width: 15%" />
                    <col style="width: 7%" />
                    <col style="width: 10%" />
                    <col style="width: 5%" />
                </colgroup>
                <thead>
                    <tr>
                        <th><label class="checkbox-inline">
                            <input type="checkbox" id="cbx_chkAll">
                        </label></th>
                        <th>제품ID</th>
                        <th>이미지</th>
                        <th>상품명</th>
                        <th>판매가</th>
                        <th>카테고리</th>
                        <th>브랜드</th>
                        <th>옵션</th>
                        <th>재고</th>
                    </tr>
                </thead>
                
                <%-- 상품 리스트 --%>
                <c:forEach var="dto" items="${ItemMgt }">
                    <tr style="background-color: white;">
                        <td><label class="checkbox-inline">
                            <input type="checkbox" name="chk" value="${dto.item_id }">
                        </label></td>
                        
                        <td><c:out value="${dto.item_id }"></c:out></td>
                        <td>
                            <a href="#" class="thumb">
                    		    <img alt="제품이미지" src="./main/item_img/${dto.item_img_main }">
                            </a>
                        </td>
                        <td>${dto.item_name }</td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.item_price}" />원</td>
                        <td>${dto.category_sport } - ${dto.category_sub } (${dto.category_major })</td>
                        <td>${dto.category_brand }</td>
                        <td>${dto.options_name } 
                            ${dto.options_value }</td>
                        <td>${dto.options_quantity }</td>
					</tr>
                </c:forEach>

            </table>
            
            
			<!--- 페이징 --->
            <div class="paging">
                <button id="deleteButton">상품 삭제</button>
                
                <c:if test="${startPage > pageBlock }">
                <!-- <span class="prev"> -->
                    <a href="./ItemMgt.it?pageNum=${startPage-pageBlock }&search=${param.search}">< 이전</a>
                <!-- </span> -->
                </c:if>
                
                <span class="num">
                <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1"> 
					<a href="./ItemMgt.it?pageNum=${i }&search=${param.search}" class="on" >${i }</a> 
				</c:forEach>
                </span>
                
                <c:if test="${endPage < pageCount }">
               <!--  <span class="next"> -->
                    <a href="./ItemMgt.it?pageNum=${startPage+pageBlock }&search=${param.search}">다음 ></a>
                <!-- </span> -->
                </c:if>
            </div>
        </section>
    </main>
    
    
    <footer class="footer">
   <!--      <p>&copy; 2023 SSB Style</p> -->
    </footer>
    

    <script src="./item/js/item.js"></script>
    <script src="js/app.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>

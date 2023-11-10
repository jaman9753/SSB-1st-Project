<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Item Add Form</title>

  <!----- Bootstrap CSS ---->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <!-------  jQuery  ------->
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="crossorigin="anonymous"></script>
  <!------ common CSS  ----->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/adItem/css/itemMgt.css">
  
  
  <style>

  </style>
</head>

						<!-- 코드 정리 나중에 낮에 -->
<body>
<form action="/ItemAddAction.it" method="post">

<!-- <form action="./ItemAddAction.it" method="post"> -->
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
           
           <div class="Add-form">
        
        <h4 class="addTitle">상품 등록</h4>
        <form class="validation-form" novalidate>


          <div class="row">
            <div class="Add-A">
              <label for="code">상품 구분</label>
              <select class="custom-select" name="code" required>
              <option value="" disabled selected>&nbsp;&nbsp;분류</option>
                <option value="sell">판매</option>
                <!-- <option >렌탈</option> -->
              </select>
            </div>
            
            
            <div class="Add-B">
              <label for="name">상품명</label>
              <input type="text" class="form-control" id="name" placeholder="" value="" required>
              <div class="invalid-feedback">
                상품명을 입력해주세요.
              </div>
            </div>
          </div>
            
            
            
          <div class="row">
            <div class="Add-C">
              <label for="category">카테고리</label>
			    <select class="custom-select" name="sport" required>
                <option value="" disabled selected>&nbsp;스포츠를 선택해 주세요</option>
                <option>공용</option>
                <option>축구/풋살/족구</option>
                <option>야구/소프트볼</option>
                <option>농구</option>
                <option>배구</option>
                <option>탁구</option>
                <option>테니스</option>
                <option>배드민턴</option>
                <option>골프</option>
                <option>수영/수상레포츠</option>
                <option>스키/보드/빙상</option>
                <option>캠핑/등산</option>
                <option>헬스/요가</option>
                <option>무도/격투</option>
                <option>육상/체조</option>
                <option>자전거/킥보드/인라인</option>
                <option>뉴스포츠</option>
                <option>기타</option>
              </select> <br><br>
	<!-- 대분류 초록불 수정하기 -->		  
<div id="app">
  <select class="custom-select" id="major">
    <option value="" disabled selected>대분류를 선택해 주세요</option>
    <option value="의류">의류</option>
    <option value="잡화">잡화</option>
    <option value="신발">신발</option>
    <option value="용품">용품</option>
  </select>
  <br><br>
  <select class="custom-select" id="sub" required>
    <option value="" disabled selected>소분류를 선택해 주세요</option>
  </select>
  <br>
</div>
            </div>
          </div> <!-- 카테고리 끝 -->


	<div class="row">
          <div class="Add-D">
            <label for="item">가격</label>
            <input type="item" class="form-control" id="item" placeholder="" required>
            <div class="invalid-feedback">
            비용을 입력해주세요.
            </div>
          </div>
          
           <div class="Add-E">
            <label for="item">잔여 재고</label>
            <input type="item" class="form-control" id="item" placeholder="" required>
            <div class="invalid-feedback">
            재고 수량을 입력해주세요.
            </div>
          </div>

           <div class="Add-F">
            <label for="item">브랜드</label>
            <input type="item" class="form-control" id="item" placeholder="" required>
            <div class="invalid-feedback">
            브랜드명을 입력해주세요.
            </div>
          </div>
     </div>
            
            
            
       <div class="row">
            <div class="Add-G">
              <label for="name">옵션명</label>
              <input type="text" class="form-control" id="name" placeholder="size, color, Etc" value="" required>
              <div class="invalid-feedback">
                옵션명을 입력해주세요.
              </div>
            </div>
            
            <div class="Add-H">
              <label for="name">옵션값</label>
              <input type="text" class="form-control" id="name" placeholder="" value="" required>
              <div class="invalid-feedback">
                옵션값을 입력해주세요.
              </div>
            </div>
            </div>
            
            
            <!-- <input type="file" name="file" accept="image/*"> -->
			 <div class="row">
			 <div class="filebox">
  		 	 <input class="upload-main" value="" placeholder="상품의 대표 이미지" >
   			  <div class="invalid-feedback">
                썸네일용 이미지가 필요해요.
              </div>
   			 <label for="img_main">파일찾기</label> 
   			 <input type="file" id="img_main" accept="image/*">
			</div>
			
			 <div class="filebox">
  		 	 <input class="upload-sub" value="" placeholder="상품 설명 이미지">
   			  <div class="invalid-feedback">
                상품 설명 이미지가 필요해요.
              </div>
   			 <label for="img_sub">파일찾기</label> 
   			 <input type="file" id="img_sub" accept="image/*">
			</div>
			
			 <div class="filebox">
  		 	 <input class="upload-logo" value="" placeholder="브랜드 로고">
   			 <label for="img_logo">선택사항</label> 
   			 <input type="file" id="img_logo" accept="image/*">
			</div>
			
			</div>
         
         
          </div>
          
          <hr class="mc">
          <button class="btn btn-primary btn-lg btn-block" type="submit">등록 완료</button>
            
          </div>
        </form>
      </div>
    </div>
    </from>
    
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2023 SSB</p>
    </footer>
  
  
<script src="${pageContext.request.contextPath}/item/js/item.js"></script>

</body>
</html>

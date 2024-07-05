<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FoodieTree</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
          integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="/assets/css/common.css">
    <link rel="stylesheet" href="/assets/css/customer/customer-mypage-edit.css">
</head>
<body>
<header>
    <div class="container">
        <div class="logo"><h1>FoodieTree</h1></div>
        <div class="logo-img">
            <img src="/assets/img/img_2.png" alt="logo">
        </div>
    </div>
</header>
<section class="my-page-area">
    <div class="container">
        <div class="profile">
            <h2>${customerMyPageDto.customerId}</h2>
            <ul class="nav">
                <li class="nav-item"><a class="nav-link" href="mypage">마이페이지</a></li>
                <li class="nav-item"><a class="nav-link" href="mypage-edit">개인정보수정</a></li>
            </ul>
        </div>
        <div class="edit">
            <div class="edit-box">
                <div class="title">
                    <h3 class="title-text">내프로필</h3>
                </div>
                <div class="edit-wrapper">
                    <div class="input-area">
                        <div class="input-wrapper">
                            <div class="icon"><i class="fa-solid fa-user"></i></div>
                            <input type="text" id="nickname" value="${customerMyPageDto.nickname}">
                            <div class="icon"><i class="fa-regular fa-square-check"
                                                 style="color: #45a049; font-size: 25px; cursor: pointer"></i>
                            </div>
                        </div>
                        <div class="input-wrapper">
                            <div class="icon"><i class="fa-solid fa-phone"></i></div>
                            <input type="text" id="phone"
                                   value="${customerMyPageDto.customerPhoneNumber}">
                            <div class="icon"><i class="fa-regular fa-square-check"
                                                 style="color: #45a049; font-size: 25px; cursor: pointer"></i>
                            </div>
                        </div>
                        <div class="input-wrapper">
                            <div class="icon"><i class="fa-solid fa-key"></i></div>
                            <button class="btn">비밀번호 재설정</button>
                        </div>
                    </div>
                    <div class="image-wrapper">
                        <input type="file" name="profileImage" id="profileImage" accept="image/*"
                               style="display: none;">
                        <a href="#" id="avatar" class="before">
                            <i class="fa-solid fa-pen-to-square"></i>
                            <img
                                    src="${customerMyPageDto.profileImage ? customerMyPageDto.profileImage : '/assets/img/western.jpg'}"
                                    alt="Customer profile image">
                        </a>
                        <button id="profile_btn" class="btn" type="submit" value="프로필 변경"
                                style="display: none;">이미지 변경
                        </button>
                    </div>
                </div>
            </div>
            <div class="edit-box">
                <div class="title">
                    <h3 class="title-text">선호지역</h3>
                </div>
                <div class="edit-wrapper">
                    <ul class="preferred">
                        <c:forEach var="area" items="${customerMyPageDto.preferredArea}"
                                   varStatus="status">
                            <li id="area-${status.index}">
                                <span>${area}</span>
                                <i class="fa-solid fa-circle-xmark delete-btn"></i>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="edit-box">
                    <div class="title">
                        <h3 class="title-text">선호음식</h3>
                    </div>
                    <div class="edit-wrapper">
                        <ul class="preferred">
                            <c:forEach var="food" items="${customerMyPageDto.preferredFood}" varStatus="status">
                                <li id="food-${status.index}">
                                    <div class="img-box">
                                        <img src="${food.foodImage}" alt="선호음식이미지">
                                    </div>
                                    <span>${food.preferredFood}</span>
                                    <i class="fa-solid fa-circle-xmark delete-btn"></i>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="edit-box">
                    <div class="title">
                        <h3 class="title-text">최애가게</h3>
                    </div>
                    <div class="edit-wrapper">
                        <ul class="preferred">
                            <c:forEach var="store" items="${customerMyPageDto.favStore}" varStatus="status">
                                <li id="store-${status.index}">
                                    <div class="img-box">
                                        <img src="${store}" alt="최애가게이미지">
                                    </div>
                                    <span>${store.storeName}</span>
                                    <i class="fa-solid fa-heart on"></i>
                                    <i class="fa-regular fa-heart off" style="display: none"></i>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
  const avatar = document.getElementById('avatar');
  const profileImage = document.getElementById('profileImage');
  const $profileBtn = document.getElementById('profile_btn');

  avatar.addEventListener('click', () => {
    profileImage.click();
  });
  profileImage.addEventListener('change', () => {
    console.log(profileImage.files[0]);
    avatar.querySelector('img').src = URL.createObjectURL(profileImage.files[0]);
    $profileBtn.style.display = 'block';
    avatar.classList.remove('before');
  });

  $profileBtn.addEventListener('click', () => {
    requestProfileImg();
  });

  const requestProfileImg = async () => {
    const formData = new FormData();
    formData.append('profileImage', profileImage.files[0]);
    //   비동기 요청
    const response = await fetch('/customer/mypage-edit', {
      method: 'POST',
      body: formData
    });
    const result = await response.json();
    console.log(result);
  };

  //   하트 클릭
  const $heart = document.querySelectorAll('.fa-heart');
  $heart.forEach(heart => {
    heart.addEventListener('click', () => {
      if (heart.classList.contains('on')) {
        heart.style.display = 'none';
        heart.nextElementSibling.style.display = 'block';
      }
      else {
        heart.style.display = 'none';
        heart.previousElementSibling.style.display = 'block';
      }
    });
  });
</script>
<!-- 공통푸터 -->
<%@ include file="include/footer.jsp" %> 
</body>
</html>

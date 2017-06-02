<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html>
<html>
<head>
  <title>Фид</title>
  
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" type="text/css" href="./assets/css/vendor.css">
  <link rel="stylesheet" type="text/css" href="./assets/css/flat-admin.css">



</head>
<body>
  <div class="app app-default">


<aside class="app-sidebar" id="sidebar">
  <div class="sidebar-header">
    <a class="sidebar-brand" href="/index"><span class="highlight">Bookmarker!</span></a>
    <button type="button" class="sidebar-toggle">
      <i class="fa fa-times"></i>
    </button>
  </div>
  <div class="sidebar-menu">
    <ul class="sidebar-nav">
      <li class="active">
        <a href="./index">
          <div class="icon">
            <i class="fa fa-diamond" aria-hidden="true"></i>
          </div>
          <div class="title">Фид</div>
        </a>
      </li>
      <li class="@@menu.messaging">
        <a href="./bookmarks">
          <div class="icon">
            <i class="fa fa-bookmark" aria-hidden="true"></i>
          </div>
          <div class="title">Закладки</div>
        </a>
      </li>

      <li class="">
        <a href="./friends" >
          <div class="icon">
            <i class="fa fa-group" aria-hidden="true"></i>
          </div>
          <div class="title">Друзья</div>
        </a>

      </li>
      <li class="@@menu.pages">
        <a href="./liked">
          <div class="icon">
            <i class="fa fa-heart" aria-hidden="true"></i>
          </div>
          <div class="title">Понравившиеся</div>
        </a>

      </li>
    </ul>
  </div>
  <div class="sidebar-footer">
    <ul class="menu">

    </ul>
  </div>
</aside>

<div class="app-container">

  <nav class="navbar navbar-default" id="navbar">
  <div class="container-fluid">
    <div class="navbar-collapse collapse in">
      <ul class="nav navbar-nav navbar-mobile">
        <li>
          <button type="button" class="sidebar-toggle">
            <i class="fa fa-bars"></i>
          </button>
        </li>
        
        <li>
          <button type="button" class="navbar-toggle">
            <img class="profile-img" src="./assets/images/profile.png">
          </button>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-left">
        <li class="navbar-title">Фид</li>
        <li class="navbar-search hidden-sm">
        </li>
      </ul>
      <jsp:include page="fragments/navbar.jsp"></jsp:include>
    </div>
  </div>
</nav>


  


<div class="row">
  <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
      <a class="card card-banner card-green-light">
  <div class="card-body">
    <i class="icon fa fa-bookmark fa-4x"></i>
    <div class="content" onclick="location.href='/bookmarks'">
      <div class="title">Моих закладок</div>
      <div class="value"><span class="sign"></span>${bcount}</div>
    </div>
  </div>
</a>

  </div>
  <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
      <a class="card card-banner card-blue-light">
  <div class="card-body">
    <i class="icon fa fa-heart fa-4x"></i>
    <div class="content" onclick="location.href='/liked'">
      <div class="title">Понравившиеся</div>
      <div class="value"><span class="sign"></span>${likedNum}</div>
    </div>
  </div>
</a>

  </div>
  <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" >
      <a class="card card-banner card-yellow-light">
  <div class="card-body">
    <i class="icon fa fa-group fa-4x"></i>
    <div class="content" onclick="location.href='/friends'">
      <div class="title">Друзей</div>
      <div class="value"><span class="sign"></span>${friends}</div>
    </div>
  </div>
</a>

  </div>
</div>

<div class="col-sm-8 col-xs-12">
  <div class="card">
    <div class="card-header">
      Активность друзей
    </div>

    <div class="card-body">
<c:forEach items="${activity}" var="act">
      <div class="media social-post">

  <div class="media-left">
    <a href="#">
      <img src="../assets/images/profile.png" />
    </a>
  </div>


  <div class="media-body" >
    <div class="media-heading">
      <h4 class="title"> ${act.header}  <span style="color: darkgray">@${act.name}</span></h4>
      <h5 class="timeing">${act.date}</h5>
    </div>

    <div class="media-content" onclick="location.href='${act.site}'" style="cursor: pointer;">${act.text}</div>
    <div class="media-action">
      <form action="/api/service/like" method="post">
        <button class="btn btn-link" name="bookmarkId" value="${act.bookmarkID}"><i class="fa fa-heart"></i> Понравилось </button>
      </form>
    </div>

  </div>

</div>
      </c:forEach>
    </div>
  </div>
</div>


</div>

  </div>

  <script type="text/javascript" src="./assets/js/vendor.js"></script>
  <script type="text/javascript" src="./assets/js/app.js"></script>

</body>
</html>

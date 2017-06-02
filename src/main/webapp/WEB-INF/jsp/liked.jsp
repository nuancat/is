<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>

<!DOCTYPE html>
<html>
<head>
  <title>Понравившиеся</title>
  
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" type="text/css" href="../assets/css/vendor.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/flat-admin.css">


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
      <li class="">
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
      <li class="active">
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
            <img class="profile-img" src="../assets/images/profile.png">
          </button>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-left">
        <li class="navbar-title">Понравившиеся</li>
        <li class="navbar-search hidden-sm">
        </li>
      </ul>
      <jsp:include page="fragments/navbar.jsp"></jsp:include>
    </div>
  </div>
</nav>

  <div class="row">
    <div class="col-xs-12">
      <div class="card">
        <div class="card-header">
          Понравившиеся закладки
        </div>
        <div class="card-body no-padding">
          <table class="datatable table table-striped primary" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Категория</th>
            <th>Название</th>
            <th>Сайт</th>
            <th>Дата</th>

        </tr>
    </thead>
    <tbody>
    <c:forEach items="${liked}" var="l">
        <tr >
            <td>${l.cathegory}</td>
            <td>${l.name}</td>
            <td><a href="${l.site}">${l.site}</a></td>
            <td>${l.date}</td>

      </tr>
    </c:forEach>
    </tbody>
</table>

        </div>
      </div>
    </div>
  </div>

  </div>
  
  <script type="text/javascript" src="../assets/js/vendor.js"></script>
  <script type="text/javascript" src="../assets/js/app.js"></script>

</body>
</html>

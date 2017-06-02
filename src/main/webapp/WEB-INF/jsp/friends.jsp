<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html>
<html>
<head>
  <title>Друзья</title>
  
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

      <li class="active">
        <a href="./friends">
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
            <img class="profile-img" src="../assets/images/profile.png">
          </button>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-left">
        <li class="navbar-title"><span class="highlight">Друзья</span></li>
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
            Мои закладки
          </div>
          <div class="card-body no-padding">
            <table class="datatable table table-striped primary" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Полное имя</th>
            <th>Логин</th>
            <th>Профиль VK</th>

        </tr>
    </thead>
    <tbody>
    <c:forEach items="${friends}" var="f">
      <tr >
        <td>${f.fullname}</td>
        <td>${f.login}</td>
        <td><a href="http://vk.com/${f.login}">http://vk.com/${f.login}</a></td>
      </tr>
    </c:forEach>



    </tbody>
</table>

          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-12">
        <div>
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
          Добавить друга
          </button>
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Введите логин друга</h4>
              </div>
              <form action="/api/service/friendshipRequest" class="form form-horizontal" method="post">
              <div class="modal-body">

                  <div class="section">

                    <div class="section-body">
                      <div class="form-group">
                        <label class="col-md-3 control-label">Введите логин</label>
                        <div class="col-md-9">
                          <input type="text" required name="targetLogin" class="form-control" placeholder="">
                        </div>
                      </div>


                    </div>
                  </div>

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Удалить</button>
                <button type="submit" class="btn btn-sm btn-success">Отправить заявку</button>
              </div>
              </form>
            </div>
          </div>
        </div>

      </div>
    </div>
</div>

  </div>
  
  <script type="text/javascript" src="../assets/js/vendor.js"></script>
  <script type="text/javascript" src="../assets/js/app.js"></script>

</body>
</html>

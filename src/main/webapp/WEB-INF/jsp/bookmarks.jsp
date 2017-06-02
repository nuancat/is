<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html>
<html>
<head>
  <title>Закладки</title>
  
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" type="text/css" href="./assets/css/vendor.css">
  <link rel="stylesheet" type="text/css" href="./assets/css/flat-admin.css">

  <!-- Theme -->
  <link rel="stylesheet" type="text/css" href="./assets/css/theme/blue-sky.css">
  <link rel="stylesheet" type="text/css" href="./assets/css/theme/blue.css">
  <link rel="stylesheet" type="text/css" href="./assets/css/theme/red.css">
  <link rel="stylesheet" type="text/css" href="./assets/css/theme/yellow.css">

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
      <li class="active">
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
          <li class="navbar-title"><span class="highlight">Закладки</span></li>
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
            <th>Категория</th>
            <th>Название</th>
            <th>Сайт</th>
            <th>Дата</th>
            <th>Доступ </th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${bookmarks}" var="i">
      <tr>
      <td>${i.cathegory}</td>
      <td>${i.name.length()>85?i.name.substring(0,85):i.name}</td>
      <td><a href="${i.site}">${i.site.length()>30?i.site.substring(0,30):i.site}</a></td>
      <td>${i.date}</td>
      <td>${i.access?"Да":"Нет"}</td>

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
        Добавить закладку
        </button>
      </div>
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title">Добавление закладки</h4>
            </div>
            <form class="form form-horizontal" action="/bookmarks" method="post">
            <div class="modal-body">

                <div class="section">

                  <div class="section-body">
                    <div class="form-group">
                      <label class="col-md-3 control-label">Категория</label>
                      <div class="col-md-9">
                        <input name="cathegory" required type="text" class="form-control" placeholder="">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-md-3">
                        <label class="control-label">Название</label>
                        <p class="control-label-help">( Не более 150 символов )</p>
                      </div>
                      <div class="col-md-9">
                        <textarea name="name" required class="form-control"></textarea>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-md-3 control-label">Сайт</label>
                      <div class="col-md-9">
                        <div class="input-group">

                          <input name="site" required type="text" class="form-control" aria-label="">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="section">
                  <div class="section-title"></div>
                  <div class="section-body">
                    <div class="form-group">
                      <label class="col-md-3 control-label">Доступ</label>
                      <div class="col-md-9">
                        <div class="radio radio-inline">
                            <input type="radio" name="access" id="radio10" value="true">
                            <label for="radio10">
                              Открытый
                            </label>
                        </div>
                        <div class="radio radio-inline">
                            <input type="radio" name="access" id="radio11" value="false" checked>
                            <label for="radio11">
                              Закрытый
                            </label>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Удалить</button>
              <button type="submit" class="btn btn-sm btn-success">Сохранить</button>
            </div>
            </form>
          </div>
        </div>
      </div>

    </div>
  </div>

</div>

  </div>
  
  <script type="text/javascript" src="./assets/js/vendor.js"></script>
  <script type="text/javascript" src="./assets/js/app.js"></script>

</body>
</html>

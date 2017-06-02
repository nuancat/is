<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html>
<html>
<head>
  <title>Профиль</title>
  
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
        <li class="navbar-title">Профиль</li>
        <li class="navbar-search hidden-sm">
        </li>
      </ul>
      <jsp:include page="fragments/navbar.jsp"></jsp:include>
    </div>
  </div>
</nav>

  <div class="row">
    <div class="col-lg-12">
      <div class="card">
        <div class="card-body app-heading">
          <img class="profile-img" src="../assets/images/profile.png">
          <div class="app-title">
            <div class="title"><span class="highlight">Шамиль</span></div>
            <div class="description">Разработчик</div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-12">
      <div class="card card-tab">
        <div class="card-header">
          <ul class="nav nav-tabs">
            <li role="tab1" class="active">
              <a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">Профиль</a>
            </li>
            <li role="tab4">
              <a href="#tab4" aria-controls="tab4" role="tab" data-toggle="tab">Настройки</a>
            </li>
          </ul>
        </div>
        <div class="card-body no-padding tab-content">
          <div role="tabpanel" class="tab-pane active" id="tab1">
            <div class="row">
              <div class="col-md-12 col-sm-12">
                <div class="section">
                  <div class="section-title"><i class="icon fa fa-user" aria-hidden="true"></i> О себе </div>
                  <div class="section-body __indent">Классный парень, занимаюсь разработками высокопроизводительных распределенных систем</div>
                </div>
                <div class="section">
                  <div class="section-title"><i class="icon fa fa-book" aria-hidden="true"></i> Интересы </div>
                  <div class="section-body __indent">Игры с мячом, бег, языки, велосипед</div>
                </div>
                <div class="section">
                  <div class="section-title"><i class="icon fa fa-envelope" aria-hidden="true"></i> Связь </div>
                  <div class="section-body __indent">Вк, фейсбук, и прочее</div>
                </div>
              </div>

            </div>
          </div>

          <div role="tabpanel" class="tab-pane" id="tab4">
            <form class="form form-horizontal">
  <div class="section">
    <div class="section-title">Информация</div>
    <div class="section-body">
      <div class="form-group">
        <label class="col-md-3 control-label">Имя и Фамилия</label>
        <div class="col-md-9">
          <input type="text" class="form-control" placeholder="">
        </div>
      </div>
      <div class="form-group">
        <div class="col-md-3">
          <label class="control-label">Интересы</label>
          <p class="control-label-help">Коротко о себе , максимально 150 слов</p>
        </div>
        <div class="col-md-9">
          <textarea class="form-control"></textarea>
        </div>
      </div>
      <div class="form-group">
        <div class="col-md-3">
          <label class="control-label">Связь</label>
          <p class="control-label-help">Свои контакты в свободной форме</p>
        </div>
        <div class="col-md-9">
          <textarea class="form-control"></textarea>
        </div>
      </div>
    </div>
  </div>
  <div class="form-footer">
    <div class="form-group">
      <div class="col-md-9 col-md-offset-3">
        <button type="submit" class="btn btn-primary">Сохранить</button>
      </div>
    </div>
  </div>
</form>

<form class="form form-horizontal">
  <div class="section">
    <div class="section-title">Параметры входа</div>
    <div class="section-body">
      <div class="form-group">
        <label class="col-md-3 control-label">Старый пароль</label>
        <div class="col-md-9">
          <input type="password" class="form-control" placeholder="" type="password">
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">Новый пароль</label>
        <div class="col-md-9">
          <input type="password" class="form-control" placeholder="" >
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">Подтверждение</label>
        <div class="col-md-9">
          <input type="password" class="form-control" placeholder="" >
        </div>
      </div>
    </div>
  </div>
  <div class="form-footer">
    <div class="form-group">
      <div class="col-md-9 col-md-offset-3">
        <button type="submit" class="btn btn-primary">Сохранить</button>
      </div>
    </div>
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


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Вход</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="../assets/css/vendor.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/flat-admin.css">

</head>
<body>


<div class="app-container app-login">
  <div class="flex-center">
    <div class="app-body">
      <div class="app-block">
      <div class="app-form">
        <div class="form-header">
          <div class="app-brand"><span class="highlight">Добро</span> пожаловать</div>
        </div>
        <form action="/service/checkUser" method="post">
            <div class="input-group">
              <span class="input-group-addon" id="basic-addon1">
                <i class="fa fa-user" aria-hidden="true"></i></span>
              <input type="text" name="login" required class="form-control" placeholder="Логин">
            </div>
            <div class="input-group">
              <span class="input-group-addon" id="basic-addon2">
                <i class="fa fa-key" aria-hidden="true"></i></span>
              <input type="password" name="password" required class="form-control" placeholder="Пароль">
            </div>
            <div class="text-center">
                <input type="submit" class="btn btn-success btn-submit" value="ВОЙТИ">
            </div>
        </form>

        <div class="form-line">
          <div class="title">ИЛИ</div>
        </div>
        <div class="form-footer">

                <div class="text-center" onClick='location.href="/pages/register"'>
                    <input type="submit" class="btn btn-success btn-submit" value="ЗАРЕГИСТРИРОВАТЬСЯ">
                </div>
       </div>
      </div>
      </div>
    </div>
    <div class="app-footer">
    </div>
  </div>
</div>
</body>
</html>

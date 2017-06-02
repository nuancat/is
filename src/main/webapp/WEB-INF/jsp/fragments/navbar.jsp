<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown notification danger">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <div class="icon"><i class="fa fa-bell" aria-hidden="true"></i></div>
                        <div class="title">System Notifications</div>
                        <div class="count">${friendshipRequests.size()}</div>
                    </a>
                    <div class="dropdown-menu">
                        <ul>
                            <li class="dropdown-header">Заявки</li>
                            <li>
                                <a href="#">
                                    <c:forEach items="${friendshipRequests}" var="f">
                                    <div class="message">
                                        <div class="content">
                                            <div class="title">${f.fullname}</div>
                                            <div class="description">Хочет добавить вас</div>

                                            <form class="" action="/api/service/friendshipAccept" method="post">
                                                <button class="label label-success"  name="acceptLogin" value="${f.id}">
                                                    Добавить
                                                </button>


                                                <button class="label label-danger" name="declineLogin" value="${f.id}">
                                                    Удалить
                                                </button>
                                            </form>

                                        </div>
                                    </div>
                                    </c:forEach>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="dropdown profile">
                    <a href="/html/pages/profile.html" class="dropdown-toggle"  data-toggle="dropdown">
                        <img class="profile-img" src="./assets/images/profile.png">
                        <div class="title">Profile</div>
                    </a>
                    <div class="dropdown-menu">
                        <div class="profile-info">
                            <h4 class="username">${user.fullname}</h4>
                        </div>
                        <ul class="action">
                            <li>
                                <a href="profile">
                                    Профиль
                                </a>
                            </li>
                            <li>
                                <a href="profile">
                                    Настройки
                                </a>
                            </li>
                            <li>
                                <a href="api/service/logout">
                                    Выйти
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>

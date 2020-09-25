
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="/com/zhuye.jsp"/>
<head>
    <title>首页</title>
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">



<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span>

                            <img alt="image" class="img-circle" src="${sessionScope.manager.photo}" width="80" height="80"/></span>





                    </div>
                    <a  style="font-size: 12px" href="Mapper/doLogin">安全退出</a>

                    <div class="logo-element">H+
                    </div>
                </li>
                <li>
                    <a href="login.jsp">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">主页</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">

                        <li>
                            <a class="J_menuItem" href="static/index.jsp" data-index="0">星空背景</a>
                        </li>

                    </ul>

                </li>

                <c:forEach items="${listfu}" var="per">


                    <li>
                        <a href="#">
                            <i class="fa fa fa-bar-chart-o"></i>
                            <span class="nav-label">${per.pName}</span>
                            <span class="fa arrow"></span>
                        </a>

                        <c:forEach var="per1" items="${listall}">

                            <ul class="nav nav-second-level">

                                <c:if test="${per1.parentid == per.permissionId}">
                                    <li>
                                        <a class="J_menuItem" href="${per1.url}">${per1.pName}</a>
                                    </li>
                                </c:if>


                            </ul>

                        </c:forEach>
                    </li>

                </c:forEach>


            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">


        <div class="row J_mainContent" id="content-main">

            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="static/index.jsp" frameborder="0" data-id="index_v1.html" seamless></iframe>
        </div>






    </div>
    </div>


</body>
</html>

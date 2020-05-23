<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="../css/normal.css"/>
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon"/>
</head>
<body>
<!-- 头部导航区 -->
<div class="nav">
    <div class="title">
        linger的书城
    </div>
    <div class="user">欢迎您！${sessionScope.user.username}</div>
    <div class="user"><a href="/index.jsp">首页</a> </div>
</div>
<!-- 主体区域 -->
<div class="content">
    <form>
        <table border="1" cellspacing="0" cellpadding="0">
            <thead>
            <td>#</td>
            <td>书名</td>
            <td>数量</td>
            </tr>
            </thead>
           <c:if test="${empty sessionScope.cart}">
               <tr>
                   <td colspan="3">购物车为空，快去添加吧！</td>
               </tr>
           </c:if>
            <c:if test="${!empty sessionScope.cart}">
               <c:forEach items="${sessionScope.cart}" var="item" varStatus="status">
                   <tr>
                       <td>${status.index+1}</td>
                       <td>《${item.key}》</td>
                       <td>${item.value}本</td>
                   </tr>
               </c:forEach>
            </c:if>
        </table>
    </form>
</div>
<div class="banner">Copyright 最终解释权归王道第四组所有</div>
<script src="js/jquery-2.1.1.min.js"></script>
<script src="layer/layer.js"></script>
</body>
</html>

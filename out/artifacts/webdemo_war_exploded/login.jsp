<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <title>书城登录</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
<div class="login-page">
    <div class="form">
        <c:if test="${! empty requestScope.message}">
            <p style="color: red">${requestScope.message}</p>
        </c:if>
        <form class="login-form"  action="/loginServlet" method="post">
            <input name="username" id="username" placeholder="用户名">
            <input type="password" name="password" id="password" placeholder="密码">
            <button type="submit" id="btnSub">登录</button>
        </form>
    </div>
</div>
<script src="./js/jquery-2.1.1.min.js"></script>
<script src="./layer/layer.js"></script>
   <script type="text/javascript">
       $("#btnSub").click(function () {
           //通过id选择器获取值
            var username=$("#username").val();
           var password=$("#password").val();
           if (username === ""){
               layer.msg("请输入用户名！");
               //取消a标签的默认行为
               return false;
           }
           if (password===""){
               layer.msg("请输入密码！");
               return false;
           }
       })
   </script>
</body>

</html>
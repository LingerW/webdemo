<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="css/normal.css"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
</head>
<body>
<!-- 头部导航区 -->
<div class="nav">
    <div class="title">
        linger的书城
    </div>
    <c:if test="${! empty sessionScope.user}">
        <div class="logout">
            <a href="/logoutServlet" id="logout">退出登录</a>
        </div>
    </c:if>
    <div class="cart"><a href="/ToCartServlet" id="myCart"> 购物车</a></div>
    <c:if test="${! empty sessionScope.user}">
        <div class="user">欢迎您！${sessionScope.user.username}</div>
    </c:if>
    <c:if test="${ empty sessionScope.user}">
        <div class="login"><a href="/login.jsp" id="login">登录</a></div>
    </c:if>
</div>
<!-- 主体区域 -->
<div class="content">
    <form>
        <table border="1" cellspacing="0" cellpadding="0">
            <thead>
            <td>#</td>
            <td>图片</td>
            <td>书名</td>
            <td>描述</td>
            <td>价格</td>
            </tr>
            </thead>
            <tr>
                <td><input id="cartHistory"  type="checkbox" name="cartHistory" value="演员的自我修养"></td>
                <td><img src="images/演员.jpg"></td>
                <td>演员的自我修养</td>
                <td>《演员的自我修养》是斯坦尼斯拉夫斯基（俄国演员，导演，戏剧教育家、理论家）的最为知名的代表作，<br/>是斯坦尼斯拉夫斯基表演体系的精华，在世界范围内产生了极大的影响。<br/>在周星驰经典电影《喜剧之王》中是用来表现主角精神追求的重要道具。
                </td>
                <td>￥：50</td>
            </tr>
            <tr>
                <td><input id="cartHistory" type="checkbox" name="cartHistory" value="普京大传"></td>
                <td><img src="images/普京.jpg"></td>
                <td>普京大传</td>
                <td>《普京大传》是丁志可所作的一部图书，该书作者丁志可潜心研究普京多年，堪称国内普京研究专家。该书史料丰富，各种秘闻与故事贯穿其中，可说是普京传记里最好的读本。另有金泽灿所作的2010版《普京大传》。
                </td>
                <td>￥：60</td>
            <tr>
                <td><input id="cartHistory" type="checkbox" name="cartHistory" value="学会爱自己"></td>
                <td><img src="images/爱自己.jpg"></td>
                <td>学会爱自己</td>
                <td>学会爱自己，才能爱别人，才能体会到世间的爱</td>
                <td>￥：520</td>
            </tr>
        </table>
        <input id="subBtn" type="button" value="加入购物车"/>
    </form>
</div>
<div class="banner">Copyright 最终解释权归王道第四组所有</div>
<script src="js/jquery-2.1.1.min.js"></script>
<script src="layer/layer.js"></script>
<script type="text/javascript">
    $("#subBtn").click(function () {
        //判断当前是否登录 没有登录禁止加入购物车
        var user = "${sessionScope.user.username}";
        if (user === "") {
            layer.msg("请先登录，再添加！")
            return ;
        }
        //判断至少添加一本书籍到购物车中
        //属性选择器 伪数组
        var checkLength = $("input[type=checkbox]:checked").length;
        if (checkLength === 0) {
            layer.msg("至少选择一本书籍！");
            return ;
        }
        var books = $("input[type=checkbox]:checked").map(function () {
            return $(this).val();
        }).get().join(',');
        //books=["学会爱自己","普京大传"]
        //发送ajax请求 axios
        $.ajax({
            "url":"/CartServlet",
            "contentType":"application/json;charset=utf-8",
            //如何处理返回的数据 respnose.setContentType("json")
            "dataType":"json",
            //请求参数
            "data":{
                "books":books
            },
            "success":function(data){
                layer.msg(data.message);
        }
        })
    });

    //购物车绑定事件
    $(".cart a").click(function(){
        //判断是否登录 没有登录禁止访问购物车
        var user = "${sessionScope.user.username}";
        if (user === "") {
            layer.msg("请先登录！")
            return false;
        }
    })
</script>
</body>
</html>

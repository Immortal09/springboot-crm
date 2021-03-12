<%@ page language="java" contentType="text/html; utf-8" pageEncoding="utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" >
   <%-- <script type="text/javascript" src="../../resources/static/js/jquery-1.11.3.min.js" />
    <script src="../../resources/static/js/bootstrap.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../../resources/static/css/bootstrap.min.css" type="text/css" />
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="../../resources/static/css/style.css" type="text/css" />--%>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js" ></script>
</head>
<script>
</script>
<title>管理员登录</title>

<style>
    body {
        margin-top: 20px;
        margin: 0 auto;
    }

    .carousel-inner .item img {
        width: 100%;
        height: 300px;
    }

    .container .row div {
        /* position:relative;
                     float:left; */

    }

    font {
        color: #666;
        font-size: 22px;
        font-weight: normal;
        padding-right: 17px;
    }
</style>

<script>
    $(document).ready(function () {
        $("#inputVerifyCode").blur(function () {
            let value = $("#inputVerifyCode").val();
            let sessionCode = $("#pro_id").val();
            console.log(value);
            console.log(sessionCode);

        });

    });

    function getRegister(){
        window.location.href="${pageContext.request.contextPath}/register";
    }
</script>
</head>
<body>

<!-- 引入header.jsp -->
<div class="container"
     style="width: 100%; height: 460px; background: #FF2C4C url('../images/loginbg.jpg') no-repeat;">
    <div class="row">
        <div class="col-md-7">
            <!--<img src="./image/login.jpg" width="500" height="330" alt="会员登录" title="会员登录">-->
        </div>

        <div class="col-md-5">
            <div
                    style="width: 440px; border: 1px solid #E7E7E7; padding: 20px 0 20px 30px; border-radius: 5px; margin-top: 60px; background: #fff;">
                <font>会员登录</font>USER LOGIN

                <div>&nbsp;
                    <span style="color: #f00">${msg}</span>
                    <c:if test="${loginUser.getState() == 0}">
                        <span>,请先</span><a href="${pageContext.request.contextPath}/UserServlet?method=active&code=${loginUser.getCode()}">激活</a>
                    </c:if>

                </div>
                <form class="form-horizontal" action="${pageContext.request.contextPath}/userLogin" method="post">
                    <div class="form-group">
                        <label for="userName" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="userName" name = "userName"
                                   placeholder="请输入用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userPassWord" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" name="userPassWord" id="userPassWord"
                                   placeholder="请输入密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputVerifyCode" class="col-sm-2 control-label">验证码</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="inputVerifyCode" name="verifyCode"
                                   placeholder="请输入验证码">
                        </div>
                        <div class="col-sm-3">
                            <img id="verifyCodeImage" src="${pageContext.request.contextPath}/getImage"
                                onclick="document.getElementById('verifyCodeImage').src = '${pageContext.request.contextPath}/getImage?'+(new Date()).getTime()"
                            />
                        </div>
                        <span id="verifyCodeSpan"></span>
                        <input type="hidden" value="${pageContext.request.getAttribute("verifyCode")}" id="pro_id"/>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label> <input type="checkbox" name="autoLogin" value="1"
                                ${not empty cookie.autoLoginCookie?"checked = 'checked'":""}> 自动登录</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label> <input type="checkbox"> 记住用户名</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="submit" width="100" value="登录" name="submit" id="suBtn"
                                   style="background: url('../images/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
                            <a href="${pageContext.request.contextPath}/register">注&nbsp;&nbsp;册</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 引入footer.jsp -->

</body>
</html>

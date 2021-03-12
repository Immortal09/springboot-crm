<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<%--异步加载导航栏上的商品分类--%>
<script type="text/javascript">
    $(function () {
        let url = "${pageContext.request.contextPath}/ProductServlet"
        $.post(url,{"method":"queryAllCategory"},function (data) {
            $.each(data,function (i,n) {
                $("#menu").append("<li value=''><a href='${pageContext.request.contextPath}/ProductServlet?method=queryProductByCid&cid="+n.cid+"'>"+n.cname+"</a></li>")
            })
        })

    })
</script>

<!-- 登录 注册 购物车... -->
<div class="container-fluid">
	<div class="col-md-4">
		<img src="img/logo2.png" />
	</div>
	<div class="col-md-5">
		<img src="img/header.png" />
	</div>
	<div class="col-md-3" style="padding-top:20px">
		<ol class="list-inline">
			<c:if test="${empty loginUser}">
				<li><a href="${pageContext.request.contextPath}/UserServlet?method=loginUI">登录</a></li>
				<li><a href="${pageContext.request.contextPath}/UserServlet?method=registerUI">注册</a></li>
			</c:if>
			<c:if test="${not empty loginUser}">
				欢迎：${loginUser.username}
				<li><a href="${pageContext.request.contextPath}/ProductServlet?methode=cartUI">购物车</a></li>
				<li><a href="${pageContext.request.contextPath}/OrderServlet?method=orderUI">我的订单</a></li>
				<li><a href="${pageContext.request.contextPath}/UserServlet?method=loginOut">退出</a></li>
			</c:if>
		</ol>
	</div>
</div>

<!-- 导航条 -->
<div class="container-fluid">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/index">首页</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav" id="menu">
					<%--<li class="active"><a href="product_list.htm">手机数码<span class="sr-only">(current)</span></a></li>
					<li><a href="#">电脑办公</a></li>
					<li><a href="#">电脑办公</a></li>
					<li><a href="#">电脑办公</a></li>--%>
				</ul>
				<form class="navbar-form navbar-right" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
		</div>
	</nav>
</div>
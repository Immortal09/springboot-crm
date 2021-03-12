<%@ page language="java" contentType="text/html; utf-8" pageEncoding="utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" >
    <title>管理员登录</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js" ></script>
    <!--上传相关依赖-->
  <%--  <script src="<%=basePath %>/webjars/jquery-file-upload/9.5.2/js/jquery.fileupload-ui.js"></script>
    <script src="<%=basePath %>/webjars/jquery-file-upload/9.5.2/js/jquery.iframe-transport.js"></script>
    <script src="<%=basePath %>/webjars/jquery-file-upload/9.5.2/js/jquery.fileupload.js"></script>
    <script src="<%=basePath %>/webjars/jquery-file-upload/9.5.2/js/jquery.fileupload-image.js"></script>
    <script src="<%=basePath %>/webjars/jquery-file-upload/9.5.2/js/jquery.fileupload-process.js"></script>
    <script src="<%=basePath %>/webjars/jquery-file-upload/9.5.2/js/jquery.fileupload-validate.js"></script>
    <script src="<%=basePath %>/webjars/jquery-ui/1.9.0/development-bundle/ui/jquery.ui.widget.js"></script>--%>

<style>
    body {
        margin-top: 20px;
        margin: 0 auto;
    }

    .carousel-inner .item img {
        width: 100%;
        height: 300px;
    }

    font {
        color: #3164af;
        font-size: 18px;
        font-weight: normal;
        padding: 0 10px;
    }
</style>

<script>
    $(function(){
        //检验用户名是否被注册
        $("#username").blur(function () {
            //获得该组件中文本框的值
            let val = $(this).val();
            //异步发送数据
            if(null != val && val!=""){
                let url = "${pageContext.request.contextPath}/UserServlet";
                let params = {"method":"checkUserName","username":val};
                $.post(url,params,function (data) {
                    //data为回传参数
                    if(data ==0){
                        $("#s1").html("用户可以使用").css("color","#0f0")
                        $("#regBut").attr("disabled",false)
                    }
                    else if(data == 1){
                        $("#s1").html("用户已经被注册").css("color","#f00")
                        $("#regBut").attr("disabled",true)
                    }
                })
            }
        })

        //检验密码正确性
        $("#username").blur(function () {

        });

        //检验邮箱格式

        $("#imageUpload").click(function () {
            $("#userImage").click();
            $("#userImage").on("change",function(){
                var objUrl = getObjectURL(this.files[0]) ; //获取图片的路径，该路径不是图片在本地的路径
                if (objUrl) {
                    $("#imageUpload").attr("src", objUrl) ; //将图片路径存入src中，显示出图片
                }
            });
        });

        //建立一個可存取到該file的url
        function getObjectURL(file) {
            var url = null ;
            if (window.createObjectURL!=undefined) { // basic
                url = window.createObjectURL(file) ;
            } else if (window.URL!=undefined) { // mozilla(firefox)
                url = window.URL.createObjectURL(file) ;
            } else if (window.webkitURL!=undefined) { // webkit or chrome
                url = window.webkitURL.createObjectURL(file) ;
            }
            return url ;
        }

       /*$("#btnImage").click(function uploadImage(){
           var formdata=new FormData($("#imageForm")[0]);
           console.log($("#imageForm")[0]);
           $.ajax({
               dataType:"json",
               async:false,
               url: '${pageContext.request.contextPath}/user/upload' ,  /!*这是处理文件上传的servlet*!/
               type: 'POST',
               data:  formdata,
               cache: false,
               contentType: false,
               processData: false,
               success: function (returndata) {
                   alert(returndata)/!*这是预览图片用的，自己在文件上传表单外添加*!/
               }
           });
       }) ;*/

    });
    let imageUri = $("#imageUrl").val();
    imageUri = "dadsfa";
</script>

</head>
<body>


<div class="container"
     style="width: 100%; background: url('../images/regist_bg.jpg');">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8"
             style="background: #fff; padding: 40px 80px; margin: 30px; border: 5px solid #ccc;">
            <span>会员注册</span>USER REGISTER
            <div class="row">
                <div class="col-md-8">
                    <form class="form-horizontal" action="${pageContext.request.contextPath}/userRegister" method="post" style="margin-top: 5px;">
                        <div class="form-group">
                            <label for="username" class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-6">
                                <input type="text" name="userName" class="form-control" id="username"
                                       placeholder="请输入用户名"><span id="s1"></span>
                            </div>
                        </div>
                        <div class="form-group" >
                            <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-6">
                                <input type="password" name="userPassword" class="form-control" id="inputPassword3"
                                       placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
                            <div class="col-sm-6">
                                <input type="password" name="truePassword" class="form-control" id="confirmpwd"
                                       placeholder="请输入确认密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-6">
                                <input type="email" name="userEmail" class="form-control" id="inputEmail3"
                                       placeholder="Email">
                            </div>
                        </div>
                        <div class="form-group opt">
                            <label for="inlineRadio1" class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-6">
                                <label class="radio-inline"> <input type="radio"
                                                                    name="userGender" id="inlineRadio1" value="男">
                                    男
                                </label> <label class="radio-inline"> <input type="radio"
                                                                             name="userGender" id="inlineRadio2" value="女">
                                女
                            </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="date" class="col-sm-2 control-label">出生日期</label>
                            <div class="col-sm-6">
                                <input type="date" id="date" name="userBirthday" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input id="imageUrl" name="imageUrl" class="form-control" style="display: none">
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
                                <input id="regBut" type="submit" width="100" value="注册" name="submit"
                                       style="background: url('../images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
                            </div>
                        </div>
                    </form>
                </div>


                <div class="col-md-2">
                    <form id="imageForm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/upload" method="post">
                    <div class="form-group" style="float: right">
                        <div class="col-sm-6">
                            <input type="file" name="userImage" id="userImage" style="display: none">
                            <img id="imageUpload" src="${pageContext.request.contextPath}/file/${sessionScope.get("url")}"  style=" width: 120px;height: 120px"  />
                            <input type="submit" class="btn-primary" id="btnImage" value="确认上传" style="width: 120px">
                        </div>
                    </div>
                    </form>
                </div>

            </div>


        </div>

        <div class="col-md-2"></div>

    </div>
</div>
</body>
</html>

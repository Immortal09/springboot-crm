<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>客户列表-BootCRM</title>
    <link rel="stylesheet" href="../css/layui.css">
    <link rel="stylesheet" href="../css/layer.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js" ></script>
    <script src="../js/layui.all.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">CRM信息管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">用户管理</a></li>
            <li class="layui-nav-item"><a href="">客户管理</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">工作日程</a></li>
            <li class="layui-nav-item"><a href="">公告</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    ${username}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">个人信息</a></dd>
                    <dd><a href="">安全设置</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/exit">退出登录</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/exit">安全退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">用户信息</a></dd>
                        <dd><a href="javascript:;">修改用户</a></dd>
                        <dd><a href="javascript:;">删除用户</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">客户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">客户信息</a></dd>
                        <dd><a href="javascript:;">新增客户</a></dd>
                        <dd><a href="javascript:;">修改信息</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">商品管理</a></li>
                <li class="layui-nav-item"><a href="">工作日程</a></li>
                <li class="layui-nav-item"><a href="">公告</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body" style="height: 100%">
        <div class="layui-row">
            <div class="layui-col-md12">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>客户信息管理</legend>
                </fieldset>
            </div>
        </div>
        <div class="layui-row">
            <form class="layui-form" id="formInfo">
            <div class="layui-col-md2">
                <div class="layui-form-item">
                    <label class="layui-form-label labelWith">客户名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="custName" lay-verify="title" autocomplete="off" placeholder="请输入客户名称" class="layui-input">
                    </div>
                </div>

            </div>
            <div class="layui-col-md3">
                    <label class="layui-form-label labelWith">客户来源</label>
                    <div class="layui-input-block">
                        <select name="custSource"  id="customerSource">
                            <option value="">--请选择--</option>
                        </select>
                    </div>
            </div>
            <div class="layui-col-md3">
                <label class="layui-form-label labelWith">所属行业</label>
                <div class="layui-input-block">
                    <select name="custIndustry"  id="customerIndustry">
                        <option value="">--请选择--</option>
                    </select>
                </div>
            </div>
            <div class="layui-col-md3">
                <label class="layui-form-label labelWith">客户级别</label>
                <div class="layui-input-block">
                    <select name="custLevel" lay-verify="required" id="customerLevel">
                        <option value="">--请选择--</option>
                    </select>
                </div>
            </div>
            <div class="layui-col-md1">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="subForm">
                    <i class="layui-icon">&#xe615;</i> 查询
                </button>
            </div>
            </form>
        </div>
        <div class="layui-row">
            <table class="layui-table" id="test" lay-filter="demo"></table>
        </div>
    </div>

    <div class="layui-footer" style="height: 38px">
        <!-- 底部固定区域 -->
       <span  style="margin-left: 45%">© immortal90.com - CRM信息系统</span>
    </div>
</div>

<div type="text/html" style="display: none" id="addCustModel" >
    <form class="layui-form" action="" lay-filter="addCustForm" id="addCustForm">
        <div class="layui-form-item" style="margin-top: 10px;display: none">
            <label class="layui-form-label labelWith" >客户Id</label>
            <div class="layui-input-block">
                <input type="text" name="custId" lay-verify="title" autocomplete="off" placeholder="请输入客户名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 10px">
            <label class="layui-form-label labelWith" >客户名称</label>
            <div class="layui-input-block">
                <input type="text" name="custName" lay-verify="title" autocomplete="off" placeholder="请输入客户名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label labelWith">客户来源</label>
            <div class="layui-input-block">
                <select name="custSource"  id="customerSource2">
                    <option value="">--请选择--</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label labelWith">所属行业</label>
            <div class="layui-input-block">
                <select name="custIndustry"  id="customerIndustry2">
                    <option value="">--请选择--</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item" >
            <label class="layui-form-label labelWith">客户级别</label>
            <div class="layui-input-block">
                <select name="custLevel" lay-verify="required" id="customerLevel2">
                    <option value="">--请选择--</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系人</label>
            <div class="layui-input-block">
                <input type="text" name="custLinkman" lay-verify="title" autocomplete="off" placeholder="请输入联系人名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label labelWith">固定电话</label>
            <div class="layui-input-block">
                <input type="text" name="custPhone" lay-verify="title" autocomplete="off" placeholder="请输入固定电话号码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label labelWith">移动电话</label>
            <div class="layui-input-block">
                <input type="text" name="custMobile" lay-verify="title" autocomplete="off" placeholder="请输入移动电话号码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label labelWith">客户地址</label>
            <div class="layui-input-block">
                <input type="text" name="custAddress" lay-verify="title" autocomplete="off" placeholder="请输入地址" class="layui-input">
            </div>
        </div>
        <%--<div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>--%>
    </form>
</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container" id="layerDemo1">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">批量删除</button>
        <button class="layui-btn layui-btn-sm"  id="addCustomerBtn" data-type="r" data-method="offset" lay-event="getCheckLength">新增客户</button>
    </div>
</script>

<script>
    //页面一加载触发的事件
    //JavaScript代码区域
    layui.use(['element','layer'], function(){
        var element = layui.element,
            table = layui.table,
            $ = layui.jquery,
            whereData=null,
            layer = layui.layer,
            form = layui.form;
        form.render();
        element.render();
        $.ajax({
            url:"${pageContext.request.contextPath}/getSelectContent",
            success:function (resp) {
                console.log(resp.custSources)
                for (let i=0;i<resp.custSources.length;i++){
                    var dataTmp = resp.custSources[i];
                    $('#customerSource').append(new Option(dataTmp.dictItemName,dataTmp.dictId));//往下拉菜单里添加元素
                }

                for (let i=0;i<resp.custIndustrys.length;i++){
                    var dataTmp = resp.custIndustrys[i];
                    $('#customerIndustry').append(new Option(dataTmp.dictItemName,dataTmp.dictId));//往下拉菜单里添加元素
                }

                for (let i=0;i<resp.custLevels.length;i++){
                    var dataTmp = resp.custLevels[i];
                    $('#customerLevel').append(new Option(dataTmp.dictItemName,dataTmp.dictId));//往下拉菜单里添加元素
                }
                form.render();
            }
        });

        form.on('submit(subForm)', function(data){
            console.log(data)
            whereData = data.field;
            table.reload("test",{where:whereData});
            return false;
        });

        table.render({
            elem: '#test'
            ,url:'${pageContext.request.contextPath}/list',
            where:whereData,  //提交的数据
            toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,cols: [[
                {type:'checkbox', fixed: 'left'},
                {field:'custId', width:106, title: 'ID', sort: true,hide:true}
                ,{field:'custName', width:120, title: '客户名'}
                ,{field:'custSource', width:140, title: '客户信息来源', sort: true}
                ,{field:'custIndustry', width:120, title: '客户所属行业'}
                ,{field:'custLevel', width:120, title: '客户级别'}
                ,{field:'custLinkman', width:120, title: '联系人', sort: true}
                ,{field:'custPhone', width:150, title: '固定电话', sort: true}
                ,{field:'custMobile', width:150, title: '移动手机'}
                ,{field:'custAddress', width:150, title: '客户地址', sort: true}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:190}
            ]]
            ,page: true ,
            height: $(document).height() - $('#test').offset().top - 20,
            response: {
                statusCode: 200 //重新规定成功的状态码为 200，table 组件默认为 0
            }
            ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": res.status, //解析接口状态
                    "msg": res.message, //解析提示文本
                    "count": res.total, //解析数据长度
                    "data": res.rows //解析数据列表
                };
            }
        });

        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                //layer.alert('ID：'+ data.custId + ' 的查看操作');
                form.val('addCustForm',data);
                layer.open({
                    title:'查看客户信息',
                    type: 1,
                    area:['450px','600px'],
                    offset:'c',
                    content: $("#addCustModel") //这里content是一个普通的String
                    ,btn: '关闭'
                    ,btnAlign: 'c' //按钮居中
                    ,yes: function(index,layero){
                        layer.close();
                    }
                });
                layui.form.render();

            } else if(obj.event === 'del'){
                layer.alert(data.custId)
                layer.confirm('真的删除行么', function(index){
                    layer.alert(data.custId)
                });
            } else if(obj.event === 'edit'){
               // layer.alert('编辑行：<br>'+ JSON.stringify(data))
                form.val('addCustForm',data);
                layer.open({
                    title:'查看客户信息',
                    type: 1,
                    area:['450px','600px'],
                    offset:'c',
                    content: $("#addCustModel") //这里content是一个普通的String
                    ,btn: '关闭'
                    ,btnAlign: 'c' //按钮居中
                    ,yes: function(index,layero){
                        layer.close();
                    }
                });
                layui.form.render();
            }
        });

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);

            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(checkStatus)
                   alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;

                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            };
        });

        //弹出框触发事件
        $("#addCustomerBtn").on('click',function(){
           // layer.alert("dafasdf");
            if(null != form.val('addCustForm')){
                $("#addCustForm")[0].reset();  //重置表单
                layui.form.render();        //重新渲染表单
            }
            layer.open({
                title:'新增客户',
                type: 1,
                area:['450px','600px'],
                offset:'r',
                content: $("#addCustModel") //这里content是一个普通的String
                ,btn: ['新增','重置','关闭']
                ,btnAlign: 'c' //按钮居中
                ,yes: function(index,layero){
                    layer.alert("新增"+index)
                },
                btn2:function(index,layero){
                    layer.alert(index);
                    return false;
                },
                btn3:function (index,layero) {
                    layer.close();
                }
            });
        });


    });
</script>
<style>
    .labelWith{
        width: 100px;
    }
</style>
</body>
</html>
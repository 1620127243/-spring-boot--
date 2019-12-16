
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="description" content="Meghna One page parallax responsive HTML Template ">
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../plugins/themefisher-font/style.css">
    <link rel="stylesheet" href="../../plugins/animate-css/animate.css">
    <link rel="stylesheet" href="../../plugins/magnific-popup/dist/magnific-popup.css">
    <link rel="stylesheet" href="../../plugins/slick-carousel/slick/slick.css">
    <link rel="stylesheet" href="../../plugins/slick-carousel/slick/slick-theme.css">
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../plugins/bootstrap/dist/css/bootstrap.min.css">
    <title>会议系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">


</head>

<body id="body" data-spy="scroll" data-target=".navbar" data-offset="50">

<!--
 Fixed Navigation
 ==================================== -->
<header id="navigation" class="navbar navigation">
    <div class="container">
        <div class="navbar-header">
            <!-- responsive nav button -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- /responsive nav button -->

            <!-- logo -->
            <a class="navbar-brand logo" href="#body">
                <!-- <img src="images/logo.png" alt="Website Logo" /> -->
                <svg width="40px" height="40px" viewBox="0 0 45 44" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                        <g id="Group" transform="translate(2.000000, 2.000000)" stroke="#57CBCC" stroke-width="3">
                            <ellipse id="Oval" cx="20.5" cy="20" rx="20.5" ry="20"></ellipse>
                            <path d="M6,7 L33.5,34.5" id="Line-2" stroke-linecap="square"></path>
                            <path d="M21,20 L34,7" id="Line-3" stroke-linecap="square"></path>
                        </g>
                    </g>
                </svg>
            </a>
            <!-- /logo -->
        </div>

        <!-- main nav -->
        <nav class="collapse navbar-collapse navbar-right" role="Navigation">
            <ul id="nav" class="nav navbar-nav navigation-menu">
                <li><a data-scroll href="#body">首页</a></li>
                <li><a data-scroll  data-toggle="modal" data-target="#register" href="">注册</a> </li>
                <li><a data-scroll href="">关于我们</a></li>
            </ul>
        </nav>
        <!-- /main nav -->
    </div>
</header>
<!--
Welcome Slider
==================================== -->

<section class="hero-area">
    <div class="block">
        <h1>会议系统 1.0</h1>
        <p>用心做网站，致力于为用户打造最好的使用体验。唯有热爱方能抵御岁月漫长</p>
        <a data-scroll href=""  data-toggle="modal" data-target="#login" class="btn btn-transparent" >进入系统</a>
    </div>
</section>
<!--
End Fixed Navigation
==================================== -->

<!-- 登录窗口 -->
<div id="login" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">登录</h1>
            </div>
            <div class="modal-body">
                <form class="form-group" action="login" method="post">
                    <div class="form-group">
                        <label>用户名</label>
                        <input class="form-control" type="text" placeholder="请输入用户名" id="loginID" name="loginID">
                    </div>
                    <div class="form-group">
                        <label >密码</label>
                        <input class="form-control" type="password" placeholder="输入密码" id="loginPassword" name="loginPassword">
                    </div>
                    <div class="text-right"style="width: 570px;">
                    <%--<button class="btn btn-primary" type="submit" onclick="login()">登录</button>--%>
                    <input class="btn btn-primary" type="submit" value="登录">
                    <button class="btn btn-danger" data-dismiss="modal">取消</button>
                    </div>
                    <a href="" data-toggle="modal" data-dismiss="modal" data-target="#register">还没有账号？点我注册</a>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 注册窗口 -->
<div id="register" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">注册</h1>
            </div>
            <div class="modal-body">
                <form class="form-group" >
                    <div class="form-group">
                        <label >用户名</label>
                        <input class="form-control" type="text" placeholder="6-15位字母或数字" id="accountID" onblur="checkID()">
                    </div>
                    <span id="checkID"></span>
                    <div class="form-group">
                        <label >密码</label>
                        <input class="form-control" type="password" placeholder="至少6位字母或数字" id="accountPassword">
                    </div>
                    <div class="form-group">
                        <label >再次输入密码</label>
                        <input class="form-control" type="password" placeholder="至少6位字母或数字" id="accountPasswordAgain" onkeyup="checkPassword()">
                    </div>
                    <span id="tishi"></span>
                    <div class="form-group">
                        <label >Email</label>
                        <input class="form-control" type="tel" placeholder="请输入可用邮箱"  id="accountEmail">
                    </div>
                    <div class="form-group">
                        <label>用户权限</label>
                        <select class="form-control" id="accountPower"><option value="会员">会员</option>
                            <option value="普通用户">普通用户</option></select>
                    </div>
                </form>
                <div class="text-right" >
                    <button class="btn btn-primary" type="submit" id="submit" onclick="register()">注册</button>
                    <button class="btn btn-danger" data-dismiss="modal">取消</button>
                </div>
                <a href="" data-toggle="modal" data-dismiss="modal" data-target="#login">已有账号？点我登录</a>
            </div>
        </div>
    </div>
</div>
<script>
    function checkPassword() {
        var password=document.getElementById("accountPassword").value;
        var repassword=document.getElementById("accountPasswordAgain").value;
        if(password!=repassword){
            document.getElementById("tishi").innerHTML="<br><font color='red'>两次密码输入不一致</font>";
            document.getElementById("submit").disabled = true;
        }
        else {
            document.getElementById("tishi").innerHTML="<br><font color='green'>密码可用</font>";
            document.getElementById("submit").disabled = false;
        }
    }
    // function login() {
    //     var loginID=$("#loginID").val();
    //     var loginPassword=$("#loginPassword").val();
    //     var loginData={'loginID':loginID,'loginPassword':loginPassword};
    //     $.ajax({
    //         url:"login",
    //         type:"post",
    //         contentType:'application/json;charset=UTF-8',
    //         data:loginData,
    //         success:function (data) {
    //             window.location.href="main";
    //         },
    //         error:function () {
    //             alert("error");
    //         }
    //         }
    //     )
    // }
    function register() {
        var accountID=$("#accountID").val();
        var accountPassword=$("#accountPassword").val();
        var accountEmail=$("#accountEmail").val();
        var accountPower=$("#accountPower").val();
        var account={'accountID':accountID,'accountPassword':accountPassword,'accountEmail':accountEmail,'accountPower':accountPower};
        $.ajax({
            url:"register",
            type:"post",
            data:JSON.stringify(account),
            // dataType:"json",
            contentType:'application/json;charset=UTF-8',
            success:function (data) {
                if(data!=null){alert("注册成功！欢迎"+data);

                }
                else alert("注册失败");
            },
            error:function () {
                alert("error");
            }
        });
    }
    function checkID() {
        var accountID=$("#accountID").val();
        var data={'accountID':accountID};
        $.ajax({
            url:"checkID",
            type:"post",
            data:data,
            // dataType:"json",
            // contentType:'application/json;charset=UTF-8',
            success:function (data) {
                if(data){
                    $("#checkID").empty();
                    $("#checkID").append("<br><font color='green'>账户可用!</font>");}
                else {
                    $("#checkID").empty();
                    $("#checkID").append("<br><font color='red'>账户名不可用!换一个吧</font>");
                }
            },
            error:function () {
                alert("错误！")
            }
        });
    }


</script>
</body>
</html>
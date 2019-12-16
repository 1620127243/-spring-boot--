<%--
  Created by IntelliJ IDEA.
  User: All Falls Down
  Date: 2019/12/7
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html >
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="description" content="Meghna One page parallax responsive HTML Template ">
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
    <title>会议系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../plugins/themefisher-font/style.css">
    <link rel="stylesheet" href="../../plugins/animate-css/animate.css">
    <link rel="stylesheet" href="../../plugins/magnific-popup/dist/magnific-popup.css">
    <link rel="stylesheet" href="../../plugins/slick-carousel/slick/slick.css">
    <link rel="stylesheet" href="../../plugins/slick-carousel/slick/slick-theme.css">
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../plugins/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="myCss.css">

</head>

<body id="body" data-spy="scroll" data-target=".navbar" data-offset="50" onload="load()">

<!--
 Fixed Navigation
 ==================================== -->
<header id="navigation" class="navbar navigation" >
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
                <li><a data-scroll class="bind_hover_card" data-toggle="popover" data-placement="bottom" data-trigger="hover" >个人信息</a></li>
                <li><a data-scroll href="">关于我们</a></li>
            </ul>
        </nav>
        <!-- /main nav -->
    </div>
</header>


<div class="hero-area"  >
    <span id="gongneng" style="position: absolute;left: 50px;width: 25%">
    </span>
    <div id="rightMain" style="float: left;width: 570px;height: 100%">
    </div>
</div>

<script>
    $(function() {
        $("[data-toggle='popover']").popover({
            html : true,
            title: title(),
            delay:{show:500, hide:1000},
            content: function() {
                return content();
            }
        });
    });
    //模拟动态加载标题(真实情况可能会跟后台进行ajax交互)
    function title() {
        return '个人资料';
    }
    //模拟动态加载内容(真实情况可能会跟后台进行ajax交互)
    function content() {
        var data = $("<form class='form-group'><ul><li><span aria-hidden='true' class='icon_globe'>" +
            "<li><span aria-hidden='true' class='icon_piechart'></span>&nbsp;<font>我的ID:</font>${ID}</li><br>" +
            "<li><span aria-hidden='true' class='icon_search_alt'></span>&nbsp;<font>我的权限:</font>${Power}</li><br>" +
            "<li><span aria-hidden='true' class='icon_pens_alt'></span>&nbsp;<font>我的Email:</font>${Email}</li><br>"
        );
        return data;
    }
    //加载主界面，根据用户权限加载不同的界面
    function load(){
        var power='${Power}';
        var gongneng=$("#gongneng");
        var guanli="管理员";
        var huiyuan="会员";
        var putong="普通用户";
        gongneng.empty();
        if(power==guanli){
            gongneng.append("<div style='margin: 0px 50px'>" +
                "<button  class=\"btn btn-primary\" id=\"selectAllAccount\" onclick='selectAllAccount()'>查看所有用户</button ><br><br><br>" +
                "<button  class=\"btn btn-primary\" id=\"selectAllMeeting\" onclick='selectAllMeeting()'>查看所有会议</button ><br><br><br>" +
                "<button  class=\"btn btn-primary\" id=\"createMeeting\" onclick='createMeetingView()'>创建会议</button ><br><br><br>" +
                "<button  class=\"btn btn-primary\" id=\"myCreateMeet\" onclick='myCreateMeeting()'>我创建的会议</button ><br><br><br>" +
                "</div>");
        }
        else if(power==huiyuan){
            gongneng.append("<div>" +
                "<button  class=\"btn btn-primary\" id=\"createMeet\" onclick='createMeetingView()' '>创建会议</button ><br><br><br>" +
                "<button  class=\"btn btn-primary\" id=\"joinMeet\" onclick='joinMeetingView()'>加入会议</button ><br><br><br>" +
                "<button  class=\"btn btn-primary\" id=\"myCreateMeet\" onclick='myCreateMeeting()'>我创建的会议</button ><br><br><br>" +
                "<button  class=\"btn btn-primary\" id=\"myJoinMeet\" onClick='myJoinMeeting()'>我加入的会议</button ><br><br><br>"+
                "</div>");
        }
        else if(power==putong){
            gongneng.append("<div class=\"myCss\">" +
                "<button  class=\"btn btn-primary\" id=\"joinMeeting\" onclick='joinMeetingView()'>加入会议</button ><br><br><br>" +
                "<button  class=\"btn btn-primary\" id=\"myMeeting\" onclick='myJoinMeeting()'>我加入的会议</button ><br><br><br>" +
                "</div>");
        }
     }

     //加载创建会议的界面
     function createMeetingView() {
        var rightMain=$("#rightMain");
        rightMain.empty();
        rightMain.append("<form class=\"form-group\" >\n" +
            "<div class=\"form-group\">\n" +
            "<label style='color: aliceblue'>会议名</label>\n" +
            "<input class=\"form-control\" type=\"text\" placeholder=\"请输入会议名称\" id=\"meetingName\" >\n" +
            "</div>\n" +
            "<div class=\"form-group\">\n" +
            "<label style='color: aliceblue'>会议密码</label>\n" +
            "<input class=\"form-control\" type=\"password\" placeholder=\"为你的会议创建一个密码吧\" id=\"meetingPassword\">\n" +
            "</div>\n" +
            "<div class=\"form-group\">\n" +
            "<label style='color: aliceblue'>再次输入密码</label>\n" +
            "<input class=\"form-control\" type=\"password\" placeholder=\"重新输入密码\" id=\"meetingPasswordAgain\" onkeyup=\"checkPassword()\">\n" +
            "</div>\n" +
            "<span id=\"tishi\"></span>\n" +
            "<div class=\"form-group\">\n" +
            "<label style='color: aliceblue'>会议时间</label>\n" +
            "<input class=\"form-control\" type=\"date\" placeholder=\"请输入会议举行时间\"  id=\"meetingTime\">\n" +
            "</div>\n" +
            "<div class=\"form-group\">\n" +
            "<label style='color: aliceblue'>会议地点</label>\n" +
            "<input class=\"form-control\" type=\"tel\" placeholder=\"请输入会议举办地点\"  id=\"meetingAddress\">\n" +
            "</div>\n" +
            "<div class=\"form-group\">\n" +
            "<label style='color: aliceblue'>会议入住宾馆</label>\n" +
            "<input class=\"form-control\" type=\"tel\" placeholder=\"请输入会议期间入住宾馆\"  id=\"meetingHotel\">\n" +
            "</div> \n"+"<div class=\"form-group\">\n" +
            "<label style='color: aliceblue'>勾选需要参会者填写的信息</label><br>\n" +
            "<label style='color: aliceblue'><input type=\"checkbox\" name='info' value=\"1\">参会者姓名</label>\n" +
            "<label style='color: aliceblue'><input type=\"checkbox\" name='info' value=\"2\">参会者性别</label>\n" +
            "<label style='color: aliceblue'><input type=\"checkbox\" name='info' value=\"3\">参会者联系方式</label>\n" +
            "<label style='color: aliceblue'><input type=\"checkbox\" name='info' value=\"4\">参会者身份证号</label>\n" +
            "<label style='color: aliceblue'><input type=\"checkbox\" name='info' value=\"5\">参会者工作单位</label>\n" +
            "<label style='color: aliceblue'><input type=\"checkbox\" name='info' value=\"6\">是否需要安排宾馆</label>\n" +
            "</div>"
            +"</form>"
            +"<div style='width: 570px' class=\"text-right\">\n" +
            "<button class=\"btn btn-primary\" type=\"submit\" id=\"submit\" onclick='createMeeting()'>提交</button>\n" +
            "<button  class=\"btn btn-primary\"  onclick='clearView()'>取消</button >\n" +
            "</div>\n");
     }
     //检查创建会议时的两次密码是否一致
     function checkPassword() {
        var password=$("#meetingPassword").val();
        var repassword=$("#meetingPasswordAgain").val();
        if(password==repassword){
            document.getElementById("tishi").innerHTML="<br><font color='green'>密码可用</font>";
            document.getElementById("submit").disabled = false;
        }
        else {
            document.getElementById("tishi").innerHTML="<br><font color='red'>两次密码输入不一致</font>";
            document.getElementById("submit").disabled = true;
        }


     }
     //创建会议函数
     function createMeeting() {
        var meetingName=$("#meetingName").val();
        var meetingPassword=$("#meetingPassword").val();
        var meetingTime=$("#meetingTime").val();
        var meetingAddress=$("#meetingAddress").val();
        var meetingHotel=$("#meetingHotel").val();
        var meetingInfo="";
        var accountID='${ID}';
        var obj=document.getElementsByName('info');
        for(var i=0;i<obj.length;i++){
            if(obj[i].checked)
                meetingInfo+=obj[i].value;
        }
        var meeting={'meetingName':meetingName,'meetingPassword':meetingPassword,'meetingTime':meetingTime,'meetingAddress':meetingAddress,'meetingHotel':meetingHotel,'meetingInfo':meetingInfo,'accountID':accountID};
        if(meetingName!=''&&meetingPassword!=''&&meetingTime!=''&&meetingAddress!=''&&meetingHotel!=''&&meetingInfo!='') {
            $.ajax({
                url: "meeting/createMeeting",
                type: "post",
                data: JSON.stringify(meeting),
                 dataType:"json",
                contentType: 'application/json;charset=UTF-8',
                success: function (data) {
                    if (data != null) {
                        alert("创建会议成功！会议ID是" + data);
                        clearView();

                    } else alert("创建失败");
                },
                error: function () {
                    alert("error");
                }
            });
        }
        else {
            alert("信息尚未填写完整");
        }
     }
     //加载加入会议功能的界面
     function joinMeetingView() {
         var rightMain=$("#rightMain");
         rightMain.empty();
         rightMain.append("<form class=\"form-group\">\n" +
             "<div class=\"form-group\">\n" +
             "<label style=\"color: aliceblue\">查询会议</label>\n" +
             "<input class=\"form-control\" type=\"text\" placeholder=\"请输入会议编号\" id=\"selectMeeting\" >\n" +
             "</div>" +
             "</form>\n" +
             "<div style='width: 570px'class=\"text-right\">\n" +
             "<button class=\"btn btn-primary\" type=\"submit\" id=\"submit\" onclick=\"select()\">查询</button>\n" +
             "<button class=\"btn btn-danger\" data-dismiss=\"modal\" onclick='clearView()'>返回</button>\n" +
             "</div>\n");
         rightMain.append("<div>\n" +
             "\t<table id='meetingTable'class=\"table table-bordered table-striped \" >\n" +
             "\t\t<tbody >\n" +
             "\t\t\t<th>会议编号</th>\n" +
             "\t\t\t<th>会议发布者</th>\n" +
             "\t\t\t<th>会议名称</th>\n" +
             "\t\t\t<th>会议时间</th>\n" +
             "\t\t\t<th>会议地点</th>\n" +
             "\t\t\t<th>会议宾馆</th>\n" +
             "\t\t\t<th>操作</th>\n"+
             "\t\t</tbody>" + "<tbody id=\"meetingContent\" ></tbody>\n" + "</table>");
     }
     //根据会议编号查询会议功能
     function select() {
         var meetingContent = $("#meetingContent");
         meetingContent.empty();
         var selectCondition=$("#selectMeeting").val();
         var select={'selectCondition':selectCondition};

         $.ajax({
             url:"meeting/selectMeeting",
             type:"post",
             data:select,
             dataType:"json",
             success:function (data) {
                 if(data.status) {
                         var result = data.meetings;
                         if(result.length>0){
                         meetingSelectID=result[0].meetingID;
                         for (var i = 0; i < result.length; i++) {
                             meetingContent.append("<tr>\n" +
                                 "\t\t\t<td >" + result[i].meetingID + "</td>\n" +
                                 "\t\t\t<td>" + result[i].accountID + "</td>\n" +
                                 "\t\t\t<td>" + result[i].meetingName + "</td>\n" +
                                 "\t\t\t<td>" + result[i].meetingTime + "</td>\n" +
                                 "\t\t\t<td>" + result[i].meetingAddress + "</td>\n" +
                                 "\t\t\t<td>" + result[i].meetingHotel + "</td>\n" +"<td><button class=\"btn btn-primary\" type=\"submit\" id=\"submit\"  onclick=\"checkMeetingPassword()\">加入会议</button></td>"+
                                 "\t\t</tr>" );
                         }
                         }
                         else alert("未找到相关会议！")
                 }
                 else {
                     alert("未找到相关的会议!");
                 }
             },
             error:function () {
                 alert("未找到相关会议！")
             }
         });

     }
     //加载用户输入会议密码的界面
     function checkMeetingPassword() {
         $("#meetingContent").append("<tr>"+"<td colspan='6'><input  style='width: 450px' class=\"form-control\"type='password' id='joinMeetingPassword' placeholder=\"请输入会议密码\" ></td>"+
             "<td><button class=\"btn btn-primary\" type=\"submit\" id=\"submit\" onclick=\"joinMeeting()\">确认</button></td>");
     }
     //检查用户输入的会议密码是否正确 ，加载参会者填写会议信息的界面
     function joinMeeting() {
        var rightMain=$("#rightMain");
         var joinMeetingID=document.getElementById("meetingTable").rows[1].cells[0].innerText;
         var joinMeetingPassword=$("#joinMeetingPassword").val();
         var joinInfo={'joinMeetingID':joinMeetingID,'joinMeetingPassword':joinMeetingPassword};
         $.ajax({
             url:"meeting/checkMeetingPassword",
             type:"post",
             data:joinInfo,
             dataType:"json",
             success:function (data) {
                 if(data.flag){
                     rightMain.empty();
                     rightMain.append(
                         "<form class=\"form-group\"><div id='showMeetingInfo'><div  class=\"modal-title\"><h1 style=\"color: aliceblue\">填写会议信息</h1></div></div></form>\n" +
                         "<div class=\"text-right\" >\n" +
                         "<button class=\"btn btn-primary\" type=\"submit\" onclick='submitMeetingInfo()'>提交</button>\n" +
                         "<button class=\"btn btn-danger\" data-dismiss=\"modal\" onclick='joinMeetingView()'>取消</button>\n"+"</div>"
                       );
                     info=data.infos;
                     var showInfo=$("#showMeetingInfo");
                     for(var i=0;i<info.length;i++){
                         if(info[i]!="是否需要宾馆"){
                         showInfo.append("<div class=\"form-group\">\n" +
                             "<label style=\"color: aliceblue\" >"+info[i]+"</label>\n" +
                             "<input class=\"form-control\" type=\"text\"  id=\"" +info[i]+
                             "\">\n" +
                             "</div>");
                         }
                         else if(info[i]=="是否需要宾馆"){
                             showInfo.append("<div class=\"form-group\">\n" +
                                 "<label style=\"color: aliceblue\">是否需要宾馆</label>\n" +
                                 "<select class=\"form-control\" id=\"" +info[i]+
                                 "\"><option value=\"是\">是</option>\n" +
                                 "<option value=\"否\">否</option></select>\n" +
                                 "</div>");
                         }
                     }
                 }
                 else {
                     alert("密码错误！");
                 }
             },
             error:function () {
                 alert("未知的错误");
             }
         });
     }
     //提交参会者填写的会议信息
     function submitMeetingInfo() {
         var name="";
         var sex="";
         var phone="";
         var identity="";
         var work="";
         var hotel="";
         var accountID='${ID}';
         if($("#姓名").length>0){name=$("#姓名").val();}
         if($("#性别").length>0){ sex=$("#性别").val();}
         if($("#联系方式").length>0){phone=$("#联系方式").val();}
         if($("#身份证号").length>0){identity=$("#身份证号").val();}
         if($("#工作单位").length>0){ work=$("#工作单位").val();}
         if($("#是否需要宾馆").length>0){ hotel=$("#是否需要宾馆").val();}
             var participantInfo={'meetingID':meetingSelectID,'accountID':accountID,'participantName':name,'participantSex':sex,'participantPhone':phone,'participantIdentity':identity,'participantWork':work,'needHotel':hotel};
             $.ajax({
                 url: "meeting/joinMeeting",
                 type: "post",
                 data: JSON.stringify(participantInfo),
                 // dataType:"json",
                 contentType: 'application/json;charset=UTF-8',
                 success:function (data) {
                     if(data){
                         alert("加入会议成功!");
                         clearView();
                     }
                     else {
                         alert("加入失败！请查询您是否已经加入该会议");
                     }
                 },
                 error:function () {
                     alert("加入失败！请查询您是否已经加入该会议");
                 }
             });
    }
    //查看我创建的会议
    function myCreateMeeting() {
        clearView();
        var accountID='${ID}';
        var ID={'accountID':accountID};
        $.ajax({
            url:"meeting/selectMyCreateMeeting",
            type:"post",
            data:ID,
            dataType:"json",
            success:function (data) {
                if(data.flag) {
                    var result = data.meetings;
                    var rightMain = $("#rightMain");
                    rightMain.empty();
                    if (result.length > 0) {
                        rightMain.append("<form class=\"form-group\">\n" +
                            "<div class=\"form-group\">\n" +
                            "<label style=\"color: aliceblue\">我创建的会议</label>\n" +
                            "</div>" +
                            "</form>\n");
                        rightMain.append("<div>\n" +
                            "\t<table id='meetingTable'class=\"table table-bordered table-striped \" >\n" +
                            "\t\t<tbody >\n" +
                            "\t\t\t<th>会议编号</th>\n" +
                            "\t\t\t<th>会议名称</th>\n" +
                            "\t\t\t<th>会议时间</th>\n" +
                            "\t\t\t<th>会议地点</th>\n" +
                            "\t\t\t<th>会议宾馆</th>\n" +
                            "\t\t\t<th>操作</th>\n" +
                            "\t\t</tbody>" + "<tbody id=\"meetingContent\" ></tbody>\n" + "</table>");
                    }
                    var meetingContent = $("#meetingContent");
                    for (var i = 0; i < result.length; i++) {
                        meetingContent.append("<tr style='background-color: white'>\n" +
                            "\t\t\t<td >" + result[i].meetingID + "</td>\n" +
                            "\t\t\t<td>" + result[i].meetingName + "</td>\n" +
                            "\t\t\t<td>" + result[i].meetingTime + "</td>\n" +
                            "\t\t\t<td>" + result[i].meetingAddress + "</td>\n" +
                            "\t\t\t<td>" + result[i].meetingHotel + "</td>\n" + "<td><button class=\"btn btn-primary\" type=\"submit\" id=\"submit\"  onclick=\"queryMeetingInfo(" +result[i].meetingID+
                            ")\">查看</button>" +"<button  class=\"btn btn-primary\" onclick=\"getCode(" +   result[i].meetingID+
                            ")\">生成二维码</button >"+
                            "<button  class=\"btn btn-primary\" onclick=\"deleteMeeting(" +   result[i].meetingID+
                            ")\">删除</button ></td>" +
                            "\t\t</tr>");
                    }
                }
            else{alert("你还没创建会议");}
                },
            error:function () {
                alert("未知错误");
            }
        });
    }
    //查看我创建的会议的信息
    function queryMeetingInfo(meetingID) {
        var ID={'meetingID':meetingID};
        var rightMain=$("#rightMain");
        rightMain.empty();
        $.ajax({
            url:"meeting/selectMyMeetingInfo",
            type:"post",
            data:ID,
            dataType:"json",
            success:function (data) {
                if(data.flag){
                    var result = data.meetingInfo;
                    rightMain.empty();
                    rightMain.append("<form class=\"form-group\">\n" +
                        "<div class=\"form-group\">\n" +
                        "<label style=\"color: aliceblue\">会议信息</label>\n" +
                        "</div>" +
                        "</form>\n");
                    rightMain.append("<div>\n" +
                        "\t<table id='meetingInfoTable'class=\"table table-bordered table-striped \" >\n" +
                        "\t\t<tbody id='meetingTitle'><th>会议编号</th><th>参会者账号</th><th>参会者姓名</th><th>参会者性别</th><th>参会者联系方式</th><th>参会者身份证号</th><th>参会者工作单位</th><th>是否需要宾馆</th><th>操作</th></tbody>" + "<tbody id=\"meetingContent\" ></tbody>\n" + "</table>");
                    var meetingContent = $("#meetingContent");
                    if(result.length>0){
                        for(var i=0;i<result.length;i++){
                            meetingContent.append("<tr style='background-color: white'>\n" +
                                "\t\t\t<td >" + result[i].meetingID+ "</td>\n" +
                                "\t\t\t<td >" + result[i].accountID+ "</td>\n" +
                                "\t\t\t<td>" + result[i].participantName + "</td>\n" +
                                "\t\t\t<td>" + result[i].participantSex + "</td>\n" +
                                "\t\t\t<td>" + result[i].participantPhone + "</td>\n" +
                                "\t\t\t<td>" + result[i].participantIdentity+ "</td>\n" +
                                "\t\t\t<td>" + result[i].participantWork+ "</td>\n" +
                                "\t\t\t<td>" + result[i].needHotel+ "</td>\n" +
                                "<td><button  class=\"btn btn-primary\" onclick=\"deleteAccount('" +
                                result[i].meetingID +
                                "','" +
                                result[i].accountID.toString() +
                                "')\">删除</button >"+
                                "</td>" +
                                "</tr>");
                        }
                        rightMain.append( "<td><button  class=\"btn btn-primary\" onclick=\"exportTableController('" + meetingID +
                            "')\">导出Excel表</button >");
                    }
                    else {alert("你发布的会议还没有人参加！" );myCreateMeeting();}
                }
                 else {alert("你发布的会议还没有人参加！");myCreateMeeting(); }
            },
            error:function () {
                  alert("错误!");
            }
        });

    }
    function deleteMeeting(meetingID) {
        var deleteID={'meetingID':meetingID};
        $.ajax({
            url:"meeting/deleteMeeting",
            type:"post",
            data:deleteID,
            dataType:"json",
            success:function (data) {
                if(data){
                    alert("删除成功！");
                    myCreateMeeting();

                }
                else {alert("删除失败!");}
            },
            error:function () {
                            alert("未知的错误");
            }

        });
    }
    //查看我加入的会议
    function myJoinMeeting() {
        clearView();
        var accountID='${ID}';
        var ID={'accountID':accountID};
        $.ajax({
            url:"meeting/selectMyJoinMeeting",
            type:"post",
            data:ID,
            dataType:"json",
            success:function (data) {
                if(data.flag) {
                    var result = data.meetings;
                    if (result.length > 0) {
                        var rightMain = $("#rightMain");
                        rightMain.append("<form class=\"form-group\">\n" +
                            "<div class=\"form-group\">\n" +
                            "<label style=\"color: aliceblue\">我加入的会议</label>\n" +
                            "</div>" +
                            "</form>\n");
                        rightMain.append("<div>\n" +
                            "\t<table id='meetingTable'class=\"table table-bordered table-striped \" >\n" +
                            "\t\t<tbody >\n" +
                            "\t\t\t<th>会议编号</th>\n" +
                            "\t\t\t<th>会议发布者</th>\n"+
                            "\t\t\t<th>会议名称</th>\n" +
                            "\t\t\t<th>会议时间</th>\n" +
                            "\t\t\t<th>会议地点</th>\n" +
                            "\t\t\t<th>会议宾馆</th>\n" +
                            "\t\t\t<th>操作</th>\n" +
                            "\t\t</tbody>" + "<tbody id=\"meetingContent\" ></tbody>\n" + "</table>");
                    }
                    var meetingContent = $("#meetingContent");
                    for (var i = 0; i < result.length; i++) {
                        meetingContent.append("<tr style='background-color: white'>\n" +
                            "\t\t\t<td >" + result[i].meetingID + "</td>\n" +
                            "\t\t\t<td >" + result[i].accountID + "</td>\n" +
                            "\t\t\t<td>" + result[i].meetingName + "</td>\n" +
                            "\t\t\t<td>" + result[i].meetingTime + "</td>\n" +
                            "\t\t\t<td>" + result[i].meetingAddress + "</td>\n" +
                            "\t\t\t<td>" + result[i].meetingHotel + "</td>\n" + "<td><button  class=\"btn btn-primary\" onclick=\"exitMeeting(" +   result[i].meetingID+
                            ")\">退出该会议</button ></td>" +
                            "\t\t</tr>");
                    }
                }
                else{alert("你还没加入过会议");}
            },
            error:function () {
                alert("未知错误");
            }
        });
    }
    function exitMeeting(meetingID) {
        clearView();
        var accountID='${ID}';
        var ID={'meetingID':meetingID,'accountID':accountID};
        $.ajax({
            url:"meeting/exitMeeting",
            type:"post",
            data:ID,
            dataType:"json",
            success:function (data) {
                if(data){
                    alert("退出成功！");
                    myJoinMeeting();
                }
                else {alert("退出失败!");}
            },
            error:function () {
                alert("未知的错误");
            }

        });
    }
    function deleteAccount(meetingID,accountID) {
        var ID={'meetingID':meetingID,'accountID':accountID};
        $.ajax({
            url:"meeting/deleteAccount",
            type:"post",
            data:ID,
            dataType:"json",
            success:function (data) {
                if(data){
                    alert("删除成功！");
                    queryMeetingInfo(meetingID);
                }
                else {alert("删除失败!");}
            },
            error:function () {
                alert("未知的错误");
            }

        });

    }
    function selectAllAccount() {
        var data="test";
        var test={'test':data};
        var rightMain=$("#rightMain");
        rightMain.empty();
        rightMain.append("<form class=\"form-group\">\n" +
            "<div class=\"form-group\">\n" +
            "<label style=\"color: aliceblue\">所有用户</label>\n" +
            "</div>" +
            "</form>\n");

        $.ajax({
            url:"selectAllAccount",
            type:"post",
            data:test,
            dataType:"json",
            success:function (data) {
                var result=data.accounts;
                if (result.length > 0) {
                    rightMain.append("<div>\n" +
                        "\t<table id='meetingTable'class=\"table table-bordered table-striped \" >\n" +
                        "\t\t<tbody >\n" +
                        "\t\t\t<th>用户名</th>\n" +
                        "\t\t\t<th>用户密码</th>\n"+
                        "\t\t\t<th>用户邮箱</th>\n" +
                        "\t\t\t<th>用户权限</th>\n" +
                        "\t\t\t<th>操作</th>\n" +
                        "\t\t</tbody>" + "<tbody id=\"meetingContent\" ></tbody>\n" + "</table>");
                    var meetingContent = $("#meetingContent");
                    for (var i = 0; i < result.length; i++) {
                        meetingContent.append("<tr style='background-color: white'>\n" +
                            "\t\t\t<td >" + result[i].accountID + "</td>\n" +
                            "\t\t\t<td>" + result[i].accountPassword + "</td>\n" +
                            "\t\t\t<td>" + result[i].accountEmail + "</td>\n" +
                            "\t\t\t<td>" + result[i].accountPower + "</td>\n" +
                             "<td><button  class=\"btn btn-primary\" onclick=\"deleteAccountByAdmin('" +   result[i].accountID+
                            "')\">删除该用户</button ></td>" +
                            "\t\t</tr>");
                    }

                }


            }
        });
    }
    function deleteAccountByAdmin(accountID) {
        var ID={'accountID':accountID};
        $.ajax({
            url:"deleteAccountByAdmin",
            type:"post",
            data:ID,
            dataType:"json",
            success:function (data) {
                alert("删除成功!");
                selectAllAccount();
            },
            error:function () {
                alert("error");
            }
        });
    }
    function selectAllMeeting() {
        var rightMain=$("#rightMain");
        rightMain.empty();
        rightMain.append("<form class=\"form-group\">\n" +
            "<div class=\"form-group\">\n" +
            "<label style=\"color: aliceblue\">所有会议</label>\n" +
            "</div>" +
            "</form>\n");
        $.ajax({
            url:"meeting/selectAllMeeting",
            type:"post",
            dataType:"json",
            success:function (data) {
                var result=data.meetings;
                if (result.length > 0) {
                    rightMain.append("<div>\n" +
                        "\t<table id='meetingTable'class=\"table table-bordered table-striped \" >\n" +
                        "\t\t<tbody >\n" +
                        "\t\t\t<th>会议编号</th>\n" +
                        "\t\t\t<th>会议名称</th>\n"+
                        "\t\t\t<th>会议发布者</th>\n"+
                        "\t\t\t<th>会议密码</th>\n"+
                        "\t\t\t<th>会议时间</th>\n" +
                        "\t\t\t<th>会议地点</th>\n" +
                        "\t\t\t<th>会议宾馆</th>\n"+
                        "\t\t\t<th>操作</th>\n" +
                        "\t\t</tbody>" + "<tbody id=\"meetingContent\" ></tbody>\n" + "</table>");
                    var meetingContent = $("#meetingContent");
                    for (var i = 0; i < result.length; i++) {
                        meetingContent.append("<tr style='background-color: white'>\n" +
                            "\t\t\t<td >" + result[i].meetingID + "</td>\n"+
                            "\t\t\t<td >" + result[i].meetingName + "</td>\n"+
                            "\t\t\t<td >" + result[i].accountID + "</td>\n" +
                            "\t\t\t<td>" + result[i].meetingPassword + "</td>\n" +
                            "\t\t\t<td>" + result[i].meetingTime + "</td>\n" +
                            "\t\t\t<td>" + result[i].meetingAddress + "</td>\n" +
                            "\t\t\t<td >" + result[i].meetingHotel + "</td>\n"+
                            "<td><button  class=\"btn btn-primary\" id='exportBtn' onclick=\"deleteMeetingByAdmin('" +   result[i].meetingID+
                            "')\">删除该会议</button ></td>" +
                            "\t\t</tr>");
                    }
                }
                else alert("当前还没有人发布会议");
            },
            error:function () {
                alert("error");
            }
        });

    }
    //管理员删除会议
    function deleteMeetingByAdmin(meetingID) {
        var deleteID={'meetingID':meetingID};
        $.ajax({
            url:"meeting/deleteMeetingByAdmin",
            type:"post",
            data:deleteID,
            dataType:"json",
            success:function (data) {
                if(data){
                    alert("删除成功！");
                    selectAllMeeting();
                }
                else {alert("删除失败!");}
            },
            error:function () {
                alert("未知的错误");
            }
        });
    }
    function clearView() {
        var rightMain=$("#rightMain");
        rightMain.empty();

    }
    //导出excel
    function exportTableController(meetingID) {
        var form = $("<form>");
        form.attr('style', 'display:none');
        form.attr('target', '');
        form.attr('method', 'post');
        form.attr('action', "export/exportExcel");

        var input1 = $('<input>');
        input1.attr('type', 'hidden');
        input1.attr('name', 'meetingID');
        input1.attr('value', meetingID);
        $('body').append(form);
        form.append(input1);
        form.submit();
    }
    function getCode(meetingID) {
        var form = $("<form>");
        form.attr('style', 'display:none');
        form.attr('target', '');
        form.attr('method', 'post');
        form.attr('action', "export/getCode");

        var input1 = $('<input>');
        input1.attr('type', 'hidden');
        input1.attr('name', 'meetingID');
        input1.attr('value', meetingID);
        $('body').append(form);
        form.append(input1);
        form.submit();
    }

</script>

</body>
</html>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>电影日历</title>
  <link rel="icon" href="favicon.ico"/>
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/profile.css">
  <link rel="stylesheet" href="css/moviecalendar.css">

</head>
<body>
<%@Language="vbscript" Codepage="65001"%>
<!--导航栏制作-->
<div class="navbar navbar-default ">
  <div class="container">
   <div class="navbar-header">
<a href="index.asp" target="view_window"><img width="80px" height="56px" src="img/1.png"></a>
   </div>
<nav class="nav navbar-nav">
<li><a href="index.asp" target="view_window">首页</a></li>
<li><a href="lists.asp" target="view_window">电影列表</a></li>
<li><a href="moviecalendar.asp" target="view_window">电影日历</a></li>

</nav>

<form class="form navbar-form navbar-left">
<div class="form-group searchbar">
  <input type="text" class="form-control" placeholder="搜索你感兴趣的电影">
</div>
<button type="submit" class="btn btn-default">搜索</button>
</form>

<nav class="nav profile navbar-nav navbar-right ">
<% If Session("UserName") = "" Then %>
  <li><a href="login.asp" target="view_window">登录</a></li>
  <li><a href="logup.asp" target="view_window">注册</a></li>
<% Else %>
   <% if session("username")="Admin" then%>
   <span class="main">✧(•̤̀ᵕ•̤́๑)ᵒᵏᵎᵎᵎᵎ&nbsp&nbsp欢迎你&nbsp<%=Session("UserName")%> ！~
   &nbsp&nbsp&nbsp&nbsp<a href=adminfile.asp target="view_window">管理员主页</a>&nbsp;
   <a href="pwdedit.asp?UserId=<%=Session("UserId")%>" target="view_window">修改密码</a>&nbsp;
   <a href=logout.asp>退出登录</a>
   <% else %>
   <div class="side">✧(•̤̀ᵕ•̤́๑)ᵒᵏᵎᵎᵎᵎ&nbsp&nbsp欢迎你&nbsp<%=Session("UserName")%> ！~</div>
   &nbsp&nbsp&nbsp&nbsp<a href="profile.asp?UserId=<%=Session("UserId")%>" target="view_window">个人中心</a>&nbsp;<a href="pwdedit.asp?UserId=<%=Session("UserId")%>" target="view_window">修改密码</a>&nbsp;

   <a href=logout.asp>退出登录</a>
   <%end if%>
<% end if %>
</nav>
</div>
</div>


<img width="1351px" height="600px"src="img/9.jpg" >
<hr>

<h1 align="center">一页电影，一页人生</h1>
<h4 align="center">收录365部高分电影及经典台词短评</h4>
<h4 align="center">每页日历上的电影，都抒写了这一天的故事</h4>
<div class="img" width=500px align="center"><img width="800px" height="560px" src="img/1.png">
</div>
<hr>

<div class="section1" align="center">
  <%
    Dim cnn, rst, sSQL
    Set cnn = Server.CreateObject("ADODB.Connection")
    Set rst = Server.CreateObject("ADODB.Recordset")
    cnn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
    cnn.Open

    dim d1,d2
    d1= cstr(date())
    d2=day(date)
    week=WeekdayName(Weekday(Date))

    sSQL = "SELECT * FROM calendar WHERE date= #" & d1 &"#"
    rst.Open sSQL, cnn

    set rsmov=cnn.execute("select * from movie where movieid='"& rst("movieid") &"'")
  %>
<!-- ' 实现分页功能
' rst.pagesize=1
' page=clng(request("page"))
' if page<1 then page=1
' if page>rst.pagecount then page=rst.pagecount -->
<button onclick="datechange()">前一天</button>






<%while not rst.eof
response.write    "<div class='date' align='left'>"
response.write  date()
response.write    "</div>"
response.write    "<div class='week'align='left'>"
response.write week
%>
 &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp <span align="right" class="moviename" >
  《<%=rsmov("moviename")%>》
</span>
<%response.write    "</div>"
response.write    "<div class='day'>"
response.write"" & d2
response.write    "</div>"
%>

<div class="reason">
  【<%=rst("reason")%>】
</div>
<hr>
<span class="comma">
  “
</span>
<div class="dialog">
    <%=rst("dialog")%>
</div>
<span class="comma">
  ”
</span>
<%n=n+1
rst.movenext
wend
%>


</div>



</div>
<hr>
<script type="text/javascript">
  function datechange(){
    // 点击后当前日期移一天
previousdate=new Date(new Date()-24*60*60*1000)
d2=previousdate.getDate()
  alert(d2)
  alert(previousdate.getday())
  alert(previousdate)
  }

</script>
<%= d1 %>
<div class="footer" align="center">
      <p>
        免责声明：本网站所有内容都是靠程序在互联网上自动搜集而来，仅供测试和学习交流。
      <br>
        目前正在逐步删除和规避程序自动搜索采集到的不提供分享的版权影视。
      </p>
      <p>若侵犯了您的权益，请发邮件通知站长，邮箱：service@imovie.com</p>
</div>

</body>
</html>

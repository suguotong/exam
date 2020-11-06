<%@ page language="java" contentType="text/html;charset=UTF-8" errorPage="error.jsp" pageEncoding="utf-8" %>
<html>
    <!-- 公共头部 -->
    <head>
        <title>数学考试</title>
        <meta charset="UTF-8">
        <script src="js/jquery-3.5.1.js"></script>
        <script src="js/common.js"></script>
    </head>
    <body>
        <form id="login">
            <h1 id="title">登录</h1>
            <div>
                <span>用户名</span>
                <input type="text" name="username">
            </div>
            <p></p>
            <div>
                <span>密码</span>
                <input type="password" name="password">
            </div>
            <div>
                <span>验证码</span>
                <input type="text" name="verify_code">
                <img src="${verifyCode}" alt="verifyCode">
            </div>
        </form>
        <button id="submit">登录</button>
        <button onclick="location.href='register.jsp'">注册</button>
    </body>
    <script>
        //提交表单
        $("#id").on('click', function () {
            //序列化表单
            var user = $("#login").serializeJson();
            //表单校验
            if (user.username == "") {
                alert("用户名不能为空");
                return false;
            }
            if (user.password == "") {
                alert("密码不能为空");
                return false;
            }
            //发送请求
            $.post("login", {
                    user: JSON.stringify(user)
                }, function (data) {
                    console.log(data)
                    return false;
                }
            );

        })
    </script>
</html>

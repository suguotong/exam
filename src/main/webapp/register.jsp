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
        <form id="register">
            <h1 id="title">注册</h1>
            <div>
                <span>用户名</span>
                <input type="text" name="username">
            </div>
            <div>
                <span>密码</span>
                <input type="password" name="password">
            </div>
            <div>
                <span>确认密码</span>
                <input type="password" name="confirm_password">
            </div>
            <div>
                <span>性别</span>
                <input type="radio" name="gender" value="男">男
                <input type="radio" name="gender" value="女">女
            </div>
            <div>
                <span>邮箱</span>
                <input type="email" name="email">
            </div>
            <div>
                <span>电话</span>
                <input type="tel" name="phone">
            </div>
        </form>
        <button id="submit">注册</button>
    </body>
    <script>
        //提交表单
        $("#submit").on('click', function () {
            //序列化表单
            var user = $("#register").serializeJson();
            //表单校验
            if (user.username == "") {
                alert("用户名不能为空");
                return false;
            }
            if (user.password == "") {
                alert("密码不能为空");
                return false;
            }
            if (user.password != user.confirm_password) {
                alert("两次密码不一致");
                return false;
            }
            if (user.email == "") {
                alert("邮箱不能为空");
                return false;
            }
            if (user.phone == "") {
                alert("电话不能为空");
                return false;
            }
            $.post("register", {
                    user: JSON.stringify(user)
                }, function (data) {
                    console.log(data);
                    alert(data.msg);
                    if (data.code === 0) {
                        location.href = "login.jsp";
                    } else {
                        return false;
                    }
                }
            )
        })
    </script>
</html>

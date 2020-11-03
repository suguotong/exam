<%@ page language="java" contentType="text/html;charset=UTF-8" errorPage="error.jsp" pageEncoding="utf-8" %>
<html>
    <!-- 公共头部 -->
    <jsp:include page="head.jsp"/>
    <body>
        <form id="login">
            <h1 id="title">登录</h1>
            <div>
                <span>用户名</span>
                <input type="text" name="username">
            </div>
            <p></p>
            <div>
                <span>密&emsp;码</span>
                <input type="password" name="password">
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
            } else if (user.password == "") {
                alert("密码不能为空");
            } else {
                //发送请求
                $.post("login", {
                        user: JSON.stringify(user)
                    }, function (data) {
                        console.log(data)
                    }
                );
            }

        })
    </script>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" import="java.util.*" %>
<%
    int x = Integer.parseInt(request.getParameter("x"));
    int y = Integer.parseInt(request.getParameter("y"));
    int o = Integer.parseInt(request.getParameter("o"));
    int result = Integer.parseInt(request.getParameter("result"));
    int right = 0;
    if (o == 0) {
        right = x + y;
    } else if (o == 1) {
        right = x - y;
    } else if (o == 2) {
        right = x * y;
    } else if (o == 3) {
        right = x / y;
    }
    String text = "";
    if (result == right) {
        text = "正确";
    } else {
        text = "错误";
    }

%>
<html>
    <head>
        <title>结果</title>
    </head>
    <style>
        #title {
            text-align: center;
        }

        #calc {
            width: 500px;
            text-align: center;
            position: absolute;
            left: 50%;
            top: 50%;
            background: #eeeeee;
            transform: translate(-50%, -50%);
            padding: 50px 100px;
        }

        #calc span {
            display: inline-block;
            width: 25px;
            height: 25px;
            line-height: 25px;
        }

        #calc input[name='result'] {
            width: 50px;
            border: 0;
            border-radius: 5px;
            height: 35px;
            padding: 0 10px;
        }
    </style>
    <body>
        <form id="calc" action="result.jsp" method="post">
            <h1 id="title">小学数学</h1>
            <h2><%=text%>
            </h2>
        </form>
    </body>
</html>

<%@ page import="java.util.Random" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" errorPage="error.jsp" pageEncoding="utf-8" %>
<%
    Random random = new Random();
    int x = random.nextInt(10);
    int y = random.nextInt(10);
    char operator = '+';
    int o = random.nextInt(4);
    if (o == 0) {
        operator = '+';
    } else if (o == 1) {
        operator = '-';
    } else if (o == 2) {
        operator = '*';
    } else if (o == 3) {
        operator = '/';
    }
%>
<html>
    <!-- 公共头部 -->
    <jsp:include page="head.jsp"/>
    <body>
        <form id="calc" action="result.jsp" method="post">
            <h1 id="title">小学数学</h1>
            <span><%=x%></span>
            <span><%=operator%></span>
            <span><%=y%></span>
            <span>=</span>
            <input type="text" name="result">
            <input type="hidden" name="x" value="<%=x%>">
            <input type="hidden" name="o" value="<%=o%>">
            <input type="hidden" name="y" value="<%=y%>">
            <button class="submit">计算</button>
            <a href="logout.jsp">退出登录</a>
        </form>
    </body>
</html>

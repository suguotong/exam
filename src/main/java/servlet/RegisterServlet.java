package servlet;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import entity.User;
import util.JsonUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author hui
 * @date 2020-11-02 17:11:12
 */
@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //返回值
        int code = -1;
        String msg = "";
        //获取用户提交的信息
        String userJson = request.getParameter("user");
        User user = JsonUtil.parse2bean(userJson, User.class);
        System.out.println(user.toString());
        //保存到数据库
        UserDao userDao = new UserDaoImpl();
        if (userDao.getUser(user.getUsername()) != null) {
            code = 2;
            msg = "用户名已存在";
        } else {
            boolean i = userDao.saveUser(user);
            if (i) {
                code = 0;
                msg = "注册成功";
            } else {
                code = 1;
                msg = "注册失败";
            }
        }
        System.out.println(msg);
        //返回前端保存结果
        PrintWriter writer = response.getWriter();
        writer.write(JsonUtil.response(code, msg, null));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
}

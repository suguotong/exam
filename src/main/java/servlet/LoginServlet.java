package servlet;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author hui
 * @date 2020-11-02 16:48:39
 */
@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取用户名密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //根据用户名从数据库查询用户信息
        UserDao userDao = new UserDaoImpl();
        User user = userDao.getUser(username);
        //判断密码是否正确
        PrintWriter writer = response.getWriter();
        int code = -1;
        if (password.equals(user.getPassword())) {
            code = 1;
            System.out.println("登录成功");
        } else {
            code = 0;
            System.out.println("登录失败");
        }
        writer.write(code);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

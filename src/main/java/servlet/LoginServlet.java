package servlet;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import entity.User;
import util.CaptchaCodeUtil;
import util.JsonUtil;

import javax.imageio.stream.ImageOutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

/**
 * @author hui
 * @date 2020-11-02 16:48:39
 */
@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //返回值
        int code = -1;
        String msg = "";
        //获取用户名密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //根据用户名从数据库查询用户信息
        UserDao userDao = new UserDaoImpl();
        User user = userDao.getUser(username);
        //判断密码是否正确
        if (password.equals(user.getPassword())) {
            code = 1;
            msg = "登录成功";
        } else {
            code = 0;
            msg = "登录失败";
        }
        System.out.println(msg);
        //返回给前端值
        PrintWriter writer = response.getWriter();
        writer.write(JsonUtil.response(code, msg, null));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //生成4位随机验证码
        String code = new CaptchaCodeUtil().randomStr(4);
        System.out.println("生成验证码：" + code);
        //验证码存入session
        HttpSession session = request.getSession();
        session.setAttribute("code", code);
        //指定验证码长宽
        CaptchaCodeUtil verifyCode = new CaptchaCodeUtil(116, 36, 4, 10, code);
        request.setAttribute("verifyCode", verifyCode.getBase64());
        request.getRequestDispatcher("login.jsp").forward(request, response);

    }
}

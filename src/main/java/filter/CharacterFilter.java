package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * 乱码过滤器
 *
 * @author hui
 * @date 2020-07-21 09:18:00
 */
@WebFilter(filterName = "CharacterFilter",
        urlPatterns = {"/login", "/register"})
public class CharacterFilter implements Filter {
    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //处理中文乱码
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;utf-8");
        //设置返回json
        resp.setContentType("application/json");
        chain.doFilter(req, resp);
    }

    @Override
    public void init(FilterConfig config) {

    }

}

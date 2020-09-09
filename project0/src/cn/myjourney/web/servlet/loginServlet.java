package cn.myjourney.web.servlet;

import cn.myjourney.domain.User;
import cn.myjourney.service.impl.userServiceImpl;
import cn.myjourney.service.userService;
import cn.myjourney.util.JDBCUtils;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String verifyCode = request.getParameter("verifyCode");
        HttpSession session = request.getSession();
        String checkCode_server = (String) session.getAttribute("CHECKCODE_SERVER");
        session.removeAttribute("CHECKCODE_SERVER");
        if (checkCode_server != null && checkCode_server.equalsIgnoreCase(verifyCode)){
            User user = new User();

//            String username = request.getParameter("username");
//            String password = request.getParameter("password");
//            user.setUsername(username);
//            user.setPassword(password);

            Map<String, String[]> map = request.getParameterMap();
            try {
                BeanUtils.populate(user, map);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }

            userService service = new userServiceImpl();
            User loginUser = service.login(user);
            if (loginUser != null){
                session.setAttribute("user", loginUser);
                response.sendRedirect(request.getContextPath()+"/index.jsp");
            }else{
                request.setAttribute("login_msg", "账号或密码错误");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }

        }else{
            request.setAttribute("login_msg","验证码错误");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}

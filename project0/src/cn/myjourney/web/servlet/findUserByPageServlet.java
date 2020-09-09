package cn.myjourney.web.servlet;

import cn.myjourney.domain.PageBean;
import cn.myjourney.domain.User;
import cn.myjourney.service.impl.userServiceImpl;
import cn.myjourney.service.userService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/findUserByPageServlet")
public class findUserByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String currentPage = request.getParameter("currentPage");
        String rows = request.getParameter("rows");
        Map<String, String[]> condition = request.getParameterMap();

        if (currentPage == null || "".equals(currentPage))
            currentPage = "1";
        if (rows == null || "".equals(rows))
            rows = "10";

        userService service = new userServiceImpl();
        PageBean<User> pb = service.findUserByPage(currentPage, rows, condition);

        request.setAttribute("pb", pb);
        request.getRequestDispatcher("/list.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}

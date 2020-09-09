package cn.myjourney.web.servlet;

import cn.myjourney.service.impl.userServiceImpl;
import cn.myjourney.service.userService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/multiDelServlet")
public class multiDelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] uid = request.getParameterValues("uid");

        userService service = new userServiceImpl();
        service.multiDel(uid);

        response.sendRedirect(request.getContextPath() + "/findUserByPageServlet");


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}

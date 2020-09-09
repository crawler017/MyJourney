package cn.myjourney.web.servlet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/checkCodeServlet")
public class checkCodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int width = 80;
        int height = 30;

        // 创建对象，验证码图片对象
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        // 获取画笔
        Graphics g = image.getGraphics();
        // 设置画笔颜色
        g.setColor(Color.GRAY);
        // 填充图片
        g.fillRect(0,0, width, height);

        // 产生4个随机验证码
        String checkCode = getCheckCode();
        // 将验证码放入HttpSession中
        request.getSession().setAttribute("CHECKCODE_SERVER", checkCode);

        // 设置画笔颜色
        g.setColor(Color.YELLOW);
        g.setFont(new Font("黑体",Font.BOLD,24));
        g.drawString(checkCode,12,25);

        ImageIO.write(image, "jpg", response.getOutputStream());
    }

    private String getCheckCode() {
        String base = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        int size = base.length();
        // 生成随机角标
        Random random = new Random();

        StringBuilder bar = new StringBuilder();
        for (int i = 1; i <= 4; i++) {
            int index = random.nextInt(base.length());
            // 获取字符
            char ch = base.charAt(index);// 随机字符
            bar.append(ch);
        }

        return bar.toString();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}

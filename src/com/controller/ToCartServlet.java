package com.controller;

import com.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "ToCartServlet")
public class ToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //判断是否登录，没有登录 跳转去首页
        User user=(User) request.getSession().getAttribute("user");
        if (Objects.isNull(user)){
            response.sendRedirect("/login.jsp");
        }
        request.getRequestDispatcher("/WEB-INF/cart.jsp").forward(request,response);
    }
}

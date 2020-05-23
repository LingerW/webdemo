package com.controller;

import com.domain.User;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> parameterMap = request.getParameterMap();
        User user=new User();
        //初始化购物车
        HashMap<String,Integer> cart=new HashMap<>();
        try {
            BeanUtils.populate(user,parameterMap);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        String rightName="linger";
        String rightPassword="1";
        //不正确
        if (!Objects.equals(user.getUsername(),rightName)||!Objects.equals(rightPassword,user.getPassword())){
            //请求域对象中
            request.setAttribute("message","用户名或密码错误！");
            //转发 是同一次请求
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
        HttpSession session = request.getSession();
        session.setAttribute("user",user);
        session.setAttribute("cart",cart);
        //如果正确，重定向到商城首页
        response.sendRedirect("/index.jsp");
    }
}

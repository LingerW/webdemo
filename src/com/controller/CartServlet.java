package com.controller;

import com.google.gson.Gson;
import com.sun.org.apache.bcel.internal.generic.GOTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

@WebServlet(name = "CartServlet")
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String books=request.getParameter("books");
       String[] bookList=books.split(",");
       //将数据加入购物车
        HttpSession session = request.getSession();
        //key 书名 value 数量
        HashMap<String,Integer> cart = (HashMap<String,Integer>)session.getAttribute("cart");
        for(String item:bookList){
            //如果以前已经添加过
            if (cart.containsKey(item)){
               Integer oldValue=cart.get(item);
               cart.put(item,oldValue+1);
            }else {
                cart.put(item,1);
            }
        }
        response.setContentType("application/json;charset=utf-8");
        //把对象转成json格式的工具 fastjson 阿里巴巴
        Gson gson=new Gson();
        HashMap<String,Object> returnMap=new HashMap<>();
        returnMap.put("message","添加成功！");
        String returnJson= gson.toJson(returnMap);
        //对应前台data
        response.getWriter().write(returnJson);
    }
}

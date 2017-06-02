package com.test.PageController;

import com.test.controller.LoginController;
import com.test.model.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

/**
 * Created by shamilbikchentaev on 04.05.17.
 */
@Controller
public class redirectLoginController {


    @Autowired
    private LoginController lc;
    @RequestMapping(value = "/service/checkUser", method = RequestMethod.POST)
    public void check(@RequestParam("login") String login, @RequestParam("password") String password, HttpServletResponse response) throws IOException {
        String token = lc.getToken(new Login(login,password));

        if (token.equals("{\"token\": \"incorrect\"}")){
            response.sendRedirect("/pages/login");
            return;
        }
        Cookie c = new Cookie("token", URLEncoder.encode(token, "UTF-8"));
        c.setPath("/");
        response.addCookie(c);
        response.sendRedirect("/index");
        return;
    }

    @RequestMapping(value = "/service/registerUser", method = RequestMethod.POST)
    public void registerME(@RequestParam String fullname, @RequestParam String login, @RequestParam String password, HttpServletResponse response) throws IOException {
        String mes = lc.register(new Login(fullname,login,password));
        if (mes.equals("{\"Messege\":\"Created\"}")) response.sendRedirect("/pages/login");
        else response.sendRedirect("/pages/register");
        return;
    }
}

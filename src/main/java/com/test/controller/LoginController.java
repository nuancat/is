package com.test.controller;

import com.test.model.Login;
import com.test.persistance.LoginRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;


/**
 * Created by shamilbikchentaev on 18.04.17.
 */
@RestController
@RequestMapping("/api/")
public class LoginController {
    @Autowired
    private LoginRepository lrep;


    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String getToken(@RequestBody Login login){
        Login l = lrep.findByLoginAndPassword(login.getLogin(),login.getPassword());
        if (l == null){
            return "{\"token\": \"incorrect\"}";
        }
        if (l.getToken().equals("empty")) {
            String time = new Date().getTime() + "";
            l = new Login(l.getFullname(), l.getLogin(), l.getPassword(), time);
            lrep.deleteAllByLogin(l.getLogin());
            lrep.save(l);
        }
        String token = "{\"token\": \""+l.getToken()+"\"}";
        return token;
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public @ResponseBody String register(@RequestBody Login login) {

        Login l = lrep.findByLogin(login.getLogin());
        if (l!=null) return "{\"Messege\":\"Login already exists\"}";
        lrep.save(login);
        return "{\"Messege\":\"Created\"}";
    }

    @RequestMapping(value = "/service/logout", method = RequestMethod.GET)
    public void logout(HttpServletResponse response, HttpServletRequest request) throws IOException {
        Cookie[] cookies = request.getCookies();
        for (Cookie x: cookies){
            if (x.getName().equals("token")) {
                x.setMaxAge(0);
                x.setPath("/");

            }
            response.addCookie(x);
        }
        response.sendRedirect("/pages/login");
        return;
    }
}

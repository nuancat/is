package com.test.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;


@Document(collection = "accounts")
public class Login {

    @Id private  String id;
    private  String fullname;
    private  String token;
    private  String login;
    private  String password;

    public Login(String login, String password) {
        this.login = login;
        this.password = password;
        this.fullname = fullname;
        this.token =  "empty";
    }

    public Login(String fullname, String login, String password) {
        this.login = login;
        this.password = password;
        this.fullname = fullname;
        this.token =  "empty";
    }

    public Login(String fullname, String login, String password, String token) {
        this.login = login;
        this.password = password;
        this.fullname = fullname;
        this.token =  token;
    }

    public Login(){}

 //***Setters&Getters{
    public String getFullname() {return fullname;}

    public String getLogin() {
        return login;
    }

    public String getPassword() {
        return password;
    }

    public String getId() {
        return id;
    }

    public String getToken() {
        return token;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    //***Setters&Getters}

    @Override
    public String toString() {
        return "Login{" +
                "id='" + id + '\'' +
                ", fullname='" + fullname + '\'' +
                ", token='" + token + '\'' +
                ", login='" + login + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}

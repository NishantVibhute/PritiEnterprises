/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.forward;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pritient.bean.LoginBean;
import com.pritient.bean.dao.LoginDao;

/**
 *
 * @author nishant.vibhute
 */
public class LoginAction extends ActionSupport implements ModelDriven {

    LoginBean loginBean = new LoginBean();

    LoginDao loginDao = new LoginDao();

    String message;

    public LoginAction() {

    }

    public String execute() throws Exception {
        String userName = loginBean.getUserName();
        String password = loginBean.getPassword();
        int count = loginDao.checkLogin(userName, password);

        if (count == 1) {
            return "success";
        } else {
            message = "failed";
            return "failed";
        }

    }

    public LoginBean getLoginBean() {
        return loginBean;
    }

    public void setLoginBean(LoginBean loginBean) {
        this.loginBean = loginBean;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public Object getModel() {
        return loginBean;
    }

}

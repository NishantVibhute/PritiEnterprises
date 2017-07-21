/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.listener;

import com.pritient.util.CommonUtil;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author nishant.vibhute
 */
public class ServletContextLis implements ServletContextListener {

    ServletContext context;
    CommonUtil commonUtil;

    public void contextInitialized(ServletContextEvent contextEvent) {
        System.out.println("Context Created");
        commonUtil = new CommonUtil();
    }

    public void contextDestroyed(ServletContextEvent contextEvent) {
        context = contextEvent.getServletContext();
        System.out.println("Context Destroyed");
    }
}

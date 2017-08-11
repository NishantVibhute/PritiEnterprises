/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.util;

import java.io.FileInputStream;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author nishant.vibhute
 */
public class CommonUtil {
public HttpServletRequest request;
    static Properties prop = new Properties();
    static InputStream input = null;
static String path;
    

    public CommonUtil(String path)
    {
       
        try {
            this.path=path;
            input = new FileInputStream(path+"WEB-INF\\classes\\com\\pritient\\properties\\resource.properties");
            // load a properties file
            prop.load(input);
        } catch (Exception ex) {
            Logger.getLogger(CommonUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public static String getResourceProperties(String name) {
        String value = prop.getProperty(name);
        return value;

    }

    public static String convertDate(String date) {
        String newDate = "";
        try {
            String sDate1 = date;
            Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(sDate1);
            java.text.SimpleDateFormat sdf
                    = new java.text.SimpleDateFormat("yyyy-MM-dd");

            newDate = sdf.format(date1);

        } catch (ParseException ex) {
            Logger.getLogger(CommonUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return newDate;
    }

    public static String convertDateToNormal(String date) {
        String newDate = "";
        try {
            String sDate1 = date;
            Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(sDate1);
            java.text.SimpleDateFormat sdf
                    = new java.text.SimpleDateFormat("dd/MM/yyyy");

            newDate = sdf.format(date1);

        } catch (ParseException ex) {
            Logger.getLogger(CommonUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return newDate;
    }

    public static String getPath() {
        return path;
    }

    public static void setPath(String path) {
        CommonUtil.path = path;
    }

    
    
    
}

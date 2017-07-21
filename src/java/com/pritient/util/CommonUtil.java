/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.util;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nishant.vibhute
 */
public class CommonUtil {

    static Properties prop = new Properties();
    static InputStream input = null;

    static {
        try {

            input = new FileInputStream("C:\\Users\\nishant.vibhute.WEBACCESS\\Documents\\NetBeansProjects\\PritiEnterprises\\src\\java\\com\\pritient\\properties\\resource.properties");
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
}

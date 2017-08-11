/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author nishant.vibhute
 */
public class DBUtil {

    Connection con;
    String url;

    public Connection getConnection() {
        try {
            url = "jdbc:mysql://127.9.126.2:3306/pritienterprises";
            Class.forName("com.mysql.jdbc.Driver");
            this.con = DriverManager.getConnection(url, "adminGnXBLDP", "dt78KgjZGwUD");
            return con;

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;

    }

    public void closeConnection(Connection con) {
        try {
            if (con != null) {
                con.close();
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }

}

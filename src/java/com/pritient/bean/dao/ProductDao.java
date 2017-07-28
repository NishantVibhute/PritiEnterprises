/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.bean.dao;

import com.pritient.bean.Product;
import com.pritient.bean.SubProduct;
import com.pritient.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nishant.vibhute
 */
public class ProductDao extends DBUtil {

    Connection conn;

    public int insertProduct(Product product) {
        int id = 0;
        try {
            conn = getConnection();

            PreparedStatement ps = conn.prepareStatement("Call insertMainProduct(?)");
            ps.setString(1, product.getMainProductName());

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                id = rs.getInt(1);
            }

            if (id != 0) {

                for (SubProduct sb : product.getSubProductList()) {
                    if (sb != null) {
                        PreparedStatement ps1 = conn.prepareStatement("Call insertSubProduct(?,?,?)");
                        ps1.setString(1, sb.getSubProductName());
                        ps1.setString(2, sb.getSubProductName());
                        ps1.setInt(3, id);
                        ps1.executeUpdate();
                    }
                }
            }

            closeConnection(conn);

        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public List<SubProduct> getAllProducts() {
        List<SubProduct> productList = new ArrayList<>();
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("Call getAllProducts()");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                SubProduct sp = new SubProduct();
                sp.setSubProductId(rs.getInt("id"));
                sp.setSubProductName(rs.getString("product_name"));
                sp.setSubProductCode(rs.getString("product_shotform"));
                productList.add(sp);
            }
            closeConnection(conn);
        } catch (SQLException ex) {
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productList;
    }

}

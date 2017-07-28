/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.bean.dao;

import com.pritient.bean.PurchaseProduct;
import com.pritient.bean.PurchaseProducts;
import com.pritient.util.CommonUtil;
import com.pritient.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nishant.vibhute
 */
public class PurchaseDao extends DBUtil {

    Connection conn;

    public int savePurchase(PurchaseProduct purchaseProduct) {
        int id = 0;
        try {
            conn = getConnection();

            PreparedStatement ps = conn.prepareStatement("Call insertPurchase(?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, CommonUtil.convertDate(purchaseProduct.getDate()));
            ps.setInt(2, purchaseProduct.getInvoiceNo());
            ps.setDouble(3, purchaseProduct.getTotalAmount());
            ps.setDouble(4, purchaseProduct.getCgstPerc());
            ps.setDouble(5, purchaseProduct.getCgstAmount());
            ps.setDouble(6, purchaseProduct.getSgstPerc());
            ps.setDouble(7, purchaseProduct.getSgstAmount());
            ps.setDouble(8, purchaseProduct.getIgstPerc());
            ps.setDouble(9, purchaseProduct.getIgstAmount());
            ps.setDouble(10, purchaseProduct.getTotalAmountAfterTax());
            ps.setInt(11, purchaseProduct.getCompanyId());

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                id = rs.getInt(1);
            }

            if (id != 0) {

                for (PurchaseProducts pp : purchaseProduct.getPurchaseProducts()) {
                    if (pp != null) {
                        PreparedStatement ps1 = conn.prepareStatement("Call insertPurchaseDetails(?,?,?,?,?,?,?,?,?,?,?,?)");
                        ps1.setInt(1, pp.getProductId());
                        ps1.setInt(2, pp.getQty());
                        ps1.setDouble(3, pp.getPrice());
                        ps1.setDouble(4, pp.getAmount());
                        ps1.setDouble(5, pp.getCgstPerc());
                        ps1.setDouble(6, pp.getCgstAmount());
                        ps1.setDouble(7, pp.getSgstPerc());
                        ps1.setDouble(8, pp.getSgstAmount());
                        ps1.setDouble(9, pp.getIgstPerc());
                        ps1.setDouble(10, pp.getIgstAmount());
                        ps1.setDouble(11, pp.getTotalAmountAfterTax());
                        ps1.setInt(12, id);
                        ps1.executeUpdate();

                        PreparedStatement ps2 = conn.prepareStatement("Call addProduct(?,?)");
                        ps2.setInt(1, pp.getProductId());
                        ps2.setInt(2, pp.getQty());
                        ps2.executeUpdate();
                    }
                }
            }

            closeConnection(conn);

        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;

    }

}

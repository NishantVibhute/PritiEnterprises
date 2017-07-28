/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.bean.dao;

import com.pritient.bean.Invoice;
import com.pritient.bean.InvoiceDetails;
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
public class InvoiceDao extends DBUtil {

    Connection conn;

    public int insertInvoice(Invoice invoice) {
        int id = 0;
        try {
            conn = getConnection();

            PreparedStatement ps = conn.prepareStatement("Call insertInvoice(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, CommonUtil.convertDate(invoice.getDate()));
            ps.setString(2, invoice.getReverseCharge());
            ps.setString(3, invoice.getState());
            ps.setInt(4, invoice.getCode());
            ps.setString(5, invoice.getTransportMode());
            ps.setString(6, invoice.getVehicleNo());
            ps.setString(7, CommonUtil.convertDate(invoice.getDateOfSupply()));
            ps.setString(8, invoice.getPlaceOfSupply());
            ps.setInt(9, invoice.getBillTO());
            ps.setInt(10, invoice.getShipTo());
            ps.setDouble(11, invoice.getTotalAmountBeforeTax());
            ps.setDouble(12, invoice.getCgstPerc());
            ps.setDouble(13, invoice.getCgstAmount());
            ps.setDouble(14, invoice.getSgstPerc());
            ps.setDouble(15, invoice.getSgstAmount());
            ps.setDouble(16, invoice.getIgstPerc());
            ps.setDouble(17, invoice.getIgstAmount());
            ps.setDouble(18, invoice.getTotalAmountATax());
            ps.setDouble(19, invoice.getRoundOff());
            ps.setDouble(20, invoice.getTotalAmount());
            ps.setString(21, invoice.getTotalAmountInWords());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                id = rs.getInt(1);
            }

            if (id != 0) {

                for (InvoiceDetails ids : invoice.getInvoiceDetails()) {
                    if (ids != null) {
                        PreparedStatement ps1 = conn.prepareStatement("Call insertInvoiceDetails(?,?,?,?,?,?,?,?,?,?,?,?)");
                        ps1.setInt(1, ids.getProductId());
                        ps1.setInt(2, ids.getQty());
                        ps1.setDouble(3, ids.getPrice());
                        ps1.setDouble(4, ids.getAmount());
                        ps1.setDouble(5, ids.getCgstPerc());
                        ps1.setDouble(6, ids.getCgstAmount());
                        ps1.setDouble(7, ids.getSgstPerc());
                        ps1.setDouble(8, ids.getSgstAmount());
                        ps1.setDouble(9, ids.getIgstPerc());
                        ps1.setDouble(10, ids.getIgstAmount());
                        ps1.setDouble(11, ids.getTotalAmountAfterTax());
                        ps1.setInt(12, id);
                        ps1.executeUpdate();

                        PreparedStatement ps2 = conn.prepareStatement("Call deleteProduct(?,?)");
                        ps2.setInt(1, ids.getProductId());
                        ps2.setInt(2, ids.getQty());
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

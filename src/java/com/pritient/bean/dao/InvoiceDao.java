/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.bean.dao;

import com.pritient.bean.Invoice;
import com.pritient.bean.InvoiceDetails;
import com.pritient.bean.PaymentBean;
import com.pritient.util.CommonUtil;
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

    public List<PaymentBean> getAllInvoice() {
        List<PaymentBean> invoice = new ArrayList<>();
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("Call getInvoiceList()");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                PaymentBean pb = new PaymentBean();
//                pb.setId(id);
                pb.setInvoiceId(rs.getInt("id"));
                pb.setCompanyName(rs.getString("company_name"));
                pb.setAmount(rs.getDouble("bill_amount"));
                pb.setDate(CommonUtil.convertDateToNormal(rs.getString("date")));
                invoice.add(pb);
            }

            closeConnection(conn);

        } catch (SQLException ex) {
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return invoice;
    }

    public Invoice getInvoiceDetails(int id) {
        Invoice in = new Invoice();
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("Call getInvoice(?)");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                in.setId(rs.getInt("id"));
                in.setDate(CommonUtil.convertDateToNormal(rs.getString("date")));
                in.setReverseCharge(rs.getString("reverse_charge"));
                in.setState(rs.getString("state"));
                in.setCode(rs.getInt("code"));
                in.setTransportMode(rs.getString("transport_mode"));
                in.setVehicleNo(rs.getString("vehicle_no"));
                in.setDateOfSupply(CommonUtil.convertDateToNormal(rs.getString("date_of_supply")));
                in.setPlaceOfSupply(rs.getString("place_of_supply"));

                in.setBillTO(rs.getInt("bill_to_party"));
                in.setShipTo(rs.getInt("ship_to_party"));
                in.setTotalAmountBeforeTax(rs.getDouble("total_amount_before_tax"));
                in.setCgstPerc(rs.getDouble("cgst_perc"));
                in.setCgstAmount(rs.getDouble("cgst_amount"));
                in.setSgstPerc(rs.getDouble("sgst_perc"));
                in.setSgstAmount(rs.getDouble("sgst_amount"));
                in.setIgstPerc(rs.getDouble("igst_perc"));
                in.setIgstAmount(rs.getDouble("igst_amount"));
                in.setTotalAmountATax(rs.getDouble("total_amount_after_tax"));
                in.setRoundOff(rs.getDouble("round_off"));
                in.setTotalAmount(rs.getDouble("bill_amount"));
                in.setTotalAmountInWords(rs.getString("bill_amount_in_words"));
            }

            List<InvoiceDetails> invoiceDetails = new ArrayList<>();
            PreparedStatement ps1 = conn.prepareStatement("Call getInvoiceDetails(?)");
            ps1.setInt(1, id);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                InvoiceDetails ind = new InvoiceDetails();
                ind.setProductName(rs1.getString("product_name"));
                ind.setQty(rs1.getInt("qty"));
                ind.setAmount(rs1.getDouble("total_amount"));
                ind.setPrice(rs1.getDouble("amount"));
                ind.setCgstPerc(rs1.getInt("cgst_perc"));
                ind.setCgstAmount(rs1.getDouble("cgst_amount"));
                ind.setSgstPerc(rs1.getInt("sgst_perc"));
                ind.setSgstAmount(rs1.getDouble("sgst_amount"));
                ind.setIgstPerc(rs1.getInt("igst_perc"));
                ind.setIgstAmount(rs1.getDouble("igst_amount"));
                ind.setTotalAmountAfterTax(rs1.getDouble("totalAmountAfterTax"));
                invoiceDetails.add(ind);
            }

            in.setInvoiceDetails(invoiceDetails);

            PreparedStatement ps2 = conn.prepareStatement("Call getCompanyDetails(?)");
            ps2.setInt(1, in.getBillTO());
            ResultSet rs2 = ps2.executeQuery();
            while (rs2.next()) {
                
                in.setBillToName(rs2.getString(2));
                in.setBillToAddress(rs2.getString(3));
                in.setBillToGSTIN(rs2.getString(4));
                in.setBillToState("Maharashtra");
                in.setBillToCode("27");
            }

            PreparedStatement ps3 = conn.prepareStatement("Call getCompanyDetails(?)");
            ps3.setInt(1, in.getShipTo());
            ResultSet rs3 = ps3.executeQuery();
            while (rs3.next()) {

                in.setShipToName(rs3.getString(2));
                in.setShipToAddress(rs3.getString(3));
                in.setShipToGSTIN(rs3.getString(4));
                in.setShipToState("Maharashtra");
                in.setShipToCode("27");
            }

            closeConnection(conn);

        } catch (SQLException ex) {
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return in;
    }

}

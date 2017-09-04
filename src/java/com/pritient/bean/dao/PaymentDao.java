/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.bean.dao;

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
public class PaymentDao extends DBUtil {

    Connection conn;

    public List<PaymentBean> getPendingPurchase() {
        List<PaymentBean> payment = new ArrayList<>();
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("Call getPendingPurchase()");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                PaymentBean pb = new PaymentBean();
//                pb.setId(id);
                pb.setInvoiceId(rs.getInt("invoice_num"));
                pb.setCompanyName(rs.getString("company_name"));
                pb.setAmount(rs.getDouble("totalAmountAfterTax"));
                pb.setDate(CommonUtil.convertDateToNormal(rs.getString("invoice_date")));
                payment.add(pb);
            }

            closeConnection(conn);

        } catch (SQLException ex) {
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return payment;
    }

    public List<PaymentBean> getPendingInvoice() {
        List<PaymentBean> invoice = new ArrayList<>();
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("Call getPendingInvoice()");

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

    public int updatePaymentPurchase(PaymentBean paymentBean) {
        int count = 0;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("Call updatePaymentPurchase(?,?,?,?,?,?,?)");
            ps.setInt(1, paymentBean.getInvoiceId());
            ps.setString(2, CommonUtil.convertDate(paymentBean.getDate()));
            ps.setString(3, CommonUtil.convertDate(paymentBean.getPaymentDate()));
            ps.setString(4, paymentBean.getMode());
            ps.setString(5, paymentBean.getChequeNo().equals("") ? null : paymentBean.getChequeNo());
            ps.setString(6, paymentBean.getBankName().equals("") ? null : paymentBean.getBankName());
            ps.setString(7, paymentBean.getPaymentAmount());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                count = rs.getInt(1);

            }

            closeConnection(conn);

        } catch (SQLException ex) {
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int updatePaymentInvoice(PaymentBean paymentBean) {
        int count = 0;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("Call updatePaymentInvoice(?,?,?,?,?,?,?)");
            ps.setInt(1, paymentBean.getInvoiceId());
            ps.setString(2, CommonUtil.convertDate(paymentBean.getDate()));
            ps.setString(3, CommonUtil.convertDate(paymentBean.getPaymentDate()));
            ps.setString(4, paymentBean.getMode());
            ps.setString(5, paymentBean.getChequeNo().equals("") ? null : paymentBean.getChequeNo());
            ps.setString(6, paymentBean.getBankName().equals("") ? null : paymentBean.getBankName());
            ps.setString(7, paymentBean.getPaymentAmount());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                count = rs.getInt(1);

            }

            closeConnection(conn);

        } catch (SQLException ex) {
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

}

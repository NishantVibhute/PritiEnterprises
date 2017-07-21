/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.bean.dao;

import com.pritient.bean.CompanyBean;
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
public class CompanyAddressDao extends DBUtil {

    Connection conn;

    public int insertCompanyAddress(String compName, String compAdd, String compGST) {
        int id = 0;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("Call addCompanyAddress(?,?,?)");
            ps.setString(1, compName);
            ps.setString(2, compAdd);
            ps.setString(3, compGST);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                id = rs.getInt(1);
            }

            closeConnection(conn);
        } catch (SQLException ex) {
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return id;
    }

    public List<CompanyBean> getCompanyList() {
        List<CompanyBean> compList = new ArrayList<>();
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("Call getCompanyList()");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CompanyBean cb = new CompanyBean();
                cb.setCompanyId(rs.getInt(1));
                cb.setCompanyName(rs.getString(2));
                cb.setCompanyAddress(rs.getString(3));
                cb.setCompanyGSTIN(rs.getString(4));
                compList.add(cb);
            }

            closeConnection(conn);

        } catch (SQLException ex) {
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return compList;
    }

    public CompanyBean getCompanyDetails(int id) {
        CompanyBean cb = new CompanyBean();
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("Call getCompanyDetails(?)");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                cb.setCompanyId(rs.getInt(1));
                cb.setCompanyName(rs.getString(2));
                cb.setCompanyAddress(rs.getString(3));
                cb.setCompanyGSTIN(rs.getString(4));

            }

            closeConnection(conn);

        } catch (SQLException ex) {
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cb;
    }

    public int updateCompanyDetails(CompanyBean cb) {
        int count = 0;
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("Call updateCompanyDetails(?,?,?,?)");
            ps.setInt(1, cb.getCompanyId());
            ps.setString(2, cb.getCompanyName());
            ps.setString(3, cb.getCompanyAddress());
            ps.setString(4, cb.getCompanyGSTIN());
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

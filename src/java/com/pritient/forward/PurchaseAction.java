/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.forward;

import com.opensymphony.xwork2.ActionSupport;
import com.pritient.bean.CompanyBean;
import com.pritient.bean.dao.CompanyAddressDao;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nishant.vibhute
 */
public class PurchaseAction extends ActionSupport {

    List<CompanyBean> companyList = new ArrayList<>();
    CompanyAddressDao companyAddressDao = new CompanyAddressDao();

    public PurchaseAction() {
    }

    public String execute() throws Exception {
        companyList = companyAddressDao.getCompanyList();
        return ActionSupport.SUCCESS;
    }

    public List<CompanyBean> getCompanyList() {
        return companyList;
    }

    public void setCompanyList(List<CompanyBean> companyList) {
        this.companyList = companyList;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.forward;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pritient.bean.CompanyBean;
import com.pritient.bean.Invoice;
import com.pritient.bean.SubProduct;
import com.pritient.bean.dao.CompanyAddressDao;
import com.pritient.bean.dao.InvoiceDao;
import com.pritient.bean.dao.ProductDao;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nishant.vibhute
 */
public class InvoiceAction extends ActionSupport implements ModelDriven<Invoice> {

    String successMessage = "";
    String errorMessage = "";
    Invoice invoice = new Invoice();
    List<CompanyBean> companyList = new ArrayList<>();
    List<SubProduct> subProductList = new ArrayList<>();
    CompanyAddressDao companyAddressDao = new CompanyAddressDao();
    ProductDao productDao = new ProductDao();
    InvoiceDao invoiceDao = new InvoiceDao();

    public String execute() throws Exception {
        companyList = companyAddressDao.getCompanyList();
        subProductList = productDao.getAllProducts();
        return ActionSupport.SUCCESS;
    }

    public String saveInvoiceAction() throws Exception {

        int id = invoiceDao.insertInvoice(this.getInvoice());

        if (id == 0) {
            errorMessage = "Failed To add Invoice";
        } else {
            successMessage = "Invoice Added Successfully";
        }
        return ActionSupport.SUCCESS;
    }

    public String getSuccessMessage() {
        return successMessage;
    }

    public void setSuccessMessage(String successMessage) {
        this.successMessage = successMessage;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public Invoice getInvoice() {
        return invoice;
    }

    public void setInvoice(Invoice invoice) {
        this.invoice = invoice;
    }

    public List<CompanyBean> getCompanyList() {
        return companyList;
    }

    public void setCompanyList(List<CompanyBean> companyList) {
        this.companyList = companyList;
    }

    public List<SubProduct> getSubProductList() {
        return subProductList;
    }

    public void setSubProductList(List<SubProduct> subProductList) {
        this.subProductList = subProductList;
    }

    @Override
    public Invoice getModel() {
        return invoice;
    }

}

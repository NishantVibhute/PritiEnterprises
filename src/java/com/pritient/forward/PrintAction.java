/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pritient.forward;

import com.opensymphony.xwork2.ActionSupport;
import com.pritient.bean.PaymentBean;
import com.pritient.bean.dao.InvoiceDao;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nishant.vibhute
 */
public class PrintAction extends ActionSupport {

    List<PaymentBean> invoiceList = new ArrayList<>();
    InvoiceDao invoiceDao = new InvoiceDao();
    
     String successMessage = "";
    String errorMessage = "";

    @Override
    public String execute() {
        
        this.invoiceList = invoiceDao.getAllInvoice();

        return ActionSupport.SUCCESS;
    }

    public List<PaymentBean> getInvoiceList() {
        return invoiceList;
    }

    public void setInvoiceList(List<PaymentBean> invoiceList) {
        this.invoiceList = invoiceList;
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


}

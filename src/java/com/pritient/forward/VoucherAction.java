/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.forward;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pritient.bean.PaymentBean;
import com.pritient.bean.dao.PaymentDao;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nishant.vibhute
 */
public class VoucherAction extends ActionSupport implements ModelDriven {
    List<PaymentBean> purchase = new ArrayList<>();
    List<PaymentBean> invoice = new ArrayList<>();
    PaymentDao paymentDao = new PaymentDao();
    String successMessage = "";
    String errorMessage = "";
    PaymentBean paymentBean = new PaymentBean();

    @Override
    public String execute() {

        this.purchase = paymentDao.getPendingPurchase();
        this.invoice = paymentDao.getPendingInvoice();

        return ActionSupport.SUCCESS;
    }

    public String updateVoucher() {

        int count = 0;

        if (this.getPaymentBean().getType().equals("p")) {
            count = paymentDao.updatePaymentPurchase(paymentBean);
        } else {
            count = paymentDao.updatePaymentInvoice(paymentBean);
        }

        if (count == 0) {
            errorMessage = "Failed to Update Voucher";
        } else {
            successMessage = "Voucher Updated Successfully";
        }
        return ActionSupport.SUCCESS;
    }

    public List<PaymentBean> getPurchase() {
        return purchase;
    }

    public void setPurchase(List<PaymentBean> purchase) {
        this.purchase = purchase;
    }

    public List<PaymentBean> getInvoice() {
        return invoice;
    }

    public void setInvoice(List<PaymentBean> invoice) {
        this.invoice = invoice;
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

    public PaymentBean getPaymentBean() {
        return paymentBean;
    }

    public void setPaymentBean(PaymentBean paymentBean) {
        this.paymentBean = paymentBean;
    }

    @Override
    public Object getModel() {
        return this.getPaymentBean();
    }

}

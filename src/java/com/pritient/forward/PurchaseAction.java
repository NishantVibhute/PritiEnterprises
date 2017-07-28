/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.forward;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pritient.bean.CompanyBean;
import com.pritient.bean.PurchaseProduct;
import com.pritient.bean.SubProduct;
import com.pritient.bean.dao.CompanyAddressDao;
import com.pritient.bean.dao.ProductDao;
import com.pritient.bean.dao.PurchaseDao;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nishant.vibhute
 */
public class PurchaseAction extends ActionSupport implements ModelDriven {

    List<CompanyBean> companyList = new ArrayList<>();
    List<SubProduct> subProductList = new ArrayList<>();
    PurchaseProduct purchaseProduct = new PurchaseProduct();
    CompanyAddressDao companyAddressDao = new CompanyAddressDao();
    ProductDao productDao = new ProductDao();
    PurchaseDao purchaseDao = new PurchaseDao();
    String successMessage = "";
    String errorMessage = "";

    public PurchaseAction() {
    }

    public String execute() throws Exception {
        companyList = companyAddressDao.getCompanyList();
        subProductList = productDao.getAllProducts();
        return ActionSupport.SUCCESS;
    }

    public String savePurchase() throws Exception {
        int id = purchaseDao.savePurchase(this.getPurchaseProduct());

        if (id == 0) {
            errorMessage = "Failed To add Purchase Details";
        } else {
            successMessage = "Purchase Details Added Successfully";
        }
        return ActionSupport.SUCCESS;
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

    public PurchaseProduct getPurchaseProduct() {
        return purchaseProduct;
    }

    public void setPurchaseProduct(PurchaseProduct PurchaseProduct) {
        this.purchaseProduct = PurchaseProduct;
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

    @Override
    public Object getModel() {
        return purchaseProduct;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.bean;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nishant.vibhute
 */
public class PurchaseProduct {

    int companyId;
    int invoiceNo;
    String date;
    double totalAmount;
    double cgstPerc;
    double cgstAmount;
    double sgstPerc;
    double sgstAmount;
    double igstPerc;
    double igstAmount;
    double totalAmountAfterTax;
    List<PurchaseProducts> purchaseProducts = new ArrayList<>();

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public int getInvoiceNo() {
        return invoiceNo;
    }

    public void setInvoiceNo(int invoiceNo) {
        this.invoiceNo = invoiceNo;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public List<PurchaseProducts> getPurchaseProducts() {
        return purchaseProducts;
    }

    public void setPurchaseProducts(List<PurchaseProducts> purchaseProducts) {
        this.purchaseProducts = purchaseProducts;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public double getCgstPerc() {
        return cgstPerc;
    }

    public void setCgstPerc(double cgstPerc) {
        this.cgstPerc = cgstPerc;
    }

    public double getCgstAmount() {
        return cgstAmount;
    }

    public void setCgstAmount(double cgstAmount) {
        this.cgstAmount = cgstAmount;
    }

    public double getSgstPerc() {
        return sgstPerc;
    }

    public void setSgstPerc(double sgstPerc) {
        this.sgstPerc = sgstPerc;
    }

    public double getSgstAmount() {
        return sgstAmount;
    }

    public void setSgstAmount(double sgstAmount) {
        this.sgstAmount = sgstAmount;
    }

    public double getIgstPerc() {
        return igstPerc;
    }

    public void setIgstPerc(double igstPerc) {
        this.igstPerc = igstPerc;
    }

    public double getIgstAmount() {
        return igstAmount;
    }

    public void setIgstAmount(double igstAmount) {
        this.igstAmount = igstAmount;
    }

    public double getTotalAmountAfterTax() {
        return totalAmountAfterTax;
    }

    public void setTotalAmountAfterTax(double totalAmountAfterTax) {
        this.totalAmountAfterTax = totalAmountAfterTax;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.bean;

import java.util.List;

/**
 *
 * @author nishant.vibhute
 */
public class Invoice {

    int id;
    String companyHeaderName;
    String companyHeaderAddress;
    String companyHeaderGSTIN;
    String companyHeaderLogo;
    String companyHeaderContact;
    String date;
    String reverseCharge;
    String state;
    int code;
    String transportMode;
    String vehicleNo;
    String dateOfSupply;
    String placeOfSupply;
    int billTO;
    String billToName;
    String billToAddress;
    String billToGSTIN;
    String billToState;
    String billToCode;

    int shipTo;
    String shipToName;
    String shipToAddress;
    String shipToGSTIN;
    String shipToState;
    String shipToCode;
    double totalAmountBeforeTax;
    double cgstPerc;
    double cgstAmount;
    double sgstPerc;
    double sgstAmount;
    double igstPerc;
    double igstAmount;
    double totalAmountATax;
    double roundOff;
    double totalAmount;
    String totalAmountInWords;
    List<InvoiceDetails> invoiceDetails;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getReverseCharge() {
        return reverseCharge;
    }

    public void setReverseCharge(String reverseCharge) {
        this.reverseCharge = reverseCharge;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getTransportMode() {
        return transportMode;
    }

    public void setTransportMode(String transportMode) {
        this.transportMode = transportMode;
    }

    public String getVehicleNo() {
        return vehicleNo;
    }

    public void setVehicleNo(String vehicleNo) {
        this.vehicleNo = vehicleNo;
    }

    public String getDateOfSupply() {
        return dateOfSupply;
    }

    public void setDateOfSupply(String dateOfSupply) {
        this.dateOfSupply = dateOfSupply;
    }

    public String getPlaceOfSupply() {
        return placeOfSupply;
    }

    public void setPlaceOfSupply(String placeOfSupply) {
        this.placeOfSupply = placeOfSupply;
    }

    public int getBillTO() {
        return billTO;
    }

    public void setBillTO(int billTO) {
        this.billTO = billTO;
    }

    public int getShipTo() {
        return shipTo;
    }

    public void setShipTo(int shipTo) {
        this.shipTo = shipTo;
    }

    public double getTotalAmountBeforeTax() {
        return totalAmountBeforeTax;
    }

    public void setTotalAmountBeforeTax(double totalAmountBeforeTax) {
        this.totalAmountBeforeTax = totalAmountBeforeTax;
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

    public double getTotalAmountATax() {
        return totalAmountATax;
    }

    public void setTotalAmountATax(double totalAmountATax) {
        this.totalAmountATax = totalAmountATax;
    }

    public double getRoundOff() {
        return roundOff;
    }

    public void setRoundOff(double roundOff) {
        this.roundOff = roundOff;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getTotalAmountInWords() {
        return totalAmountInWords;
    }

    public void setTotalAmountInWords(String totalAmountInWords) {
        this.totalAmountInWords = totalAmountInWords;
    }

    public List<InvoiceDetails> getInvoiceDetails() {
        return invoiceDetails;
    }

    public void setInvoiceDetails(List<InvoiceDetails> invoiceDetails) {
        this.invoiceDetails = invoiceDetails;
    }

    public String getCompanyHeaderName() {
        return companyHeaderName;
    }

    public void setCompanyHeaderName(String companyHeaderName) {
        this.companyHeaderName = companyHeaderName;
    }

    public String getCompanyHeaderAddress() {
        return companyHeaderAddress;
    }

    public void setCompanyHeaderAddress(String companyHeaderAddress) {
        this.companyHeaderAddress = companyHeaderAddress;
    }

    public String getCompanyHeaderGSTIN() {
        return companyHeaderGSTIN;
    }

    public void setCompanyHeaderGSTIN(String companyHeaderGSTIN) {
        this.companyHeaderGSTIN = companyHeaderGSTIN;
    }

    public String getCompanyHeaderLogo() {
        return companyHeaderLogo;
    }

    public void setCompanyHeaderLogo(String companyHeaderLogo) {
        this.companyHeaderLogo = companyHeaderLogo;
    }

    public String getCompanyHeaderContact() {
        return companyHeaderContact;
    }

    public void setCompanyHeaderContact(String companyHeaderContact) {
        this.companyHeaderContact = companyHeaderContact;
    }

    public String getBillToName() {
        return billToName;
    }

    public void setBillToName(String billToName) {
        this.billToName = billToName;
    }

    public String getBillToAddress() {
        return billToAddress;
    }

    public void setBillToAddress(String billToAddress) {
        this.billToAddress = billToAddress;
    }

    public String getBillToGSTIN() {
        return billToGSTIN;
    }

    public void setBillToGSTIN(String billToGSTIN) {
        this.billToGSTIN = billToGSTIN;
    }

    public String getBillToState() {
        return billToState;
    }

    public void setBillToState(String billToState) {
        this.billToState = billToState;
    }

    public String getBillToCode() {
        return billToCode;
    }

    public void setBillToCode(String billToCode) {
        this.billToCode = billToCode;
    }

    public String getShipToName() {
        return shipToName;
    }

    public void setShipToName(String shipToName) {
        this.shipToName = shipToName;
    }

    public String getShipToAddress() {
        return shipToAddress;
    }

    public void setShipToAddress(String shipToAddress) {
        this.shipToAddress = shipToAddress;
    }

    public String getShipToGSTIN() {
        return shipToGSTIN;
    }

    public void setShipToGSTIN(String shipToGSTIN) {
        this.shipToGSTIN = shipToGSTIN;
    }

    public String getShipToState() {
        return shipToState;
    }

    public void setShipToState(String shipToState) {
        this.shipToState = shipToState;
    }

    public String getShipToCode() {
        return shipToCode;
    }

    public void setShipToCode(String shipToCode) {
        this.shipToCode = shipToCode;
    }


}

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
import com.pritient.util.CommonUtil;
import com.pritient.util.ConvertToPdf;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.codehaus.jackson.map.ObjectMapper;

/**
 *
 * @author nishant.vibhute
 */
public class InvoiceAction extends ActionSupport implements ModelDriven {

    private InputStream fileInputStream;
    private String fileName;
    
    String successMessage = "";
    String errorMessage = "";
    Invoice invoice = new Invoice();
    List<CompanyBean> companyList = new ArrayList<>();
    List<SubProduct> subProductList = new ArrayList<>();
    CompanyAddressDao companyAddressDao = new CompanyAddressDao();
    ProductDao productDao = new ProductDao();
    InvoiceDao invoiceDao = new InvoiceDao();
    int docId;
    private InputStream inputStream;

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

    public String printInvoice() {
        try {
             FileOutputStream out = null;
            int id = this.getDocId();

            Invoice invoice = invoiceDao.getInvoiceDetails(id);

            ConvertToPdf.convert(invoice);
            ObjectMapper mapper = new ObjectMapper();
            String res = mapper.writeValueAsString("");
            File file = new File(System.getenv("OPENSHIFT_DATA_DIR")+"pdf.pdf");
            
            fileInputStream = new FileInputStream(file);
            this.setFileName("bill.pdf");
            file.delete();
            
           
            inputStream = new ByteArrayInputStream(res.getBytes(StandardCharsets.UTF_8));
        } catch (IOException ex) {
            Logger.getLogger(AddressBookAction.class.getName()).log(Level.SEVERE, null, ex);
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

    public int getDocId() {
        return docId;
    }

    public void setDocId(int docId) {
        this.docId = docId;
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

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }


    @Override
    public Object getModel() {
        return invoice;
    }

    public InputStream getFileInputStream() {
        return fileInputStream;
    }

    public void setFileInputStream(InputStream fileInputStream) {
        this.fileInputStream = fileInputStream;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    
    

}

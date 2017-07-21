/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.forward;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pritient.bean.CompanyBean;
import com.pritient.bean.dao.CompanyAddressDao;
import java.io.ByteArrayInputStream;
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
public class AddressBookAction extends ActionSupport implements ModelDriven {

    CompanyBean companyBean = new CompanyBean();
    CompanyAddressDao companyAddressDao = new CompanyAddressDao();
    List<CompanyBean> companyList = new ArrayList<>();
    private InputStream inputStream;
    int id;
    String successMessage = "";
    String errorMessage = "";

    public AddressBookAction() {
    }

    public String execute() throws Exception {

        companyList = companyAddressDao.getCompanyList();

        return ActionSupport.SUCCESS;
    }

    public String addCompanyAddress() {
        String compName = companyBean.getCompanyName();
        String compAdd = companyBean.getCompanyAddress();
        String compGST = companyBean.getCompanyGSTIN();
        int id = companyAddressDao.insertCompanyAddress(compName, compAdd, compGST);

        if (id == 0) {
            errorMessage = "Failed To add Company";
        } else {
            successMessage = "Company Added Successfully";
        }
        return ActionSupport.SUCCESS;
    }

    public String getCompanyDetails() {
        try {
            int id = this.getId();
            CompanyBean companyBean = companyAddressDao.getCompanyDetails(id);

            ObjectMapper mapper = new ObjectMapper();
            String res = mapper.writeValueAsString(companyBean);
            inputStream = new ByteArrayInputStream(res.getBytes(StandardCharsets.UTF_8));
        } catch (IOException ex) {
            Logger.getLogger(AddressBookAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ActionSupport.SUCCESS;
    }

    public String updateCompanyDetails() {

        int count = companyAddressDao.updateCompanyDetails(this.getCompanyBean());

        if (count == 0) {
            errorMessage = "Failed Update Company";
        } else {
            successMessage = "Company Updated Successfully";
        }
        return ActionSupport.SUCCESS;
    }

    public CompanyBean getCompanyBean() {
        return companyBean;
    }

    public void setCompanyBean(CompanyBean companyBean) {
        this.companyBean = companyBean;
    }

    @Override
    public Object getModel() {
        return companyBean;
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

    public List<CompanyBean> getCompanyList() {
        return companyList;
    }

    public void setCompanyList(List<CompanyBean> companyList) {
        this.companyList = companyList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

}

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
public class Product {

    String mainProductName;
    List<SubProduct> subProductList;

    public String getMainProductName() {
        return mainProductName;
    }

    public void setMainProductName(String mainProductName) {
        this.mainProductName = mainProductName;
    }

    public List<SubProduct> getSubProductList() {
        return subProductList;
    }

    public void setSubProductList(List<SubProduct> subProductList) {
        this.subProductList = subProductList;
    }

}

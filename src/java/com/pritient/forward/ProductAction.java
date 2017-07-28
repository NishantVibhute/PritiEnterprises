/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.forward;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pritient.bean.Product;
import com.pritient.bean.SubProduct;
import com.pritient.bean.dao.ProductDao;
import java.util.List;

/**
 *
 * @author nishant.vibhute
 */
public class ProductAction extends ActionSupport implements ModelDriven {

    Product product = new Product();
    ProductDao productDao = new ProductDao();

    public ProductAction() {
    }

    public String execute() throws Exception {

        Product pr = this.getProduct();
        productDao.insertProduct(pr);

        System.out.println("here");
        return "success";
    }

    public String getProducts() {
        List<SubProduct> subProductList = productDao.getAllProducts();
        return "success";
    }

    public String saveProducts() {

//        Product p = this.getProduct();
        return "success";
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public Object getModel() {
        return this.product;
    }
}

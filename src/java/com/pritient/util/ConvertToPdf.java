/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.util;

import com.pritient.bean.Invoice;
import freemarker.template.Configuration;
import freemarker.template.Template;
import java.io.File;
import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nishant.vibhute
 */
public class ConvertToPdf {

    public static String convert(Invoice in) {
        Writer out = null;
        try {
            Configuration cfg = new Configuration();

//            cfg.setDirectoryForTemplateLoading(new File(System.getenv("OPENSHIFT_DATA_DIR")));
            cfg.setDirectoryForTemplateLoading(new File("C:\\Users\\nishant.vibhute.WEBACCESS\\Documents\\NetBeansProjects\\PritiEnterprises\\src\\java\\com\\pritient\\template"));

            Template template = cfg.getTemplate("index.ftl");

            // Build the data-model
            Map<String, Object> data = new HashMap<>();
            data.put("companyHeaderName", "Priti Enterprises");
            data.put("companyHeaderAddress", "T.B. Bhandari Compound, M.G. Road, Charkop Village, Kandivali(west), Mumbai-400 067.");
            data.put("companyHeaderGSTIN", "27AAGFM6340M1ZY");

            data.put("invoiceNo", in.getId());
            data.put("invoiceDate", in.getDate());
            data.put("isReverse", in.getReverseCharge());
            data.put("invoiceState", in.getState());
            data.put("invoiceCode", in.getCode());

            data.put("transMode", in.getTransportMode());
            data.put("vehicleNo", in.getVehicleNo());
            data.put("dateOFSupply", in.getDateOfSupply());
            data.put("placeOfSupply", in.getPlaceOfSupply());

            data.put("totalAmountBeforeTax", in.getTotalAmountBeforeTax());
            data.put("cgstPerc", in.getCgstPerc());
            data.put("cgstAmount", in.getCgstAmount());
            data.put("sgstPerc", in.getSgstPerc());
            data.put("sgstAmount", in.getSgstAmount());
            data.put("igstPerc", in.getIgstPerc());
            data.put("igstAmount", in.getIgstAmount());
            data.put("roundOff", in.getRoundOff());
            data.put("totalAmountAfterTax", in.getTotalAmountATax());
            data.put("billamount", in.getTotalAmount());
            data.put("amountInwords", in.getTotalAmountInWords());

            data.put("invoiceDetails", in.getInvoiceDetails());

            data.put("BillToName", in.getBillToName());
            data.put("BillToAddress", in.getBillToAddress());
            data.put("BillToGSTIN", in.getBillToGSTIN());
            data.put("BillToState", in.getBillToState());
            data.put("BillToCode", in.getBillToCode());

            data.put("ShipToName", in.getShipToName());
            data.put("ShipToAddress", in.getShipToAddress());
            data.put("ShipToGSTIN", in.getShipToGSTIN());
            data.put("ShipToState", in.getShipToState());
            data.put("ShipToCode", in.getShipToCode());

            // Console output
            out = new StringWriter();
            template.process(data, out);
            out.flush();

            // File output
//            Writer file = new FileWriter(new File(System.getenv("OPENSHIFT_DATA_DIR")+"index.html"));
//            Writer file = new FileWriter(new File("E:\\index.html"));
//            template.process(data, file);
//            file.flush();
//            file.close();
            // step 1
//            Document document = new Document(PageSize.A4, 50, 30, 50, 30);
//            // step 2
////            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(System.getenv("OPENSHIFT_DATA_DIR")+"pdf.pdf"));
//            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("E:\\pdf.pdf"));
//            // step 3
//            document.open();
//            // step 4
////            XMLWorkerHelper.getInstance().parseXHtml(writer, document,
////                    new FileInputStream(System.getenv("OPENSHIFT_DATA_DIR") + "index.html"));
//
//            XMLWorkerHelper.getInstance().parseXHtml(writer, document,
//                    new FileInputStream("E:\\index.html"));
//
//            //step 5
//            document.close();
        } catch (Exception ex) {
            Logger.getLogger(ConvertToPdf.class.getName()).log(Level.SEVERE, null, ex);
        }

        return out.toString();
    }

}

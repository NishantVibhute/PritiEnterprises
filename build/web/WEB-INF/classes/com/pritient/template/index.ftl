<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>HTML to PDF</title>
<style>

h1 {
  color:#ccc;
}

.itext{
    color:#84C7FD;
    font-weight:bold;
}
.description{
    color:gray;
}

.border-left-s{
         border-left-style: dotted;
     }
     
     .border-right{
         border-right:  1px solid gray;
     }
     
     .border-top{
         border-top: 1px solid gray;
     }
     
     .border-bottom{
         border-left: 1px solid gray;
     }

.no-spacing {
  border-spacing:0; /* Removes the cell spacing via CSS */
  border-collapse: collapse;  /* Optional - if you don't want to have double border where cells touch */
  
}
.border-style{
     border:0.5px solid gray;
   
}

.border-style-1{
     border:1px solid gray;
   
}

.ab
{
    padding:9px;
    margin-top: 10px;
}

.font-heading{
    font-size: 24px;
}

.font-large{
    font-size: 14px;
}

.font-medium{
    font-size: 11px;
}


.font-small{
    font-size: 8px;
}

.center
{
    text-align: center;
}

br {
        line-height: 1px;
     }
     

</style>
    </head>
    <body>
        <table  width="100%" class="border-style-1 no-spacing">
            <tr  class="border-style">
                <td colspan="2" >
                    <table cellpadding="3" width="100%">
                        <tr>
                            <td width="20%" style="text-align: center;" >
                                LOGO
                            </td>

                            <td width="80%" >
                                <div style="text-align: center;width: 100%;">
                                    <br/>
                                    <p ><b class="font-heading" >${companyHeaderName}</b></p>
                                    <p class="font-medium">${companyHeaderAddress}</p>
                                    <p class="font-medium">GSTIN : ${companyHeaderGSTIN} </p>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr height="5px">
                <td colspan="2">

                </td>
            </tr>
            <tr class="border-style">
                <td colspan="2" class="border-style">
                    <table cellpadding="3"  width="100%">
                        <tr >
                            <td  width="70%" style="text-align: center;border-right: 1px solid gray;" valign="center">
                                <p class="font-large" style="font-weight: bold;text-decoration: underline;">Tax Invoice</p>
                            </td>

                            <td width="30%" class="border-left">
                                <table height="auto">
                                    <tr >
                                        <td style="border: 0.5px solid gray">&nbsp;</td>
                                        <td><span class="font-medium">Original for Recipient</span></td>
                                    </tr>
                                    <tr>
                                        <td style="border: 0.5px solid gray"></td>
                                        <td><span class="font-medium">Duplicate for supplier/Transporter</span></td>
                                    </tr>
                                    <tr>
                                        <td style="border: 0.5px solid gray">&nbsp;</td>
                                        <td><span class="font-medium">Triplicate for Supplier</span></td>
                                    </tr>

                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr height="5px">
                <td colspan="2">

                </td>
            </tr>
            <tr >
                <td  class="border-style" width="50%">
                    <table  cellpadding="3" width="100%">
                        <tr >
                            <td width="34%" ><span class="font-medium">Invoice No</span></td>
                            <td width="1%"><span class="font-medium">:</span></td>
                            <td colspan="3"><span class="font-medium">${invoiceNo}</span></td>
                        </tr>
                        <tr >
                            <td ><span class="font-medium">Invoice Date</span></td>
                            <td ><span class="font-medium">:</span></td>
                            <td colspan="3"><span class="font-medium">${invoiceDate}</span></td>
                        </tr>
                        <tr >
                            <td ><span class="font-medium">Reverse Charge(Y/N)</span></td>
                            <td><span class="font-medium">:</span></td>
                            <td colspan="3"><span class="font-medium">${isReverse}</span></td>
                        </tr>
                        <tr >
                            <td ><span class="font-medium">State</span></td>
                            <td ><span class="font-medium">:</span></td>
                            <td width="30%"><span class="font-medium">${invoiceState}</span></td>
                            <td><span class="font-medium">Code:</span></td>
                            <td><span class="font-medium">${invoiceCode}</span></td>
                        </tr>
                    </table>
                </td>

                <td width="50%" class="border-style">
                    <table cellpadding="3"  width="100%">
                        <tr >
                            <td width="39%"><span class="font-medium">Transport Mode</span></td>
                            <td width="1%"><span class="font-medium">:</span></td>
                            <td width="60%"><span class="font-medium">${transMode}</span></td>
                        </tr>
                        <tr >
                            <td  ><span class="font-medium">Vehicle number</span></td>
                            <td ><span class="font-medium">:</span></td>
                            <td ><span class="font-medium">${vehicleNo}</span></td>
                        </tr>
                        <tr >
                            <td  ><span class="font-medium">Date of Supply</span></td>
                            <td ><span class="font-medium">:</span></td>
                            <td ><span class="font-medium">${dateOFSupply}</span></td>
                        </tr>
                        <tr >
                            <td  ><span class="font-medium">Place of Supply</span></td>
                            <td ><span class="font-medium">:</span></td>
                            <td ><span class="font-medium">${placeOfSupply}</span></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr height="5px">
                <td colspan="2">

                </td>
            </tr>
            <tr class="border-style">
                <td width="50%" class="border-style">
                    <table  cellpadding="3"  width="100%">
                        <tr height="20px">
                            <td width="100%" colspan="5" style="text-align: center;" class="border-style"><span class="font-medium">Bill to Party</span></td>
                        </tr>
                        <tr >
                            <td width="34%" ><span class="font-medium">Name</span></td>
                            <td width="1%"><span class="font-medium">:</span></td>
                            <td colspan="3"><span class="font-medium">${BillToName}</span></td>
                        </tr>
                        <tr >
                            <td width="34%" ><span class="font-medium">Address</span></td>
                            <td width="1%"><span class="font-medium">:</span></td>
                            <td colspan="3" rowspan="3"><span class="font-medium">${BillToAddress}</span></td>
                        </tr>
                        <tr >
                            <td ><span class="font-medium">&nbsp;</span></td>
                            <td ><span class="font-medium"></span></td>

                        </tr>
                        <tr >
                            <td ><span class="font-medium">&nbsp;</span></td>
                            <td ><span class="font-medium"></span></td>

                        </tr>
                        <tr >
                            <td ><span class="font-medium">GSTIN</span></td>
                            <td ><span class="font-medium">:</span></td>
                            <td colspan="2"><span class="font-medium">${BillToGSTIN}</span></td>
                        </tr>
                        <tr >
                            <td ><span class="font-medium">State</span></td>
                            <td ><span class="font-medium">:</span></td>
                            <td width="30%"><span class="font-medium">${BillToState}</span></td>
                            <td><span class="font-medium">Code:</span></td>
                            <td><span class="font-medium">${BillToCode}</span></td>
                        </tr>
                    </table>
                </td>

                <td width="50%" class="border-style">
                    <table  cellpadding="3"  width="100%">
                        <tr height="20px">
                            <td width="100%" colspan="5" style="text-align: center;" class="border-style"><span class="font-medium">Ship to Party</span></td>
                        </tr>
                        <tr >
                            <td width="34%" ><span class="font-medium">Name</span></td>
                            <td width="1%"><span class="font-medium">:</span></td>
                            <td colspan="3"><span class="font-medium">${ShipToName}</span></td>
                        </tr>
                        <tr >
                            <td width="34%" ><span class="font-medium">Address</span></td>
                            <td width="1%"><span class="font-medium">:</span></td>
                            <td colspan="3" rowspan="3"><span class="font-medium">${ShipToAddress}</span></td>
                        </tr>
                        <tr >
                            <td ><span class="font-medium">&nbsp;</span></td>
                            <td ><span class="font-medium"></span></td>

                        </tr>
                        <tr >
                            <td ><span class="font-medium">&nbsp;</span></td>
                            <td ><span class="font-medium"></span></td>

                        </tr>
                        <tr >
                            <td ><span class="font-medium">GSTIN</span></td>
                            <td ><span class="font-medium">:</span></td>
                            <td  colspan="2"><span class="font-medium">${ShipToGSTIN}</span></td>
                        </tr>
                        <tr >
                            <td ><span class="font-medium">State</span></td>
                            <td ><span class="font-medium">:</span></td>
                            <td width="30%"><span class="font-medium">${ShipToState}</span></td>
                            <td><span class="font-medium">Code:</span></td>
                            <td><span class="font-medium">${ShipToCode}</span></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr height="5px">
                <td colspan="2">

                </td>
            </tr>

            <tr height="200px" class="border-style">
                <td colspan="2" >
                    <table  cellpadding="2"  width="100%" class="border-style no-spacing">
                        <tr class="center">
                            <th style="border: 0.5px solid gray" rowspan="2" ><span class="font-small" >Sr. No</span></th>
                            <th style="border: 0.5px solid gray"rowspan="2" ><span class="font-small">Product Description</span></th>
                            <th style="border: 0.5px solid gray"rowspan="2" ><span class="font-small">HSN</span></th>
                            <th style="border: 0.5px solid gray"rowspan="2" ><span class="font-small">QTY</span></th>
                            <th style="border: 0.5px solid gray"rowspan="2" ><span class="font-small">UOM</span></th>
                            <th style="border: 0.5px solid gray"rowspan="2" ><span class="font-small">RATE</span></th>
                            <th style="border: 0.5px solid gray"rowspan="2" ><span class="font-small">TOTAL</span></th>
                            <th style="border: 0.5px solid gray"colspan="2" ><span class="font-small">CGST </span></th>
                            <th style="border: 0.5px solid gray"colspan="2" ><span class="font-small">SGST </span></th>
                            <th style="border: 0.5px solid gray"colspan="2"><span class="font-small">IGST </span></th>
                            <th style="border: 0.5px solid gray"rowspan="2" ><span class="font-small">TOTAL AMOUNT</span></th>
                        </tr>

                        <tr class="center">

                            <th style="border: 0.5px solid gray" ><span class="font-small" >RATE</span></th>
                            <th style="border: 0.5px solid gray" ><span class="font-small">AMOUNT</span></th>
                            <th style="border: 0.5px solid gray" ><span class="font-small" >RATE</span></th>
                            <th style="border: 0.5px solid gray" ><span class="font-small">AMOUNT</span></th>
                            <th style="border: 0.5px solid gray"><span class="font-small" >RATE</span></th>
                            <th style="border: 0.5px solid gray" ><span class="font-small">AMOUNT</span></th>
                        </tr>

                        <#assign i = 1>
                        <#list invoiceDetails as invoice>


                        <tr>

                            <td style="border: 0.5px solid gray" width="3%"><span class="font-small" >${invoice_index + 1}</span></td>
                            <td style="border: 0.5px solid gray"  width="22%"><span class="font-small">${invoice.productName}</span></td>
                            <td style="border: 0.5px solid gray"  width="5%"><span class="font-small" >HSN</span></td>
                            <td style="border: 0.5px solid gray"  width="5%"><span class="font-small">${invoice.qty}</span></td>
                            <td style="border: 0.5px solid gray"  width="5%"><span class="font-small" >UOM</span></td>
                            <td style="border: 0.5px solid gray"  width="6%"><span class="font-small">${invoice.price}</span></td>
                            <td style="border: 0.5px solid gray"  width="8%"><span class="font-small" >${invoice.amount}</span></td>
                            <td style="border: 0.5px solid gray"  width="4%"><span class="font-small">${invoice.cgstPerc}</span></td>
                            <td style="border: 0.5px solid gray"  width="8%"><span class="font-small" >${invoice.cgstAmount}</span></td>
                            <td style="border: 0.5px solid gray"  width="4%"><span class="font-small">${invoice.sgstPerc}</span></td>
                            <td style="border: 0.5px solid gray"  width="8%"><span class="font-small" >${invoice.sgstAmount}</span></td>
                            <td style="border: 0.5px solid gray"  width="4%"><span class="font-small">${invoice.igstPerc}</span></td>
                            <td style="border: 0.5px solid gray"  width="8%"><span class="font-small" >${invoice.igstAmount}</span></td>
                            <td style="border: 0.5px solid gray"  width="10%"><span class="font-small">${invoice.totalAmountAfterTax}</span></td>

                        </tr>
                        <#assign i = i+1>
                        </#list>

                        <#assign x=11>
                        <#list i..x as i>
                        <!--                        ${i}-->



                        <tr>
                            <td style="border: 0.5px solid gray"  ><span class="font-small" >${i}</span></td>
                            <td style="border: 0.5px solid gray"  ><span class="font-small">&nbsp;</span></td>
                            <td style="border: 0.5px solid gray"  ><span class="font-small" >&nbsp;</span></td>
                            <td style="border: 0.5px solid gray"  ><span class="font-small">&nbsp;</span></td>
                            <td style="border: 0.5px solid gray"  ><span class="font-small" >&nbsp;</span></td>
                            <td style="border: 0.5px solid gray" ><span class="font-small">&nbsp;</span></td>
                            <td style="border: 0.5px solid gray"  ><span class="font-small" >&nbsp;</span></td>
                            <td style="border: 0.5px solid gray"  ><span class="font-small">&nbsp;</span></td>
                            <td style="border: 0.5px solid gray"  ><span class="font-small" >&nbsp;</span></td>
                            <td style="border: 0.5px solid gray"  ><span class="font-small">&nbsp;</span></td>
                            <td style="border: 0.5px solid gray"  ><span class="font-small" >&nbsp;</span></td>
                            <td style="border: 0.5px solid gray"  ><span class="font-small">&nbsp;</span></td>
                            <td style="border: 0.5px solid gray"  ><span class="font-small" >&nbsp;</span></td>
                            <td style="border: 0.5px solid gray"  ><span class="font-small">&nbsp;</span></td>

                        </tr>
                        </#list>


                        <tr>

                            <td style="border: 0.5px solid gray"  colspan="6"><span class="font-small" >TOTAL</span></td>

                            <td style="border: 0.5px solid gray"  ><span class="font-small" >&nbsp;</span></td>
                            <td style="border: 0.5px solid gray"  ><span class="font-small">&nbsp;</span></td>
                            <td style="border: 0.5px solid gray"  ><span class="font-small" >&nbsp;</span></td>
                            <td style="border: 0.5px solid gray"  ><span class="font-small">&nbsp;</span></td>
                            <td style="border: 0.5px solid gray"  ><span class="font-small" >&nbsp;</span></td>
                            <td style="border: 0.5px solid gray"  ><span class="font-small">&nbsp;</span></td>
                            <td style="border: 0.5px solid gray"  ><span class="font-small" >&nbsp;</span></td>
                            <td style="border: 0.5px solid gray"  ><span class="font-small">&nbsp;</span></td>

                        </tr>

                    </table>
                </td>
            </tr>
            <tr height="5px">
                <td  colspan="2">

                </td>
            </tr>
            <tr class="border-style" >

                <td colspan="2">
                    <table class="border-style" cellpadding="3"  width="100%">
                        <tr >
                            <td width="50%" colspan="2" class="center border-style"><span class="font-medium" >Total Invoice amount in words</span></td>
                            <td class="border-style" colspan="3" width="19%"><span class="font-medium" >Total Amount Before Tax</span></td>
                            <td class="border-style" width="1%"><span class="font-medium" >:</span></td>
                            <td class="border-style"><span class="font-medium" >${totalAmountBeforeTax}</span></td>
                        </tr>
                        <tr >
                            <td class="border-style" rowspan="5" colspan="2"><span  class="font-medium" >${amountInwords}</span></td>
                            <td class="border-style" width="16%"><span class="font-medium" >Add : CGST</span></td>
                            <td class="border-style" width="3%"><span class="font-medium" >${cgstPerc}</span></td>
                            <td class="border-style" width="1%"><span class="font-medium" >%</span></td>
                            <td class="border-style"><span class="font-medium" >:</span></td>
                            <td class="border-style"><span class="font-medium" >${cgstAmount}</span></td>
                        </tr>
                        <tr >
                            <td class="border-style"><span class="font-medium" >Add : SGST</span></td>
                            <td class="border-style" ><span class="font-medium" >${sgstPerc}</span></td>
                            <td class="border-style" ><span class="font-medium" >%</span></td>
                            <td class="border-style" ><span class="font-medium" >:</span></td>
                            <td class="border-style"><span class="font-medium" >${sgstAmount}</span></td>
                        </tr>
                        <tr >
                            <td class="border-style"><span class="font-medium" >Add : IGST</span></td>
                            <td class="border-style" ><span class="font-medium" >${igstPerc}</span></td>
                            <td class="border-style" ><span class="font-medium" >%</span></td>
                            <td class="border-style" ><span class="font-medium" >:</span></td>
                            <td class="border-style"><span class="font-medium" >${igstAmount}</span></td>
                        </tr>
                        <tr >
                            <td class="border-style" colspan="3" ><span class="font-medium" >Total Amount GST</span></td>
                            <td class="border-style" ><span class="font-medium" >:</span></td>
                            <td class="border-style"><span class="font-medium" >&nbsp;</span></td>
                        </tr>
                        <tr >
                            <td class="border-style" colspan="3"><span class="font-medium" >Total Amount After Tax</span></td>
                            <td class="border-style" ><span class="font-medium" >:</span></td>
                            <td class="border-style"><span class="font-medium" >${totalAmountAfterTax}</span></td>
                        </tr>
                        <tr >
                            <td class="border-style center" colspan="2" width="30%" ><span class="font-medium center" >Bank Details</span></td>
                            <td class="border-style" colspan="3" ><span class="font-medium" >Round Off</span></td>
                            <td class="border-style" ><span class="font-medium" >:</span></td>
                            <td class="border-style"><span class="font-medium" >${roundOff}</span></td>
                        </tr>
                        <tr >
                            <td class="border-style" width="15%"><span class="font-medium " >Bank A/C :</span></td>

                            <td class="border-style" ><span class="font-medium " >&nbsp;</span></td>
                            <td class="border-style" colspan="3" ><span class="font-medium" >Bill Amount</span></td>
                            <td class="border-style" ><span class="font-medium" >:</span></td>
                            <td class="border-style"><span class="font-medium" >${billamount}</span></td>
                        </tr>
                        <tr >
                            <td class="border-style" ><span class="font-medium " >Bank IFSC :</span></td>

                            <td class="border-style" ><span class="font-medium " >&nbsp;</span></td>
                            <td class="border-style" colspan="3" ><span class="font-medium" >GST On Reverse Charge</span></td>
                            <td class="border-style" ><span class="font-medium" >:</span></td>
                            <td class="border-style"><span class="font-medium" >&nbsp;</span></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr height="5px">
                <td colspan="2">

                </td>
            </tr>
            <tr >
                <td colspan="2">
                    <table cellpadding="3" width="100%">
                        <tr>
                            <td class="border-style center" width="30%" ><span class="font-medium center" >Terms & conditions</span></td>
                            <td class="border-style" rowspan="3" width="20%"><span class="font-medium center" >&nbsp;</span></td>
                            <td class="border-style center" width="50%" ><span class="font-small " >Ceritified that the particulars given above are true and correct</span></td>
                        </tr>
                        <tr>
                            <td class="border-style center" rowspan="3" ><span class="font-medium center" ></span></td>
                            <td class="border-style center" ><span class="font-medium " >For PritiEnterprises</span></td>

                        </tr>
                        <tr height="70px">
                            <td class="border-style" ><span class="font-medium " >&nbsp;</span></td>
                        </tr>


                        <tr>

                            <td class="border-style center"  ><span class="font-medium center" >Common Seal</span></td>
                            <td class="border-style center" ><span class="font-medium center" >Authorised signatory</span></td>
                        </tr>
                    </table>
                </td>

            </tr>

        </table>
    </body>
</html>
<%--
    Document   : purchase
    Created on : Jul 19, 2017, 1:39:05 PM
    Author     : nishant.vibhute
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/jsp/include/includeSideMenu.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="js/invoice.js"></script>
        <!--<script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script>-->
        <script type="text/javascript" src="js/jquery-ui-1.12.1.js"></script>
        

        <script type="text/javascript" src="js/bootstrap.js"></script>

        <link href="css/jquery-ui.css" rel="stylesheet">
        <title>JSP Page</title>

        <script>

            $(function() {
                $("#datepicker").datepicker({changeMonth: true,
                    changeYear: true,
                    showAnim: "slideDown",
                    dateFormat: "dd/mm/yy"
                });
                $("#datepicker1").datepicker({changeMonth: true,
                    changeYear: true,
                    showAnim: "slideDown",
                    dateFormat: "dd/mm/yy"
                });

            });
            function getCompanyInfoBillTo()
            {
                var id = $("#billToCompSelect").val();
                $.ajax({
                    url: 'getCompanyDetails?id=' + id,
                    type: "POST",
                    dataType: 'json'
                }).success(function(response) {


                    $("#companyId").val(response.companyId);
                    $("#billToAddress").val(response.companyAddress);
                    $("#billToGSTIN").val(response.companyGSTIN);
                    
                });
            }
            function getCompanyInfoShipTo()
            {
                var id = $("#shipToCompSelect").val();
                $.ajax({
                    url: 'getCompanyDetails?id=' + id,
                    type: "POST",
                    dataType: 'json'
                }).success(function(response) {


                    $("#companyId").val(response.companyId);
                    $("#shipToAddress").val(response.companyAddress);
                    $("#shipToGSTIN").val(response.companyGSTIN);
                });
            }
            
            
            function viewBill()
            {
                var formData = $("#invoiceForm").serialize();
                var id = $("#shipToCompSelect").val();
                $.ajax({
                    url: 'saveInvoiceCall' ,
                    type: "POST",
                    data: formData,
                    
                }).success(function(response) {

//                    alert(response);
$('#invoiceModal').find('.modal-body').text("");
        $('#invoiceModal').find('.modal-body').append(response);
                    $('#invoiceModal').modal('show');
                });
            }
            

            function setValue(val)
            {
               if(val==="cgst")
               {
                if ($("#cgstCheckBox").is(':checked')) {
                    $("#cgstPerc0").val("9");
                    $("#cgstPercFinal").val("9");
                    
                } else {
                    $("#cgstPerc0").val("0");
                    $("#cgstPercFinal").val("0");
                }
            }
            if(val==="sgst")
               {
                if ($("#sgstCheckBox").is(':checked')) {
                    $("#sgstPerc0").val("9");
                    $("#sgstPercFinal").val("9");
                } else {
                    $("#sgstPerc0").val("0");
                    $("#sgstPercFinal").val("0");
                }
            }
            if(val==="igst")
               {
                if ($("#igstCheckBox").is(':checked')) {
                    $("#igstPerc0").val("18");
                    $("#igstPercFinal").val("18");
                } else {
                    $("#igstPerc0").val("0");
                    $("#igstPercFinal").val("0");
                }
            }
                
            }
              
              
           
function printDiv(divName) {
      var printContents = document.getElementById(divName).innerHTML;    
   var originalContents = document.body.innerHTML;      
   document.body.innerHTML = printContents;     
   window.print();     
   document.body.innerHTML = originalContents;
   }


        </script>
        <style>
            table, th, td {
                border: 2px solid #ddd;
                /*text-align: center;*/

            }
        </style>
    </head>
    <body>
        <div id="page-wrapper">

            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Invoice
                        </h1>
                        <ol class="breadcrumb">
                            <li >
                                <i class="fa fa-dashboard"></i> Dashboard
                            </li>
                            <li class="active">
                                <i class="fa fa-shopping-basket"></i> Invoice
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <s:if test="successMessage!=''">
                    <div class="alert alert-success">
                        <strong><s:property value = 'successMessage'/></strong>
                    </div>
                </s:if>

                <s:if test="errorMessage!=''">
                    <div class="alert alert-danger">
                        <strong><s:property value = 'errorMessage'/></strong>
                    </div>
                </s:if>
                <div class="row breadcrumb">
                    <div class="col-lg-12">
                        <form  id="invoiceForm" >
                            <table class=" table" width="60%"  >
                                <tr>
                                    <td colspan="2">
                                <center><label class="col-xs-12 ">Tax Invoice</label></center>
                                </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="row">
                                            <div class="form-group">
                                                <label class="col-xs-3 control-label">Invoice No.</label>
                                                <div class="col-xs-9">
                                                    <input type="text" class="form-control" name="id" />
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td> <div class="row">
                                            <div class="form-group">
                                                <label class="col-xs-3 control-label">Transport Mode</label>
                                                <div class="col-xs-9">
                                                    <input type="text" class="form-control" name="transportMode" />
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="row">
                                            <div class="form-group">
                                                <label class="col-xs-3 control-label">Invoice Date.</label>
                                                <div class="col-xs-9">
                                                    <input type="text" class="form-control" id="datepicker"  readonly name="date" />
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td> <div class="row">
                                            <div class="form-group">
                                                <label class="col-xs-3 control-label">Vehicle No.</label>
                                                <div class="col-xs-9">
                                                    <input type="text" class="form-control" name="vehicleNo" />
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div class="row">
                                            <div class="form-group">
                                                <label class="col-xs-4 control-label">Reverse Charge (Y/N)</label>
                                                <div class="col-xs-3">
                                                    <select name="reverseCharge" class="form-control">
                                                        <option selected value="no">NO</option>
                                                        <option value="yes">YES</option>

                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td> <div class="row">
                                            <div class="form-group">
                                                <label class="col-xs-3 control-label">Date Of Supply</label>
                                                <div class="col-xs-9">
                                                    <input type="text" class="form-control" id="datepicker1"  readonly name="dateOfSupply" />
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td width="50%">
                                        <div class="row">
                                            <div class="form-group">

                                                <label class="col-xs-3 control-label">State </label>
                                                <div class="col-xs-5">
                                                    <input type="text" value="MAHARASHTRA" class="form-control" name="state" />
                                                </div>
                                                <label class="col-xs-1 control-label">Code </label>
                                                <div class="col-xs-3">
                                                    <input type="text" value="27" class="form-control" name="code" />
                                                </div>

                                            </div>
                                        </div>
                                    </td>
                                    <td> <div class="row">
                                            <div class="form-group">
                                                <label class="col-xs-3 control-label">Place Of Supply</label>
                                                <div class="col-xs-9">
                                                    <input type="text" class="form-control" name="placeOfSupply" />
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr height="1px">
                                    <td colspan="2">

                                    </td>
                                </tr>
                                <tr style="text-align: center">
                                    <td width="50%" >
                                        <label class="col-xs-12 control-label" >Bill to Party</label>
                                    </td>
                                    <td>
                                        <label class="col-xs-12 control-label">Ship to Party</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="row">
                                            <div class="form-group">
                                                <label class="col-xs-3 control-label">Name</label>
                                                <div class="col-xs-9">
                                                    <select id="billToCompSelect" name="billToName" class="form-control"  onchange="getCompanyInfoBillTo()()">
                                                        <option value="0">Select</option>
                                                        <s:iterator value="companyList">
                                                            <option value="<s:property value = 'companyId'/>"><s:property value = 'companyName'/></option>
                                                        </s:iterator>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td> <div class="row">
                                            <div class="form-group">
                                                <label class="col-xs-3 control-label">Name</label>
                                                <div class="col-xs-9">
                                                    <select id="shipToCompSelect" name="shipToName" class="form-control"  onchange="getCompanyInfoShipTo()()">
                                                        <option value="0">Select</option>
                                                        <s:iterator value="companyList">
                                                            <option value="<s:property value = 'companyId'/>"><s:property value = 'companyName'/></option>
                                                        </s:iterator>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="row">
                                            <div class="form-group">
                                                <label class="col-xs-3 control-label">Address</label>
                                                <div style="height:80px" class="col-xs-9">
                                                    <textarea style="height:80px" id="billToAddress" resize="none" name="billToAddress" class="form-control"> </textarea>

                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td> <div class="row">
                                            <div class="form-group">
                                                <label class="col-xs-3 control-label">Address</label>
                                                <div class="col-xs-9">
                                                    <textarea style="height:80px" id="shipToAddress" resize="none" name="shipToAddress" class="form-control"> </textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="row">
                                            <div class="form-group">
                                                <label class="col-xs-3 control-label">GSTIN</label>
                                                <div class="col-xs-9">
                                                    <input type="text" class="form-control" id="billToGSTIN"  name="billToGSTIN" />
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td> <div class="row">
                                            <div class="form-group">
                                                <label class="col-xs-3 control-label">GSTIN</label>
                                                <div class="col-xs-9">
                                                    <input type="text" class="form-control" id="shipToGSTIN" name="shipToGSTIN" />
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="50%">
                                        <div class="row">
                                            <div class="form-group">

                                                <label class="col-xs-3 control-label">State </label>
                                                <div class="col-xs-5">
                                                    <input type="text" class="form-control" id="billToState" name="billToState" />
                                                </div>
                                                <label class="col-xs-1 control-label">Code </label>
                                                <div class="col-xs-3">
                                                    <input type="text" class="form-control"  id="billToCode" name="billToCode" />
                                                </div>

                                            </div>
                                        </div>
                                    </td>
                                    <td width="50%">
                                        <div class="row">
                                            <div class="form-group">

                                                <label class="col-xs-3 control-label">State </label>
                                                <div class="col-xs-5">
                                                    <input type="text" class="form-control" id="shipToState" name="shipToState" />
                                                </div>
                                                <label class="col-xs-1 control-label">Code </label>
                                                <div class="col-xs-3">
                                                    <input type="text" class="form-control" id="shipToCode" name="shipToCode" />
                                                </div>

                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr height="1px">
                                    <td colspan="2">

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <table id="myTable" class=" table order-list" style="">
                                            <thead>
                                                <tr style="text-align: center">
                                                    <th rowspan="2">Name</th>
                                                     <th rowspan="2">HSN</th>
                                                      <th rowspan="2">UOM</th>
                                                    <th rowspan="2">QTY</th>
                                                    
                                                    <th rowspan="2">PRICE</th>
                                                    <th rowspan="2">AMOUNT</th>
                                                    <th colspan="2"><input type="checkbox" id="cgstCheckBox" onchange="setValue('cgst')"/> CGST </th>

                                                    <th colspan="2"><input type="checkbox" id="sgstCheckBox" onchange="setValue('sgst')"/> SGST</th>

                                                    <th colspan="2"><input type="checkbox" id="igstCheckBox" onchange="setValue('igst')"/> IGST </th>

                                                    <th rowspan="2">TOTAL AMOUNT</th>
                                                </tr>
                                                <tr align="center">

                                                    <th >PERC</th>
                                                    <th>AMOUNT</th>
                                                    <th>PERC</th>
                                                    <th>AMOUNT</th>
                                                    <th>PERC</th>
                                                    <th>AMOUNT</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>

                                                    <td class="col-sm-2">
                                                        <select id="productSelect" name="invoiceDetails[0].productName" class="form-control" onchange="getCompanyInfo()">
                                                            <option value="0">Select</option>
                                                            <s:iterator value="subProductList">
                                                                <option value="<s:property value = 'subProductId'/>"><s:property value = 'subProductName'/></option>
                                                            </s:iterator>
                                                        </select>
                                                    </td>
                                                     <td class="col-sm-1">
                                                        <input type="text" name="invoiceDetails[0].hsn" id="hsn0"   class="form-control"/>
                                                    </td>
                                                     <td class="col-sm-1">
                                                        <input type="text" name="invoiceDetails[0].uom" id="uom0"    class="form-control"/>
                                                    </td>
                                                    <td class="col-sm-1">
                                                        <input type="text" name="invoiceDetails[0].qty" id="qty0"  class="form-control"/>
                                                    </td>
                                                    
                                                    <td class="col-sm-1">
                                                        <input type="text" name="invoiceDetails[0].price" id="price0"  onblur="calculateRowGSTTotal('0')"  class="form-control"/>
                                                    </td>
                                                    
                                                    <td class="col-sm-1">
                                                        <input type="text" name="invoiceDetails[0].amount" id="amount0"  class="form-control"/>
                                                    </td>
                                                    <td class="col-sm-1">
                                                        <input type="text" name="invoiceDetails[0].cgstPerc" id="cgstPerc0" onblur="calculateRowGSTTotal('0')" value="0" class="form-control"/>
                                                    </td>
                                                    <td class="col-sm-1">
                                                        <input type="text" name="invoiceDetails[0].cgstAmount" id="cgstAmt0" class="form-control"/>
                                                    </td>
                                                    <td class="col-sm-1">
                                                        <input type="text" name="invoiceDetails[0].sgstPerc" id="sgstPerc0" onblur="calculateRowGSTTotal('0')"  value="0" class="form-control"/>
                                                    </td>
                                                    <td class="col-sm-1">
                                                        <input type="text" name="invoiceDetails[0].sgstAmount"  id="sgstAmt0" class="form-control"/>
                                                    </td>
                                                    <td class="col-sm-1">
                                                        <input type="text" name="invoiceDetails[0].igstPerc" id="igstPerc0" onblur="calculateRowGSTTotal('0')" value="0" class="form-control"/>
                                                    </td>
                                                    <td class="col-sm-1">
                                                        <input type="text" name="invoiceDetails[0].igstAmount"  id="igstAmt0" class="form-control"/>
                                                    </td>
                                                    <td class="col-sm-1">
                                                        <input type="text" name="invoiceDetails[0].totalAmountAfterTax" id="totalAmountAfterTax0" class="form-control"/>
                                                    </td>


                                                    <td class="col-sm-1"><a class="deleteRow"></a>

                                                    </td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="12" style="text-align: left;">
                                                        <input type="button" class="btn btn-lg btn-block " id="addrow" value="Add Row" />
                                                    </td>
                                                </tr>
                                                <tr>

                                                    <td style="text-align: right" colspan="3">
                                                        <label class="col-xs-12 control-label">TOTAL </label>
                                                    </td>
                                                    <td class="col-sm-1">
                                                        <input type="text" name="" id="TotalTatalAmount"  value="0" class="form-control"/>
                                                    </td>
                                                    <td class="col-sm-1">

                                                    </td>
                                                    <td class="col-sm-1">
                                                        <input type="text" name="" id="TotalTatalCGST" value="0" class="form-control"/>
                                                    </td>
                                                    <td class="col-sm-1">

                                                    </td>
                                                    <td class="col-sm-1">
                                                        <input type="text" name=""  id="TotalTatalSGST" value="0" class="form-control"/>
                                                    </td>
                                                    <td class="col-sm-1">

                                                    </td>
                                                    <td class="col-sm-1">
                                                        <input type="text" name=""  id="TotalTatalIGST" value="0" class="form-control"/>
                                                    </td>
                                                    <td class="col-sm-1">
                                                        <input type="text" name="" id="TotalTotalAmountAfterTax" value="0" class="form-control"/>
                                                    </td>


                                                    <td class="col-sm-1"><a class="deleteRow"></a>

                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </td>
                                </tr>
                                <tr >
                                    <td colspan="2">
                                        <input type="button" class="btn btn-lg btn-block " id="calculate" value="calculate" />
                                    </td>
                                </tr>
                                <tr>
                                    <td > <label class="control-label col-xs-12 text-center" for="inputSuccess">Total Invoice amount in words</label>


                                    </td>
                                    <td >

                                        <div class="form-group">
                                            <input type="hidden" id="companyId"/>
                                            <label class="control-label col-xs-6 " for="inputSuccess">Total Amount Before Tax</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control"  name="totalAmountBeforeTax" id="totalAmountFinal">
                                            </div>
                                        </div>


                                    </td>
                                </tr>

                                <tr>
                                    <td rowspan="3">
                                        <input type="text" class="form-control"  name="totalAmountInWords" id="amountInwords"/>
                                    </td>
                                    <td >


                                        <div class="form-group">

                                            <label class="control-label col-xs-2 " for="inputSuccess">CGST %</label>
                                            <div class="col-xs-2 ">
                                                <input type="text" class="form-control"  name="cgstPerc" id="cgstPercFinal" VALUE="0">
                                            </div>
                                            <label class="control-label col-xs-2" for="inputWarning">Amount</label>
                                            <div class="col-xs-6">
                                                <input type="text" class="form-control" name="cgstAmount" id="cgstAmountFinal">
                                            </div>
                                        </div>



                                    </td>
                                </tr>
                                <tr>

                                    <td >


                                        <div class="form-group">

                                            <label class="control-label col-xs-2 " for="inputSuccess">SGST %</label>
                                            <div class="col-xs-2 ">
                                                <input type="text" class="form-control"   name="sgstPerc" id="sgstPercFinal" VALUE="0">
                                            </div>
                                            <label class="control-label col-xs-2" for="inputWarning">Amount</label>
                                            <div class="col-xs-6">
                                                <input type="text" class="form-control" name="sgstAmount" id="sgstAmountFinal">
                                            </div>
                                        </div>



                                    </td>
                                </tr>
                                <tr>

                                    <td >


                                        <div class="form-group">

                                            <label class="control-label col-xs-2 " for="inputSuccess">IGST %</label>
                                            <div class="col-xs-2 ">
                                                <input type="text" class="form-control"   name="igstPerc" id="igstPercFinal" VALUE="0">
                                            </div>
                                            <label class="control-label col-xs-2" for="inputWarning">Amount</label>
                                            <div class="col-xs-6">
                                                <input type="text" class="form-control" name="igstAmount" id="igstAmountFinal">
                                            </div>
                                        </div>



                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="3" ></td>
                                    <td >

                                        <div class="form-group">
                                            <input type="hidden" id="companyId"/>
                                            <label class="control-label col-xs-6 " for="inputSuccess">Total Amount After Tax</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control"  name="totalAmountATax" id="totalAmountAfterTaxFinal">
                                            </div>
                                        </div>


                                    </td>
                                </tr>
                                <tr>

                                    <td >
                                        <div class="form-group">
                                            <input type="hidden" id="companyId"/>
                                            <label class="control-label col-xs-6 " for="inputSuccess">Round off</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control" name="roundOff" id="roubndOffAmountFinal">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>

                                    <td >
                                        <div class="form-group">
                                            <input type="hidden" id="companyId"/>
                                            <label class="control-label col-xs-6 " for="inputSuccess">Total Amount</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control"  name="totalAmount" id="FinalAmount">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <input type="button" class="btn btn-lg btn-block btn-primary" onclick="viewBill()"  value="View" />

                        </form>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row" style="height: 600px">
                    
                    <div id="invoiceModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      
      <div class="modal-body">
       
      </div>
      <div class="modal-footer">
        <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
      
  </div>
  
</div>
                    

                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

</body>
</html>

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
        <script type="text/javascript" src="js/purchase.js"></script>
        <!--<script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script>-->
        <script type="text/javascript" src="js/jquery-ui-1.12.1.js"></script>

        <link href="css/jquery-ui.css" rel="stylesheet">
        <title>JSP Page</title>

        <script>

            $(function() {
                $("#datepicker").datepicker({changeMonth: true,
                    changeYear: true,
                    showAnim: "slideDown",
                    dateFormat: "dd/mm/yy"
                });

            });
            function getCompanyInfo()
            {
                var id = $("#compSelect").val();
                $.ajax({
                    url: 'getCompanyDetails?id=' + id,
                    type: "POST",
                    dataType: 'json'
                }).success(function(response) {


                    $("#companyId").val(response.companyId);
                    $("#companyAddress").val(response.companyAddress);
                    $("#companyGSTIN").val(response.companyGSTIN);
                });
            }

        </script>
        <style>
            table, th, td {
                border: 2px solid #ddd;
                text-align: center;
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
                            Purchase
                        </h1>
                        <ol class="breadcrumb">
                            <li >
                                <i class="fa fa-dashboard"></i> Dashboard
                            </li>
                            <li class="active">
                                <i class="fa fa-shopping-basket"></i> Purchase
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row breadcrumb">
                    <div class="col-lg-12">
                        <form role="form" action="savePurchase" >

                            <div class="row">
                                <div class="form-group">
                                    <label class="col-xs-1 ">Date</label>
                                    <div class="col-xs-5">

                                        <input type="text" class="form-control" id="datepicker" name="date"  readonly/>

                                    </div>

                                    <label class="col-xs-1 control-label">Invoice No.</label>
                                    <div class="col-xs-5">

                                        <input type="text" class="form-control" name="invoiceNo" />
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-xs-1 ">Company Name</label>
                                    <div class="col-xs-5 ">
                                        <select id="compSelect" name="companyId" class="form-control"  onchange="getCompanyInfo()">
                                            <option value="0">Select</option>
                                            <s:iterator value="companyList">
                                                <option value="<s:property value = 'companyId'/>"><s:property value = 'companyName'/></option>
                                            </s:iterator>
                                        </select>
                                    </div>

                                    <label class="control-label col-xs-1" for="inputWarning">GSTIN</label>
                                    <div class="col-xs-5">
                                        <input type="text" class="form-control" id="companyGSTIN">
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="form-group">
                                    <input type="hidden" id="companyId"/>
                                    <label class="control-label col-xs-1 " for="inputSuccess">Company Address</label>
                                    <div class="col-xs-11 ">
                                        <input type="text" class="form-control" id="companyAddress">
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="form-group">
                                    <input type="hidden" id="companyId"/>
                                    <label class="control-label col-xs-1 " for="inputSuccess">Total Amount</label>
                                    <div class="col-xs-5 ">
                                        <input type="text" class="form-control" onblur="calculateTotal()" name="totalAmount" id="totalAmount">
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="form-group">
                                    <input type="hidden" id="companyId"/>
                                    <label class="control-label col-xs-1 " for="inputSuccess">CGST Perc</label>
                                    <div class="col-xs-5 ">
                                        <input type="text" class="form-control"  onblur="calculateTotal()" name="cgstPerc" id="cgst" VALUE="9">
                                    </div>
                                    <label class="control-label col-xs-1" for="inputWarning">CGST Amount</label>
                                    <div class="col-xs-5">
                                        <input type="text" class="form-control" name="cgstAmount" id="cgst1">
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="form-group">
                                    <input type="hidden" id="companyId"/>
                                    <label class="control-label col-xs-1 " for="inputSuccess">SGST Perc</label>
                                    <div class="col-xs-5 ">
                                        <input type="text" class="form-control"  onblur="calculateTotal()" name="sgstPerc" id="sgst" VALUE="9">
                                    </div>
                                    <label class="control-label col-xs-1" for="inputWarning">SGST Amount</label>
                                    <div class="col-xs-5">
                                        <input type="text" class="form-control" name="sgstAmount" id="sgst1">
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="form-group">
                                    <input type="hidden" id="companyId"/>
                                    <label class="control-label col-xs-1 " for="inputSuccess">IGST Perc</label>
                                    <div class="col-xs-5 ">
                                        <input type="text" class="form-control"  onblur="calculateTotal()" name="igstPerc" id="igst" VALUE="18">
                                    </div>
                                    <label class="control-label col-xs-1" for="inputWarning">IGST Amount</label>
                                    <div class="col-xs-5">
                                        <input type="text" class="form-control" name="igstAmount" id="igst1">
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="form-group">
                                    <input type="hidden" id="companyId"/>
                                    <label class="control-label col-xs-1 " for="inputSuccess">Total Amount After Tax</label>
                                    <div class="col-xs-5 ">
                                        <input type="text" class="form-control" name="totalAmountAfterTax" id="totalAmountAfterTax">
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="tab-pane" id="2b">

                                <table id="myTable" class=" table order-list" style="">
                                    <thead>
                                        <tr align="center">
                                            <th rowspan="2">Name</th>
                                            <th rowspan="2">QTY</th>
                                            <th rowspan="2">PRICE</th>
                                            <th rowspan="2">AMOUNT</th>
                                            <th colspan="2">CGST</th>

                                            <th colspan="2">SGST</th>

                                            <th colspan="2">IGST </th>

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
                                                <select id="productSelect" name="purchaseProducts[0].productId" class="form-control" onchange="getCompanyInfo()">
                                                    <option value="0">Select</option>
                                                    <s:iterator value="subProductList">
                                                        <option value="<s:property value = 'subProductId'/>"><s:property value = 'subProductName'/></option>
                                                    </s:iterator>
                                                </select>
                                            </td>
                                            <td class="col-sm-1">
                                                <input type="text" name="purchaseProducts[0].qty" id="qty0"  class="form-control"/>
                                            </td>
                                            <td class="col-sm-1">
                                                <input type="text" name="purchaseProducts[0].price" id="price0"  onblur="calculateRowGSTTotal('0')"  class="form-control"/>
                                            </td>
                                            <td class="col-sm-1">
                                                <input type="text" name="purchaseProducts[0].amount" id="amount0"  class="form-control"/>
                                            </td>
                                            <td class="col-sm-1">
                                                <input type="text" name="purchaseProducts[0].cgstPerc" id="cgstPerc0" onblur="calculateRowGSTTotal('0')" value="9" class="form-control"/>
                                            </td>
                                            <td class="col-sm-1">
                                                <input type="text" name="purchaseProducts[0].cgstAmount" id="cgstAmt0" class="form-control"/>
                                            </td>
                                            <td class="col-sm-1">
                                                <input type="text" name="purchaseProducts[0].sgstPerc" id="sgstPerc0" onblur="calculateRowGSTTotal('0')"  value="9" class="form-control"/>
                                            </td>
                                            <td class="col-sm-1">
                                                <input type="text" name="purchaseProducts[0].sgstAmount"  id="sgstAmt0" class="form-control"/>
                                            </td>
                                            <td class="col-sm-1">
                                                <input type="text" name="purchaseProducts[0].igstPerc" id="igstPerc0" onblur="calculateRowGSTTotal('0')" value="18" class="form-control"/>
                                            </td>
                                            <td class="col-sm-1">
                                                <input type="text" name="purchaseProducts[0].igstAmount"  id="igstAmt0" class="form-control"/>
                                            </td>
                                            <td class="col-sm-1">
                                                <input type="text" name="purchaseProducts[0].totalAmountAfterTax" id="totalAmountAfterTax0" class="form-control"/>
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
                                            <td colspan="12" style="text-align: left;">
                                                <input type="submit" class="btn btn-lg btn-block btn-primary" id="addrow" value="Save" />
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>

                            </div>


                        </form>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row" style="height: 600px">

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

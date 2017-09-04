<%--
    Document   : addressbook
    Created on : Jul 19, 2017, 1:55:58 PM
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
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/formValidation.min.js"></script>

        <script type="text/javascript" src="js/framework/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootbox.min.js"></script>
        <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="js/datatables.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.12.1.js"></script>
        <link href="css/jquery-ui.css" rel="stylesheet">
        <title>JSP Page</title>
        <script>
            $(document).ready(function() {
                     $( "#details" ).hide();
                $('#invoiceTable').DataTable();
                $('#paymenyTable').DataTable();
            });
            $(function() {
                $("#datepicker").datepicker({changeMonth: true,
                    changeYear: true,
                    showAnim: "slideDown",
                    dateFormat: "dd/mm/yy"
                });

            });

            function hideShow()
            {
 var val = $( "#modeSelect" ).val();

 if(val==="cheque")
 {$( "#details" ).show();

 }
 else{
     $( "#details" ).hide();
 }
            }

        </script>
    </head>
   

    <!-- The form which is used to populate the item data -->
    <form id="userForm" method="post" class="form-horizontal" style="display: none;" action="updateVoucher">
        <div class="form-group">
            <label class="col-xs-3 control-label">Invoice ID</label>
            <div class="col-xs-3">
                <input type="hidden" name="type"  />
                <input type="text" class="form-control" name="invoiceId"  readonly/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-xs-3 control-label">Company Name</label>
            <div class="col-xs-5">
                <input type="text" class="form-control" name="companyName" readonly/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-xs-3 control-label">Date</label>
            <div class="col-xs-5">
                <input type="text" class="form-control" name="date" readonly/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-xs-3 control-label">Amount</label>
            <div class="col-xs-5">
                <input type="text" class="form-control" name="amount" readonly/>
            </div>
        </div>
        <div class="form-group">

            <label class="col-xs-12 text-center">Payment Details</label>
        </div>

        <div class="form-group">
            
            <label class="col-xs-3 control-label">Date</label>
            <div class="col-xs-5">
                <input type="text" id="datepicker" class="form-control" name="paymentDate" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-3 control-label">Mode</label>

            <div class="col-xs-5">
                <select id="modeSelect" name="mode" class="form-control"  onchange="hideShow()">
                    <option selected value="cash">Cash</option>
                    <option value="cheque">Cheque</option>
                    
                </select>
            </div>
        </div>
        <div id="details" >
            <div class="form-group">
                <label class="col-xs-3 control-label">Cheque No.</label>
                <div class="col-xs-5">
                    <input type="text" class="form-control" name="chequeNo" />
                </div>
            </div>
            <div class="form-group">
            <label class="col-xs-3 control-label">Bank Name</label>
            <div class="col-xs-5">
                <input type="text" class="form-control" name="bankName" />
            </div>
        </div>
       
        </div>
        <div class="form-group">
            <label class="col-xs-3 control-label">Pay Amount</label>
            <div class="col-xs-5">
                <input type="text" class="form-control" name="paymentAmount" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-xs-5 col-xs-offset-3">
                <button type="submit" class="btn btn-default">Save</button>
            </div>
        </div>
    </form>
    <!--edit form ends-->

    <body style="padding-right: 0px !important">
        <div id="page-wrapper">

            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Voucher
                        </h1>
                        

                        <ol class="breadcrumb">
                            <li >
                                <i class="fa fa-dashboard"></i> Dashboard
                            </li>
                            <li class="active">
                                <i class="fa fa-product-hunt"></i> Voucher
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

                <div class="row">
                    <div class="col-lg-12">

                    </div>
                </div>
                <!-- /.row -->

                <div class="row" style="height: 600px">

                    <div id="exTab3">
                        <ul  class="nav nav-pills nav-justified">
                            <li class="active" >
                                <a  href="#1b" data-toggle="tab" style="padding: 10px 100px !important">Payment</a>
                            </li>
                            <li><a href="#2b" data-toggle="tab" style="padding: 10px 100px !important">Receipt</a>
                            </li>

                        </ul>


                        <div class="tab-content clearfix">

                            <div class="tab-pane active" id="1b">
                                <div class="table-responsive">
                                    <table id="paymenyTable" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Invoice Id</th>
                                                <th>Invoice Date</th>
                                                <th>Company name</th>
                                                <th>Bill Amount</th>
                                                <th>Edit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <s:iterator value="purchase">
                                                <tr>
                                                    <td><input type="hidden" id="pinvoiceId<s:property value = 'invoiceId'/>" value="<s:property value = 'invoiceId'/>" /><s:property value = 'invoiceId'/></td>
                                                    <td><input type="hidden" id="pdate<s:property value = 'invoiceId'/>" value="<s:property value = 'date'/>" /><s:property value = 'date'/></td>
                                                    <td><input type="hidden" id="pcompanyName<s:property value = 'invoiceId'/>" value="<s:property value = 'companyName'/>" /><s:property value = 'companyName'/></td>
                                                    <td><input type="hidden" id="pamount<s:property value = 'invoiceId'/>" value="<s:property value = 'amount'/>" /><s:property value = 'amount'/></td>
                                                    <td><button type="button" data-id="p<s:property value = 'invoiceId'/>" class="btn btn-default editButton">Edit</button></td>
                                                </tr>
                                            </s:iterator>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane" id="2b">
                                <table id="invoiceTable" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>Invoice Id</th>
                                            <th>Invoice Date</th>
                                            <th>Company name</th>
                                            <th>Bill Amount</th>
                                            <th>Edit</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <s:iterator value="invoice">
                                            <tr>
                                                <td><input type="hidden" id="rinvoiceId<s:property value = 'invoiceId'/>" value="<s:property value = 'invoiceId'/>" /><s:property value = 'invoiceId'/></td>
                                                <td><input type="hidden" id="rdate<s:property value = 'invoiceId'/>" value="<s:property value = 'date'/>" /><s:property value = 'date'/></td>
                                                <td><input type="hidden" id="rcompanyName<s:property value = 'invoiceId'/>" value="<s:property value = 'companyName'/>" /><s:property value = 'companyName'/></td>
                                                <td><input type="hidden" id="ramount<s:property value = 'invoiceId'/>" value="<s:property value = 'amount'/>" /><s:property value = 'amount'/></td>
                                                <td><button type="button" data-id="r<s:property value = 'invoiceId'/>" class="btn btn-default editButton">Edit</button></td>
                                            </tr>
                                        </s:iterator>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                    <!-- /.container-fluid -->

            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->



        <script>
            
               

            $('#loginModal').on('hidden.bs.modal', function() {
                $('#loginForm').formValidation('resetForm', true);
            });

            $('.editButton').on('click', function() {

                // Get the record's ID via attribute
                var name = $(this).attr('data-id');

                var id = name.substring(1);
                var type=name.substring(0,1);

//$('#userForm')
//                  .find('[name="type"]').val("type").end()
//                            .find('[name="invoiceId"]').val("type").end();
////                            .find('[name="companyName"]').val("#pcompanyName"+id).val()).end()
////                            .find('[name="date"]').val("#pdate"+id).val()).end()
////                            .find('[name="amount"]').val("#pamount"+id).val()).end();
//alert($("#pinvoiceId"+id).val());

if(type==="p")
{
                 $('#userForm').find('[name="type"]').val(type);
                             $('#userForm').find('[name="invoiceId"]').val($("#pinvoiceId"+id).val());
                             $('#userForm').find('[name="companyName"]').val($("#pcompanyName"+id).val());
                             $('#userForm').find('[name="date"]').val($("#pdate"+id).val());
                             $('#userForm').find('[name="amount"]').val($("#pamount"+id).val());
                    }
                    else
                    {
                        $('#userForm').find('[name="type"]').val(type);
                             $('#userForm').find('[name="invoiceId"]').val($("#rinvoiceId"+id).val());
                             $('#userForm').find('[name="companyName"]').val($("#rcompanyName"+id).val());
                             $('#userForm').find('[name="date"]').val($("#rdate"+id).val());
                             $('#userForm').find('[name="amount"]').val($("#ramount"+id).val());
                    }

                    
                 bootbox
                            .dialog({
                                title: 'Update Details',
                                message: $('#userForm'),
                                show: false // We will show it manually later
                            })
                            .on('shown.bs.modal', function() {
                                $('#userForm')
                                        .show()                             // Show the login form
                                        .formValidation('resetForm'); // Reset form
                            })
                            .on('hide.bs.modal', function(e) {
                                // Bootbox will remove the modal (including the body which contains the login form)
                                // after hiding the modal
                                // Therefor, we need to backup the form
                                $('#userForm').hide().appendTo('body');
                            })
                            .modal('show');
            });


            $('#userForm')
                    .formValidation({
                        framework: 'bootstrap',
                        excluded: ':disabled',
                        icon: {
                            valid: 'glyphicon glyphicon-ok',
                            invalid: 'glyphicon glyphicon-remove',
                            validating: 'glyphicon glyphicon-refresh'
                        },
                        fields: {
                            companyName: {
                                validators: {
                                    notEmpty: {
                                        message: 'Company Name is required'
                                    }
                                }
                            },
                            companyAddress: {
                                validators: {
                                    notEmpty: {
                                        message: 'Company Address is required'
                                    }
                                }
                            },
                            companyGSTIN: {
                                validators: {
                                    notEmpty: {
                                        message: 'Company GSTIN is required'
                                    }
                                }
                            }
                        }
                    });


        </script>


    </body>

</html>

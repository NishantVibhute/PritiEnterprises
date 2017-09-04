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
               
                $('#invoiceTable').DataTable();
                
            });
            

        </script>
    </head>


  

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
                                <i class="fa fa-product-hunt"></i> Print
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
                            <s:iterator value="invoiceList">
                            <form action="printInvoice">
                                <tr>
                                
                                    <td><s:property value = 'invoiceId'/></td>
                                    <td><s:property value = 'date'/></td>
                                    <td><s:property value = 'companyName'/></td>
                                    <td><s:property value = 'amount'/></td>
                                    <td><input type="hidden" value="<s:property value = 'invoiceId'/>" name="docId"/><input type="submit" value="Print" data-id="<s:property value = 'invoiceId'/>" class="btn btn-default editButton"></td>
                     
                                </tr>
                            </form>
                            </s:iterator>
                        </tbody>
                    </table>


                </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- /#page-wrapper -->

            </div>
            <!-- /#wrapper -->


            <script>

$('.editButton').on('click', function() {

                // Get the record's ID via attribute
                
            });

                
            </script>



    </body>

</html>

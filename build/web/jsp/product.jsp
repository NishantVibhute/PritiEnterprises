<%--
    Document   : product
    Created on : Jul 18, 2017, 3:21:30 PM
    Author     : nishant.vibhute
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/jsp/include/includeSideMenu.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/product.css" rel="stylesheet">
        <script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="js/product.js"></script>

        <title>JSP Page</title>

    </head>
    <body>
        <div id="page-wrapper">

            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Products
                        </h1>
                        <ol class="breadcrumb">
                            <li >
                                <i class="fa fa-dashboard"></i> Dashboard
                            </li>
                            <li class="active">
                                <i class="fa fa-product-hunt"></i> Products
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->



                <div class="row" style="height: 600px">

                    <div id="exTab3">
                        <ul  class="nav nav-pills">
                            <li class="active" >
                                <a  href="#1b" data-toggle="tab" style="padding: 10px 100px !important">List</a>
                            </li>
                            <li><a href="#2b" data-toggle="tab" style="padding: 10px 100px !important">New</a>
                            </li>

                        </ul>


                        <div class="tab-content clearfix">

                            <div class="tab-pane active" id="1b">
                                <h3>Same as example 1 but we have now styled the tab's corner</h3>
                                <s:form action="saveProduct1" >
                                    <input type="submit" />
                                </s:form>

                            </div>
                            <div class="tab-pane" id="2b">
                                <s:form action="saveProduct" >
                                    <div class="form-group">
                                        <label class="col-xs-2 control-label">Product Name</label>
                                        <div class="col-xs-3">
                                            <input type="text" class="form-control" name="mainProductName"  />
                                            <hr>

                                        </div>

                                    </div>


                                    <table id="myTable" class=" table order-list">
                                        <thead>
                                            <tr>
                                                <td >Name</td>
                                                <td>Code</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>

                                                <td class="col-sm-4">
                                                    <input type="text" name="subProductList[0].subProductName" class="form-control" />
                                                </td>
                                                <td class="col-sm-4">
                                                    <input type="text" name="subProductList[0].subProductCode"  class="form-control"/>
                                                </td>

                                                <td class="col-sm-2"><a class="deleteRow"></a>

                                                </td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="4" style="text-align: left;">
                                                    <input type="button" class="btn btn-lg btn-block btn-info" id="addrow" value="Add Row" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: left;">
                                                    <input type="submit" class="btn btn-lg btn-block btn-primary" id="addrow" value="Save" />
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </s:form>
                            </div>

                        </div>
                    </div>


                    <!-- Bootstrap core JavaScript
                        ================================================== -->
                    <!-- Placed at the end of the document so the pages load faster -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
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

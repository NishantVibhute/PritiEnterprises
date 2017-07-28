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
        <title>JSP Page</title>
    </head>
    <!--modal starts-->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title">NEW</h5>
                </div>

                <div class="modal-body">
                    <!-- The form is placed inside the body of modal -->
                    <form id="loginForm" method="post" class="form-horizontal" action="saveCompany">
                        <div class="form-group">
                            <label class="col-xs-3 control-label">Company Name</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control" name="companyName" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3 control-label">Address</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control" name="companyAddress" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3 control-label">GSTIN</label>
                            <div class="col-xs-8">
                                <input type="text" class="form-control" name="companyGSTIN" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-5 col-xs-offset-3">
                                <button type="submit" class="btn btn-primary">Save</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--modal ends-->

    <!-- The form which is used to populate the item data -->
    <form id="userForm" method="post" class="form-horizontal" style="display: none;" action="updateCompany">
        <div class="form-group">
            <label class="col-xs-3 control-label">ID</label>
            <div class="col-xs-3">
                <input type="text" class="form-control" name="companyId"  readonly/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-xs-3 control-label">Full name</label>
            <div class="col-xs-5">
                <input type="text" class="form-control" name="companyName" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-xs-3 control-label">Email</label>
            <div class="col-xs-5">
                <input type="text" class="form-control" name="companyAddress" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-xs-3 control-label">GSTIN</label>
            <div class="col-xs-5">
                <input type="text" class="form-control" name="companyGSTIN" />
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
                            Address Book
                        </h1>
                        <p class="text-center">
                            <button class="btn btn-default" data-toggle="modal" data-target="#loginModal">NEW</button>
                        </p>

                        <ol class="breadcrumb">
                            <li >
                                <i class="fa fa-dashboard"></i> Dashboard
                            </li>
                            <li class="active">
                                <i class="fa fa-shopping-basket"></i> Address Book
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
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Sr No.</th>
                                    <th>Company name</th>
                                    <th>Company Address</th>
                                    <th>GSTIN</th>
                                    <th>Edit</th>
                                </tr>
                            </thead>
                            <tbody>
                                <s:iterator value="companyList">
                                    <tr>
                                        <td><s:property value = 'companyId'/></td>
                                        <td><s:property value = 'companyName'/></td>
                                        <td><s:property value = 'companyAddress'/></td>
                                        <td><s:property value = 'companyGSTIN'/></td>
                                        <td><button type="button" data-id="<s:property value = 'companyId'/>" class="btn btn-default editButton">Edit</button></td>
                                    </tr>
                                </s:iterator>
                            </tbody>
                        </table>

                    </div>
                    <!-- /.row -->




                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->



        <script>
            $(document).ready(function() {
                $('#loginForm').formValidation({
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
            });

            $('#loginModal').on('hidden.bs.modal', function() {
                $('#loginForm').formValidation('resetForm', true);
            });

            $('.editButton').on('click', function() {

                // Get the record's ID via attribute
                var id = $(this).attr('data-id');

                $.ajax({
                    url: 'getCompanyDetails?id=' + id,
                    type: "POST",
                    dataType: 'json'
                }).success(function(response) {

                    // Populate the form fields with the data returned from server
                    $('#userForm')
                            .find('[name="companyId"]').val(response.companyId).end()
                            .find('[name="companyName"]').val(response.companyName).end()
                            .find('[name="companyAddress"]').val(response.companyAddress).end()
                            .find('[name="companyGSTIN"]').val(response.companyGSTIN).end();

                    // Show the dialog
                    bootbox
                            .dialog({
                                title: 'Edit the user profile',
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

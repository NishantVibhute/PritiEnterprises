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
        <title>JSP Page</title>
        
        <script>
            
            function getCompanyInfo()
            {
                var id = $( "#compSelect" ).val();
               
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
                        <form role="form">

                            <div class="form-group">
                                <label>Company Name</label>
                                <select id="compSelect" class="form-control" onchange="getCompanyInfo()">
                                    <s:iterator value="companyList">
                                        <option value="<s:property value = 'companyId'/>"><s:property value = 'companyName'/></option>
                                    </s:iterator>
                                </select>
                            </div>
                            
                            
                            <div class="form-group">
                                <input type="hidden" id="companyId"/>
                                <label class="control-label" for="inputSuccess">Company Address</label>
                                <input type="text" class="form-control" id="companyAddress">
                            </div>

                            <div class="form-group ">
                                <label class="control-label" for="inputWarning">GSTIN</label>
                                <input type="text" class="form-control" id="companyGSTIN">
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

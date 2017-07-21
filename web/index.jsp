<%-- 
    Document   : index
    Created on : Jul 17, 2017, 6:30:27 PM
    Author     : nishant.vibhute
--%>

<%@include file="jsp/include/includetags.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/login.css" type="text/css" />
        
        <script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>


        <div class="login-page">
            <s:if test="message=='failed'">
                <div class="alert alert-danger">
                    <strong>User Id and Password Does not match!</strong>
                </div>
            </s:if>


            <div class="form">
                <form class="login-form" action="login" method="POST">
                    <input type="text" placeholder="username" name="userName" required=""/>
                    <input type="password" placeholder="password" name="password" required=""/>
                    <button>login</button>

                </form>
            </div>
        </div>
    </body>
</html>
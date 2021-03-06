<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>login</title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <%--<link href="css/common.css" rel="stylesheet">--%>
    <link href="vendors/custom/custom.min.css" rel="stylesheet">
</head>

<body class="login">
<div>
    <a class="hiddenanchor" id="signup"></a>
    <a class="hiddenanchor" id="signin"></a>

    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content">
                <form>
                    <h1>武穴光明管理系统</h1>
                    <div>
                        <input type="text" id="name" class="form-control" placeholder="Username" required="" />
                    </div>
                    <div>
                        <input type="password" id="pwd" class="form-control" placeholder="Password" required="" />
                    </div>
                    <div>
                        <a class="btn btn-default submit" onclick="login()">登录</a>
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                        <div class="clearfix"></div>
                        <br />
                        <div>
                            <p>©2017 All Rights Reserved. 武穴光明乳业</p>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </div>
</div>

</body>
<script src="vendors/jquery/js/jquery.min.js"></script>
<script src="js/common.js"></script>

<script>
    function login() {
        var params = {};

        params.name = $("#name").val();
        params.password = $("#pwd").val();

        user.login(params)
    }
</script>
</html>

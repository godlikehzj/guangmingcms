<%--
  Created by IntelliJ IDEA.
  User: zhijunhu
  Date: 2018/3/2
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../common/taglibs.jsp"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
<div class="">
    <div class="page-title">
        <div class="title_left">
            <h3>奶品管理</h3>
        </div>

    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>奶品列表</h2>
                    <button type="button" class="btn createbtn btn-success" onclick="dairy.toAddPrice()">创建</button>
                    <ul class="nav panel_toolbox">

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a onclick='dairy.toModifyPrice($(".typeon th").text())'>修改</a>
                                </li>
                                <li><a onclick='dairy.deletePrice($(".typeon th").text())'>删除</a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th class="none">#</th>
                            <th>序号</th>
                            <th>奶品</th>
                            <th>单价（元）</th>
                            <th>工价（元）</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="type" items="${priceTypes}" varStatus="status">
                            <tr class="typetr <c:if test="${type.id == pid}">typeon</c:if>">
                                <th class="none">${type.id}</th>
                                <td scope="row">${status.index + 1}</td>
                                <td>${type.name}</td>
                                <td>${type.price/100}</td>
                                <td>${type.deliverPrice/100}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

        <div class="col-md-6 col-sm-6 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>二级奶品列表</h2>
                    <button type="button" class="btn createbtn btn-success" onclick='dairy.toAddDairy($(".typeon th").text())'>创建</button>
                    <ul class="nav navbar-right panel_toolbox">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a onclick='dairy.toModifyDairy($(".dairyon th").text())'>修改</a>
                                </li>
                                <li><a onclick='dairy.deleteDairy($(".dairyon th").text())'>删除</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th class="none">#</th>
                            <th>序号</th>
                            <th>名称</th>
                            <th>描述</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="dairy" items="${dairies}" varStatus="status">
                            <tr class="dairytr <c:if test="${dairy.id == did}">dairyon</c:if>">
                                <th class="none">${dairy.id}</th>
                                <td>${status.index + 1}</td>
                                <td>${dairy.name}</td>
                                <td>${dairy.description}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>

            <div class="x_panel">
                <div class="x_title">
                    <h2>调价记录</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th class="none">#</th>
                            <th>生效时间</th>
                            <th>失效时间</th>
                            <th>单价（元）</th>
                            <th>工价（元）</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="history" items="${histories}" varStatus="status">
                            <tr>
                                <td><fmt:formatDate value="${history.startDate}" pattern="yyyy-MM-dd hh:mm"/></td>
                                <td><c:if test="${history.endDate == null}">-</c:if>
                                    <c:if test="${history.endDate != null}"><fmt:formatDate value="${history.endDate}" pattern="yyyy-MM-dd hh:mm"/></td></c:if>

                                <td>${history.price/100}</td>
                                <td>${history.deliverPrice/100}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

    </div>
</div>

<script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<script>
    //    $('#datatable').dataTable();
    $(".typetr").bind("click", function () {
        console.debug($(".typeon th").text());
        $(".typeon").removeClass("typeon");
        $(this).addClass("typeon");
        dairy.getList($(".typeon th").text())
    });

    $(".dairytr").bind("click", function () {
        console.debug($(".dairyon th").text());
        $(".dairyon").removeClass("dairyon");
        $(this).addClass("dairyon");
    });
</script>
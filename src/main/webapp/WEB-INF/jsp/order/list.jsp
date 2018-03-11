<%--
  Created by IntelliJ IDEA.
  User: zhijunhu
  Date: 2018/3/9
  Time: 17:19
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
            <h3>订单管理</h3>
        </div>

    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>订单列表</h2>
                    <button type="button" class="btn createbtn btn-success" onclick="order.toAdd()">创建</button>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>奶品</th>
                            <th>数量</th>
                            <th>创建日期</th>
                            <th>结束日期</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="order" items="${orders}">
                            <tr>
                                <td>${order.name}</td>
                                <td><c:forEach var="dairy" items="${dairies}"><c:if test="${order.dairyId == dairy.id}">${dairy.name}</c:if> </c:forEach> </td>
                                <td>${order.num}</td>
                                <td><fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                                <td><fmt:formatDate value="${order.endDay}" pattern="yyyy-MM-dd HH:mm"/></td>
                                <td><a href="javascript:void(0);" onclick="order.detail(${order.id})">查看</a> |
                                    <a href="javascript:void(0);" onclick="order.toModify(${order.id})">修改</a> |
                                    <a href="javascript:void(0);" onclick="order.delete(${order.id})">删除</a></td>
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
    $('#datatable').dataTable();
</script>


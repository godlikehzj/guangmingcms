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
            <h3>用户管理</h3>
        </div>

    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>用户列表</h2>
                    <button type="button" class="btn createbtn btn-success" onclick="user.toAdd()">创建</button>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th>用户名</th>
                            <th>姓名</th>
                            <th>角色</th>
                            <th>手机</th>
                            <th>片区</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>${user.name}</td>
                                <td>${user.cname}</td>
                                <td><c:if test="${user.role == 0}">管理员</c:if>
                                    <c:if test="${user.role == 1}">送奶工</c:if></td>
                                <td>${user.mobile}</td>
                                <td><c:forEach var="area" items="${areas}"><c:if test="${area.id == user.area}">${area.name}</c:if> </c:forEach> </td>
                                <td><c:if test="${user.status == 0}">失效</c:if>
                                    <c:if test="${user.status == 1}">激活</c:if></td>
                                <td><a href="javascript:void(0);" onclick="user.toModify(${user.id})">修改</a> |
                                    <a href="javascript:void(0);" onclick="user.delete(${user.id})">删除</a></td>
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
</script>
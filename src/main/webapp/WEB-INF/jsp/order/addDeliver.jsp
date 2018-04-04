<%--
  Created by IntelliJ IDEA.
  User: zhijunhu
  Date: 2018/4/4
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../common/taglibs.jsp"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="vendors/iCheck/skins/flat/green.css" rel="stylesheet">
<link href="vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

<div class="">
    <div class="page-title">
        <div class="title_left">
            <h3>订单详情</h3>
        </div>

    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>创建送奶规则</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <br />
                    <form id="deliver_rule" class="form-horizontal form-label-left">
                        <input type="text" id="orderId" class="none" value="${orderId}">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="deliver_num">每天数量<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <input type="text" id="deliver_num" name="deliver_num" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="begin_date">开始日期<span class="required">*</span>
                                </label>
                                <div class="col-md-4 col-sm-4 col-xs-12 xdisplay_inputx form-group has-feedback">
                                    <input type="text" class="form-control has-feedback-left" id="begin_date" placeholder="请选择" aria-describedby="inputSuccess2Status4">
                                    <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                    <span id="inputSuccess2Status4" class="sr-only">(success)</span>
                                </div>
                            </div>
                        </div>

                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <button type="button" class="btn createbtn btn-success" onclick="addDeliver()">添加</button>
                                <button type="button" class="btn createbtn btn-primary" onclick="order.detail(${orderId}, 2)">取消</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="vendors/iCheck/icheck.min.js"></script>
<script src="vendors/moment/moment.min.js"></script>
<script src="vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>

<script>
    initicheck();
    function addDeliver() {
        var param = {};
        if (param.num === ""){
            alert("请填写数量");
            return;
        }
        if (param.startDate === ""){
            alert("请填写日期");
            return;
        }
        param.orderId = $('#orderId').val();
        param.num = $('#deliver_num').val();
        param.startDate = $('#begin_date').val();
        order.addDeliver(param);
    }
</script>

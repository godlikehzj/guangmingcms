<%--
  Created by IntelliJ IDEA.
  User: zhijunhu
  Date: 2018/3/2
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../common/taglibs.jsp"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="vendors/iCheck/skins/flat/green.css" rel="stylesheet">
<link href="vendors/bootstrap-daterangepicker/daterangepicker.css">
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
                    <h2>创建订单</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <br />
                    <div id="wizard" class="form_wizard wizard_horizontal">
                        <ul class="wizard_steps">
                            <li>
                                <a href="#step-1">
                                    <span class="step_no">1</span>
                                    <span class="step_descr">
                                              步骤1<br />
                                              <small>填写客户信息</small>
                                          </span>
                                </a>
                            </li>
                            <li>
                                <a href="#step-2">
                                    <span class="step_no">2</span>
                                    <span class="step_descr">
                                              步骤2<br />
                                              <small>订奶信息</small>
                                          </span>
                                </a>
                            </li>
                            <li>
                                <a href="#step-3">
                                    <span class="step_no">3</span>
                                    <span class="step_descr">
                                              步骤3<br />
                                              <small>送奶规则</small>
                                          </span>
                                </a>
                            </li>
                            <li>
                                <a href="#step-4">
                                    <span class="step_no">4</span>
                                    <span class="step_descr">
                                              步骤4<br />
                                              <small>停奶规则</small>
                                          </span>
                                </a>
                            </li>
                        </ul>
                        <div id="step-1">
                            <form id="add_user" class="form-horizontal form-label-left">

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">姓名<span class="required">*</span>
                                    </label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" id="name" required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mobile">手机<span class="required">*</span>
                                    </label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" id="mobile" name="mobile" required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="optional_mobile">备份手机
                                    </label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" id="optional_mobile" name="optional_mobile" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="addr">地址<span class="required">*</span>
                                    </label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" id="addr" name="addr" required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">选择片区</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <select class="select2_single form-control" tabindex="-1" id="area_select">
                                            <option value="0">--</option>
                                            <c:forEach var="area" items="${areas}">
                                                <option value="${area.id}">${area.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </form>

                        </div>
                        <div id="step-2">
                            <form id="add_order" class="form-horizontal form-label-left">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">选择奶品</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <select class="select2_single form-control" tabindex="-1" id="dairy_select">
                                            <c:forEach var="price" items="${priceTypes}">
                                                <option value="${price.id}">${price.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="buy_num">订购数量<span class="required">*</span>
                                    </label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" id="buy_num" name="buy_num" required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="free_num">赠送数量<span class="required">*</span>
                                    </label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" id="free_num" name="free_num" required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="remain_deliver">送奶总量<span class="required">*</span>
                                    </label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" id="remain_deliver" name="remain_deliver" required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pay">支付金额<span class="required">*</span>
                                    </label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" id="pay" name="pay" required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>


                            </form>
                        </div>
                        <div id="step-3">
                            <form id="deliver_rule" class="form-horizontal form-label-left">


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
                            </form>
                        </div>
                        <div id="step-4">
                            <form id="stop_rule" class="form-horizontal form-label-left">

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">停奶类型</label>
                                    <div class="col-md-2 col-sm-2 col-xs-6">
                                        <select class="select2_single form-control" tabindex="-1" id="stop_type">
                                            <option value=0 >每月</option>
                                            <option value=1 >每周</option>
                                            <option value=2 >单次</option>
                                            <option value=3 >永久</option>
                                        </select>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
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
    $(document).ready(function() {
        $('#wizard').smartWizard();

        $('.buttonNext').addClass('btn btn-success');
        $('.buttonPrevious').addClass('btn btn-primary');
        $('.buttonFinish').addClass('btn btn-default');

        initicheck();
        $('#begin_date').daterangepicker({
            singleDatePicker: true,
            singleClasses: "picker_4"
        }, function(start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
        });
        function addOrder() {
            var param = {};
            param.name = $('#name').val();
            param.mobile = $('#mobile').val();
            param.optionalMobile = $('#optional_mobile').val();
            param.addr = $('#addr').val();
            param.channel = $('input:radio:checked').val();
            param.area = $('#area_select').find('option:selected').val();
            param.dairyId = $('#dairy_select').find('option:selected').val();
            param.buyNum = $('#buy_num').val();
            param.freeNum = $('#free_num').val();
            param.remainDeliver = $('#remain_deliver').val();
            param.pay = $('#pay').val();
            if (param.name === ""){
                alert("请填写姓名");
                return;
            }
            if (param.addr === ""){
                alert("请填写地址");
                return;
            }
            if (param.mobile === ""){
                alert("请填写手机");
                return;
            }
            if (param.buyNum === ""){
                alert("请填写购买数量");
                return;
            }
            if (param.freeNum === ""){
                alert("请填写赠送数量，没有填写0");
                return;
            }
            if (param.remainDeliver === ""){
                alert("请填写送奶总量");
                return;
            }
            order.add(param);
        }
    });

</script>

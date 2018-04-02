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
<link href="vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
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
                                    <button type="button" class="btn createbtn btn-success" onclick="searchByMobile()">搜索</button>
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
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">来源</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div id="channel" class="btn-group" data-toggle="buttons">
                                            <label class="btn" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                到店:<input type="radio" class="flat" name="status" id="admin" value="0" checked="checked"/>
                                            </label>
                                            <label class="btn" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                奶工:<input type="radio" class="flat" name="status" id="worker" value="1" />
                                            </label>
                                        </div>
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
                                    <div class="col-md-3 col-sm-3 col-xs-6">
                                        <select class="select2_single form-control" tabindex="-1" id="stop_type" onchange="stop_change()">
                                            <option value=0 >每月</option>
                                            <option value=1 >每周</option>
                                            <option value=2 >单次</option>
                                            <option value=3 >永久</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group stop_rule single_rule none">
                                    <div class="controls">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="rule_begin_date">开始日期<span class="required">*</span>
                                        </label>
                                        <div class="col-md-3 col-sm-3 col-xs-12 xdisplay_inputx form-group has-feedback">
                                            <input type="text" class="form-control has-feedback-left" id="rule_begin_date" placeholder="请选择" aria-describedby="rule_begin">
                                            <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                            <span id="rule_begin" class="sr-only">(success)</span>
                                        </div>
                                    </div>
                                </div>

                                <%--<div class="form-group stop_rule single_rule none">--%>
                                    <%--<div class="controls">--%>
                                        <%--<label class="control-label col-md-3 col-sm-3 col-xs-12" for="rule_end_date">结束日期<span class="required">*</span>--%>
                                        <%--</label>--%>
                                        <%--<div class="col-md-3 col-sm-3 col-xs-12 xdisplay_inputx form-group has-feedback">--%>
                                            <%--<input type="text" class="form-control has-feedback-left" id="rule_end_date" placeholder="请选择" aria-describedby="rule_end">--%>
                                            <%--<span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>--%>
                                            <%--<span id="rule_end" class="sr-only">(success)</span>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>

                                <div class="form-group stop_rule single_rule none">
                                    <div class="controls">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="rule_end_date">停奶日期<span class="required">*</span>
                                        </label>
                                        <div class="col-md-3 col-sm-3 col-xs-12 xdisplay_inputx form-group has-feedback">
                                            <input type="text" class="form-control has-feedback-left" id="rule_end_date" placeholder="请选择" aria-describedby="rule_end">
                                            <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                            <span id="rule_end" class="sr-only">(success)</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group stop_rule" id="monthly_stop">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="month_stop">每月日期(逗号分隔)<span class="required">*</span>
                                    </label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" id="month_stop" name="month_stop" required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>

                                <div class="form-group stop_rule none" id="week_stop">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">星期</label>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" class="flat" value="1"> 周一
                                            </label>
                                            <label>
                                                <input type="checkbox" class="flat" value="2"> 周二
                                            </label>
                                            <label>
                                                <input type="checkbox" class="flat" value="3"> 周三
                                            </label>
                                            <label>
                                                <input type="checkbox" class="flat" value="4"> 周四
                                            </label>
                                            <label>
                                                <input type="checkbox" class="flat" value="5"> 周五
                                            </label>
                                            <label>
                                                <input type="checkbox" class="flat" value="6"> 周六
                                            </label>
                                            <label>
                                                <input type="checkbox" class="flat" value="7"> 周日
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div style="padding-bottom: 40px">

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
    function stop_change() {
        var ruleType = $('#stop_type').find('option:selected').val();
        $(".stop_rule").addClass("none");
        if (ruleType == 0)
            $("#monthly_stop").removeClass("none");
        else if (ruleType == 1)
            $("#week_stop").removeClass("none");
        else if (ruleType == 2){
            $(".single_rule").removeClass("none");
        }
    }

    function searchByMobile() {
        var params = {};
        params.mobile = $('#mobile').val();
        $.ajax({
            type : "POST",
            url : "customer/search",
            data : params,
            error : function() {
            },
            success : function(ret) {
                var cinfo = ret.data;
                if (cinfo !== null){
                    $('#name').val(cinfo.name);
                    $('#mobile').val(cinfo.mobile);
                    $('#optional_mobile').val(cinfo.optionalMobile);
                    $('#addr').val(cinfo.addr);
                    $("#area_select").find("option[value="+cinfo.area+"]").attr("selected",true);
                }
            }
        });
    }

    function addOrder() {
        var param = {};
        param.name = $('#name').val();
        param.mobile = $('#mobile').val();
        param.optionalMobile = $('#optional_mobile').val();
        param.addr = $('#addr').val();
        param.channel = $('input:radio:checked').val();
        param.area = $('#area_select').find('option:selected').val();
        param.priceId = $('#dairy_select').find('option:selected').val();
        param.buyNum = $('#buy_num').val();
        param.freeNum = $('#free_num').val();
        param.remainDeliver = $('#remain_deliver').val();
        param.pay = $('#pay').val();
        param.num = $('#deliver_num').val();
        param.startDate = $('#begin_date').val();
        param.ruleType = $('#stop_type').find('option:selected').val();

        if (param.ruleType == 0){
            //每月
            param.ruleContent = $('#month_stop').val();
        }else if (param.ruleType == 1){
            //每周
            param.ruleContent = "";
            $.each($('input:checkbox:checked'),function(){
                param.ruleContent = param.ruleContent + $(this).val() + ",";
            });
            param.ruleContent = param.ruleContent.substring(0, param.ruleContent.length - 1);
        }else if (param.ruleType == 2){
            var single_begin = $('#rule_begin_date').val();
            var single_end = $('#rule_end_date').val();
            if (single_begin > single_end){
                alert("开始日期不能晚于结束日期")
                return;
            }
            param.ruleContent = single_begin + "," + single_end;
        }
        console.log(param);
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

    $(document).ready(function() {
        $('#week_day').multiselect({
            nonSelectedText:"请选择"
        });
        $('#wizard').smartWizard({onFinish:function () {
            addOrder();
        }});

        $('.buttonNext').addClass('btn btn-success');
        $('.buttonPrevious').addClass('btn btn-primary');
        $('.buttonFinish').addClass('btn btn-default');

        initicheck();

        $('#rule_begin_date').daterangepicker({
            singleDatePicker: true,
            singleClasses: "picker_4"
        }, function(start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
        });

        $('#rule_end_date').daterangepicker({
            singleDatePicker: true,
            singleClasses: "picker_4"
        }, function(start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
        });

        $('#begin_date').daterangepicker({
            singleDatePicker: true,
            singleClasses: "picker_4"
        }, function(start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
        });

    });

</script>

<%--
  Created by IntelliJ IDEA.
  User: zhijunhu
  Date: 2018/4/2
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../common/taglibs.jsp"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="vendors/iCheck/skins/flat/green.css" rel="stylesheet">

<div class="">
    <div class="page-title">
        <div class="title_left">
            <h3>订单详情</h3>
        </div>
    </div>
    <div class="clearfix"></div>
    <ul id="myTab" class="nav nav-tabs" style="padding-top: 30px">
        <li <c:if test="${tab == 1}">class="active"</c:if>>
            <a href="#detail" data-toggle="tab">
                详细信息
            </a>
        </li>
        <li><a href="#delivery_rule" data-toggle="tab">配送规则</a></li>
        <li><a href="#stop_rule" data-toggle="tab">停奶规则</a></li>
    </ul>

    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="detail">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_content">
                            <form id="modify_order" class="form-horizontal form-label-left">
                                <input type="text" id="orderId" class="none" value="${order.id}">

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">姓名<span class="required">*</span>
                                    </label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" id="name" required="required" readonly="readonly" value="${order.name}" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mobile">手机<span class="required">*</span>
                                    </label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" id="mobile" name="mobile" required="required" readonly="readonly" value="${order.mobile}" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="optional_mobile">备份手机
                                    </label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" id="optional_mobile" name="optional_mobile" readonly="readonly" value="${order.optionalMobile}" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="addr">地址<span class="required">*</span>
                                    </label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" id="addr" name="addr" required="required" readonly="readonly" value="${order.addr}" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">选择片区</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <select class="select2_single form-control" tabindex="-1" readonly="readonly" id="area_select">
                                            <option value="0">--</option>
                                            <c:forEach var="area" items="${areas}">
                                                <option value="${area.id}" <c:if test="${order.area == area.id}">selected="selected"</c:if>>${area.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">选择奶品</label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <select class="select2_single form-control" tabindex="-1" readonly="readonly" id="dairy_select">
                                            <c:forEach var="price" items="${priceTypes}">
                                                <option value="${price.id}" <c:if test="${order.priceId == price.id}">selected="selected"</c:if>>${price.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="buy_num">订购数量<span class="required">*</span>
                                    </label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" id="buy_num" name="buy_num" required="required" readonly="readonly" value="${order.buyNum}" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="free_num">赠送数量<span class="required">*</span>
                                    </label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" id="free_num" name="free_num" required="required" readonly="readonly" value="${order.freeNum}" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="remain_deliver">送奶总量<span class="required">*</span>
                                    </label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" id="remain_deliver" name="remain_deliver" required="required" readonly="readonly" value="${order.freeNum}" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pay">支付金额<span class="required">*</span>
                                    </label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" id="pay" name="pay" required="required" readonly="readonly" value="${order.pay}" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">来源</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div id="channel" class="btn-group" data-toggle="buttons">
                                            <label class="btn" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                到店:<input type="radio" class="flat" name="status" id="admin" value="0" <c:if test="${order.channel == 0}">checked="checked"</c:if>/>
                                            </label>
                                            <label class="btn" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                奶工:<input type="radio" class="flat" name="status" id="worker" value="1" <c:if test="${order.channel == 1}">checked="checked"</c:if>/>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                        <button type="button" id="modify_order_btn" class="btn createbtn btn-success none" onclick="modifyOrder()">确认修改</button>
                                        <button type="button" id="quit_modify_order_btn" class="btn createbtn btn-primary none" onclick="quitModifyOrder()">取消</button>
                                        <button type="button" id="to_modify_order_btn" class="btn createbtn btn-primary" onclick="toModifyOrder()">修改订单</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="tab-pane fade" id="delivery_rule">
            <c:forEach var="deliverRule" items="${deliverRules}" varStatus="status">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>配送规则${status.index + 1}</h2>
                            <button type="button" id="modify_deliver_btn" class="btn createbtn btn-success none" onclick="modifyDeliver()">确认修改</button>
                            <button type="button" id="to_modify_deliver_btn" class="btn createbtn btn-primary" onclick="toModifyDeliver()">修改规则</button>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <form class="form-horizontal form-label-left">
                                <input type="text" class="none" value="${deliverRule.id}">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="deliver_num">每天数量<span class="required">*</span>
                                    </label>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input type="text" id="deliver_num" name="deliver_num" value="${deliverRule.num}" required="required" class="form-control col-md-7 col-xs-12" readonly="readonly">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="begin_date">开始日期<span class="required">*</span>
                                        </label>
                                        <div class="col-md-4 col-sm-4 col-xs-12 xdisplay_inputx form-group has-feedback">
                                            <input type="text" class="form-control has-feedback-left" id="begin_date" readonly="readonly" value="<fmt:formatDate value="${deliverRule.startDate}" pattern="yyyy-MM-dd"/>" placeholder="请选择" aria-describedby="inputSuccess2Status4">
                                            <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                            <span id="inputSuccess2Status4" class="sr-only">(success)</span>
                                        </div>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>


            </c:forEach>
        </div>
        <div class="tab-pane fade" id="stop_rule">
            <p>jMeter 是一款开源的测试软件。它是 100% 纯 Java 应用程序，用于负载和性能测试。</p>
        </div>
        <div class="tab-pane fade" id="ejb">
            <p>Enterprise Java Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的 J2EE 上。
            </p>
        </div>
    </div>
</div>
<script src="vendors/iCheck/icheck.min.js"></script>
<script>
    initicheck();

    function toModifyDeliver() {
        $("#modify_deliver_btn").removeClass("none");
        $("#to_modify_deliver_btn").addClass("none");
    }

    function modifyDeliver() {

    }

    function toModifyOrder() {
        if(window.confirm('你确定要修改该订单吗？')){
            $("#modify_order input").removeAttr("readonly");
            $("#modify_order select").removeAttr("readonly");
            $("#modify_order_btn").removeClass("none");
            $("#quit_modify_order_btn").removeClass("none");
            $("#to_modify_order_btn").addClass("none");
        }
    }

    function quitModifyOrder() {
        $("#modify_order input").attr("readonly", "readonly");
        $("#modify_order select").attr("readonly", "readonly");
        $("#modify_order_btn").addClass("none");
        $("#quit_modify_order_btn").addClass("none");
        $("#to_modify_order_btn").removeClass("none");
    }
    function modifyOrder() {
        var param = {};
        param.id = $('#orderId').val();
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
        order.modify(param);

    }
</script>
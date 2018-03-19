function getContent(url, params){
    loading();
    $.ajax({
        type : "POST",
        url : url,
        data : params,
        error : function() {
        },
        success : function(ret) {
            $('#content').html(ret);
        }
    });
}

function loading() {
    $('#content').html('<div class="circle" style="position: absolute;top:50%;transform: translateY(-50%);left:50%;">\n' +
        '        <span class="ouro ouro3">\n' +
        '        <span class="left"><span class="anim"></span></span>\n' +
        '        <span class="right"><span class="anim"></span></span>\n' +
        '        </span>\n' +
        '        </div>');

}

function initicheck() {
    if ($("input.flat")[0]) {
        $(document).ready(function () {
            $('input.flat').iCheck({
                checkboxClass: 'icheckbox_flat-green',
                radioClass: 'iradio_flat-green'
            });
        });
    }
}

var user = {
    login : function (params) {
        $.ajax({
            type : "POST",
            url : "user/login",
            data : params,
            error : function() {
            },
            success : function(ret) {
                if (ret.code === 0){
                    window.location.href = "/";
                }else{
                    alert(ret.msg);
                }
            }
        });
    },

    logout : function (params) {
        $.ajax({
            type : "POST",
            url : "user/logout",
            data : params,
            error : function() {
            },
            success : function(ret) {
                if (ret.code === 0){
                    window.location.href = "/";
                }else{
                    alert(ret.msg);
                }
            }
        });
    },
    
    getList : function () {
        var url = "user/list";
        var param = {};
        getContent(url, param);
    },

    toAdd : function () {
        var url = "user/toAdd";
        var param = {};
        getContent(url, param);
    },

    add : function (params) {
        if(window.confirm('你确定要添加吗？')){
            $.ajax({
                type : "POST",
                url : "user/doAdd",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        user.getList();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },

    toModify : function (uid) {
        var url = "user/toModify";
        var param = {};
        param.uid = uid;
        getContent(url, param);
    },
    modify : function (params) {
        if(window.confirm('你确定要修改吗？')){
            $.ajax({
                type : "POST",
                url : "user/doModify",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        user.getList();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },
    delete : function (uid) {
        var param = {};
        param.uid = uid;
        if(window.confirm('你确定要删除吗？')){
            $.ajax({
                type : "POST",
                url : "user/delete",
                data : param,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        user.getList();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    }

    };
var area = {
    getList : function () {
        var url = "area/list";
        var param = {};
        getContent(url, param);
    },

    toAdd : function () {
        var url = "area/toAdd";
        var param = {};
        getContent(url, param);
    },

    add : function (params) {
        if(window.confirm('你确定要添加吗？')){
            $.ajax({
                type : "POST",
                url : "area/doAdd",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        area.getList();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },

    toModify : function (aid) {
        var url = "area/toModify";
        var param = {};
        param.aid = aid;
        getContent(url, param);
    },
    modify : function (params) {
        if(window.confirm('你确定要修改吗？')){
            $.ajax({
                type : "POST",
                url : "area/doModify",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        area.getList();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },
    delete : function (aid) {
        var param = {};
        param.aid = aid;
        if(window.confirm('你确定要删除吗？')){
            $.ajax({
                type : "POST",
                url : "area/delete",
                data : param,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        area.getList();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    }
};

var dairy = {
    getList : function (pid) {
        var url = "dairy/list";
        var param = {};
        param.pid = pid;
        getContent(url, param);
    },

    toAddPrice : function () {
        var url = "dairy/toAddPrice";
        var param = {};
        getContent(url, param);
    },

    toAddDairy : function (pid) {
        var url = "dairy/toAddDairy";
        var param = {};
        param.pid = pid;
        getContent(url, param);
    },

    addPrice : function (params) {
        if(window.confirm('你确定要添加吗？')){
            $.ajax({
                type : "POST",
                url : "dairy/doAddPrice",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        dairy.getList(ret.data);
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },

    addDairy : function (params) {
        if(window.confirm('你确定要添加吗？')){
            $.ajax({
                type : "POST",
                url : "dairy/doAddDairy",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        dairy.getList(ret.data);
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },

    toModifyPrice : function (pid) {
        var url = "dairy/toModifyPrice";
        var param = {};
        param.pid = pid;
        getContent(url, param);
    },

    toModifyDairy : function (did) {
        var url = "dairy/toModifyDairy";
        var param = {};
        param.did = did;
        getContent(url, param);
    },
    modifyPrice : function (params) {
        if(window.confirm('你确定要修改吗？')){
            $.ajax({
                type : "POST",
                url : "dairy/doModifyPrice",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        dairy.getList(ret.data);
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },

    modifyDairy : function (params) {
        if(window.confirm('你确定要修改吗？')){
            $.ajax({
                type : "POST",
                url : "dairy/doModifyDairy",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        dairy.getList(ret.data);
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },

    deletePrice : function (pid) {
        var param = {};
        param.pid = pid;
        if(window.confirm('你确定要删除吗？')){
            $.ajax({
                type : "POST",
                url : "dairy/deletePrice",
                data : param,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        dairy.getList();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },
    deleteDairy : function (did) {
        var param = {};
        param.did = did;
        if(window.confirm('你确定要删除吗？')){
            $.ajax({
                type : "POST",
                url : "dairy/deleteDairy",
                data : param,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        dairy.getList(ret.data);
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    }
};

var customer = {
    getList : function () {
        var url = "customer/list";
        var param = {};
        getContent(url, param);
    },

    toAdd : function () {
        var url = "customer/toAdd";
        var param = {};
        getContent(url, param);
    },

    add : function (params) {
        if(window.confirm('你确定要添加吗？')){
            $.ajax({
                type : "POST",
                url : "customer/doAdd",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        customer.getList();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },

    toModify : function (cid) {
        var url = "customer/toModify";
        var param = {};
        param.cid = cid;
        getContent(url, param);
    },
    modify : function (params) {
        if(window.confirm('你确定要修改吗？')){
            $.ajax({
                type : "POST",
                url : "customer/doModify",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        customer.getList();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },
    delete : function (cid) {
        var param = {};
        param.cid = cid;
        if(window.confirm('你确定要删除吗？')){
            $.ajax({
                type : "POST",
                url : "customer/delete",
                data : param,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        customer.getList();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    }
};

var order = {
    getList : function () {
        var url = "order/list";
        var param = {};
        getContent(url, param);
    },

    toAdd : function () {
        var url = "order/toAdd";
        var param = {};
        getContent(url, param);
    },

    add : function (params) {
        if(window.confirm('你确定要添加吗？')){
            $.ajax({
                type : "POST",
                url : "order/doAdd",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        order.getList();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },

    toModify : function (oid) {
        var url = "order/toModify";
        var param = {};
        param.oid = oid;
        getContent(url, param);
    },
    modify : function (params) {
        if(window.confirm('你确定要修改吗？')){
            $.ajax({
                type : "POST",
                url : "order/doModify",
                data : params,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        order.getList();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    },
    delete : function (oid) {
        var param = {};
        param.oid = oid;
        if(window.confirm('你确定要删除吗？')){
            $.ajax({
                type : "POST",
                url : "order/delete",
                data : param,
                error : function() {
                },
                success : function(ret) {
                    if (ret.code === 0){
                        order.getList();
                    }else{
                        alert(ret.msg);
                    }
                }
            });
        }else{

        }
    }
}
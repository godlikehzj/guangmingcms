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
    getList : function () {
        var url = "dairy/list";
        var param = {};
        getContent(url, param);
    },

    toAdd : function () {
        var url = "dairy/toAdd";
        var param = {};
        getContent(url, param);
    },

    add : function (params) {
        if(window.confirm('你确定要添加吗？')){
            $.ajax({
                type : "POST",
                url : "dairy/doAdd",
                data : params,
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

    toModify : function (did) {
        var url = "dairy/toModify";
        var param = {};
        param.did = did;
        getContent(url, param);
    },
    modify : function (params) {
        if(window.confirm('你确定要修改吗？')){
            $.ajax({
                type : "POST",
                url : "dairy/doModify",
                data : params,
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
    delete : function (did) {
        var param = {};
        param.did = did;
        if(window.confirm('你确定要删除吗？')){
            $.ajax({
                type : "POST",
                url : "dairy/delete",
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
    }
}
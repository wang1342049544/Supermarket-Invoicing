
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

<%--    <jsp:include page="/com/tagg.jsp"/>--%>

    <!--基本的bootstrap配置-->
    <link href="${pageContext.request.contextPath}/static/hplus/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/hplus/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/hplus/js/bootstrap.min.js"></script>
    <!--bootstraptable的配置-->
    <script src="${pageContext.request.contextPath}/static/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/hplus/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <!--动画图标-->
    <link href="${pageContext.request.contextPath}/static/hplus/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/hplus/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/hplus/css/style.min.css" rel="stylesheet">
    <!--登陆样式-->
    <link href="${pageContext.request.contextPath}/static/hplus/css/login.min.css" rel="stylesheet">
    <!--首页-->
    <script src="${pageContext.request.contextPath}/static/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${pageContext.request.contextPath}/static/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/hplus/js/hplus.min.js?v=4.1.0"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/hplus/js/contabs.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/hplus/js/plugins/pace/pace.min.js"></script>
    <link rel="stylesheet" href="../static/login/bootstrap.min.css">
    <!--验证-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrapvalidator/bootstrapValidator.min.css">
    <script src="${pageContext.request.contextPath}/static/bootstrapvalidator/bootstrapValidator.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrapvalidator/zh_CN.js"></script>

    <%--统计图--%>
    <script src="${pageContext.request.contextPath}/static/echarts/echarts.js"></script>
    <script src="${pageContext.request.contextPath}/static/echarts/roma.js"></script>
    <script src="${pageContext.request.contextPath}/static/echarts/dark.js"></script>

    <%--sweet提示框--%>
    <link href="${pageContext.request.contextPath}/static/hplus/css/plugins/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/hplus/js/plugins/sweetalert/sweetalert.min.js" type="text/javascript"></script>

    <%--选择--%>
    <link href="${pageContext.request.contextPath}/static/Select/bootstrap-select.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/Select/bootstrap-select.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/Select/bootstrap-select.js"></script>

    <%--上传图片--%>
    <link href="${pageContext.request.contextPath}/static/fileinput/css/fileinput.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/fileinput/js/fileinput.js"></script>
    <script src="${pageContext.request.contextPath}/static/fileinput/js/locales/zh.js"></script>


    <%--treeview树状菜单--%>
    <link href="${pageContext.request.contextPath}/static/treeview/bootstrap-treeview.min.css">
    <script src="${pageContext.request.contextPath}/static/treeview/bootstrap-treeview.min.js"></script>

    <%--时间控件--%>
    <script src="${pageContext.request.contextPath}/static/date/Moment.js"></script>
    <link href="${pageContext.request.contextPath}/static/date/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/date/bootstrap-datetimepicker.min.js"></script>


    <%--百度地图--%>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ekDr2vIa7mG0VgglUSxDzj2xF7csC0Az"></script>

    <%--导出数据--%>
    <script href="${pageContext.request.contextPath}/static/fileinput/js/plugins/purify.js/purify.min.js"></script>





    <title>进货</title>
</head>


    <script>


        /*打开采购单修改表*/
        function xiu(index) {
            //取消所有选择
            $("#stable").bootstrapTable("uncheckAll");
            $("#stable").bootstrapTable("check", index);

            var row = $("#stable").bootstrapTable("getSelections")[0];
            $("[name = 'id']").val(row.id);
            $("[name = 'buId']").val(row.buId);
            $("[name = 'buName']").val(row.buName);
            $("[name = 'danWei']").val(row.danWei);
            $("[name = 'price']").val(row.price);
            $("[name = 'nums']").val(row.nums);
            $("[name = 'money']").val(row.money);


            $("#addmoda4").modal("show");
        }


        /*验证*/
        $(function () {

            <!--校验框架-->
            $('#userfromv').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    buName: {
                        message: 'The username is not valid',
                        validators: {
                            notEmpty: {
                                message: '商品名称不能为空！'
                            }
                        }
                    },
                    danWei:{
                        message:'',
                        validators: {
                            notEmpty: {
                                message: '单位不能为空！'
                            }
                        }
                    },
                    price:{
                        message:'',
                        validators: {
                            notEmpty: {
                                message: '单价不能为空！'
                            }
                        }

                    },
                    nums:{
                        validators: {
                            notEmpty: {
                                message: '数量不能为空！'
                            }
                        }

                    },
                    yileld:{
                        validators: {
                            notEmpty: {
                                message: '生产日期不能为空！'
                            }
                        }

                    },
                    expiration:{
                        validators: {
                            notEmpty: {
                                message: '到期时间不能为空！'
                            }
                        }

                    }

                }
            });

        })


        /*算钱*/
        $(function () {

            /*复选框*/
            $(function () {
                $('#stable').on('uncheck.bs.table check.bs.table check-all.bs.table uncheck-all.bs.table',function(e,rows){
                    var datas = $.isArray(rows) ? rows : [rows];        // 点击时获取选中的行或取消选中的行
                    examine(e.type,datas);
                });
            });
            var overAllIds = new Array();
            function examine(type,datas){
                if(type.indexOf('uncheck')==-1){
                    $.each(datas,function(i,v){
                        // 添加时，判断一行或多行的 id 是否已经在数组里 不存则添加　
                        overAllIds.indexOf(v.price) == -1 ? overAllIds.push(v.price * v.nums) : -1;
                        chai(overAllIds);
                    });
                }else{
                    $.each(datas,function(i,v){
                        overAllIds.splice(overAllIds.indexOf(v.price * v.nums),1);    //删除取消选中行
                        chai(overAllIds);
                    });
                }
            }
            /*金额*/
            function chai(overAllIds){
                var moeny = 0;
                if( overAllIds.length == 0 ){
                    $("#yinfu").html("");
                    $("[name = 'shifu']").val("");
                }else{
                    for (var i = 0; i < overAllIds.length; i++) {
                        var zhi = overAllIds[i];
                        moeny = zhi + moeny;
                        $("#yinfu").html(moeny);
                        $("[name = 'shifu']").val(moeny);

                    }
                }
            }


        })
        /*绑定供货商数据*/
        $(function () {

            //全局方法,获取当前时间
            function pad2(n) { return n < 10 ? '0' + n : n }
            function generateTimeReqestNumber() {
                var date = new Date();
                return date.getFullYear().toString() + pad2(date.getMonth() + 1) + pad2(date.getDate()) + pad2(date.getHours()) + pad2(date.getMinutes()) ;
            }
            var rand = Math.floor(Math.random() * 900) + 100;
            var order_id =   rand + generateTimeReqestNumber();


            var danhao = "DJ" + order_id;
            $("#danhao").html(danhao);

            //经办人
            $.ajax({
                url:'${pageContext.request.contextPath}/Mapper/caiList',
                type:"get",
                success:function(data){
                    $.each(data,function(){
                        var adds=$("<option value='"+this.managerId+"'>"+this.mname+"</option>");
                        $(".l").append(adds);

                    });
                }
            })

            //供货商
            $.ajax({
                url:'${pageContext.request.contextPath}/Supplier/queryList',
                type:"get",
                success:function(data){
                    $.each(data,function(){
                        var adds=$("<option value='"+this.supplierId+"'>"+this.supName+"</option>");
                        $(".o").append(adds);
                        var zhi = $("#inputIDs").val()

                        $("[name = 'gzhi']").val(zhi);

                    });
                }
            })

            //商品类型 1级
            $.ajax({
                url:'${pageContext.request.contextPath}/ShopType/listAll',
                type:"get",
                success:function(data){
                    $.each(data,function(d){

                        if(this.dengji ==1){
                            var adds=$(
                                "<option value='"+this.typeId+"'>"+this.typeName+"</option>");
                            $(".v").append(adds);
                        }
                   });
                }
            })





            //商品类型 2级
            $.ajax({
                url:'${pageContext.request.contextPath}/ShopType/listAll',
                type:"get",
                success:function(data){
                    $.each(data,function(d){

                        if(this.dengji ==2 ){
                            var adds=$(
                                "<option value='"+this.typeId+"'>"+this.typeName+"</option>");
                            $(".vv").append(adds);
                        }
                    });
                }
            })





            //商品类型  3级
            $.ajax({
                url:'${pageContext.request.contextPath}/ShopType/listAll',
                type:"get",
                success:function(data){
                    $.each(data,function(d){

                        if(this.dengji ==3){
                            var adds=$(
                                "<option value='"+this.typeId+"'>"+this.typeName+"</option>");
                            $(".vvv").append(adds);
                        }
                    });
                }
            })


            //分店
            $.ajax({
                url:'${pageContext.request.contextPath}/Store/Storelist',
                type:"get",
                success:function(data){
                    $.each(data,function(){
                        var adds=$("<option value='"+this.storeId+"'>"+this.storeName+"</option>");
                        $(".k").append(adds);
                        var zhi = $("#inputID").val()

                        $("[name = 'gzhis']").val(zhi);

                    });
                }
            })

            //表格信息
            $("#tables").bootstrapTable({
                url:'${pageContext.request.contextPath}/Gshop/queryTJ?supplierId=1',
                toolbar:'#br',
                height:'250',
                pageSize : 3,
                pageList:[2,3,4,8],
                pagerNumber:1,
                //启用分页，但默认情况下，是客户端分页
                pagination:true,
                //启用服务器端分页
                sidePagination : 'server',

                queryParams:function(params){

                    var temp = {
                        limit : params.limit,//页面大小
                        offset:params.offset,//页面
                        gzhi:$("#gzhi").val()
                    };
                    return temp;

                },

                columns:[
                    {
                        checkbox:true
                    },
                    {
                        field:'gshopId',
                        title:'商品编号',
                        align:'center'
                    },
                    {
                        field:'gshopName',
                        title:'商品名称',
                        align:'center'
                    },
                    {
                        field:'danWei',
                        title:'单位',
                        align:'center'
                    },
                    {
                        field:'price',
                        title:'单价',
                        align:'center'
                    },
                    {
                        field:'shoptypes.typeName',
                        title:'商品类型',
                        align:'center'
                    },
                    {
                        field:'yileld',
                        title:'生产日期',
                        align:'center'
                    },
                    {
                        field:'pledge',
                        title:'保质期',
                        align:'center'
                    },
                    {
                        field:'expiration',
                        title:'到期日期',
                        align:'center'
                    },
                    {
                        title:'操作',
                        align:'center',
                        formatter:function (varlue,row,index) {
                            return "<button class='btn btn-info' onclick='tianjia("+index+")'><span class='glyphicon glyphicon-plus'></span></button>"

                        }
                    }
                ]

            })
            //临时表格信息
            $("#table").bootstrapTable({
                url:'${pageContext.request.contextPath}/Yxshop/listList',
                height:'250',
                pageSize : 3,
                pageList:[2,3,4,8],
                pagerNumber:1,
                //启用分页，但默认情况下，是客户端分页
                pagination:true,
                //启用服务器端分页
                sidePagination : 'server',

                queryParams:function(params){

                    var temp = {
                        limit : params.limit,//页面大小
                        offset:params.offset,//页面
                    };
                    return temp;

                },

                columns:[
                    {
                        checkbox:true
                    },
                    {
                        field:'id',
                        title:'编号',
                        align:'center'
                    },
                    {
                        field:'yxsId',
                        title:'商品编号',
                        align:'center'
                    },
                    {
                        field:'yxsName',
                        title:'商品名称',
                        align:'center'
                    },
                    {
                        field:'danWei',
                        title:'单位',
                        align:'center'
                    },
                    {
                        field:'price',
                        title:'单价',
                        align:'center'
                    },
                    {
                        field:'nums',
                        title:'数量',
                        align:'center'
                    },
                    {
                        field:'money',
                        title:'总金额',
                        align:'center'
                    },
                    {
                        field:'yileld',
                        title:'生产日期',
                        align:'center'
                    },
                    {
                        field:'pledge',
                        title:'保质期',
                        align:'center'
                    },
                    {
                        field:'expiration',
                        title:'到期日期',
                        align:'center'
                    },
                    {
                        field:'suppliers.supName',
                        title:'供货商',
                        align:'center'
                    },
                    {
                        field:'shoptypes.typeName',
                        title:'商品类型',
                        align:'center'
                    },

                    {
                        title:'操作',
                        align:'center',
                        formatter:function (varlue,row,index) {
                            return "<button class='btn btn-info' onclick='del("+index+")'><span class='glyphicon glyphicon-trash'></span></button>" + "&nbsp;" +
                                "<button class='btn btn-info' onclick='upd("+index+")'><span class='glyphicon glyphicon-pencil'></span></button>"

                        }
                    }
                ]

            })
            //临时表格信息
            $("#stable").bootstrapTable({
                url:'${pageContext.request.contextPath}/Buyer/queryFY',
                height:'380',
                pageSize : 10,
                pageList:[2,3,4,8],
                pagerNumber:1,
                //启用分页，但默认情况下，是客户端分页
                pagination:true,
                //启用服务器端分页
                sidePagination : 'server',

                queryParams:function(params){

                    var temp = {
                        limit : params.limit,//页面大小
                        offset:params.offset,//页面
                    };
                    return temp;

                },

                columns:[
                    {
                        checkbox:true
                    },
                    {
                        field:'id',
                        title:'编号',
                        align:'center'
                    },
                    {
                        field:'buId',
                        title:'商品编号',
                        align:'center'
                    },
                    {
                        field:'buName',
                        title:'商品名称',
                        align:'center'
                    },
                    {
                        field:'danWei',
                        title:'单位',
                        align:'center'
                    },
                    {
                        field:'price',
                        title:'单价',
                        align:'center'
                    },
                    {
                        field:'nums',
                        title:'数量',
                        align:'center'
                    },
                    {
                        field:'money',
                        title:'总金额',
                        align:'center'
                    },
                    {
                        field:'yileld',
                        title:'生产日期',
                        align:'center'
                    },
                    {
                        field:'pledge',
                        title:'保质期',
                        align:'center'
                    },
                    {
                        field:'expiration',
                        title:'到期日期',
                        align:'center'
                    },
                    {
                        field:'suppliers.supName',
                        title:'供货商',
                        align:'center'
                    },
                    {
                        field:'shoptypes.typeName',
                        title:'商品类型',
                        align:'center'
                    },
                    {
                        title:'操作',
                        align:'center',
                        formatter:function (varlue,row,index) {
                            return "<button class='btn btn-info' onclick='shan("+index+")'>删除</button>" + "&nbsp;" +
                                "<button class='btn btn-info' onclick='xiu("+index+")'>修改</button>"
                        }
                    }
                ]

            })

        })


        //供货商
        function dan() {



            var zhi = $("#inputIDs option:selected").val();
            $("[name = 'gzhi']").val(zhi);


            //返回表格的 Options
            var opts = $("#tables").bootstrapTable("getOptions");
            var limit = opts.pageSize;
            var offset = (opts.pagerNumber - 1) * limit;
            var supplierId = $("[name = 'gzhi']").val();


            $.get("${pageContext.request.contextPath}/Gshop/queryTJ",{'supplierId':supplierId,'limit':limit,'offset':offset},function (data) {

                //重新绑定表格数据
                $("#tables").bootstrapTable('load',data) ;
            })


        }
        //分店
        function fen() {
            var zhi = $("#inputID option:selected").val();
            $("[name = 'gzhis']").val(zhi);
        }
        //时间
        $(function () {
            $('#datetimepicker1').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn')
            });

            $('#datetimepicker2').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn')
            });

            $('#datetimepicker3').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn')
            });


        })

        //打开添加商品框

        function tianjia(index) {

            //取消所有选择
            $("#tables").bootstrapTable("uncheckAll");

            $("#tables").bootstrapTable("check", index);

            var row = $("#tables").bootstrapTable("getSelections")[0];

            $("[name = 'yxsId']").val(row.gshopId);
            $("[name = 'yxsName']").val(row.gshopName);
            $("[name = 'danWei']").val(row.danWei);
            $("[name = 'price']").val(row.price);
            $("[name = 'yileld']").val(row.yileld);
            $("[name = 'pledge']").val(row.pledge);
            $("[name = 'expiration']").val(row.expiration);
            //供货商编号
            var zhis = $("[name = 'gzhi']").val();
            $("[name = 'supplierIds']").val(zhis);
            $("[name = 'money']").val(row.price);
            $("[name = 'typeId']").val(row.typeId);

            $("#addmodal").modal("show");

        }

        /*采购单删除*/
        function shan(index) {

            //取消所有选择
            $("#stable").bootstrapTable("uncheckAll");

            $("#stable").bootstrapTable("check", index);

            var row = $("#stable").bootstrapTable("getSelections")[0];

            swal({
                title: "您确定要删除这条信息吗",
                text: "删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                closeOnConfirm: false
            },function(){
                $.post("${pageContext.request.contextPath}/Buyer/delInfo",{"id":row.id},function (data) {
                    $("#stable").bootstrapTable('load',data);
                    //提示增加成功
                    swal("删除成功！", "您已经永久删除了这条信息。", "success");

                })
            });

        }

       /* /!*打开采购单修改表*!/
        function xiu(index) {
            //取消所有选择
            $("#stable").bootstrapTable("uncheckAll");
            $("#stable").bootstrapTable("check", index);

            var row = $("#stable").bootstrapTable("getSelections")[0];
            $("[name = 'id']").val(row.id);
            $("[name = 'buId']").val(row.buId);
            $("[name = 'buName']").val(row.buName);
            $("[name = 'danWei']").val(row.danWei);
            $("[name = 'price']").val(row.price);
            $("[name = 'nums']").val(row.nums);
            $("[name = 'money']").val(row.money);


            $("#addmoda4").modal("show");
        }*/

        /*单个删除临时表信息*/
        function del(index) {

            //取消所有选择
            $("#table").bootstrapTable("uncheckAll");

            $("#table").bootstrapTable("check", index);

            var row = $("#table").bootstrapTable("getSelections")[0];

            swal({
                title: "您确定要删除这条信息吗",
                text: "删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                closeOnConfirm: false
            },function(){
                $.post("${pageContext.request.contextPath}/Yxshop/delInfo",{"id":row.id},function (data) {
                    $("#table").bootstrapTable('load',data);
                    //提示增加成功
                    swal("删除成功！", "您已经永久删除了这条信息。", "success");

                })
            });


        }

        /*修改临时表信息*/
        function upd(index) {
            //取消所有选择
            $("#table").bootstrapTable("uncheckAll");

            $("#table").bootstrapTable("check", index);

            var row = $("#table").bootstrapTable("getSelections")[0];

            $("[name = 'id']").val(row.id);
            $("[name = 'yxsId']").val(row.yxsId);
            $("[name = 'yxsName']").val(row.yxsName);
            $("[name = 'danWei']").val(row.danWei);
            $("[name = 'price']").val(row.price);
            $("[name = 'nums']").val(row.nums);
            $("[name = 'money']").val(row.money);
            $("[name = 'remake']").val(row.remake);

            $("#addmoda3").modal("show");

        }

        function bsc() {
            //序列化表单
            var formStr = $('#userforma').serialize()

            //处理表单控件的中文乱码
            params = decodeURIComponent(formStr,true);

            $.ajax({
                'type':'post',
                'url':'${pageContext.request.contextPath}/Buyer/updInfo',
                'data':params,
                success:function(data){
                    //关闭对话框
                    $("#addmoda4").modal('hide') ;
                    //友好的提示
                    swal("提示信息", "修改成功!", "success");
                    //重新加载表格
                    $("#stable").bootstrapTable('load',data) ;

                }
            })
        }

        /*添加商品*/
        function add() {


            $.ajax({
                type : 'post',
                url : '${pageContext.request.contextPath}/Yxshop/InsertInfo',
                data : new FormData($("#userform")[0]),
                contentType: false, //必须false才会自动加上正确的Content-Type
                processData: false,//必须false才会避开jQuery对 formdata 的默认处理XMLHttpRequest会对 formdata 进行正确的处理
                success : function (data) {
                    document.getElementById("userform").reset();
                    /*隐藏对话框*/
                    $("#addmodal").modal('hide');
                    $("#table").bootstrapTable('load',data);
                    //提示增加成功
                    swal("提示信息", "增加成功!", "success");
                }
            })



        }

        /*添加老商品*/
        function tian() {

            $("#addmoda2").modal("show");

        }

        /*修改临时表数据*/
        function bc() {
            //序列化表单
            var formStr = $('#userforms').serialize()

            //处理表单控件的中文乱码
            params = decodeURIComponent(formStr,true);

            $.ajax({
                'type':'post',
                'url':'${pageContext.request.contextPath}/Yxshop/updInfo',
                'data':params,
                success:function(data){
                    //关闭对话框
                    $("#addmoda3").modal('hide') ;
                    //友好的提示
                    swal("提示信息", "修改成功!", "success");
                    //重新加载表格
                    $("#table").bootstrapTable('load',data) ;

                }
            })
        }

        /*总金额*/
        function myFunction(is) {
            var dan = $("[name = 'price']").val();
            var nums = $(is).val();
            var moneys = dan * nums;
            $("[name = 'money']").val(moneys);
        }

        /*往采购单里面添加数据*/
        function cun() {
            var ids = "";//数据
            var sids = "";//编号
            //得到要删除的行
            //返回所选的行，当没有选择任何行的时候返回一个空数组。
            var rows = $("#table").bootstrapTable("getSelections") ;
            //判断是否选中所删除的行
            if(rows.length == 0){
                alert("请选择要添加的数据！");
            }else{
                $.each(rows,function (index,row) {
                    ids = ids + row.yxsId + "/" + row.yxsName + "/" + row.danWei + "/" +
                        row.price + "/" + row.nums + "/" + row.money +"/"+ row.suppliers.supplierId + "/"+ row.yileld+
                    "/"+ row.pledge + "/"+ row.expiration + "/" +row.shoptypes.typeId + "," ;
                });

                $.post("${pageContext.request.contextPath}/Buyer/InserList",{'ids': ids},function(data){

                    if(data != ""){

                        $.each(rows,function (index,row) {
                            sids = sids + row.id + "-" ;
                        });
                        /*删除所选数据*/
                        $.post("${pageContext.request.contextPath}/Yxshop/delList",{'sids': sids},function(data){

                            //友好的提示
                            swal("提示信息！", "保存成功！。", "success");
                            //刷新表格
                            $("#table").bootstrapTable('load',data) ;
                            $("#stable").bootstrapTable('load',data) ;

                            $("#addmoda2").modal('hide') ;


                            //返回表格的 Options
                            var opts = $("#stable").bootstrapTable("getOptions");
                            var limit = opts.pageSize;
                            var offset = (opts.pagerNumber - 1) * limit;

                            $.get("${pageContext.request.contextPath}/Buyer/queryFY",{'limit':limit,'offset':offset},function (data) {

                                //重新绑定表格数据
                                $("#stable").bootstrapTable('load',data) ;
                            })


                        });

                    }else
                    {
                        //友好的提示
                        swal("提示信息！", "保存失败！。", "success");
                    }


                })

            }

        }

        /*添加新商品*/
        function tian2() {


          $.post("${pageContext.request.contextPath}/Gshop/zuida",function (data) {

              //商品编号
              $("[name = 'buId']").val(data + 1);

            })


            document.getElementById("userfromv").reset();
            $("#userfromv").data('bootstrapValidator').resetForm();//清除当前验证的关键之处

            $("#addmoda5").modal("show");

        }

        /*点击添加新商品按钮*/
        function addx() {

            //启用校验
            $('#userfromv').data('bootstrapValidator').validate();

            //校验是否通过
            var flag = $('#userfromv').data('bootstrapValidator').isValid();

            if(flag){
                //添加供货商
                var gshopId = $("[name = 'buId']").val();//商品编号4
                var gshopName = $("[name = 'buName']").val();//商品名称
               /* var gshopName = $("#buNames").val();//商品名称*/
                var danwei = $("#danWeis").val();//单位
                var price = $("#prices").val();
                var supplierId = $("[name = 'supplierId']").val();
                var typeId = $("#typeIds").val();
                var pledge = $("#pledge").val();
                var expiration = $("#expiration").val();
                var yileld = $("#yileld").val();





               $.post("${pageContext.request.contextPath}/Gshop/InsertList",{"gshopId":gshopId,"gshopName":gshopName,"danWei":danwei,"price":price,"supplierId":supplierId ,"typeId":typeId,"yileld":yileld,"pledge":pledge,"expiration":expiration},function (data) {



                   $.ajax({
                       type : 'post',
                       url : '${pageContext.request.contextPath}/Buyer/InsertI',
                       data : new FormData($("#userfromv")[0]),
                       contentType: false, //必须false才会自动加上正确的Content-Type
                       processData: false,//必须false才会避开jQuery对 formdata 的默认处理XMLHttpRequest会对 formdata 进行正确的处理
                       success : function (data) {
                           document.getElementById("userfromv").reset();
                          /* 隐藏对话框*/
                           $("#addmoda5").modal('hide');
                           $("#stable").bootstrapTable('load',data) ;
                           //提示增加成功
                           swal("提示信息", "增加成功!", "success");
                       }
                   })


               })

            }

        }

        /*数量*/
        function mysFunction(index) {

            /*获取单价*/
            var dan = $("#prices").val();

            var nums = $(index).val();


                var money = dan * nums;
                $("[name = 'money']").val(money);



        }

        /*1数量*/
        function myeFunction(index) {
            /*获取单价*/
            var dan = $("[name = 'price']").val();

            var nums = $(index).val();


            var money = dan * nums;
            $("[name = 'money']").val(money);
        }

        /*提交*/
        function tijiao() {
            var ids = "";//数据
            var sids = "";//编号
            //得到要删除的行
            //返回所选的行，当没有选择任何行的时候返回一个空数组。
            var rows = $("#stable").bootstrapTable("getSelections") ;
            //判断是否选中所删除的行
            if(rows.length == 0){
                alert("请选择要添加的数据！");

            }else{
                //获取订单号
                var Number = $("#danhao").html();
                //获取仓库
                var StoreIds = $("[name = 'storeId']").val();
                //获取当前时间
                var date = new Date();//创建时间对象
                var year = date.getFullYear();//获取年
                var month = date.getMonth() + 1;//获取月
                var day = date.getDate();//获取天
                var time = year + "-" + month + "-" + day;
                //获取应付金额
                var yingF = $("#yinfu").html();
                //获取实付金额
                var shiF = $("[name = 'shifu']").val();

                //经办人
               /* var jing = $("#inpustsID").val();*/
                var jing ="admin3"
                console.log(jing);
           /*     alert(jing)*/
                //操作员
                var managerId = $("[name = 'ManagerId']").val();
           /*     alert(managerId)*/ /* 获取是个空   bissdap 控制器里边没写*/
                //审核Id 1
                var auditId = 2;
                //单据类型
                var typeId = 1;
                //备注
                var remake = $("[name = 'remakes']").val();

                $.post("${pageContext.request.contextPath}/bills/InserList",{'Number': Number,
                                                                                'typeId':typeId,
                                                                                'StoreIds': StoreIds,
                                                                                'time': time,
                                                                                'yingF': yingF,
                                                                                'shiF': shiF,
                                                                                'jing': jing,
                                                                                'managerId': managerId,
                                                                                'auditId': auditId,
                                                                                'remake': remake},function(data){
                    $.each(rows,function (index,row) {
                        ids = ids + Number+"/"+ row.buId + "/" + row.buName + "/" + row.danWei + "/" +
                            row.price + "/" + row.nums + "/" + row.money +"/"+ row.yileld + "/"+
                            row.pledge + "/"+row.expiration+"/"+row.suppliers.supplierId+ "/"+
                            row.shoptypes.typeId +"/"+ StoreIds +"," ;
                    });

                    $.post("${pageContext.request.contextPath}/Details/InserList",{'ids': ids},function(data){

                        /*删除表里的数据*/
                        if (data == 1){
                            $.each(rows,function (index,row) {
                                sids = sids + row.id + "-" ;
                            });


                            $.post("${pageContext.request.contextPath}/Buyer/delD",{'sids': sids},function(data){
                                //友好的提示
                                swal("提示信息！", "保存成功！。", "success");


                                function pad2(n) { return n < 10 ? '0' + n : n }
                                function generateTimeReqestNumber() {
                                    var date = new Date();
                                    return date.getFullYear().toString() + pad2(date.getMonth() + 1) + pad2(date.getDate()) + pad2(date.getHours()) + pad2(date.getMinutes()) ;
                                }
                                var rand = Math.floor(Math.random() * 900) + 100;
                                var order_id =   rand + generateTimeReqestNumber();

                                var one = 1;
                                var hao = parseInt(order_id) + parseInt(one);

                                var danhao = "DJ" + hao;

                                $("#danhao").html(danhao);

                                //刷新表格
                                $("#stable").bootstrapTable('load',data) ;

                            })

                        }


                    })



                })


            }
        }

        /*提交*/


    </script>



<body>

<%--表格--%>

<div class="panel panel-default">
    <div class="panel-heading">
        <h2 class="panel-title">进货列表</h2>
    </div>
    <div style="height: 50px"></div>
    <div class="panel-body">
        <div class="row">
            <form action="" method="post" role="form" class="form-horizontal">

                <input type="hidden" name="ManagerId" value="${Mapper.managerId}">


                        <%--单号--%>
                        <div class="col-sm-8 form-group" hidden>
                            <label for="" class="col-sm-3 text-right control-label">单号:</label>
                            <div class="col-sm-8">
                                <h3 style="color: red" id="danhao"></h3>
                            </div>
                        </div>
            </form>


        </div>


        <div class="row"></div>

        <%--添加商品--%>
        <div class="row">
            <%--分店--%>
            <div class="col-sm-3 form-group" hidden>
                <label for="" class="col-sm-3 text-right control-label">邯郸翱翔仓库:</label>
                <div class="col-sm-8">
                    <select name="storeId" id="inputID" class="form-control k" onchange="fen()">
                    </select>

                    <input type="hidden" name="gzhis">
                </div>
            </div>
            <div class="col-sm-3">

                <button class="btn btn-primary" onclick="tijiao()" type="button"><span class=""></span>提交订单</button>
                <button class="btn btn-primary" onclick="tian2()" type="button">&nbsp;添加新商品</button>


            </div>
        </div>

        <div class="row">&nbsp;</div>

        <%--表格--%>
        <div class="row">
            <div class="col-sm-12">
                <table id="stable"></table>
            </div>
        </div>

    </div>



</div>
<%--底层--%>
<div class="row">
    <form action="" method="post" role="form" class="form-horizontal">

        <div class="col-sm-3 form-group"  hidden >
            <div class="col-sm-12">
                <label for="" class="col-sm-4 text-right control-label" style="font-size: 16px">应付金额:</label>
                <h3 style="color:red;">￥<span id="yinfu" style="font-size: 20px; left: -50px; ">0</span></h3>
            </div>
        </div>



        <div class="col-sm-3 form-group"   hidden>
            <label for="" class="col-sm-3 text-right control-label" style="font-size: 16px">实付金额:</label>
            <div class="col-sm-4">
                <input type="text" name="shifu" style="width: 70px;height: 30px;" value="0">
            </div>
        </div>


        <div class="col-sm-3 form-group" hidden>
            <label for="" class="col-sm-3 text-right control-label" style="font-size: 16px">备注:</label>
            <div class="col-sm-4">
                <input type="text" name="remakes" style="height: 30px;">
            </div>
        </div>

        <%--经办人--%>
        <div class="col-sm-3 form-group " hidden>
            <label for="" class="col-sm-3 text-right control-label" style="font-size: 16px">经办人:</label>
            <div class="col-sm-8">
                <select name="storeId" id="inpustsID" class="form-control l">
                </select>

                <input type="hidden" name="gzhis">
            </div>
        </div>

    </form>
</div>





<%--修改--%>
<div class="modal inmodal" id="addmoda4" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
    <div class="modal-dialog">
        <form class="form-horizontal" id="userforma"  method="post" role="form">
            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">商品信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 text-right" for="">商品编号:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="buId" readonly/>
                            <input type="hidden" class="form-control" name="id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">商品名称:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="buName"  readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">单位:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="danWei"  readonly/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">单价:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="price"  readonly/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">数量:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="nums" oninput="myFunction(this)"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">总金额:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="money" value="" readonly/>
                        </div>
                    </div>



                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="close()">关闭</button>
                        <button type="button" name="tj" onclick="bsc()" class="btn btn-primary">保存</button>
                    </div>

                </div>
            </div>
        </form>
    </div>
</div>



<%--添加老商品--%>
<div class="modal inmodal" id="addmoda2" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInLeft" style="width: 1300px; left: -340px">
            <div class="container" style="height: 750px;">

                <div class="row">&nbsp;</div>






                <%--修改--%>
                <div class="modal inmodal" id="addmoda3" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
                    <div class="modal-dialog">
                        <form class="form-horizontal" id="userforms"  method="post" role="form">
                            <div class="modal-content animated bounceInLeft">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <h4 class="modal-title">商品信息</h4>
                                </div>


                                <div class="modal-body">
                                    <div class="form-group">
                                        <label class="col-sm-3 text-right" for="">商品编号:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="yxsId" readonly/>
                                            <input type="hidden" class="form-control" name="id">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="" class="col-sm-3 text-right">商品名称:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="yxsName"  readonly/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="" class="col-sm-3 text-right">单位:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="danWei" readonly/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="" class="col-sm-3 text-right">单价:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="price" readonly/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                    <label for="" class="col-sm-3 text-right">数量:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="nums" oninput="myFunction(this)"/>
                                    </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="" class="col-sm-3 text-right">总金额:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="money" value="" readonly/>
                                        </div>
                                    </div>


                                            <input type="hidden" class="form-control" name="money" />




                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="close()">关闭</button>
                                        <button type="button" name="tj" onclick="bc()" class="btn btn-primary">保存</button>
                                    </div>

                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>





        </div>
    </div>
</div>

<%--添加新商品--%>
<div class="modal inmodal" id="addmoda5" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
    <div class="modal-dialog">
        <form class="form-horizontal" id="userfromv"  method="post" role="form">
            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">商品信息</h4>
                </div>


                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 text-right" for="">商品编号:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="buId" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">商品名称:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="buName" id="buName" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">单位:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="danWei" id="danWeis" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">单价:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="price" id="prices" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">数量:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="nums" oninput="mysFunction(this)"/>
                        </div>
                    </div>
                    <%--供货商--%>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">供货商:</label>
                        <div class="col-sm-8">
                            <select name="supplierId" id="supp" class="form-control o">

                            </select>
                        </div>
                    </div>
                    <%--商品类型--%>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">商品类型一级:</label>
                        <div class="col-sm-8">
                            <select   name="typeId" id="typeIds" class="form-control v">
                                <option value="0">请选择</option>
                            </select>
                        </div>
                    </div>
                    <%--商品类型--%>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">商品类型二级:</label>
                        <div class="col-sm-8">
                            <select   name="typeId" id="" class="form-control vv">
                                <option value="0">请选择</option>
                            </select>
                        </div>
                    </div>

                    <%--商品类型--%>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">商品类型三级:</label>
                        <div class="col-sm-8">
                            <select   name="typeId" id="" class="form-control vvv">
                                <option value="0">请选择</option>
                            </select>
                        </div>
                    </div>

                    <%--生产日期--%>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">生产日期:</label>
                        <div class="col-sm-8">
                            <div class="input-group" id="datetimepicker2">
                                <input name="yileld" type='text' class="form-control" id="yileld"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>

                        </div>
                    </div>
                    <%--保质期--%>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">保质期:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="pledge" id="pledge"/>
                        </div>
                    </div>
                    <%--到期时间--%>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">到期时间:</label>
                        <div class="col-sm-8">
                            <div class="input-group" id="datetimepicker3">
                                <input name="expiration" type='text' class="form-control" id="expiration"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>

                        </div>
                    </div>
                    <%--总金额--%>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">总金额:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="money" readonly/>
                        </div>
                    </div>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="close()">关闭</button>
                        <button type="button" name="tj" onclick="addx()" class="btn btn-primary">添加</button>
                    </div>

                </div>
            </div>
        </form>
    </div>
</div>


</body>
</html>

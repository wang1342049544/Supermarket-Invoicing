
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>  库存报警</title>
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

    <script>


        function searcha(){
            //返回表格的 Options
            var opts = $("#tables").bootstrapTable("getOptions");
            var limit = opts.pageSize;
            var offset = (opts.pagerNumber - 1) * limit;
            var mname = $("#sName").val();


            $.get("${pageContext.request.contextPath}/customer/TJquery",{'sName':sName,'limit':limit,'offset':offset},function (data) {

                //重新绑定表格数据s
                $("#tables").bootstrapTable('load',data) ;
            })
        }

        $(function () {



            $("#tables").bootstrapTable({

                url:'${pageContext.request.contextPath}/KCT/queryyy',
                height:'400',
                pageSize : 6,
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
                        sName:$("#sName").val()
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
                        field:'kcId',
                        title:'商品编号',
                        align:'center'
                    },
                    {
                        field:'sName',
                        title:'商品名称',
                        align:'center'
                    },
                    {
                        field:'nums',
                        title:'数量',
                        align:'center'
                    },
                    {
                        field:'shoptype.typeName',
                        title:'商品类型',
                        align:'center'
                    },
                    {
                        field:'danWei',
                        title:'单位',
                        align:'center'
                    },
                    {
                        field:'jprice',
                        title:'售价',
                        align:'center'
                    },

                    {
                        field: 'yileld',
                        title: '生产日期',
                        align: 'center'
                    },
                    {
                        field: 'pledge',
                        title: '保质期',
                        align: 'center'
                    },
                    {
                        field: 'expiration',
                        title: '到期日期',
                        align: 'center'
                    },

                    {
                        field: 'guoqi',
                        title: '状态',
                        align: 'center',
                        formatter: function (varlue, row, index) {
                            return "快过期"

                        }
                    },
                    {
                        title: '操作',
                        align: 'center',
                        formatter: function (varlue, row, index) {
                            return "<button style='background: red;border: red;' class='btn btn-info' onclick='cuxiao("+index+")'>促销</button>"

                        }
                    }
                ]
            })

        });


        function adda(index) {

            $("#tables").bootstrapTable("uncheckAll");

            $("#tables").bootstrapTable("check", index);

            var row = $("#tables").bootstrapTable("getSelections")[0];

            $("[name = 'buId']").val(row.buId);
            $("[name = 'buName']").val(row.buName);
            $("[name = 'danWei']").val(row.danWei);
            $("[name = 'price']").val(row.price);
            $("[name = 'typeId']").val(row.typeId);
            $("[name = 'yileId']").val(row.yileId);
            $("[name = 'pledge']").val(row.pledge);
            $("[name = 'expiration']").val(row.expiration);
            $("[name = 'jifen']").val(row.jifen);



            $("#addmoda1").modal('show');

        }

        /*添加按钮*/

        function addx() {

            $.ajax({
                type : 'post',
                url : '${pageContext.request.contextPath}/CKXQ/Insertlist',
                data : new FormData($("#userfromv")[0]),
                contentType: false, //必须false才会自动加上正确的Content-Type
                processData: false,//必须false才会避开jQuery对 formdata 的默认处理XMLHttpRequest会对 formdata 进行正确的处理
                success : function (data) {
                    document.getElementById("userfromv").reset();
                    /*隐藏对话框*/
                    $("#addmoda1").modal('hide');
                    $("#tables").bootstrapTable('load',data);
                    //提示增加成功
                    swal("提示信息", "增加成功!", "success");
                }
            })

        }


    </script>
</head>
<body>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">销售报警</h3>
    </div>
    <div class="panel-body">
        <div class="row">
        </div>

        <div class="row">

            <div class="col-sm-12 form-group">
                <form  class="form-inline">
                    <input id="number" type="text" class="form-control">
                    <button style="background: red;border: red" class="btn btn-primary" onclick="searcha()" type="button"><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;搜索</button>
                </form>
            </div>

        </div>

    </div>

    <div class="row">
        <div class="col-sm-12">
            <table id="tables"></table>
        </div>
    </div>

</div>


<%--添加信息--%>
<%--添加新商品--%>
<div class="modal inmodal" id="addmoda1" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
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
                            <input type="text" class="form-control" name="buName" id="buName" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">单位:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="danWei" id="danWei" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">单价:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="price" id="price" readonlys/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">数量:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="num" value="1"/>
                        </div>
                    </div>
                    <%--商品类型--%>
                    <input type="hidden" name="typeId">
                    <%--生产日期--%>
                    <input type="hidden" name="yileId">
                    <%--保质期--%>
                    <input type="hidden" name="pledge">
                    <%--到期日期--%>
                    <input type="hidden" name="expiration">
                    <%--积分--%>
                    <input type="hidden" name="jifen">


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

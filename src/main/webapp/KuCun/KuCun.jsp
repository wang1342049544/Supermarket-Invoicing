
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../com/tagg.jsp"/>
    <link rel="stylesheet" href="../static/login/bootstrap.min.css">
<%--
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

    &lt;%&ndash;统计图&ndash;%&gt;
    <script src="${pageContext.request.contextPath}/static/echarts/echarts.js"></script>
    <script src="${pageContext.request.contextPath}/static/echarts/roma.js"></script>
    <script src="${pageContext.request.contextPath}/static/echarts/dark.js"></script>

    &lt;%&ndash;sweet提示框&ndash;%&gt;
    <link href="${pageContext.request.contextPath}/static/hplus/css/plugins/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/hplus/js/plugins/sweetalert/sweetalert.min.js" type="text/javascript"></script>

    &lt;%&ndash;选择&ndash;%&gt;
    <link href="${pageContext.request.contextPath}/static/Select/bootstrap-select.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/Select/bootstrap-select.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/Select/bootstrap-select.js"></script>

    &lt;%&ndash;上传图片&ndash;%&gt;
    <link href="${pageContext.request.contextPath}/static/fileinput/css/fileinput.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/fileinput/js/fileinput.js"></script>
    <script src="${pageContext.request.contextPath}/static/fileinput/js/locales/zh.js"></script>


    &lt;%&ndash;treeview树状菜单&ndash;%&gt;
    <link href="${pageContext.request.contextPath}/static/treeview/bootstrap-treeview.min.css">
    <script src="${pageContext.request.contextPath}/static/treeview/bootstrap-treeview.min.js"></script>

    &lt;%&ndash;时间控件&ndash;%&gt;
    <script src="${pageContext.request.contextPath}/static/date/Moment.js"></script>
    <link href="${pageContext.request.contextPath}/static/date/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/date/bootstrap-datetimepicker.min.js"></script>


    &lt;%&ndash;百度地图&ndash;%&gt;
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ekDr2vIa7mG0VgglUSxDzj2xF7csC0Az"></script>

    &lt;%&ndash;导出数据&ndash;%&gt;
    <script href="${pageContext.request.contextPath}/static/fileinput/js/plugins/purify.js/purify.min.js"></script>
--%>

    <title>库存查询</title>
</head>

    <script>





   var  num  ;
        /*进货库存有的商品*/
        function xiu(index) {



         //取消所有选择
            $("#tables").bootstrapTable("uncheckAll");
            //选中要修改的行
            $("#tables").bootstrapTable("check", index);
            var row = $("#tables").bootstrapTable("getSelections")[0];
            if(row.nums <20){
                alert("库存数量不足")
                return;
            }else{

                $("[name = 'id']").val(row.id);
                $("[name = 'kcId']").val(row.kcId);
                $("[name = 'sName']").val(row.sName);
                $("[name = 'danWei']").val(row.danWei);
                $("[name = 'sprice']").val(row.sprice);
                $("[name = 'nums']").val(row.nums);
                $("[name = 'money']").val(row.money);
                num =  row.nums;
                console.log(num);
                $("#addmoda5").modal("show");
            }
            alert(num)

        }


        /*查看*/
        function cha(index) {

            //取消所有选择
            $("#tables").bootstrapTable("uncheckAll");
            //选中要修改的行
            $("#tables").bootstrapTable("check", index);
            var row = $("#tables").bootstrapTable("getSelections")[0];
            $("[name = 'id']").val(row.id);
            $("[name = 'kcId']").val(row.kcId);
            $("[name = 'sName']").val(row.sName);
            $("[name = 'danWei']").val(row.danWei);
            $("[name = 'sprice']").val(row.sprice);
            $("[name = 'nums']").val(row.nums);
            $("[name = 'money']").val(row.money);
            $("[name = 'jprice']").val(row.jprice);
            $("[name = 'supplier.supName']").val(row.supplier.supName);
            $("[name = 'yileld']").val(row.yileld);
            $("[name = 'pledge']").val(row.pledge);
            $("[name = 'expiration']").val(row.expiration);
            $("[name = 'queState']").val(row.queState);
            $("[name = 'store.storeName']").val(row.store.storeName);
            $("[name = 'shoptype.typeName']").val(row.shoptype.typeName);
            $("#addmoda9").modal("show");

        }







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
                url:'${pageContext.request.contextPath}/KCT/TJquery',
                height:'500',
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
                        title:'库存编号',
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
                        field:'danWei',
                        title:'单位',
                        align:'center'
                    },
                    {
                        field:'nums',
                        title:'数量',
                        align:'center'
                    },
                    {
                        field:'jprice',
                        title:'售价',
                        align:'center'
                    },
                    {
                        field:'sprice',
                        title:'进价',
                        align:'center'
                    },
                    {
                        field:'supplier.supName',
                        title:'供货商',
                        align:'center'
                    },
                   /* {
                        field:'store.storeName',
                        title:'仓库',
                        align:'center'
                    },*/
                    {
                        field:'shoptype.typeName',
                        title:'商品类型',
                        align:'center'
                    },/*
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
                        title:'到期时间',
                        align:'center'
                    },*/
                   /* {
                        field:'queState',
                        title:'是否缺货',
                        align:'center',
                        formatter:function (value,row,index) {
                            if (row.queState==0){
                                return '不缺货' ;
                            }
                            else {
                                return '缺货' ;
                            }
                        }
                    }
                    ,*/
                    {
                        title:'操作',
                        align:'center',
                        formatter:function (varlue,row,index) {
                            return  "<button class='btn btn-info' onclick='xiu("+index+")'>出库</button>"+
                                    " <button class='btn btn-info' onclick='cha("+index+")'>查看</button> "

                        }
                        }
                ]



            })






        })




  //进货叠加
        function update() {

            //启用校验
            //序列化表单
            var formStr = $('#userformaa').serialize()

            //处理表单控件的中文乱码
            params = decodeURIComponent(formStr,true);

            console.log( parseInt($("[name = 'nums']").val() ) +parseInt(num))

            $.ajax({
                'type':'post',
                'url':'${pageContext.request.contextPath}/KCT/updateInfo',
                data:{
                    id:$("[name = 'id']").val(),
                    nums:parseInt(  parseInt(num) -$("[name = 'nums']").val())
                },
                success:function(data){
                    //关闭对话框
                    $("#addmoda5").modal('hide') ;
                    //友好的提示
                    swal("提示信息", "修改成功!", "success");
                    //重新加载表格


                }
            })
        }



    </script>

<body>

<div class="panel panel-default" >

    <div class="panel-body"><h2 style="color:#0d8ddb;text-align:center">库存管理&nbsp;&nbsp;&nbsp;<button class="btn btn-primary" onclick="searcha()" type="button"><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;搜索</button></h2>
        <br>
        <br>
        <div class="row">



            <%--分店--%>
            <div class="col-sm-3">
                <label for="" class="col-sm-3 text-right"  style="font-size: 15px;color: #0c0f13">仓库:</label>
                <div class="col-sm-8">
                    <select name="storeId" id="inputID" class="form-control k" onchange="fen()">
                        <option value="0">全部</option>
                    </select>

                    <input type="hidden" name="gzhis">
                </div>
            </div>

        <%--    &lt;%&ndash;供货商&ndash;%&gt;
            <div class="col-sm-3">
                <label class="col-sm-3 text-right" style="font-size: 15px;color: #0c0f13">供货商:</label>
                <div class="col-sm-8">
                    <select name="supllierId" id="inputIDs" class="form-control o" onchange="dan()">
                        <option value="0">全部</option>
                    </select>

                    <input type="hidden" name="gzhi" value="1">
                </div>
            </div>--%>

                <br>  <br>  <br>
         <%--   &lt;%&ndash;商品类型&ndash;%&gt;
            <div class="col-sm-3">
                <label class="col-sm-3 text-right" style="font-size: 15px;color: #0c0f13">类型:</label>
                <div class="col-sm-8">
                    <select name="supllierId" id="" class="form-control o" onchange="dan()">
                        <option value="0">全部</option>
                    </select>

                    <input type="hidden" name="gzhi" value="1">
                </div>
            </div>--%>



              <%--  <div class="col-sm-3">
                    <label class="col-sm-3 text-right" style="font-size: 15px;color: #0c0f13">商品名:</label>
                    <div class="col-sm-8">
                        <input id="sName" type="text" class="form-control">
                    </div>
                </div>--%>

        </div>

        <div class="row">
            <div class="col-sm-12">

                <table id="tables"></table>

            </div>
        </div>

    </div>
</div>





<div class="panel panel-default">


    <div class="panel-body">
        <div class="row">
            <br>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <table id="t"></table>
        </div>
    </div>


    <div class="row">&nbsp;</div>

    <div class="row">
        <div class="col-sm-12">
            <table id="twoTables"></table>
        </div>
    </div>

</div>







<%--修改--%>
<div class="modal inmodal" id="addmoda5" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
    <div class="modal-dialog">
        <form class="form-horizontal" id="userformaa"  method="post" role="form">
            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">修改商品信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 text-right" for="">商品编号:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="kcId" readonly/>
                            <input type="hidden" class="form-control" name="id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">商品名称:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="sName"  readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">单位:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="danWei"  readonly/>
                        </div>
                    </div>



                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">数量:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="nums" />
                        </div>
                    </div>





                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="close()">关闭</button>
                        <button type="button" name="tj" onclick="update()" class="btn btn-primary">确认出库</button>
                    </div>

                </div>
            </div>
        </form>
    </div>
</div>













<%--查看--%>
<div class="modal inmodal" id="addmoda9" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
    <div class="modal-dialog">
        <form class="form-horizontal" id=""  method="post" role="form">
            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">库存信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 text-right" for="">商品编号:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="kcId" readonly/>
                            <input type="hidden" class="form-control" name="id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">商品名称:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="sName"  readonly/>
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
                            <input type="text" class="form-control" name="sprice"  readonly/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">售价:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="jprice"  readonly/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">供货商:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="supplier.supName"  readonly/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">仓库:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="store.storeName"  readonly/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">商品类型:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="shoptype.typeName"  readonly/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">生产日期:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="yileld"  readonly/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">保质期:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="pledge"  readonly/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">到期时间:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="expiration"  readonly/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">是否缺货:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="queState"  readonly/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">数量:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="nums"  readonly/>
                        </div>
                    </div>




                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">总金额:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="money" value="" readonly/>
                        </div>
                    </div>



                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="close()">返回上一级</button>
                    </div>

                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script>

    function searcha(){
        //返回表格的 Options
        var opts = $("#t").bootstrapTable("getOptions");
        var limit = opts.pageSize;
        var offset = (opts.pagerNumber - 1) * limit;
        var number = $("#number").val();
        var storeId = $("[name = 'storeId']").val();

        $.get("${pageContext.request.contextPath}/rbills/queryFY",{'storeId':storeId,'number':number,'limit':limit,'offset':offset},function (data) {

            //重新绑定表格数据
            $("#tables").bootstrapTable('load',data) ;
        })
    }

    $(function () {

        /*仓库*/
        $.ajax({
            url:'${pageContext.request.contextPath}/Store/Storelist',
            type:"get",
            success:function(data){
                $.each(data,function(){
                    var adds=$("<option value='"+this.storeId+"'>"+this.storeName+"</option>");
                    $(".o").append(adds);


                });
            }
        })


        $("#t").bootstrapTable({

            url:'${pageContext.request.contextPath}/rbills/queryFY?storeId=0',
            toolbar:'#br',
            height:'300',
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
                    field:'number',
                    title:'单据号',
                    align:'center'
                },
                {
                    field:'billstype.typeName',
                    title:'单据类型',
                    align:'center'
                },
                {
                    field:'danTime',
                    title:'开单时间',
                    align:'center'
                },
                {
                    field:'store.storeName',
                    title:'所属仓库',
                    align:'center'
                },

                {
                    field:'shiF',
                    title:'总金额',
                    align:'center'
                },

                {
                    field:'stateId',
                    title:'状态',
                    align:'center',
                    formatter:function (value,row,index) {
                        if (row.stateId==0){
                            return '未入库' ;
                        }
                        else {
                            return '已入库' ;
                        }
                    }
                },
                {
                    title:'操作',
                    align:'center',
                    formatter:function (varlue,row,index) {
                        return "<button class='btn btn-info' onclick='shenhe("+index+")'>确定入库</button>"

                    }
                }
            ],
            onClickRow : function(row, $element){
                var index = $element.data('index');
                $("#t").bootstrapTable("uncheckAll");
                console.log(row);
                //选中要修改的行
                $("#t").bootstrapTable("check",index);

                $.post('${pageContext.request.contextPath}/Rdetails/queryList',{'number':row.number},function(data) {
                    $("#twoTables").bootstrapTable('load',data);
                })
            }
        })

    });


    /*审核*/
    function shenhe(index) {
        //取消所有选择
        $("#t").bootstrapTable("uncheckAll");

        $("#t").bootstrapTable("check", index);

        var row = $("#t").bootstrapTable("getSelections")[0];


        /*判断审核是否通过*/
        $.post("${pageContext.request.contextPath}/rbills/TG",{"number":row.number},function (data) {
            if(data == 1){
                swal("审核已通过！", "审核通过。", "warning");
            }else{

                swal({
                    title: "您确定要审核这条单据吗？",
                    text: "请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Yes",
                    closeOnConfirm: false
                },function() {
                    $.post("${pageContext.request.contextPath}/rbills/updatelist",{"number":row.number},function (data) {
                        $("#t").bootstrapTable('load',data);

                        if(data != null){

                            //根据单号查询入库信息表
                            $.post("${pageContext.request.contextPath}/Rdetails/queryLists",{"number":row.number},function (data) {



                                if(data == 1){
                                    swal("审核通过！", "审核通过。", "success");
                                    $("#twoTables").bootstrapTable("removeAll");
                                }

                            })

                        }else {
                            swal("审核异常！", "审核异常。", "warning");
                        }



                    })

                })
            }


        })



    }




</script>
</html>

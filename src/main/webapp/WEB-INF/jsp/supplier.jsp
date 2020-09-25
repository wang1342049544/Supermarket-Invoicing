
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/com/tagg.jsp"/>
    <title>供货商设置</title>
    <link rel="stylesheet" href="../static/login/bootstrap.min.css">
    <link href="../static/statics/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <link href="../static/statics/css/nprogress.css" rel="stylesheet">
    <link href="../static/statics/css/custom.min.css" rel="stylesheet">
    <script src="../static/statics/js/jquery.min.js"></script>
    <script src="../static/statics/js/bootstrap.min.js"></script>
    <script src="../static/statics/js/moment.min.js"></script>
    <script src="../static/statics/js/daterangepicker.js"></script>
    <script src="../static/statics/js/custom.min.js"></script>
    <script src="../static/statics/js/nprogress.js"></script>
    <script src="../static/statics/js/fastclick.js"></script>
    <script src="../static/statics/js/validator.js"></script>
    <style type="text/css">
        #myditu{
            height: 360px;
            width: 550px;
        }
    </style>
</head>


<script>

    //条件查询
    function searcha(){
        //返回表格的 Options
        var opts = $("#tables").bootstrapTable("getOptions");
        var limit = opts.pageSize;
        var offset = (opts.pagerNumber - 1) * limit;
        var supName = $("#supName").val();

        $.get("${pageContext.request.contextPath}/Supplier/TJquery",{'supName':supName,'limit':limit,'offset':offset},function (data) {

            //重新绑定表格数据
            $("#tables").bootstrapTable('load',data) ;
        })
    }





    $(function () {

        <!--校验框架-->
        $('#userform').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {

                supName:{
                    message:'',
                    validators: {
                        notEmpty: {
                            message: '供货商名称不能为空！'
                        }
                    }
                },

                phone:{
                    validators: {
                        notEmpty: {
                            message: '手机号码不能为空！'
                        }
                    }

                },
                address:{
                    validators: {
                        notEmpty: {
                            message: '地址不能为空！'
                        }
                    }

                }

            }
        });




        //表格信息
        $("#tables").bootstrapTable({
            url:'${pageContext.request.contextPath}/Supplier/TJquery',
            toolbar:'#br',
            height:'400',

            pageSize : 3,
            pageList:[2,3,4,8],
            pagerNumber:1,
            //启用分页，但默认情况下，是客户端分页
            pagination:true,
            //启用服务器端分页
            sidePagination : 'server',

         /*   queryParams:function(params){

                var temp = {
                    limit : params.limit,//页面大小
                    offset:params.offset,//页面
                    supName:$("#supName").val()
                };
                return temp;

            },*/

            columns:[
                {
                    checkbox:true
                },
                {
                    field:'supplierId',
                    title:'编号',
                    align:'center'
                },
                {
                    field:'supName',
                    title:'供货商名称',
                    align:'center'
                },
                {
                    field:'phone',
                    title:'联系电话',
                    align:'center'
                },
                {
                    field:'supptype.typeName',
                    title:'供货商类型',
                    align:'center'
                },
                {
                    field:'address',
                    title:'联系地址',
                    align:'center'
                },




                {

                    title:'操作',
                    align:'center',
                    formatter:function (varlue,row,index) {
                        return " <button onclick=\"toupdate("+index+")\" class='btn btn-info'><span class='glyphicon glyphicon-pencil'></span>&nbsp;修改</button> " +
                            "  "
                            +"  ";

                    }
                }
            ]

        })


    })


    /*打开添加模态框*/
    function toadd() {

        document.getElementById("userform").reset();

        $("#userform").data('bootstrapValidator').resetForm();//清除当前验证的关键之处

        $("#zhi").val(1);

        $("#addmodal").modal("show");

    }

    /*打开修改模态框*/
    function toupdate(index){

        document.getElementById("userform").reset();//清空数据
        $("#userform").data('bootstrapValidator').resetForm();//清除当前验证的关键之处

        //取消所有选择
        $("#tables").bootstrapTable("uncheckAll");
        //选中要修改的行
        $("#tables").bootstrapTable("check", index);
        //得到所选行的数据
        var row = $("#tables").bootstrapTable("getSelections")[0];

        //绑定主键
        $("input[name = 'supplierId']").val(row.supplierId);
        //绑定当前页开始
        var options = $('#tables').bootstrapTable('getOptions');
        //得到当前页
        var pn = options.pagerNumber;
        //绑定当前页
        $("input[name = 'pn']").val(pn);
        $("#supNames").val(row.supName);
        $("#phone").val(row.phone);
        $("#address").val(row.address);

        $("#typeId").val(row.typeId);


        $("#zhi").val(2);
        $("#addmodal").modal("show");

    }


    /*绑定供货商类型*/
    $(function () {

        $.ajax({
            url:'${pageContext.request.contextPath}/Supptype/querylist',
            type:"get",
            success:function(data){
                $.each(data,function(){
                    var adds=$("<option value='"+this.typeId+"'>"+this.typeName+"</option>");
                    $(".k").append(adds);
                });
            }
        })


    })

    /*点击保存按钮*/
    function add() {

        var zhi = $("[name = 'zhi']").val();

        if(zhi == 1){
       /*     alert($("#supNames").val())
*/
            //启用校验
            $('#userform').data('bootstrapValidator').validate();

            //校验是否通过
            var flag = $('#userform').data('bootstrapValidator').isValid();

            if (flag){

                //序列化表单
                var formStr = $('#userform').serialize();
               /* alert(formStr)*/


                //处理表单控件的中文乱码
                params = decodeURIComponent(formStr,true);

              /*  alert(params);*/

                $.post('${pageContext.request.contextPath}/Supplier/InsertInfo',params,function (data) {
                    //关闭模态框
                    $("#addmodal").modal('hide');
                    //清空数据
                    document.getElementById("userform").reset();

                    //友好提示
                    swal("提示信息", "添加成功!", "success");

                    //重新绑定表格数据
                    $("#tables").bootstrapTable('load',data) ;


                });


            }


        }
        else if(zhi == 2) {

            //启用校验
            $('#userform').data('bootstrapValidator').validate();

            //校验是否通过
            var flag = $('#userform').data('bootstrapValidator').isValid();

            if(flag){

                //序列化表单
                var formStr = $('#userform').serialize()

                //处理表单控件的中文乱码
                params = decodeURIComponent(formStr,true);

                $.ajax({
                    type:'post',
                    url:'${pageContext.request.contextPath}/Supplier/updateInfo',
                    data:params,
                    success:function(data){
                        //关闭对话框
                        $("#addmodal").modal('hide') ;
                        //友好的提示
                        swal("提示信息", "修改成功!", "success");
                        //重新加载表格
                        $("#tables").bootstrapTable('load',data) ;

                    }
                })

            }

        }

    }

    /*删除*/

    function todel() {

        var ids = "";
        //得到要删除的行
        //返回所选的行，当没有选择任何行的时候返回一个空数组。
        var rows = $("#tables").bootstrapTable("getSelections") ;
        //判断是否选中所删除的行
        if(rows.length == 0){
            alert("请选择要删除的数据！");
        }
        else
        {

            $.each(rows,function (index,row) {
                ids = ids + row.supplierId + "-";
            });

            swal({
                title: "您确定要删除这条信息吗",
                text: "删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                closeOnConfirm: false
            },function () {
                //得到当前页
                //绑定当前页开始
                var options = $("#tables").bootstrapTable('getOptions') ;
                //得到当前页
                var pn = options.pageNumber ;
                $.post("${pageContext.request.contextPath}/Supplier/delInfo",{'ids': ids,'pn':pn},function(data){
                    //友好的提示
                    swal("删除成功！", "您已经永久删除了这条信息。", "success");
                    //刷新表格
                    $("#tables").bootstrapTable('load',data) ;
                })

            });

        }

    }
    function dizhi(dizhi) {
        var map = new BMap.Map("myditu");
        // 创建地址解析器实例
        var myGeo = new BMap.Geocoder();
        // 将地址解析结果显示在地图上，并调整地图视野
        myGeo.getPoint(dizhi, function(point){
                if (point) {
                    map.centerAndZoom(point, 16);
                    map.addOverlay(new BMap.Marker(point));
                    var opts = {
                        width : 150,     // 信息窗口宽度
                        height: 50,     // 信息窗口高度
                        //title : "地址"  // 信息窗口标题
                    };
                    var infoWindow = new BMap.InfoWindow(dizhi, opts);  // 创建信息窗口对象
                    map.openInfoWindow(infoWindow, map.getCenter());      // 打开信息窗口
                }
            },
            "北京市");
        map.addControl(new BMap.NavigationControl());
        map.addControl(new BMap.ScaleControl());
        map.addControl(new BMap.OverviewMapControl());
        map.addControl(new BMap.MapTypeControl());
        map.enableScrollWheelZoom(true);
    }


</script>


<body>


<%--展示信息--%>
<div class="panel panel-default" style="height: 780px">
    <div class="panel-heading">
        <h3 class="panel-title">供货商列表</h3>

    </div>
    <br><br>
    <div class="panel-body">
        <div class="row">
        <%--    <div class="col-sm-6">
                <button onclick="toadd()" class="btn btn-primary" id="tianjia"><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;增加</button>
                <button onclick="todel()" class="btn btn-primary"><span class="glyphicon glyphicon-trash"></span>&nbsp;&nbsp;删除</button>
            </div>--%>
            <div class="col-sm-6">
                <form  class="form-inline pull-right">
                  供应商名称:<input id="supName" type="text" class="form-control">&nbsp;&nbsp;&nbsp;
                    供应商类型:<input id="" type="text" class="form-control">
                    <button class="btn btn-primary" onclick="searcha()" type="button"><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;搜索</button>
                </form>
            </div>
        </div>


        <div class="row">

            <button onclick="toadd()" class="btn btn-primary" id="tianjia"><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;增加</button>
            <button onclick="todel()" class="btn btn-primary"><span class="glyphicon glyphicon-trash"></span>&nbsp;&nbsp;批量删除</button>
            <div class="col-sm-12">
                <table id="tables"></table>
            </div>
        </div>

    </div>
</div>


<%--增加修改模块--%>
<div class="modal inmodal" id="addmodal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
    <div class="modal-dialog">


        <form class="form-horizontal" id="userform"  method="post" role="form">

            <input type="hidden" name="supplierId" value="0">
            <%--<input type="hidden" name="pn">--%>

            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">录入职位信息</h4>
                </div>


                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 text-right">供货商名称:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="supName" id="supNames" placeholder="请输入职位名称" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 text-right">联系电话:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="phone" id="phone" placeholder="请输入联系电话" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 text-right">供货商类型:</label>
                        <div class="col-sm-8">
                            <select name="typeId" id="typeId" class="form-control k">
                                <option value="0">全部</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 text-right">联系地址:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="address" id="address"  placeholder="请输入地址名称" />
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        <button type="button" name="tj" onclick="add()" class="btn btn-primary">保存</button>
                    </div>

                </div>

                <input type="hidden" id="zhi" name="zhi" value="">
            </div>
        </form>
    </div>
</div>




<div class="modal fade" id="modal-id">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">地图</h4>
            </div>
            <div class="modal-body">
                <div id="myditu"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>
</html>

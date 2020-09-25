
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>分店管理</title>

    <style type="text/css">
        #myditu{
            height: 360px;
            width: 550px;
        }
    </style>
    <jsp:include page="/com/tagg.jsp"/>
    <link rel="stylesheet" href="../static/login/bootstrap.min.css">

    <script>

        function searcha(){
            //返回表格的 Options
            var opts = $("#tables").bootstrapTable("getOptions");
            var limit = opts.pageSize;
            var offset = (opts.pagerNumber - 1) * limit;
            var mname = $("#storeName").val();

            $.get("${pageContext.request.contextPath}/Store/TJquery",{'storeName':mname,'limit':limit,'offset':offset},function (data) {

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
                    roleName: {
                        message: 'The username is not valid',
                        validators: {
                            notEmpty: {
                                message: '职位名称不能为空！'
                            }
                        }
                    }
                }
            });

            //表格信息
            $("#tables").bootstrapTable({
                url:'${pageContext.request.contextPath}/Store/TJquery',
                toolbar:'#br',
                height:'600',
                pageSize : 5,
                pageList:[2,3,4,8],
                pagerNumber:1,
                //启用分页，但默认情况下，是客户端分页
                pagination:true,
                //启用服务器端分页
                sidePagination : 'server',



                columns:[
                    {
                        checkbox:true
                    },
                    {
                        field:'storeId',
                        title:'仓库编号',
                        align:'center'
                    },
                    {
                        field:'storeName',
                        title:'仓库名称',
                        align:'center'
                    },
                    {
                        field:'phone',
                        title:'仓库电话',
                        align:'center'
                    },
                    {
                        field:'address',
                        title:'仓库地址',
                        align:'center'
                    },
                    {
                        field:'remake',
                        title:'仓库备注',
                        align:'center'
                    },
                    {
                        title:'操作',
                        align:'center',
                        formatter:function (varlue,row,index) {
                            return " <button onclick=\"toupdate("+index+")\" class='btn btn-info'><span class='glyphicon glyphicon-pencil'></span>&nbsp;修改</button>"+
                                "  \n" +
                                "   <button class='btn btn-info' onclick='shann("+index+")'>删除</button> &nbsp;"+
                                "<button class='btn btn-info'  onclick='pan("+index+")'>盘库</button>";
                               /*  "<a class='btn btn-info' href='../KuCun/panku.jsp'>盘库</a>";*/


                        }
                    }
                ]

            })

        });

        function pan(index) {
            //取消所有选择
            $("#tables").bootstrapTable("uncheckAll");
            $("#tables").bootstrapTable("check", index);
            var row = $("#tables").bootstrapTable("getSelections")[0];
          store =  $("input[name = 'storeId']").val(row.storeId);
           alert(row.storeId)
            window.location.href = '../KuCun/panku.jsp?storeId='+row.storeId;
        }


        /*单个删除*/
        function shann(index) {

            //取消所有选择
            $("#tables").bootstrapTable("uncheckAll");

            $("#tables").bootstrapTable("check", index);

            var row = $("#tables").bootstrapTable("getSelections")[0];

            swal({
                title: "您确定要删除这条信息吗",
                text: "删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                closeOnConfirm: false
            },function(){
                $.post("${pageContext.request.contextPath}/Store/delInfo",{"id":row.storeId},function (data) {
                    $("#stable").bootstrapTable('load',data);
                    //提示增加成功
                    swal("删除成功！", "您已经永久删除了这条信息。", "success");
                    $("#tables").bootstrapTable('load',data) ;
                })
            });

        }




        /*打开添加模态框*/
        function toadd() {

            document.getElementById("userform").reset();

            $("#userform").data('bootstrapValidator').resetForm();//清除当前验证的关键之处

            $("#zhi").val(1);

            $("#addmodal").modal("show");

        }

        /*打开修改模态框*/

        function toupdate(index) {

            $("#zhi").val(2);
            $("#addmodal").modal("show");

            //取消所有选择
            $("#tables").bootstrapTable("uncheckAll");
            //选中要修改的行
            $("#tables").bootstrapTable("check", index);
            //得到所选行的数据
            var row = $("#tables").bootstrapTable("getSelections")[0];
            //绑定主键

     /*       //得到当前页
            var pn = options.pagerNumber;
            //绑定当前页
            $("input[name = 'pn']").val(pn);*/
            $("input[name = 'storeId']").val(row.storeId);
            $("input[name = 'storeName']").val(row.storeName);
            $("input[name = 'phone']").val(row.phone);
            $("input[name = 'address']").val(row.address);
            $("input[name = 'remake']").val(row.remake);
            $("input[name = 'state']").val(row.state);

        }

        /*点击保存按钮*/
        function add() {

            var zhi = $("#zhi").val();
            if(zhi == 1){

                //启用校验
                $('#userform').data('bootstrapValidator').validate();

                //校验是否通过
                var flag = $('#userform').data('bootstrapValidator').isValid();
                if(flag){

                    //序列化表单
                    var formStr = $('#userform').serialize()

                    //处理表单控件的中文乱码
                    params = decodeURIComponent(formStr,true);

                    $.post('${pageContext.request.contextPath}/Store/addinfo',params,function (data) {
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

            }else if(zhi == 2){
                //序列化表单
                var formStr = $('#userform').serialize()

                //处理表单控件的中文乱码
                params = decodeURIComponent(formStr,true);

                $.ajax({
                    'type':'post',
                    'url':'${pageContext.request.contextPath}/Store/updateInfo',
                    'data':params,
                    success:function(data){
                        //关闭模态框
                        $("#addmodal").modal('hide');
                        //清空数据
                        document.getElementById("userform").reset();

                        //友好提示
                        swal("提示信息", "修改成功!", "success");

                        //重新绑定表格数据
                        $("#tables").bootstrapTable('load',data) ;
                    }
                })
            }





        }

        /*点击删除*/
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
                    ids = ids + row.storeId + "-";
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
                    $.post("${pageContext.request.contextPath}/Role/delList",{'ids': ids},function(data){
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
</head>
<body>
    <%--分店信息列表--%>
    <br>   <br>   <br>
    <div class="panel panel-default">
       <div class="panel-body">
           <h2 style="color:#0F769F;text-align:center">邯郸翱翔分仓管理


               <form  class="form-inline pull-right">
                  <input id="storeName" type="text" class="form-control">
                     <button class="btn btn-primary" onclick="searcha()" type="button"><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;搜索</button>
                  </form>
           </h2>

           <div class="row">




           </div>
           <div class="row">
               <div class="col-sm-12">
                   <button onclick="toadd()" class="btn btn-primary"  id="tianjia"><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;增加</button>
                  <%-- <button onclick="todel()" class="btn btn-primary"><span class="glyphicon glyphicon-trash"></span>&nbsp;&nbsp;批量删除</button>--%>
                   <table id="tables"></table>
               </div>
           </div>
       </div>
    </div>



    <%--增加修改模态框--%>

        <div class="modal inmodal" id="addmodal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
            <div class="modal-dialog">
                <form class="form-horizontal" id="userform"  method="post" role="form">

                    <input name="roleId" id="roleId" type="hidden">
                    <div class="modal-content animated bounceInLeft">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title">录入职位信息</h4>
                        </div>





                        <input type="hidden" class="form-control" name="storeId"  value="0"/>

                        <div class="modal-body">
                            <div class="form-group">
                                <label class="col-sm-3 text-right">分店名称:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="storeName"  placeholder="请输入分店名称" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 text-right">分店电话:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="phone"  placeholder="请输入联系方式" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 text-right">分店地址:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="address"  placeholder="请输入分店地址" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 text-right">备注:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="remake"  placeholder="请输入分店备注" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-sm-3 text-right">分店状态:</label>
                                <div class="col-sm-8">

                                    <select name="state" class="form-control ">
                                        <option value="0">禁用</option>
                                        <option value="1">启用</option>
                                    </select>
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

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/8 0008
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>销售单据查询</title>
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


        function shenhe(index) {
            //取消所有选择
            $("#tables").bootstrapTable("uncheckAll");
            //选中要修改的行
            $("#tables").bootstrapTable("check", index);
            //得到所选行的数据
            var row = $("#tables").bootstrapTable("getSelections")[0];
            $("input[name = 'id']").val(row.id);
            $("input[name = 'bohui']").val(row.idd)

            $("#up").modal("show");

        }



        //修改状态变成 已审核 已审核是 1  已驳回是2
        function update1() {
            //序列化表单
            var formStr = $('#up').serialize()

            $.ajax({
                'type':'post',
                'url':'${pageContext.request.contextPath}/Xsbills/updateInfo',
                data:{
                    id: $("input[name = 'id']").val()
                },
                success:function(data){
                    //关闭对话框
                    $("#up").modal('hide') ;
                    //友好的提示
                    swal("提示信息", "审核成功!", "success");
                    //重新加载表格
                    $("#tables").bootstrapTable('load',data) ;
                    searcha();
                }
            })

        }

        //修改状态变成 已审核 已审核是 1  已驳回是2
        function update2() {
            //序列化表单
            var formStr = $('#up').serialize()

            $.ajax({
                'type':'post',
                'url':'${pageContext.request.contextPath}/Xsbills/updateInfo1',
                data:{
                    id: $("input[name = 'id']").val(),
                    idd:$("input[name = 'bohui']").val()
                },
                success:function(data){
                    //关闭对话框
                    $("#up").modal('hide') ;
                    //友好的提示
                    swal("提示信息", "驳回成功!", "success");
                    //重新加载表格
                    $("#tables").bootstrapTable('load',data) ;
                    searcha();
                }
            })

        }

        //出库
        function chuku(index) {
            //序列化表单
            var formStr = $('#up').serialize()
            //选中要修改的行
            $("#tables").bootstrapTable("check", index);
            //得到所选行的数据
            var row = $("#tables").bootstrapTable("getSelections")[0];
            id=$("input[name = 'id']").val(row.id);
            number=$("input[name = 'number']").val(row.number);
            alert(id)
            $("#upp").modal("show");
        }

        function update3() {

            $.ajax({
                'type':'post',
                'url':'${pageContext.request.contextPath}/Xsdetails/kucun',
                data:{
                    id: $("input[name = 'id']").val(),
                    number: $("input[name = 'number']").val()
                },
                success:function(data){
                    //关闭对话框
                    $("#upp").modal('hide') ;
                    //友好的提示
                    swal("提示信息", "出库成功!", "success");
                    //重新加载表格
                    $("#tables").bootstrapTable('load',data) ;
                    //出ku之后调用减去数量的方法
                    shuliang();
                    //查询更新的方法
                    searcha();
                }
            })

        }

        // 出库成功之后减去数量的方法
        function  shuliang() {
            $.ajax({
                'type':'post',
                'url':'${pageContext.request.contextPath}/Xsbills/updateInfo2',
                data:{
                    id: $("input[name = 'id']").val(),
                },
                success:function(data){

                }
            })
        }


        //销售人员点击退货
        function tui(index) {
            //取消所有选择
            $("#tables").bootstrapTable("uncheckAll");
            //选中要修改的行
            $("#tables").bootstrapTable("check", index);
            //得到所选行的数据
            var row = $("#tables").bootstrapTable("getSelections")[0];
            $("input[name = 'id']").val(row.id);
            $("input[name = 'tui']").val(row.idd);

            $("#uppp").modal("show");

        }

        function update4() {
            //序列化表单
            var formStr = $('#up').serialize()

            $.ajax({
                'type':'post',
                'url':'${pageContext.request.contextPath}/Xsbills/updateInfo4',
                data:{
                    id: $("input[name = 'id']").val(),
                   idd: $("input[name = 'tui']").val()
                },
                success:function(data){
                    //关闭对话框
                    $("#uppp").modal('hide') ;
                    //友好的提示
                    swal("提示信息", "退货申请成功!", "success");
                    //重新加载表格
                    $("#tables").bootstrapTable('load',data) ;
                    searcha();
                }
            })

        }

        //经理 登录 确认退货
        function quetui(index) {
            //取消所有选择
            $("#tables").bootstrapTable("uncheckAll");
            //选中要修改的行
            $("#tables").bootstrapTable("check", index);
            //得到所选行的数据
            var row = $("#tables").bootstrapTable("getSelections")[0];
            $("input[name = 'id']").val(row.id);
            number=$("input[name = 'number']").val(row.number);
            $("#upppp").modal("show");

        }

        function update5() {
            //序列化表单
            var formStr = $('#up').serialize()

            $.ajax({
                'type':'post',
                'url':'${pageContext.request.contextPath}/Xsdetails/tuihuo',
                data:{
                    id: $("input[name = 'id']").val(),
                    number: $("input[name = 'number']").val()
                },
                success:function(data){
                    //关闭对话框
                    $("#upppp").modal('hide') ;
                    //友好的提示
                    swal("提示信息", "经理退货成功!", "success");
                    //重新加载表格
                    $("#tables").bootstrapTable('load',data) ;


                    shuliang2();
                    searcha();
                }
            })

        }



        // 经理退货成功之后加上数量的方法
        function  shuliang2() {
            $.ajax({
                'type':'post',
                'url':'${pageContext.request.contextPath}/Xsbills/updateInfo5',
                data:{
                    id: $("input[name = 'id']").val(),
                },
                success:function(data){

                }
            })
        }





        //打印
        function  dayin(index) {
            //取消所有选择
            $("#tables").bootstrapTable("uncheckAll");
            //选中要修改的行
            $("#tables").bootstrapTable("check", index);
            //得到所选行的数据
            var row = $("#tables").bootstrapTable("getSelections")[0];



            $("#xsTime").val(row.xsTime);
            $(".number").val(row.number);
            $("#cName").val(row.customer.cName);
            $("#idd").val(row.idd);
            $("#money").val(row.money);
            $("#bType").val(row.bType);

            if(row.bType == 5){
                $("#bType").val("已退货");
            }else if(row.bType == 3){
                $("#bType").val("已出库");
            }

            $("#mname").val(row.manager.mname);



            $("#dayin").modal("show");


        }


        function searcha(){
            //返回表格的 Options
            var opts = $("#tables").bootstrapTable("getOptions");
            var limit = opts.pageSize;
            var offset = (opts.pagerNumber - 1) * limit;
            var number = $("#number").val();

            $.get("${pageContext.request.contextPath}/Xsbills/selectFY",{'number':number,'limit':limit,'offset':offset},function (data) {

                //重新绑定表格数据
                $("#tables").bootstrapTable('load',data) ;
            })
        }

        $(function () {

            $("#tables").bootstrapTable({

                url:'${pageContext.request.contextPath}/Xsbills/selectFYY',
                toolbar:'#br',
                height:'400',
                pageSize : 5,
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
                        field:'khId',
                        title:'客户名称',
                        align:'center'
                    },
                    {
                        field:'bType',
                        title:'单据类型',
                        align:'center',
                        formatter:function (value,row,index) {
                            if (row.bType==0){
                                return '未审核' ;
                            }
                            else if(row.bType==1){
                                return '已审核' ;
                            }else if(row.bType==2){
                                return '已驳回' ;
                            }else if(row.bType==3){
                                return '已出库' ;
                            }else if(row.bType==4){
                                return '退货申请中' ;
                            }else if(row.bType==5){
                                return '已退货' ;
                            }
                        }
                    },
                    {
                        field:'xsTime',
                        title:'销售时间',
                        align:'center'
                    },
                    {
                        field:'money',
                        title:'总金额',
                        align:'center'
                    },
                    {
                        field: 'manager.mname',
                        title: '操作员',
                        align: 'center'
                    },
                    {
                        field: 'idd',
                        title: '原因',
                        align: 'center'
                    },
                    {
                        title:'操作',
                        align:'center',
                        formatter:function (varlue,row,index) {

                            var zhi = $("[name = 'zhi']").val();
                            //如果是销售人员的话
                            if(zhi == 4 && row.bType ==0){
                                return "<button style='background: red;border: red' class='btn btn-info' onclick='shenhe("+index+")'></span>审核</button>"
                            }else if(zhi == 5 && row.bType == 1){
                                return "<button style='background: red;border: red' class='btn btn-info' onclick='chuku("+index+")'></span>出库</button>"
                            }else if(zhi == 4 && row.bType ==3){
                                return "<button style='background: red;border: red' class='btn btn-info' onclick='tui("+index+")'></span>退货申请</button>"
                                    +"<button  class='btn btn-info' onclick='dayin("+index+")'></span>打印票据</button>"
                            }else if(zhi ==2 && row.bType ==4){
                                return "<button style='background: red;border: red' class='btn btn-info' onclick='quetui("+index+")'></span>确认退货</button>"
                            }else if(row.bType ==5){
                                return "<button  class='btn btn-info' onclick='dayin("+index+")'></span>打印票据</button>"
                            }
                        }
                    }
                ],
                onClickRow : function(row, $element){

                    var index = $element.data('index');
                    $("#tables").bootstrapTable("uncheckAll");
                    console.log(row);
                    //选中要修改的行
                    $("#tables").bootstrapTable("check",index);

                    $.post('${pageContext.request.contextPath}/Xsdetails/selectGF',{'number':row.number},function(data) {
                        $("#twoTables").bootstrapTable('load',data);
                    })
                }
            })


            $("#twoTables").bootstrapTable({
                url:'',
                toolbar:'#br',
                height:'300',
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
                        field:'buId',
                        title:'商品编号',
                        align:'center'
                    },
                    {
                        field:'shopName',
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
                        title:'价格',
                        align:'center'
                    },
                    {
                        field:'num',
                        title:'数量',
                        align:'center'
                    },
                    {
                        field:'money',
                        title:'总金额',
                        align:'center'
                    }/*,*/
                    /*      {
                              field:'dh',
                              title:'是否兑换',
                              align:'center',
                              formatter:function (value,row,index) {
                                  if (row.dh==0){
                                      return '不是兑换' ;
                                  }
                                  else {
                                      return '是兑换' ;
                                  }
                              }
                          },*/
                    /*     {
                             field:'zjifen',
                             title:'总积分 ',
                             align:'center'
                         }*/
                ]
            })
        })



    </script>
</head>
<body>
<input type="hidden" name="id">

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">单据查询</h3>
    </div>

    <%--  获取 当前的职位--%>
    <input type="hidden" name ="zhi" value="${sessionScope.manager.roleId}">

    <div class="row">
        <br>
        <form action="" method="post" role="form" class="form-horizontal">
            <div class="row">
                <%--仓库--%>
                <%--      <div class="col-sm-3 form-group">
                          <label for="" class="col-sm-3 text-right control-label">仓库:</label>
                          <div class="col-sm-8">
                              <select name="storeId" id="inputID" class="form-control o" style="width: 200px">
                                  <option value="0">全部</option>
                              </select>

                          </div>
                      </div>

                        &lt;%&ndash;审核类型&ndash;%&gt;
                        <div class="col-sm-3 form-group">
                            <label for="" class="col-sm-3 text-right control-label">审核状态:</label>
                            <div class="col-sm-8">
                                <select name="auditId" id="ghs" class="form-control i" style="width: 200px">
                                    <option value="0">全部</option>
                                </select>
                            </div>
                        </div>--%>

        </form>

        <div class="col-sm-6 form-group">
            <label for="" class="col-sm-3 text-right control-label">单据号:</label>
            <form  class="form-inline">
                <input id="number" type="text" class="form-control">
                <button  style="background: red;border: red" class="btn btn-primary" onclick="searcha()" type="button"><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;搜索</button>
            </form>
        </div>

    </div>

</div>


<div class="row">
    <div class="col-sm-12">
        <table id="tables"></table>
    </div>
</div>


<div class="row">&nbsp;</div>


<div class="row">
    <div class="col-sm-6">

    </div>
</div>

<div class="row">
    <div class="col-sm-12">
        <table id="twoTables"></table>
    </div>
</div>



<%--
修改开始--%>

<div class="modal inmodal" id="up" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
    <div class="modal-dialog">
        <form class="form-horizontal" id="userupdateforms"  method="post" role="form">



            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">修改</h4>
                </div>



                <div class="form-group">
                    <label for="" class="col-sm-4 text-right">驳回原因:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="bohui" placeholder="请输入驳回原因"  />
                    </div>
                </div>



                <div class="modal-footer">
                    <button type="button" name="xg" onclick="update1()" class="btn btn-primary">审核</button>
                    <button type="button" name="xg" onclick="update2()" class="btn btn-primary">驳回</button>
                </div>
            </div>

        </form>
    </div>
</div>





<%--修改2  出库--%>

<div class="modal inmodal" id="upp" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
    <div class="modal-dialog">
        <form class="form-horizontal" id=""  method="post" role="form">



            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">出库</h4>
                </div>

                <div class="form-group">
                    <label for="" class="col-sm-4 text-right">商品名称:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="number" placeholder=""  />
                    </div>
                </div>


                <div class="modal-footer">
                    <button type="button" name="xg" onclick="update3()" class="btn btn-primary">出库</button>

                </div>
            </div>

        </form>
    </div>
</div>




<%--修改3  退货申请--%>

<div class="modal inmodal" id="uppp" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
    <div class="modal-dialog">
        <form class="form-horizontal" id=""  method="post" role="form">



            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">出库</h4>
                </div>


                <div class="form-group">
                    <label for="" class="col-sm-4 text-right">退货原因:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="tui" placeholder="请输入退货原因"  />
                    </div>
                </div>



                <div class="modal-footer">
                    <button type="button" name="xg" onclick="update4()" class="btn btn-primary">退货申请</button>

                </div>
            </div>

        </form>
    </div>
</div>




<%--修改4  经理登录 退货--%>

<div class="modal inmodal" id="upppp" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
    <div class="modal-dialog">
        <form class="form-horizontal" id=""  method="post" role="form">



            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">出库</h4>
                </div>


                <div class="form-group">
                    <label for="" class="col-sm-4 text-right">商品名称:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="number" placeholder=""  />
                    </div>
                </div>


                <div class="modal-footer">
                    <button type="button" name="xg" onclick="update5()" class="btn btn-primary">退货申请</button>

                </div>
            </div>

        </form>
    </div>
</div>


<%--打印票据  获取当前的--%>

<div class="modal inmodal" id="dayin" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
    <div class="modal-dialog">
        <form class="form-horizontal" id=""  method="post" role="form">



            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h6 class="modal-title">收据</h6>

                    <div class="main">
                        <div class="body">
                            <div class="title">
                                <div class="div1">
                                    <div class="divCtn">
                                        <%--                 <div class="titleCtn">收&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;据</div>--%>
                                        <div class="titleUdeLine"></div>
                                    </div>
                                </div>
                                &nbsp;&nbsp; 单据号:<input  class="number" style="border: white"></input>
                            </div>
                            <div class="date">

                                <%--  <div class="">2020年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;04月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;21日</div>--%>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                销售时间:<input id="xsTime" style="border: white"></input>
                            </div>
                            <table border="1" style="width: 100%; border-collapse: collapse;">
                                <tr class="tempTr2">
                                    <td colspan="6" style="border-right-color: #FFFFFF; width: 50%; text-align: left;">&nbsp;&nbsp;客户
                                        <input type="text" id="cName" style="border: white"> </td>
                                    <td colspan="6" style="width: 50%;">交&nbsp;&nbsp;来&nbsp;&nbsp;下&nbsp;&nbsp;列&nbsp;&nbsp;款&nbsp;&nbsp;项&nbsp;&nbsp;此&nbsp;&nbsp;据</td>
                                </tr>
                                <tr>
                                    <td align="center" rowspan="2" style="width: 60%;">原&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;因</td>
                                    <td colspan="10" align="center" style="width: 10%;">金&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;额</td>
                                    <td rowspan="2" align="center" style="width: 30%;">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</td>
                                </tr>
                                <tr class="tempTr1">
                                    <td>￥</td>
                                    <td>百</td>
                                    <td>十</td>
                                    <td>万</td>
                                    <td>千</td>
                                    <td>百</td>
                                    <td>十</td>
                                    <td>元</td>
                                    <td>角</td>
                                    <td>分</td>
                                </tr>
                                <tr class="tempTr2">
                                    <td><input type="text" style="border: white" id="idd"></td>
                                    <td>￥</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><input type="text" id="shopName" size="15" style=""> </td>
                                </tr>
                                <tr class="tempTr2">
                                    <td></td>
                                    <td>￥</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr class="tempTr2">
                                    <td></td>
                                    <td>￥</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr class="tempTr2">
                                    <td colspan="12" style=" text-align: left;">
                                        合计人民币（大写）贰万伍仟肆佰叁拾贰圆贰角叁分
                                        <div style="float: right; display: flex;"><div style="font-size: 20px;">￥：</div><div style="width: 180px; height: 30px; border-bottom: solid #000000 1px; text-align: center;">
                                            <input type="text" style="border: white" size="15" id="money"></div></div>
                                    </td>
                                </tr>
                            </table>
                            <div style="width: 100%; display: flex; height: 40px;">
                                <div style="width: 50%; height: 40px; line-height: 40px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单据类型:
                                    <input type="text" style="border: white" id="bType"></div>
                                <div style="width: 50%; height: 40px; line-height: 40px;">经手人:
                                    <input type="text" style="border: white" size="15" id="mname"></div>
                            </div>
                        </div>
                    </div>

                </div>


                <div class="modal-footer">
                    <button type="button" name="xg" onclick="dayinzhong()" class="btn btn-primary">确定打印</button>

                </div>
            </div>



        </form>
    </div>
</div>

</body>
</html>

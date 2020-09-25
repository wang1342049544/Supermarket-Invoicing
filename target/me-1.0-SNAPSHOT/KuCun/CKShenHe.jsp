<%--
&lt;%&ndash;
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/8 0008
  Time: 16:28
  To change this template use File | Settings | File Templates.
&ndash;%&gt;
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>出库审核</title>
    <jsp:include page="/com/tagg.jsp"/>
    <script>

       /* function searcha(){
            //返回表格的 Options
            var opts = $("#tables").bootstrapTable("getOptions");
            var limit = opts.pageSize;
            var offset = (opts.pagerNumber - 1) * limit;
            var number = $("#number").val();
            var storeId = $("[name = 'storeId']").val();

            $.get("${pageContext.request.contextPath}/bills/queryFY",{'storeId':storeId,'number':number,'limit':limit,'offset':offset},function (data) {

                //重新绑定表格数据
                $("#tables").bootstrapTable('load',data) ;
            })
        }*/

        $(function () {


            $("#tables").bootstrapTable({

                url:'${pageContext.request.contextPath}/CKXQ/querylist',
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
                        field:'num',
                        title:'数量',
                        align:'center'
                    },
                    {
                        field:'price',
                        title:'售价',
                        align:'center'
                    },
                    {
                        field:'shoptype.typeName',
                        title:'商品类型',
                        align:'center'
                    },
                    {
                        field:'yileId',
                        title:'生产日期',
                        align:'center'
                    },
                    {
                        field:'pledge',
                        title:'生产日期',
                        align:'center'
                    },
                    {
                        field:'expiration',
                        title:'到期时间',
                        align:'center'
                    },
                    {
                        field:'jifen',
                        title:'积分 ',
                        align:'center'
                    }
                ]
            })


        })


        /*出库*/
        function chuku() {

            var ids = "";//数据
            var sids = "";//编号
            //得到要删除的行
            //返回所选的行，当没有选择任何行的时候返回一个空数组。
            var rows = $("#tables").bootstrapTable("getSelections") ;
            //判断是否选中所删除的行
            if(rows.length == 0){
                alert("请选择要添加的数据！");
            }else{


                function pad2(n) { return n < 10 ? '0' + n : n }
                function generateTimeReqestNumber() {
                    var date = new Date();
                    return date.getFullYear().toString() + pad2(date.getMonth() + 1) + pad2(date.getDate()) + pad2(date.getHours()) + pad2(date.getMinutes()) ;
                }
                var rand = Math.floor(Math.random() * 900) + 100;
                var order_id =   rand + generateTimeReqestNumber();

                var one = 1;
                var hao = parseInt(order_id) + parseInt(one);

                var danhao = "CK" + hao;

                var managerId = $("[name = 'managerId']").val();

                //获取当前时间
                var now= new Date();
                var year=now.getFullYear();
                var month=now.getMonth()+1;
                var day=now.getDate();

                var times = year + "-"+ month + "-" + day ;


                $.each(rows,function (index,row) {
                    ids = ids + row.buId+"/" + row.num + "/"+danhao + "/" + managerId + "/"+times+

                        "/"+row.danWei + "/" + row.price + "/" + row.yileId + "/" + row.pledge + "/"+ row.expiration + "/" + row.jifen +"/"+row.buName +"/" +
                        row.shoptype.typeId+"," ;
                });


                $.post("${pageContext.request.contextPath}/KCT/selectNum",{"ids":ids},function (data) {

                        if(data == 1){

                            $.each(rows,function (index,row) {
                                sids = sids + row.buId+"-" ;
                            });

                            $.post("${pageContext.request.contextPath}/CKXQ/dellist",{"sids":sids},function (data) {

                                if(data != null){
                                    $("#tables").bootstrapTable('load',data);
                                    //提示增加成功
                                    swal("出库成功！", "温馨提示", "success");
                                }

                            })
                        }else if (data == 2) {
                            swal("库存数量不足！", "温馨提示", "warning");
                        }

                })

            }

        }




    </script>
</head>
<body>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">出库审核</h3>
    </div>
    <div class="panel-body">

        <input type="hidden" name="managerId" value="${Manager.managerId}">

        <div class="row">
            <div class="col-sm-6">
                <button onclick="daoChu()" class="btn btn-primary" id="tianjia"><span class="glyphicon glyphicon-download-alt"></span>&nbsp;&nbsp;导出</button>
                <button onclick="daYin()" class="btn btn-primary"><span class="glyphicon glyphicon-print"></span>&nbsp;&nbsp;打印</button>
                <button onclick="del()" class="btn btn-primary"><span class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;删除单据</button>
            </div>
        </div>

        <div class="row">
            <br>
            <form action="" method="post" role="form" class="form-horizontal">
                <div class="row">
                &lt;%&ndash;仓库&ndash;%&gt;
                    <div class="col-sm-3 form-group">
                        <label for="" class="col-sm-3 text-right control-label">仓库:</label>
                        <div class="col-sm-8">
                            <select name="storeId" id="inputID" class="form-control o" style="width: 200px">
                                <option value="0">全部</option>
                            </select>

                        </div>
                    </div>


            </form>

                <div class="col-sm-6 form-group">
                    <form  class="form-inline">
                        <input id="number" type="text" class="form-control">
                        <button class="btn btn-primary" onclick="searcha()" type="button"><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;搜索</button>
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

<div class="row">
    <form action="" method="post" role="form" class="form-horizontal">
        &lt;%&ndash;按钮&ndash;%&gt;
        <div class="col-md-offset-5">
            <button class="btn btn-primary" onclick="chuku()" type="button"><span class=""></span>出库</button>
        </div>

    </form>
</div>

</body>
</html>
--%>

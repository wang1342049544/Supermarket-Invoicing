
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>采购审核</title>
    <jsp:include page="/com/tagg.jsp"/>
    <link rel="stylesheet" href="../static/login/bootstrap.min.css">
    <script>
        $(function () {

            //经办人
            $.ajax({
                url:'${pageContext.request.contextPath}/Mapper/caiList',
                type:"post",
                success:function(data){
                    $.each(data,function(){
                        var adds=$("<option value='"+this.managerId+"'>"+this.mname+"</option>");
                        $(".l").append(adds);

                    });
                }
            })

        })


        function searcha(){








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
        }

        $(function () {

            //审核状态
            /*$.ajax({
                url:'${pageContext.request.contextPath}/Audit/queryL',
                type:"get",
                success:function(data){
                    $.each(data,function(){
                        var adds=$("<option value='"+this.auditId+"'>"+this.auditName+"</option>");
                        $(".i").append(adds);

                    });
                }
            })*/

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


            $("#tables").bootstrapTable({

                url:'${pageContext.request.contextPath}/bills/queryFY?storeId=0',
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
                    }/*,
                    {
                        field:'store.storeName',
                        title:'所属仓库',
                        align:'center'
                    }*/

                    /*,
                    {
                        field:'yingF',
                        title:'应付金额',
                        align:'center'
                    }*/,
                    {
                        field:'shiF',
                        title:'总金额',
                        align:'center'
                    },
          /*          {
                        field:'manager.mname',
                        title:'经办人',
                        align:'center'
                    },*/
              /*      {
                        field:'manager.mname',
                        title:'操作员',
                        align:'center'
                    },*/
         /*           {
                        field:'remake',
                        title:'备注 ',
                        align:'center'
                    },*/

                    {
                        field:'audit.auditName',
                        title:'状态',
                        align:'center'
                    },
                    {
                        title:'操作',
                        align:'center',
                        formatter:function (varlue,row,index) {
                            return "<button style='background: red;border: red' class='btn btn-info' onclick='shenhe("+index+")'>审核</button> &nbsp; &nbsp; "+
                            "<button class='btn btn-info' onclick='xuanze("+index+")'>选择仓库</button>";

                        }
                    }
                ],
                onClickRow : function(row, $element){
                    var index = $element.data('index');
                    $("#tables").bootstrapTable("uncheckAll");
                    console.log(row);
                    //选中要修改的行
                    $("#tables").bootstrapTable("check",index);

                    $.post('${pageContext.request.contextPath}/Details/queryList',{'number':row.number},function(data) {
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
                        title:'进价',
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
                        field:'supplier.supName',
                        title:'供货商',
                        align:'center'
                    },
                    {
                        field:'yileld',
                        title:'生产日期',
                        align:'center'
                    },
                    {
                        field:'pledge',
                        title:'保质期 ',
                        align:'center'
                    },
                    {
                        field:'expiration',
                        title:'过期时间',
                        align:'center'
                    },
                    {
                        field:'shoptype.typeName',
                        title:'商品类型',
                        align:'center'
                    }
               /*     ,
                    {
                        field:'store.storeName',
                        title:'所属仓库',
                        align:'center'
                    }*/
                ]
            })
        })


        /*审核*/
        function shenhe(indexs) {

            //经理
            var jinglii = $("[name = 'jinglii']").val();
            var roleName = $("[name = 'roleName']").val();
        /*    alert(roleName)
            alert(jinglii)*/
            var ids = "";

            //取消所有选择
            $("#tables").bootstrapTable("uncheckAll");

            $("#tables").bootstrapTable("check", indexs);

            var row = $("#tables").bootstrapTable("getSelections")[0];
            //使用经理来登录  如果钱大于1000 需要经理来操作

            if(row.shiF >1000){
                alert("经理操作")
                //rolename 写死的 是个2
                //当前登录的 和 经理是一样的话  操作
                if(jinglii ==roleName){
                    /*判断审核是否通过*/
                    $.post("${pageContext.request.contextPath}/bills/TG",{"number":row.number},function (data) {
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
                                $.post("${pageContext.request.contextPath}/bills/updatelist",{"number":row.number},function (data) {
                                    $("#tables").bootstrapTable('load',data);
                                    var stateId = 0;

                                    if(data != null){
                                        ids = ids + row.number +"/"+ row.typeId + "/" + row.danTime + "/" + row.store.storeId + "/" +
                                            row.yingF + "/" + row.shiF + "/" + row.managerId +"/"+ row.managerId + "/"+
                                            stateId + "/"+row.remake + "/" ;

                                        $.post("${pageContext.request.contextPath}/rbills/InserList",{'ids': ids},function(data){

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




            }else{
                //采购员
                alert("采购员操作")

                /*判断审核是否通过*/
                $.post("${pageContext.request.contextPath}/bills/TG",{"number":row.number},function (data) {
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
                            $.post("${pageContext.request.contextPath}/bills/updatelist",{"number":row.number},function (data) {
                                $("#tables").bootstrapTable('load',data);
                                var stateId = 0;

                                if(data != null){
                                    ids = ids + row.number +"/"+ row.typeId + "/" + row.danTime + "/" + row.store.storeId + "/" +
                                        row.yingF + "/" + row.shiF + "/" + row.managerId +"/"+ row.managerId + "/"+
                                        stateId + "/"+row.remake + "/" ;

                                    $.post("${pageContext.request.contextPath}/rbills/InserList",{'ids': ids},function(data){

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







        }

        //选择仓库
     function xuanze(index) {

            alert("选择仓库")

         //取消所有选择
         $("#tables").bootstrapTable("uncheckAll");

         $("#tables").bootstrapTable("check", index);

         var row = $("#tables").bootstrapTable("getSelections")[0];


         $("[name = 'id']").val(row.id);
         $("[name = 'kcId']").val(row.number); //单据号
   /*      $("[name = 'jine']").val(row.shiF);//总金额*/
        $("[name = 'idd']").val(row.storeId);
        $("[name = 'storeId']").val(row.storeId);


         $("#addmoda55").modal("show");
     }




        function update6() {

            //启用校验
            //序列化表单
            var formStr = $('#userformaa').serialize()

            //处理表单控件的中文乱码
            params = decodeURIComponent(formStr,true);


            $.ajax({
                'type':'post',
                'url':'${pageContext.request.contextPath}/bills/update',
                'data':params,
                success:function(data){
                    //关闭对话框
                    $("#addmoda55").modal('hide') ;
                    //友好的提示
                    swal("提示信息", "修改成功!", "success");
                    //重新加载表格
                    $("#tables").bootstrapTable('load',data) ;

                }
            })
        }





        function del() {
            var ids = "";//数据
            //得到要删除的行
            //返回所选的行，当没有选择任何行的时候返回一个空数组。
            var rows = $("#tables").bootstrapTable("getSelections") ;
            //判断是否选中所删除的行
            if(rows.length == 0){
                alert("请选择要添加的数据！");
            }else{
                $.each(rows,function (index,row) {
                    ids = ids + row.number + "-" ;
                });
                /*删除所选数据*/
                $.post("${pageContext.request.contextPath}/bills/delList",{'ids': ids},function(data){

                    $("#tables").bootstrapTable('load',data) ;
                    if(data != null){

                        $.post("${pageContext.request.contextPath}/Details/delInfo",{'ids': ids},function(data){

                            //友好的提示
                            swal("提示信息！", "删除成功！。", "success");
                            //刷新表格

                            $("#twoTables").bootstrapTable('load',data) ;

                        })

                    }


                })

            }
        }
        


    </script>
</head>
<body>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">采购审核</h3>
    </div>


  <%--  <form action="post">
     <div class="col-sm-3 form-group " >
            <label for="" class="col-sm-3 text-right control-label" style="font-size: 16px">经办人:</label>
            <div class="col-sm-8">
                <select name="ssss" id="inpustsID" class="form-control l">
                </select>

                <input type="hidden" name="gzhis">
            </div>
        </div>



    </form>  --%>
    <%--获取权限  判断是采购员 还是经理--%>
    <%--当前登录的用户id--%><input type="hidden" name="roleName" value="${sessionScope.manager.roleId}">
    <%-- 经理id --%>  <input type="hidden" name="jinglii" value="2">
    <%--修改--%>
    <div class="modal inmodal" id="addmoda55" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
        <div class="modal-dialog">
            <form class="form-horizontal" id="userformaa"  method="post" role="form">
                <div class="modal-content animated bounceInLeft">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title">选择仓库</h4>
                    </div>






                        <div class="modal-body">
                            <div class="form-group">
                                <label class="col-sm-3 text-right" for="">单据号:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="kcId" readonly/>
                                    <input type="hidden" class="form-control" name="id">
                                    <input type="hidden" class="form-control" name="idd">
                                </div>
                            </div>
                      <%--      <div class="modal-body">
                                <div class="form-group">
                                    <label class="col-sm-3 text-right" for="">总金额:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="jine" />
                                    </div>
                                </div>--%>


                            <div class="form-group">
                                <label class="col-sm-3 text-right" for="">选择仓库:</label>
                                <div class="col-sm-8">
                                    <select name="storeId" id="inputID" class="form-control o" style="width: 200px">
                                    </select>
                                </div>
                            </div>


                </div>


                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="close()">关闭</button>
                            <button type="button" name="tj" onclick="update6()" class="btn btn-primary">确认选择</button>
                        </div>

                    </div>

            </form>
        </div>
    </div>





    <div class="panel-body">
        <div class="row">

        </div>





<%--
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


            </form>--%>


                <div class="col-sm-6 form-group">
                    <form  class="form-inline">
                        <input id="number" type="text" class="form-control">
                        <button class="btn btn-primary" onclick="searcha()" type="button"><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;搜索</button>
                    </form>
                </div>

                </div>

        </div>


    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-6">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <table id="tabless"></table>
                </div>
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

        </div>

        <div class="row">
            <div class="col-sm-12">
                <table id="twoTables"></table>
            </div>
        </div>

    </div>




<script>
    $(function () {
        $("#tabless").bootstrapTable({

            url:'${pageContext.request.contextPath}/bills/queryFYS?storeId=0',
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
              /*  {
                    field:'yingF',
                    title:'应付金额',
                    align:'center'
                },*/
                {
                    field:'shiF',
                    title:'总金额',
                    align:'center'
                },
               /* {
                    field:'manager.mname',
                    title:'经办人',
                    align:'center'
                },
                {
                    field:'manager.mname',
                    title:'操作员',
                    align:'center'
                },*/
                {
                    field:'audit.auditName',
                    title:'审核状态',
                    align:'center'
                }/*,
                {
                    field:'remake',
                    title:'备注 ',
                    align:'center'
                }*/
            ],
            onClickRow : function(row, $element){
                var index = $element.data('index');
                $("#tabless").bootstrapTable("uncheckAll");
                console.log(row);
                //选中要修改的行
                $("#tabless").bootstrapTable("check",index);

                $.post('${pageContext.request.contextPath}/Details/queryList',{'number':row.number},function(data) {
                    $("#twoTables").bootstrapTable('load',data);
                })
            }
        })

    })
</script>
</body>
</html>

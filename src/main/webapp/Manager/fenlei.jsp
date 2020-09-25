
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/com/tagg.jsp"/>
    <link rel="stylesheet" href="../static/login/bootstrap.min.css">
</head>
<body>




<div class="panel panel-default">
    <div class="panel-body">
        <h2 style="color:#0F769F;text-align:center">分类管理</h2>

        <div class="row">

        </div>
            <div class="row">
            <div class="col-sm-12">
                <button onclick="toadd()" class="btn btn-primary"  id="tianjia"><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;添加一级分类</button>
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


            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">添加分类信息</h4>
                </div>
                <input type="hidden" class="form-control" name="typeId"  value="0"/>
                <input type="hidden" class="form-control" name="dengji"  value="1"/>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 text-right">分类名称:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="typeName"  placeholder="请输入分店名称" />
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        <button type="button" name="tj" onclick="add()" class="btn btn-primary">确定</button>
                    </div>

                </div>
            </div>
        </form>
    </div>
</div>













  <%--子模态框--%>

<div class="modal inmodal" id="addmoda2" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
    <div class="modal-dialog">
        <form class="form-horizontal" id="userform"  method="post" role="form">
            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">添加二级分类信息</h4>
                </div>
                typeId: <input type="text" class="form-control" name="typeId"  />
              等级：  <input type="text" class="form-control" name="dengji2" />
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 text-right">分类名称:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="typeNamee"  placeholder="请输入分店名称" />
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        <button type="button" name="tj" onclick="addd()" class="btn btn-primary">确定</button>
                    </div>

                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script>

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
        url:'${pageContext.request.contextPath}/ShopType/TJquery',
        toolbar:'#br',
        height:'800',
        pageSize : 15,
        pageList:[2,3,4,8,15],
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
                field:'typeId',
                title:'编号',
                align:'center'
            },
            {
                field:'typeName',
                title:'分类名称',
                align:'center'
            },
            {
                field:'dengji',
                title:'分类等级',
                align:'center'
            },
            {
                field:'shangji',
                title:'上级id',
                align:'center'
            },
            {
                title:'操作',
                align:'center',
                formatter:function (varlue,row,index) {
                 if(row.dengji ==3 ){

                     return " <button onclick=\"toupdate("+index+")\" class='btn btn-info'><span class='glyphicon glyphicon-pencil'></span>&nbsp;修改</button>"+
                         "  \n" +
                         "   <button class='btn btn-info'  onclick='shann("+index+")'>删除</button>"

                 }else if(row.dengji ==2){
                     return " <button onclick=\"toupdate("+index+")\" class='btn btn-info'><span class='glyphicon glyphicon-pencil'></span>&nbsp;修改</button>"+
                         "  \n" +
                         "   <button class='btn btn-info'  onclick='shann("+index+")'>删除</button>"+ "" +
                         "   <button class='btn btn-info' onclick='toaddd("+index+")'>添加三级分类</button>";

                 }else {
                     return " <button onclick=\"toupdate("+index+")\" class='btn btn-info'><span class='glyphicon glyphicon-pencil'></span>&nbsp;修改</button>"+
                         "  \n" +
                         "   <button class='btn btn-info'  onclick='shann("+index+")'>删除</button>"+ "" +
                         "   <button class='btn btn-info' onclick='toaddd("+index+")'>添加二级分类</button>";

                 }




                }
            }
        ]

    })

    });
    /*打开添加一级模态框*/
    function toadd() {
        document.getElementById("userform").reset();
        $("#userform").data('bootstrapValidator').resetForm();//清除当前验证的关键之处
        $("#addmodal").modal("show");

    }

    /*点击保存  添加一级*/
    function add() {


        //启用校验
        $('#userform').data('bootstrapValidator').validate();

        //校验是否通过
        var flag = $('#userform').data('bootstrapValidator').isValid();
        if(flag){

            //序列化表单
            var formStr = $('#userform').serialize()

            //处理表单控件的中文乱码
            params = decodeURIComponent(formStr,true);

            $.post('${pageContext.request.contextPath}/ShopType/addinfo',params,function (data) {
                //关闭模态框
                $("#addmodal").modal('hide');
                //清空数据
                document.getElementById("userform").reset();

                //友好提示
                swal("提示信息", "添加成功!", "success");

                //重新绑定表格数据

                $("#tables").bootstrapTable('load',data) ;


            })
        }

    }




var a =1;
    /*打开添加子模态框*/
    function toaddd(index) {
        $("#addmoda2").modal("show");
        //得到所选行的数据
        //取消所有选择
        $("#tables").bootstrapTable("uncheckAll");
        //选中要修改的行
        $("#tables").bootstrapTable("check", index);
        //得到所选行的数据
        var row = $("#tables").bootstrapTable("getSelections")[0];
        shangji = $("input[name = 'typeId']").val(row.typeId) ;  //上级id


        typeName =   $("input[name = 'typeNamee']").val();
        dengji =  parseInt($("input[name = 'dengji2']").val(row.dengji))


        alert(dengji)

    }

 /*   /!*添加二级分类*!/*/
    function addd() {


        $.ajax({
            'type':'post',
            'url':'${pageContext.request.contextPath}/ShopType/addinfo',
            data:{
                dengji :parseInt($("input[name = 'dengji2']").val())+1,
                typeName:$("[name = 'typeNamee']").val(),
                shangji:$("input[name = 'typeId']").val()
            },
            success:function(data){
                //关闭模态框
                $("#addmoda2").modal('hide');
                //重新绑定表格数据
                $("#tables").bootstrapTable('load',data) ;
            }
        })



    }



</script>
</html>

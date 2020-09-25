
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="/com/tagg.jsp"/>


<head>
    <title>权限管理</title>
    <link rel="stylesheet" href="../static/login/bootstrap.min.css">



</head>

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
                    },




                }
            });

        //表格信息
        $("#tables").bootstrapTable({
            url:'${pageContext.request.contextPath}/Role/Rolelist',
            toolbar:'#br',
            height:'400',


            columns:[
                {
                    checkbox:true
                },
                {
                    field:'roleId',
                    title:'序号',
                    align:'center'
                },
                {
                    field:'roleName',
                    title:'职位',
                    align:'center'
                },
                {
                    title:'操作',
                    align:'center',
                    formatter:function (varlue,row,index) {
                        return "<button class='btn btn-info' onclick='dofp("+row.roleId+")'><span class='glyphicon glyphicon-edit'></span>&nbsp;分配权限</button>" +
                        " <button onclick=\"toupdate("+index+")\" class='btn btn-info'><span class='glyphicon glyphicon-pencil'></span>&nbsp;修改</button>"
                    +" <button onclick=\"todel()\" class=\"btn btn-primary\"><span class=\"glyphicon glyphicon-trash\"></span>&nbsp;&nbsp;删除</button>";
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
           /* alert( $("input[name = 'roleId']").val())*/


        }

        /*打开修改模态框*/

        function toupdate(index) {





            //取消所有选择
            $("#tables").bootstrapTable("uncheckAll");
            //选中要修改的行
            $("#tables").bootstrapTable("check", index);
            //得到所选行的数据
            var row = $("#tables").bootstrapTable("getSelections")[0];
            //绑定主键
            $("input[name = 'roleId']").val(row.roleId);
            $("input[name = 'roleName']").val(row.roleName);
            $("#addmoda2").modal("show");
        }



        function add1() {


            $('#userform').data('bootstrapValidator').validate();

            //校验是否通过
            var flag = $('#userform').data('bootstrapValidator').isValid();




            if(flag){
                alert(roleId)
                //序列化表单
                var formStr = $('#userform').serialize()

                //处理表单控件的中文乱码
                params = decodeURIComponent(formStr,true);
                alert(params)
                $.post('${pageContext.request.contextPath}/Role/InsertList',params,function (data) {
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





            /*点击保存按钮*/
        function add() {




                //启用校验
                $('#userform').data('bootstrapValidator').validate();

                //校验是否通过
                var flag = $('#userform').data('bootstrapValidator').isValid();

                if (flag){


                    //序列化表单
                    var formStr = $('#userform').serialize()

                    //处理表单控件的中文乱码
                    params = decodeURIComponent(formStr,true);

                    $.ajax({
                        'type':'post',
                        'url':'${pageContext.request.contextPath}/Role/updateList',
                        'data':params,
                        success:function(data){
                            //关闭模态框
                            $("#addmoda2").modal('hide');
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
                    ids = ids + row.roleId + "-";
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


        var roleid;
        //打开分配权限框
        function dofp(id) {
            roleid = id;
            var a = 0;
            $("#modal-id").modal('show');

            $("#modal-id").on("shown.bs.modal",function () {

                if(++a == 1){
                    //当对话框加载完成以后，展示树形菜单
                    $.post('${pageContext.request.contextPath}/Role/doFenPei',
                        {'roleid':id},function (data) {
                        $("#searchTree").treeview({
                            showCheckbox:true,
                            data:data,
                            onNodeChecked: nodeChecked,
                            onNodeUnchecked: nodeUnchecked
                        });


                    })


                }

            })
        }


        function fenpei() {
            var pmid = "";
            //1.
            var cks = $("#searchTree").treeview('getChecked');
            $.each(cks,function (i,n) {
                pmid = pmid + "-" + n.id;
            })

            $.post('${pageContext.request.contextPath}/RolePermission/grantPermission',{'roleid':roleid,'pmid':pmid},function (data) {

                if(data.msg == "1"){
                    //关闭对话框
                    $("#modal-id").modal('hide');
                }



            })
        }

    </script>

<body>

<%--职位信息--%>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">职位列表</h3>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-sm-6">
                <button onclick="toadd()" class="btn btn-primary" id="tianjia"><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;添加职位信息</button>
               <%-- <button onclick="todel()" class="btn btn-primary"><span class="glyphicon glyphicon-trash"></span>&nbsp;&nbsp;删除</button>--%>
            </div>

        </div>
        <div class="row">
            <div class="col-sm-12">
                <table id="tables"></table>
            </div>
        </div>

    </div>
</div>



<%--增加模态框--%>

    <div class="modal inmodal" id="addmodal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
        <div class="modal-dialog">
            <form class="form-horizontal" id="userform"  method="post" role="form">



                <input name="r" id="r" value="0" hidden>
                <div class="modal-content animated bounceInLeft">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title">增加职位</h4>
                    </div>



                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-3 text-right">职位名称:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="roleName"  placeholder="请输入职位名称" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                            <button type="button" name="tj" onclick="add1()" class="btn btn-primary">保存</button>
                        </div>

                    </div>


                </div>
            </form>
        </div>
    </div>









<%--修改模态框--%>
<div>
    <div class="modal inmodal" id="addmoda2" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
        <div class="modal-dialog">
            <form class="form-horizontal" id="userform"  method="post" role="form">



                <input name="roleId" id="roleId">
                <div class="modal-content animated bounceInLeft">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title">修改职位</h4>
                    </div>



                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-3 text-right">职位名称:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="roleName"  placeholder="请输入职位名称" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                            <button type="button" name="tj" onclick="add()" class="btn btn-primary">保存</button>
                        </div>

                    </div>

                </div>
            </form>
        </div>
    </div>
</div>



<%--分配权限模态框--%>

<div class="modal fade" id="modal-id">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">分配权限</h4>
            </div>
            <div class="modal-body">
               <div id="searchTree"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button onclick="fenpei()" type="button" class="btn btn-primary">分配</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>


<script>


    $(function () {

    })

    var treeData = [{
        text: "Parent 1",
        nodes: [{
            text: "Child 1",
            nodes: [{
                text: "Grandchild 1"
            }, {
                text: "Grandchild 2",
                nodes: [{
                    text: "Grandchild 2-1",
                    nodes: [{
                        text: "Grandchild 2-1-1"
                    }, {
                        text: "Grandchild 2-2-1",
                    }]
                }, {
                    text: "Grandchild 1-2",
                }]
            }]
        }, {
            text: "Child 2",
            nodes: [{
                text: "Grandchild 2-1"
            }, {
                text: "Grandchild 2-2",
            }]
        }]
    }, {
        text: "Parent 2",
        id:'11111'
    }, {
        text: "Parent 3"
    }, {
        text: "Parent 4"
    }, {
        text: "Parent 5"
    }];



    var nodeCheckedSilent = false;

    function nodeChecked(event, node) {
        if (nodeCheckedSilent) {
            return;
        }
        nodeCheckedSilent = true;
        checkAllParent(node);
        checkAllSon(node);
        nodeCheckedSilent = false;
    }

    var nodeUncheckedSilent = false;

    function nodeUnchecked(event, node) {
        if (nodeUncheckedSilent)
            return;
        nodeUncheckedSilent = true;
        uncheckAllParent(node);
        uncheckAllSon(node);
        nodeUncheckedSilent = false;
    }

    //选中全部父节点
    function checkAllParent(node) {
        $('#searchTree').treeview('checkNode', node.nodeId, {
            silent: true
        });
        var parentNode = $('#searchTree').treeview('getParent', node.nodeId);
        if (!("nodeId" in parentNode)) {
            return;
        } else {
            checkAllParent(parentNode);
        }
    }
    //取消全部父节点
    function uncheckAllParent(node) {
        $('#searchTree').treeview('uncheckNode', node.nodeId, {
            silent: true
        });
        var siblings = $('#searchTree').treeview('getSiblings', node.nodeId);
        var parentNode = $('#searchTree').treeview('getParent', node.nodeId);
        if (!("nodeId" in parentNode)) {
            return;
        }
        var isAllUnchecked = true; //是否全部没选中
        for (var i in siblings) {
            if (siblings[i].state.checked) {
                isAllUnchecked = false;
                break;
            }
        }
        if (isAllUnchecked) {
            uncheckAllParent(parentNode);
        }

    }
    //级联选中所有子节点
    function checkAllSon(node) {
        $('#searchTree').treeview('checkNode', node.nodeId, {
            silent: true
        });
        if (node.nodes != null && node.nodes.length > 0) {
            for (var i in node.nodes) {
                checkAllSon(node.nodes[i]);
            }
        }
    }
    //级联取消所有子节点
    function uncheckAllSon(node) {
        $('#searchTree').treeview('uncheckNode', node.nodeId, {
            silent: true
        });
        if (node.nodes != null && node.nodes.length > 0) {
            for (var i in node.nodes) {
                uncheckAllSon(node.nodes[i]);
            }
        }
    }










</script>


</html>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>



<head>
    <jsp:include page="../com/tagg.jsp"/>
    <title>用户信息</title>
    <link rel="stylesheet" href="../static/login/bootstrap.min.css">
</head>
    <script>
        //条件查询
        function searcha(){
            //返回表格的 Options
            var opts = $("#tables").bootstrapTable("getOptions");
            var limit = opts.pageSize;
            var offset = (opts.pagerNumber - 1) * limit;
            var mname = $("#mname").val();

            $.get("${pageContext.request.contextPath}/Mapper/TJquery",{'mname':mname,'limit':limit,'offset':offset},function (data) {

                //重新绑定表格数据
                $("#tables").bootstrapTable('load',data) ;
            })
        }

        //表格
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
                    mname: {
                        message: 'The username is not valid',
                        validators: {
                            notEmpty: {
                                message: '用户名不能为空！'
                            },
                            stringLength: {
                                min: 3,
                                max: 16,
                                message: '必须是3-16个字符'
                            },
                            regexp: {
                                regexp: /^[a-zA-Z0-9_\.]+$/,
                                message: '字母或者数字开头'
                            }
                        }
                    },
                    password:{
                        message:'',
                        validators: {
                            notEmpty: {
                                message: '密码不能为空！'
                            },
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: '必须是6-30个字符'
                            }
                        }
                    },
                    confirmpwd:{
                        message:'',
                        validators: {
                            notEmpty: {
                                message: '确认密码不能为空！'
                            },
                            identical:{
                                field: 'password',
                                message:'两次密码不一致'
                            }
                        }

                    },
                    phone:{
                        validators: {
                            notEmpty: {
                                message: '手机号码不能为空！'
                            },
                            regexp: {
                                regexp:             /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/,
                                message: '请填写正确的手机号码'
                            }
                        }

                    }

                }
            });

            /*修改校验*/

            <!--校验框架-->
            $('#userupdateforms').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    mname: {
                        message: 'The username is not valid',
                        validators: {
                            notEmpty: {
                                message: '用户名不能为空！'
                            },
                            stringLength: {
                                min: 3,
                                max: 16,
                                message: '必须是3-16个字符'
                            },
                            regexp: {
                                regexp: /^[a-zA-Z0-9_\.]+$/,
                                message: '字母或者数字开头'
                            }
                        }
                    },
                    password:{
                        message:'',
                        validators: {
                            notEmpty: {
                                message: '密码不能为空！'
                            },
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: '必须是6-30个字符'
                            }
                        }
                    },
                    confirmpwd:{
                        message:'',
                        validators: {
                            notEmpty: {
                                message: '确认密码不能为空！'
                            },
                            identical:{
                                field: 'password',
                                message:'两次密码不一致'
                            }
                        }

                    },
                    phone:{
                        validators: {
                            notEmpty: {
                                message: '手机号码不能为空！'
                            },
                            regexp: {
                                regexp:             /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/,
                                message: '请填写正确的手机号码'
                            }
                        }

                    }

                }
            });




            //表格信息
            $("#tables").bootstrapTable({
                url:'../Mapper/TJquery',
                toolbar:'#br',
                height:'700',
                pageSize : 6,
                pageList:[2,6,8,12],
                pagerNumber:1,
                //启用分页，但默认情况下，是客户端分页
                pagination:true,
                //启用服务器端分页
                sidePagination : 'server',

               queryParams:function(params){

                    var temp = {
                        limit : params.limit,//页面大小
                        offset:params.offset,//页面
                        mname:$("#mname").val()
                    };
                    return temp;

                },

                columns:[
                    {
                        checkbox:true
                    },
                    {
                        field:'managerId',
                        title:'用户编号',
                        align:'center'
                    },
                    {
                        field:'mname',
                        title:'用户名',
                        align:'center'
                    },
                    {
                        field:'photo',
                        title:'头像',
                        align:'center',
                        formatter:function (value,row,index) {
                            return "<img class=\"img-circle\"  src='${pageContext.request.contextPath}/"+row.photo+"' width=\"50px\" height=\"50px\">"
                        }
                    },
                    {
                        field:'phone',
                        title:'联系方式',
                        align:'center'
                    },
                    {
                        field:'address',
                        title:'地址',
                        align:'center'
                    }

                    ,
                    {
                        field:'role.roleName',
                        title:'职位',
                        align:'center'
                    },
                    {
                        title:'操作',
                        align:'center',
                        formatter:function (varlue,row,index) {
                            return  " <button onclick=\"toupdate("+index+")\" class='btn btn-info'><span class='glyphicon glyphicon-pencil'></span>&nbsp;修改</button> "
                            +" "
                        }
                    }
                ]

            })

        });

        /*打开增加模态框*/
        function toadd() {
            document.getElementById("userform").reset();

            $("#userform").data('bootstrapValidator').resetForm();//清除当前验证的关键之处

            $("#addmodal").modal("show");

        }

        /*点击添加按钮*/
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

                //异步处理
                /*$.post('${pageContext.request.contextPath}/Manager/addinfo',params,function (data) {
                    //关闭模态框
                    $("#addmodal").modal('hide');
                    //清空数据
                    document.getElementById("userform").reset();

                    //友好提示
                    swal("提示信息", "添加成功!", "success");

                    //重新加载
                    searcha();


                });*/


                $.ajax({
                    type : 'post',
                    url : '${pageContext.request.contextPath}/Mapper/addinfo',
                    data : new FormData($("#userform")[0]),
                    contentType: false, //必须false才会自动加上正确的Content-Type
                    processData: false,//必须false才会避开jQuery对 formdata 的默认处理XMLHttpRequest会对 formdata 进行正确的处理
                    success : function (data) {
                        document.getElementById("userform").reset();
                        $("#userform").data('bootstrapValidator').resetForm();//清除当前验证的关键之处
                        /*隐藏对话框*/
                        $("#addmodal").modal('hide');
                        $("#tables").bootstrapTable('load',data);
                        //提示增加成功
                        swal("提示信息", "增加成功!", "success");
                    }
                })

                //清空校验
                $("#userform").data('bootstrapValidator').resetForm();//清除当前验证的关键之处
            }



        }

        /*绑定增加职位数据*/
        $(function () {
            $.ajax({
                url:'${pageContext.request.contextPath}/Role/Rolelist',
                type:"get",
                success:function(data){
                    $.each(data,function(){
                        var adds=$("<option value='"+this.roleId+"'>"+this.roleName+"</option>");
                        $(".k").append(adds);
                    });
                }
            })
        })

        /*绑定修改职位数据*/
        $(function () {
            $.ajax({
                url:'${pageContext.request.contextPath}/Role/Rolelist',
                type:"get",
                success:function(data){
                    $.each(data,function(){
                        var adds=$("<option value='"+this.roleId+"'>"+this.roleName+"</option>");
                        $(".o").append(adds);
                    });
                }
            })
        })

        /*打开修改模态框*/

        function toupdate(index) {

            //取消所有选择
            $("#tables").bootstrapTable("uncheckAll");
            //选中要修改的行
            $("#tables").bootstrapTable("check", index);
            //得到所选行的数据
            var row = $("#tables").bootstrapTable("getSelections")[0];
            //绑定主键
            $("input[name = 'managerId']").val(row.managerId);
            //绑定当前页开始
            var options = $('#tables').bootstrapTable('getOptions');
            //得到当前页
            var pn = options.pagerNumber;
            //绑定当前页
            $("input[name = 'pn']").val(pn);
            $("#mnames").val(row.mname);
            $("#phone").val(row.phone);
            $("#address").val(row.address);
            $("#roleId").val(row.roleId);
            $("#updatemodal").modal("show");
        }

        /*修改*/
        function update2() {


            //启用校验
            $('#userupdateforms').data('bootstrapValidator').validate();

            //校验是否通过
            var flag = $('#userupdateforms').data('bootstrapValidator').isValid();

            if(flag){

                //序列化表单
                var formStr = $('#userupdateforms').serialize()

                //处理表单控件的中文乱码
                params = decodeURIComponent(formStr,true);

                $.ajax({
                    'type':'post',
                    'url':'${pageContext.request.contextPath}/Mapper/updateInfo',
                    'data':params,
                    success:function(data){
                        //关闭对话框
                        $("#updatemodal").modal('hide') ;
                        //友好的提示
                        swal("提示信息", "修改成功!", "success");
                        //重新加载表格
                        $("#tables").bootstrapTable('load',data) ;

                    }
                })

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
                    ids = ids + row.managerId + "-";
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
                        $.post("${pageContext.request.contextPath}/Mapper/delInfo",{'ids': ids,'pn':pn},function(data){
                            //友好的提示
                            swal("删除成功！", "您已经永久删除了这条信息。", "success");
                            //刷新表格
                            $("#tables").bootstrapTable('load',data) ;
                        })

                    });

            }
        }

        /*上传*/
        $(function () {
            $(".myfile").fileinput({
                language: 'zh',
                //uploadUrl: "/role/uploadFile",
                maxFileSize: 0, //文件的大小
                maxFileCount:1,//文件的数量
                showUpload:false, //是否显示上传按钮
                showRemove :false, //显示移除按钮
                showPreview :true, //是否显示预览
                allowedFileExtensions: ["jpg", "png", "gif","jpeg"],
                enctype: 'multipart/form-data', //二进制传递参数
                browseClass: "btn btn-primary", //按钮样式
                dropZoneEnabled : false,//是否显示拖拽区域，默认不写为true，但是会占用很大区域
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
                msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            }).on("fileuploaded", function (event, data, previewId, index){
                swal({title:"上传成功",text:"小手一抖就上传成功了！",type:"success"});
                $("[name='photo']").val("/image/"+data.response.url);
            });
        })




    </script>

    <body>

    <%--用户信息--%>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">用户列表</h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-6">
                    <button onclick="toadd()" class="btn btn-primary">添加用户信息</button>
                    <button onclick="todel()" class="btn btn-primary"><span class="glyphicon glyphicon-trash"></span>&nbsp;&nbsp;批量删除</button>
                </div>
                <div class="col-sm-6">
                    <form  class="form-inline pull-right">
                        <input id="mname" type="text" class="form-control">
                        <button class="btn btn-primary" onclick="searcha()" type="button"><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;搜索</button>
                    </form>
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
    <div>
        <div class="modal inmodal" id="addmodal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
        <div class="modal-dialog">
            <form class="form-horizontal" id="userform"  method="post" role="form">
                <div class="modal-content animated bounceInLeft">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title">录入管理员信息</h4>
                    </div>

                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-3 text-right" for="mname">管理员名称:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="mname"  placeholder="请输入管理员名称" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 text-right">管理员密码:</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control" name="password" placeholder="请输入管理员密码"  />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 text-right">确认密码:</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control" name="confirmpwd" placeholder="再次输入密码"  />
                            </div>
                        </div>
                        <div class="form-group" hidden>
                            <label class="control-label col-sm-3">头像：</label>
                            <div class="col-sm-8">
                                <input multiple type="file" name="touxiang " class="myfile" value=""/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="" class="col-sm-3 text-right">联系方式:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="phone" placeholder="联系方式"  />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="" class="col-sm-3 text-right">地址:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="address" placeholder="请填写地址"  />
                            </div>
                        </div>

                        <%--管理员职位--%>
                        <div class="form-group">
                            <label for="" class="col-sm-3 text-right">管理员职位:</label>
                            <div class="col-sm-8">
                                <select name="roleId" id="inputID" class="form-control k">
                                    <option value="0">全部</option>
                                </select>
                            </div>
                        </div>


                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="close()">关闭</button>
                            <button type="button" name="tj" onclick="add()" class="btn btn-primary">添加</button>
                        </div>

                    </div>
                </div>
            </form>
        </div>
    </div>
    </div>


    <%--修改模态框--%>
    <div>
        <div class="modal inmodal" id="updatemodal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
        <div class="modal-dialog">
            <form class="form-horizontal" id="userupdateforms"  method="post" role="form">

                <input type="hidden" name="managerId">
                <input type="hidden" name="pn">

                <div class="modal-content animated bounceInLeft">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title">修改管理员信息</h4>
                    </div>

                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-4 text-right" for="mname">管理员名称:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="mname" id="mnames"  placeholder="请输入管理员名称" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="" class="col-sm-4 text-right">联系方式:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="phone" id="phone" placeholder="联系方式"  />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="" class="col-sm-4 text-right">地址:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="address" id="address" placeholder="请填写地址"  />
                            </div>
                        </div>

                        <%--管理员职位--%>
                        <div class="form-group">
                            <label for="" class="col-sm-4 text-right">管理员职位:</label>
                            <div class="col-sm-6">

                                <select name="roleId" id="roleId" class="form-control o">

                                </select>

                            </div>
                        </div>


                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="close()">关闭</button>
                            <button type="button" name="xg" onclick="update2()" class="btn btn-primary">修改</button>
                        </div>

                    </div>
                </div>  </form>

        </div>
    </div>
    </div>



    </body>
</html>

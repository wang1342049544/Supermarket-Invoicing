<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 2020/6/26
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/com/tagg.jsp"/>
    <link rel="stylesheet" href="../static/login/bootstrap.min.css">
</head>
<body>
<input type="hidden" id="storeId" value="${param.storeId}">
id:<input type="text" name="id" >

<div class="panel panel-default">
    <div class="panel-body">
        <div class="row">  </div>

        <div class="row">
            <div class="col-sm-12">
                <table id="tables"></table>
            </div>
           <%-- &lt;%&ndash;增加 到盘库表里边  再盘库记录再显示出来&ndash;%&gt;
            <button style="float: right" class="btn btn-primary" onclick="tijiao('index')" type="button"><span class=""></span>确认提交</button>--%>
        </div>
<%--
        <input type="text" name="storeId">--%>

    </div>
</div>
</body>
<script>
    function tijiao(index) {
        //取消所有选择
     $("#tables").bootstrapTable("uncheckAll");
        $("#tables").bootstrapTable("check", index);
        var row = $("#tables").bootstrapTable("getSelections")[0];
        var id= $("input[name = 'id']").val(row.id);

        //获取 实际数量
        var shiji = $("[name = 'shiji']").val();
        alert(shiji)



        //库存数量

        //商品名称

        //仓库编号

        //当前日期

        //操作员

  //状态 0 未完成  1已经完成

        //ajax 添加到 库存记录表





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
            url:'${pageContext.request.contextPath}/Store/TT?storeId='+$('#storeId').val(),
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
                    field:'id',
                    title:'序号',
                    align:'center'
                },
                {
                    field:'storeId',
                    title:'仓库编号',
                    align:'center'
                },
                {
                    field:'sName',
                    title:'商品名称',
                    align:'center'
                },
                {
                    field:'nums',
                    title:'库存数量',
                    align:'center'
                },

                {
                    title:'实际数量',
                    align:'center',
                    formatter:function (varlue,row,index) {
                        return "     <input name='shiji' style='border:white ' type=\"text\"> "
                    }
                },
                {
                    title:'操作',
                    align:'center',
                    formatter:function (varlue,row,index) {
                        return "  <button class='btn btn-info'  onclick='tijiao("+index+")'>盘库</button>"




                    }
                }
            ]

        })

    });

</script>

</html>

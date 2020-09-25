
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>采购单据查询</title>
    <jsp:include page="/com/tagg.jsp"/>


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
                    {
                        field:'yingF',
                        title:'应付金额',
                        align:'center'
                    },
                    {
                        field:'shiF',
                        title:'实付金额',
                        align:'center'
                    },
                    {
                        field:'manager.mname',
                        title:'经办人',
                        align:'center'
                    },
                    {
                        field:'manager.mname',
                        title:'操作员',
                        align:'center'
                    },
                    {
                        field:'audit.auditName',
                        title:'审核状态',
                        align:'center'
                    },
                    {
                        field:'remake',
                        title:'备注 ',
                        align:'center'
                    }
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





        

        


</head>
<body>




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

</body>
</html>

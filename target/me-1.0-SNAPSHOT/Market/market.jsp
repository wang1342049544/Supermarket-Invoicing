
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品销售</title>
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

        function searcha(){
            //返回表格的 Options
            var opts = $("#tables").bootstrapTable("getOptions");
            var limit = opts.pageSize;
            var offset = (opts.pagerNumber - 1) * limit;

            var typeId = $("[name = 'typeId']").val();
            var buName = $("#buName").val();


            $.get("${pageContext.request.contextPath}/Sales/queryTJ",{'typeId':typeId,'buName':buName,'limit':limit,'offset':offset},function (data) {

                //重新绑定表格数据
                $("#tables").bootstrapTable('load',data) ;
            })
        }

        $(function () {

            /*判断库存量*/
            $.post("${pageContext.request.contextPath}/Sales/queryBJ",function (data) {

                if(data == 1){
                    swal("您有商品数量不足！", "温馨提示。", "warning");
                }else if (data == 2){

                }

            })

            /*客户*/
            $.ajax({
                url:'${pageContext.request.contextPath}/customer/listquery',
                type:"get",
                success:function(data){
                    $.each(data,function(){
                        var adds=$("<option value='"+this.id+"'>"+this.cName+"</option>");
                        $(".o").append(adds);


                    });
                }
            })

            /*展示商品*/
            $("#tables").bootstrapTable({

                url:'${pageContext.request.contextPath}/KCT/TJquery',
                toolbar:'#br',
                height:'600',
                pageSize : 8,
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
                        field:'kcId',
                        title:'商品编号',
                        align:'center'
                    },
                    {
                        field:'sName',
                        title:'商品名称',
                        align:'center'
                    },
                    /*{
                        field:'touxiang',
                        title:'图片',
                        align:'center',
                        formatter:function (value,row,index) {
                            return "<img class=\"img-circle\"  src='${pageContext.request.contextPath}/"+row.touxiang+"' width=\"60px\" height=\"60px\">"
                        }
                    },
*/
                    {
                        field:'danWei',
                        title:'单位',
                        align:'center'
                    },
                    {
                        field:'nums',
                        title:'数量',
                        align:'center'
                    },
                    {
                        field:'jprice',
                        title:'售价',
                        align:'center'
                    },
                    {
                        field:'shoptype.typeName',
                        title:'商品类型',
                        align:'center'
                    },
                    {
                        field:'yileld',
                        title:'生产日期',
                        align:'center'
                    },
                    {
                        field:'pledge',
                        title:'保质期',
                        align:'center'
                    },
                    {
                        field:'expiration',
                        title:'到期时间 ',
                        align:'center'
                    },

                    {
                        title:'操作',
                        align:'center',
                        formatter:function (varlue,row,index) {
                            return "<button style='background: red;border: red' class='btn btn-info' onclick='gou("+index+")'><span style='background: red' class='glyphicon glyphicon-shopping-cart'>&nbsp;</span>添加</button>" + "&nbsp;&nbsp;"+
                                ""

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

            /*临时商品表*/
            $("#twoTables").bootstrapTable({
                url:'${pageContext.request.contextPath}/Khshop/queryTJ',
                toolbar:'#br',
                height:'600',
                pageSize :8,
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
                        title:'售价',
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
                    },

                    {
                        title: '操作',
                        align: 'center',
                        formatter: function (varlue, row, index) {
                            return "<button style='background: red;border: red' class='btn btn-info'>删除</button>" + "&nbsp;&nbsp;" +
                                ""

                        }
                    }
                /*    {
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
                    },
                    {
                        field:'zjifen',
                        title:'总积分',
                        align:'center'
                    }*/
                ]
            })
        })


        /*购买商品*/
        function gou(index) {

            //取消所有选择
            $("#tables").bootstrapTable("uncheckAll");

            $("#tables").bootstrapTable("check", index);

            var row = $("#tables").bootstrapTable("getSelections")[0];

            $("[name = 'buId']").val(row.kcId);
            $("[name = 'buName']").val(row.sName);
            $("[name = 'danWei']").val(row.danWei);
            $("[name = 'price']").val(row.jprice);
            $("[name = 'money']").val(row.jprice);
            $("[name = 'dh']").val(row.dh);

            $("[name = 'numss']").val(row.nums);

            $("#addmoda1").modal("show");

        }


        /*随机事件*/
        function mysFunction(is) {

            var dan = $("[name = 'price']").val();
            var nums = $(is).val();


                var moneys = dan * nums;
                $("[name = 'money']").val(moneys);




        }

        /*购买*/
        function addx() {

           var one = $("[name = 'num']").val();
           var two = $("[name = 'numss']").val();
          /*  if(one > two){
                swal("数量不足", "温馨提示!", "warning");
            }else {*/


                $("[name = 'dh']").val(0);
                var buId = $("[name = 'buId']").val();
                var num = $("[name = num]").val();
                var price = $("[name = 'price']").val();
                var dh = $("[name = 'dh']").val();

                $.post("${pageContext.request.contextPath}/Khshop/SelectTG",{"buId":buId,"dh":dh},function (data) {


                    if(data != 0){
                        var sum = parseInt(data) + parseInt(num);
                        var money = sum * price;
                        $.post("${pageContext.request.contextPath}/Khshop/updlist",{"sum":sum,"money":money,"buId":buId,"dh":dh},function (data) {

                            if(data != null){
                                document.getElementById("userfromv").reset();
                                /* /!* 隐藏对话框*!/*/
                                $("#addmoda1").modal('hide');
                                $("#twoTables").bootstrapTable('load',data) ;
                                //提示增加成功
                                swal("提示信息", "增加成功!", "success");
                            }

                        })

                    }else{
                        $.ajax({
                            type : 'post',
                            url : '${pageContext.request.contextPath}/Khshop/Insertlist',
                            data : new FormData($("#userfromv")[0]),
                            contentType: false, //必须false才会自动加上正确的Content-Type
                            processData: false,//必须false才会避开jQuery对 formdata 的默认处理XMLHttpRequest会对 formdata 进行正确的处理
                            success : function (data) {
                                document.getElementById("userfromv").reset();

                                $("#addmoda1").modal('hide');
                                $("#twoTables").bootstrapTable('load',data) ;
                                //提示增加成功
                                swal("提示信息", "增加成功!", "success");
                            }
                        })
                    }
                })




           /* }*/

        }

        /*兑换商品*/
        function dui(index) {

            var id = $("[name = 'id']").val();
            $("[name = 'dh']").val(1);

            if(id == 0){
                swal("请选择客户！", "温馨提示。", "warning");
            }else {

                //取消所有选择
                $("#tables").bootstrapTable("uncheckAll");

                $("#tables").bootstrapTable("check", index);

                var row = $("#tables").bootstrapTable("getSelections")[0];

               var jifens = row.jifen;

                $.post("${pageContext.request.contextPath}/customer/jifen",{"id":id},function (data) {

                    if(data >= jifens){

                        $("[name = 'buId']").val(row.buId);
                        $("[name = 'buName']").val(row.buName);
                        $("[name = 'danWei']").val(row.danWei);
                        $("[name = 'price']").val(row.price);
                        $("[name = 'jifen']").val(row.jifen);
                        $("[name = 'zjifen']").val(row.jifen);
                        $("[name = 'numss']").val(row.num);

                        $("#addmoda2").modal("show");

                    }else
                    {
                        swal("积分不足！", "温馨提示。", "warning");
                    }




                })


            }

        }

        /*积分*/
        function mysFunctions(is) {
            var dan = $("[name = 'jifen']").val();
            var nums = $(is).val();

            var sum = $("[name = 'numss']").val();



                var moneys = dan * nums;
                $("[name = 'zjifen']").val(moneys);
                //获取他的总积分
                var zjifen = $("[name = 'zjifen']").val();
                //获取客户编号
                var id = $("[name = 'id']").val();
                $.post("${pageContext.request.contextPath}/customer/jifen",{"id":id},function (data) {

                    if(data >= zjifen){

                    }else {
                        $("[name = 'num']").val(1);
                        $("[name = 'zjifen']").val(dan);
                        swal("积分不足！", "温馨提示。", "warning");
                    }

                })




        }

        /*积分兑换*/
        function addxs() {

            var buId = $("[name = 'buId']").val();
            var num = $("#nums").val();
            var jifen = $("[name = 'jifen']").val();
            var dh = $("[name = 'dh']").val();

            $.post("${pageContext.request.contextPath}/Khshop/SelectTG",{"buId":buId,"dh":dh},function (data) {

                if(data != 0){

                    var sum = parseInt(data) + parseInt(num);

                    var zjifen = sum * jifen;

                    $.post("${pageContext.request.contextPath}/Khshop/updlists",{"sum":sum,"zjifen":zjifen,"buId":buId,"dh":dh},function (data) {
                        if(data != null){
                            document.getElementById("userfromm").reset();
                            /* /!* 隐藏对话框*!/*/
                            $("#addmoda2").modal('hide');
                            $("#twoTables").bootstrapTable('load',data) ;
                            //提示增加成功
                            swal("提示信息", "增加成功!", "success");
                        }

                    })

                }else{
                    $.ajax({
                        type : 'post',
                        url : '${pageContext.request.contextPath}/Khshop/Insertlist',
                        data : new FormData($("#userfromm")[0]),
                        contentType: false, //必须false才会自动加上正确的Content-Type
                        processData: false,//必须false才会避开jQuery对 formdata 的默认处理XMLHttpRequest会对 formdata 进行正确的处理
                        success : function (data) {
                            document.getElementById("userfromm").reset();
                            $("#addmoda2").modal('hide');
                            $("#twoTables").bootstrapTable('load',data) ;
                            //提示增加成功
                            swal("提示信息", "增加成功!", "success");
                        }
                    })
                }

            })


        }


        /*购买*/
        function goumai() {
        //会员购买

            var id = $("[name = 'id']").val();


         if(id !=0){
                //勾选商品
                var ids = "";//数据
                var sids = "";//编号
                var ides = "";
                //得到要删除的行
                //返回所选的行，当没有选择任何行的时候返回一个空数组。
                var rows = $("#twoTables").bootstrapTable("getSelections") ;
                //判断是否选中所删除的行
                if(rows.length == 0){
                    swal("请选择商品！", "温馨提示!", "warning");
                }else {

                    /!*生产销售单据号*!/
                    function pad2(n) { return n < 10 ? '0' + n : n }
                    function generateTimeReqestNumber() {
                        var date = new Date();
                        return date.getFullYear().toString() + pad2(date.getMonth() + 1) + pad2(date.getDate()) + pad2(date.getHours()) + pad2(date.getMinutes()) ;
                    }
                    var rand = Math.floor(Math.random() * 900) + 100;
                    var order_id =   rand + generateTimeReqestNumber();

                    //获取销售单据号
                    var danhao = "XS" + order_id;
                    //单据类型 0销售 1退货
                    var danType = 0;
                    //获取当前时间
                    var now= new Date();
                    var year=now.getFullYear();
                    var month=now.getMonth()+1;
                    var day=now.getDate();
                    //当前时间
                    var times = year + "-"+ month + "-" + day;
                    //获取付款金额
                    var money = $("[name = 'moneyes']").val();
                    //获取销售积分
                    var zjifen = $("[name = 'zjifens']").val();
                    //操作员
                    var cz = $("[name = 'czz']").val();
                    //权限中销售人员
                    var ro = $("[name = 'ro']").val();

                    if( ro== 4){

                        //添加单据
                        $.post("../Xsbills/Insertlist",{
                            "id":id,
                            "danhao":danhao,
                            "danType":danType,
                            "times":times,
                            "money":money,
                            "zjifen":zjifen,
                            "cz":cz
                        },function (data) {

                            if(data == 1){

                                $.each(rows,function (index,row) {
                                    sids = sids + row.buId + "-" + row.dh + "-" + danhao +    "," ;
                                });

                                //查询客户商品临时表，添加到销售详情表
                                $.post("${pageContext.request.contextPath}/Khshop/selectTH",{"sids":sids},function (data) {

                                    if(data == 1){
                                        //根据消费金额(5%)生产积分添加给客户，并且减去他消费的积分
                                        var xjifen = money * 0.05;//客户消费获得的积分
                                        var jis = zjifen - xjifen;//花掉的总积分 - 消费获得的积分

                                        //查询该客户的总积分 然后减去消费的积分
                                        /*      $.post("${pageContext.request.contextPath}/customer/jifen",{"id":id},function (data) {*/
                                        if(data >= jis){
                                            var jie = data - jis;
                                            var ji = parseInt(jie);//转化为整数
                                            $.post("${pageContext.request.contextPath}/customer/xiulist",{"ji":ji,"id":id},function (data) {
                                                if(data == 1){

                                                    //把销售表里面的商品数量修改
                                                    $.each(rows,function (index,row) {
                                                        ids = ids + row.buId + "-" + danhao  + "-" + row.dh +"," ;
                                                    });
                                                    /*   $.post("${pageContext.request.contextPath}/Xsdetails/slectGH",{"ids":ids},function (data) {*/
                                                    if(data == 1){
                                                        //获取商品编号，删除选择商品临时表
                                                        $.each(rows,function (index,row) {
                                                            ides = ides + row.buId +"-" ;
                                                        });
                                                        $.post("${pageContext.request.contextPath}/Khshop/delInfo",{"ides":ides},function (data) {
                                                            $("#twoTables").bootstrapTable('removeAll');
                                                            swal("购买成功！", "温馨提示!", "success");
                                                            $("[name = 'moneyes']").val(0);
                                                            $("[name = 'zjifens']").val(0);
                                                            return;
                                                        })
                                                    }



                                                    /*  })*/

                                                }else {
                                                    swal("购买失败！", "温馨提示!", "warning");
                                                }





                                            })
                                        }else {
                                            swal("积分不足！", "温馨提示!", "warning");
                                        }



                                        /*})*/

                                    }else {
                                        alert("错误");
                                    }

                                })

                            }else {
                                alert("添加失败");
                            }

                        })

                    }else{
                        alert("只有销售人员可提交")
                    }







                }


            }else {
                swal("请选择客户！", "温馨提示!", "warning");
            }
        }





        function goumaii() {
            /*首先判断客户是否为空*/
            var idd = $("[name = 'idd']").val();


            // text 购买
            if(idd){
                //勾选商品
                var ids = "";//数据
                var sids = "";//编号
                var ides = "";
                //得到要删除的行
                //返回所选的行，当没有选择任何行的时候返回一个空数组。
                var rows = $("#twoTables").bootstrapTable("getSelections") ;
                //判断是否选中所删除的行
                if(rows.length == 0){
                    swal("请选择商品！", "温馨提示!", "warning");
                }else {

                    /!*生产销售单据号*!/
                    function pad2(n) { return n < 10 ? '0' + n : n }
                    function generateTimeReqestNumber() {
                        var date = new Date();
                        return date.getFullYear().toString() + pad2(date.getMonth() + 1) + pad2(date.getDate()) + pad2(date.getHours()) + pad2(date.getMinutes()) ;
                    }
                    var rand = Math.floor(Math.random() * 900) + 100;
                    var order_id =   rand + generateTimeReqestNumber();

                    //获取销售单据号
                    var danhao = "XS" + order_id;
                    //单据类型 0销售 1退货
                    var danType = 0;
                    //获取当前时间
                    var now= new Date();
                    var year=now.getFullYear();
                    var month=now.getMonth()+1;
                    var day=now.getDate();
                    //当前时间
                    var times = year + "-"+ month + "-" + day;
                    //获取付款金额
                    var money = $("[name = 'moneyes']").val();
                    //获取销售积分
                    var zjifen = $("[name = 'zjifens']").val();
                    //操作员
                    var cz = $("[name = 'czz']").val();

                    //权限中销售人员
                    var ro = $("[name = 'ro']").val();

                    if( ro== 4){
                        //添加单据
                        $.post("../Xsbills/Insertlist",{
                            "id":idd,
                            "danhao":danhao,
                            "danType":danType,
                            "times":times,
                            "money":money,
                            "zjifen":zjifen,
                            "cz":cz
                        },function (data) {

                            if(data == 1){

                                $.each(rows,function (index,row) {
                                    sids = sids + row.buId + "-" + row.dh + "-" + danhao +"," ;
                                });

                                //查询客户商品临时表，添加到销售详情表
                                $.post("${pageContext.request.contextPath}/Khshop/selectTH",{"sids":sids},function (data) {

                                    if(data == 1) {
                                        //根据消费金额(5%)生产积分添加给客户，并且减去他消费的积分
                                        var xjifen = money * 0.05;//客户消费获得的积分
                                        var jis = zjifen - xjifen;//花掉的总积分 - 消费获得的积分


                                        $("#twoTables").bootstrapTable('removeAll');
                                        swal("购买成功！", "温馨提示!", "success");
                                        $("[name = 'moneyes']").val(0);
                                        $("[name = 'zjifens']").val(0);
                                        return;

                                    }
                                })



                            }


                        })
                    }else{
                        alert("只有销售员可提交")
                    }

                }
            }
        }

    </script>
</head>
<body>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">商品销售</h3>
    </div>
    <div class="panel-body">
        <div class="row">
            <input type="hidden" name="cz" value="${Mapper.managerId}">

        </div>

        <div class="row">
            <br>
            <form action="" method="post" role="form" class="form-horizontal">
                <div class="row">
                <%--仓库--%>
                    <div class="col-sm-3 form-group">
                        <label for="" class="col-sm-3 text-right control-label">商品类型:</label>
                        <div class="col-sm-8">
                            <select  class="form-control " style="width: 200px">
                                <option value="0">全部</option>
                            </select>

                        </div>
                    </div>

            </form>
       <%--     操作员--%>
            <input type="hidden" value="${sessionScope.manager.managerId}" name="czz">
            <input type="hidden" value="${sessionScope.manager.roleId}" name="ro">

                <div class="col-sm-6 form-group">
                    <form  class="form-inline">
                        <label for="" class="col-sm-3 text-right control-label">商品名称:</label>
                        <input id="buName" type="text" class="form-control">
                        <button style="background: red;border: red" class="btn btn-primary" onclick="searcha()" type="button"><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;搜索</button>
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
               <h2 style="text-align: center;margin: 0 0 0 720px;color: red">详情</h2>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <table id="twoTables"></table>
            </div>
        </div>

    </div>


<%--底部--%>
<div class="row">

  <%--  &lt;%&ndash;客户&ndash;%&gt;--%>
    <div class="col-sm-3 form-group">
        <label for="" class="col-sm-3 text-right control-label">客户:</label>
        <div class="col-sm-8">
            <select name="id" id="id" class="form-control o" onchange="fen()">
                <option value="0">全部</option>
            </select>
            <input type="hidden" name="gzhis">
        </div>
    </div>



    <%--总金额--%>
        <div class="col-sm-3 form-group" style="color:red ">
            <label for="" class="col-sm-3 text-right control-label">总金额:</label>
            <div class="col-sm-8">
              <input type="text" name="moneyes" id="moneys" style="border: white">
            </div>
        </div>
    <%--总积分--%>
        <div class="col-sm-3 form-group" hidden>
            <label for="" class="col-sm-3 text-right control-label">总积分:</label>
            <div class="col-sm-8">
                <input type="text" name="zjifens" id="zjifens">
            </div>
        </div>

        <%--总金额--%>
        <div class="row">
            <form action="" method="post" role="form" class="form-horizontal">
                <%--按钮--%>
                <div class="col-md-offset-5">
                    <button class="btn btn-primary" style="background: red;border: red" onclick="goumai()" type="button"><span class=""></span>会员订单</button>
                </div>
            </form>
        </div>
</div>





<%--底部--%>
<div class="row">

    <%--购买人--%>
    <div class="col-sm-3 form-group">

        <div class="col-sm-8">
            购买人：<input type="text" name="idd" id="idd">
        </div>
    </div>
        <%--总金额--%>
        <div class="col-sm-3 form-group" style="color:red ">
            <label for="" class="col-sm-3 text-right control-label">总金额:</label>
            <div class="col-sm-8">
                <input type="text" name="moneyes" id="moneys" style="border: white">
            </div>
        </div>



    <%--总金额--%>
    <div class="row">
        <form action="" method="post" role="form" class="form-horizontal">
            <%--按钮--%>
            <div class="col-md-offset-5">
                <button class="btn btn-primary" style="background: red;border: red" onclick="goumaii()" type="button"><span class=""></span>普通订单</button>
            </div>
        </form>
    </div>
</div>




<%--购买商品页面--%>
<div class="modal inmodal" id="addmoda1" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
    <div class="modal-dialog">
        <form class="form-horizontal" id="userfromv"  method="post" role="form">
            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">商品信息</h4>
                </div>


                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 text-right" for="">商品编号:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="buId" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">商品名称:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="buName" id="buNames" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">单位:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="danWei" id="danWeis" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">售价:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="price" id="prices" readonly/>
                        </div>
                    </div>
                    <%--数量--%>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">数量:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="num" oninput="mysFunction(this)" value="1"/>
                        </div>
                    </div>

                    <%--总金额--%>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">总金额:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="money"/>
                        </div>
                    </div>

                    <input type="hidden" name="numss">


                    <input type="hidden" name="dh" value="0">
                    <input type="hidden" name="zjifen" value="0">

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="close()">关闭</button>
                        <button type="button" name="tj" onclick="addx()" class="btn btn-primary">添加</button>
                    </div>

                </div>
            </div>
        </form>
    </div>
</div>

<%--兑商品--%>
<div class="modal inmodal" id="addmoda2" tabindex="-1" role="dialog" aria-labelledby="modelTitleId">
    <div class="modal-dialog">
        <form class="form-horizontal" id="userfromm"  method="post" role="form">
            <div class="modal-content animated bounceInLeft">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">商品信息</h4>
                </div>


                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 text-right" for="">商品编号:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="buId" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">商品名称:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="buName" id="buNamess" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">单位:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="danWei" id="danWei" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                    <label for="" class="col-sm-3 text-right">价钱:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="price" id="price" readonly/>
                    </div>
                </div>

                    <%--积分--%>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">积分:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="jifen" id="jifen" readonly/>
                        </div>
                    </div>

                    <%--数量--%>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">数量:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="num" id="nums" oninput="mysFunctions(this)" value="1"/>
                        </div>
                    </div>

                    <%--总金额--%>
                    <div class="form-group">
                        <label for="" class="col-sm-3 text-right">总积分:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="zjifen"/>
                        </div>
                    </div>

                    <input type="hidden" name="numss">

                    <input type="hidden" value="1" name="dh">

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="close()">关闭</button>
                        <button type="button" name="tj" onclick="addxs()" class="btn btn-primary">添加</button>
                    </div>

                </div>
            </div>
        </form>
    </div>
</div>

</body>


<script>
    /*算钱*/
    $(function () {

        /*复选框*/
        $(function () {
            $('#twoTables').on('uncheck.bs.table check.bs.table check-all.bs.table uncheck-all.bs.table',function(e,rows){
                var datas = $.isArray(rows) ? rows : [rows];        // 点击时获取选中的行或取消选中的行
                examine(e.type,datas);
            });
        });
        /*总金额*/
        var overAllIds = new Array();
        function examine(type,datas){
            if(type.indexOf('uncheck')==-1){
                $.each(datas,function(i,v){
                    // 添加时，判断一行或多行的 id 是否已经在数组里 不存则添加　
                    overAllIds.indexOf(v.money) == -1 ? overAllIds.push(v.money * 1) : -1;
                    chai(overAllIds);
                });
            }else{
                $.each(datas,function(i,v){
                    overAllIds.splice(overAllIds.indexOf(v.money * 1),1);    //删除取消选中行
                    chai(overAllIds);
                });
            }
        }
        /*金额*/
        function chai(overAllIds){
            var moeny = 0;
            if( overAllIds.length == 0 ){
                $("[name = 'moneyes']").val("");
            }else{
                for (var i = 0; i < overAllIds.length; i++) {
                    var zhi = overAllIds[i];
                    moeny = zhi + moeny;
                    $("[name = 'moneyes']").val(moeny);

                }
            }
        }

    })

    $(function () {

        /*复选框*/
        $(function () {
            $('#twoTables').on('uncheck.bs.table check.bs.table check-all.bs.table uncheck-all.bs.table',function(e,rows){
                var datas = $.isArray(rows) ? rows : [rows];        // 点击时获取选中的行或取消选中的行
                examine(e.type,datas);
            });
        });

        /*总积分*/
        var overAllIdss = new Array();
        function examine(type,datas){
            if(type.indexOf('uncheck')==-1){
                $.each(datas,function(i,v){
                    // 添加时，判断一行或多行的 id 是否已经在数组里 不存则添加　
                    overAllIdss.indexOf(v.zjifen) == -1 ? overAllIdss.push(v.zjifen * 1) : -1;
                    chai(overAllIdss);
                });
            }else{
                $.each(datas,function(i,v){
                    overAllIdss.splice(overAllIdss.indexOf(v.zjifen * 1),1);    //删除取消选中行
                    chai(overAllIdss);
                });
            }
        }
        /*金额*/
        function chai(overAllIdss){
            var moeny = 0;
            if( overAllIdss.length == 0 ){
                $("[name = 'zjifens']").val("");
            }else{
                for (var i = 0; i < overAllIdss.length; i++) {
                    var zhi = overAllIdss[i];
                    moeny = zhi + moeny;
                    $("[name = 'zjifens']").val(moeny);

                }
            }
        }

    })

</script>

</html>

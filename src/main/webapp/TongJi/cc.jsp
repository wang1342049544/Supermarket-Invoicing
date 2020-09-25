<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/com/tagg.jsp"/>
    <title>商品年月销售额度</title>
</head>
<body>
<div style="height: 150px"></div>






<form  method="post">
    <select class="layui-select" id="xsTime" lay-verify="required" style="height: 30px" >
        <option value="2018">2018</option>
        <option value="2019">2019</option>
        <option value="2020">2020</option>

    </select>


    <%--    <select class="layui-select" id="typeId" lay-verify="required" >
            <c:forEach items="${cate}" var="a">
                <option value="${a.typeId}">${a.typeName}</option>
            </c:forEach>
        </select>--%>


    <button class="btn btn-primary" onclick="searcha()" type="button"><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;搜索</button>
</form>
<div id="main" style="height:650px;padding-top: 50px"></div>


</body>


<script>



    searcha();







    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    //设置等待图
    myChart.showLoading();

    var option = {
        title: {
            text: '年月总销售额统计'
        },
        tooltip: {},
        legend: {
            data:['年月总销售额']
        },
        xAxis: {
            data: []
        },
        yAxis: {},
        series: [{
            name: '年月总销售额',
            type: 'bar',
            data: []
        }]
    };

    myChart.setOption(option);



    function searcha(){
        //返回表格的 Options
        var xsTime = $("#xsTime").val();
           /* alert(xsTime)*/
        $.post("${pageContext.request.contextPath}/Xsdetails/zz",{'xsTime':xsTime},function (data) {
            console.log(data.namelist)
            var xq = data.namelist;
            var xqsum = data.countlist ;
            option = {
                toolbox: {          //图表容器的右上角工具栏
                    feature: {
                        dataView: {show: true, readOnly: false},
                        magicType: {show: true, type: ['line', 'bar']},
                        restore: {show: true},
                        saveAsImage: {show: true}
                    }
                },
                xAxis: {
                    type: 'category',
                    data: xq,
                },
                yAxis: {
                    type: 'value'
                },
                series: [{
                    name: '年月总销售额',
                    type: 'bar',
                    data: xqsum,
                }]
            };
            myChart.setOption(option);
            myChart.hideLoading();
        })
    }
</script>

</html>

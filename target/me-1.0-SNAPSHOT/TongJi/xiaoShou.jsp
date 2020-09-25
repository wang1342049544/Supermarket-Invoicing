
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/com/tagg.jsp"/>
    <title>商品销售</title>
</head>
<body>
<div id="main" style="height:400px;padding-top: 50px"></div>
</body>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    //设置等待图
    myChart.showLoading();
    option = {
        title: {
            text: '商品销售额'
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: []
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            data: [],
            type: 'line',
            areaStyle: {}
        }]
    };
    myChart.setOption(option);

    $.post("${pageContext.request.contextPath}/Xsdetails/ShopXS",function (data) {

        console.log(data.namelist)
        var xq = data.namelist;
        var xqsum = data.countlist ;

        option = {
            title: {
                text: '商品销售额'
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: xq,
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                data: xqsum,
                type: 'line',
                areaStyle: {}
            }]
        };
        myChart.setOption(option);
        myChart.hideLoading();

    })

</script>


</html>

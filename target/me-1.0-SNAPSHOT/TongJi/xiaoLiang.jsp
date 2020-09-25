
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/com/tag.jsp"/>
    <title>商品销量</title>
</head>
<body>


        <div id="main" style="height:400px;padding-top: 50px"></div>


</body>


<script>
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    //设置等待图
    myChart.showLoading();

    var option = {
        title: {
            text: '商品销量TOP'
        },
        tooltip: {},
        legend: {
            data:['销量']
        },
        xAxis: {
            data: []
        },
        yAxis: {},
        series: [{
            name: '销量',
            type: 'bar',
            data: []
        }]
    };

    myChart.setOption(option);



    $.post("${pageContext.request.contextPath}/Xsdetails/ShopTop",function (data) {
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
                name: '销量',
                type: 'bar',
                data: xqsum,
            }]
        };
        myChart.setOption(option);
        myChart.hideLoading();
    })
</script>

</html>

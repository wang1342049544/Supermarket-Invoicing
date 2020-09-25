<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 2020/6/15
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="height: 100%; margin: 0">



<div id="main" style="height: 100%"></div>




<jsp:include page="/com/tagg.jsp"/>


<script type="text/javascript">
    var dom = document.getElementById("main");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;







    $.post("${pageContext.request.contextPath}/KCT/Shopkct",function (data) {
        var xq = data.namelist;
        var xqsum = data.countlist ;
    option = {
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b}: {c} ({d}%)'
        },
        legend: {
            orient: 'vertical',
            left: 10,
            data: xq,
        },
        series: [
            {
                name: '数量',
                type: 'pie',
                radius: ['50%', '70%'],
                avoidLabelOverlap: false,
                label: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    label: {
                        show: true,
                        fontSize: '30',
                        fontWeight: 'bold'
                    }
                },
                labelLine: {
                    show: false
                },
                data: [

                   {value:  xqsum[0], name: xq[0]},
                    {value:  xqsum[1], name:  xq[1]},
                    {value:  xqsum[2], name:  xq[2]},
                    {value:  xqsum[3], name:  xq[3]},
                    {value:  xqsum[4], name: xq[4]},
                    {value:  xqsum[5], name: xq[5]},
                    {value:  xqsum[6], name: xq[6]},
                    {value:  xqsum[7], name: xq[7]},
                    {value:  xqsum[9], name: xq[9]},
                    {value:  xqsum[10], name: xq[10]},
                    {value:  xqsum[11], name: xq[11]},
                    {value:  xqsum[12], name: xq[12]},
                  /*  {value:  xqsum[8], name: xq[8]}*/
                ]
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
    })
</script>
</body>
</html>

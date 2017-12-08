<%@ Page Title="" Language="C#" MasterPageFile="~/SMasterPage.master" AutoEventWireup="true" CodeFile="SByTime.aspx.cs" Inherits="SByTime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>"
        SelectCommand="select mealName from meal where taxID=@taxID">
        <SelectParameters>
            <asp:SessionParameter SessionField="taxID" Name="taxID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>"
        SelectCommand="select meal.mealName,orderList.orderTime from orderContains inner join meal on orderContains.mealNo=meal.mealNo inner join orderList on orderContains.orderNo=orderList.orderNo where taxID=@taxID">
        <SelectParameters>
            <asp:SessionParameter SessionField="taxID" Name="taxID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="grv1" runat="server" DataSourceID="SqlDataSource1" CssClass="grv1"></asp:GridView>
    <asp:GridView ID="grv2" runat="server" DataSourceID="SqlDataSource2" CssClass="grv2"></asp:GridView>

    <div id="ByTime" style="width: 600px; height: 400px;">
    </div>

    <script src="Scripts/jquery-3.2.1.min.js"></script>
    <script src="Scripts/echarts.min.js"></script>
    <script>
        //$('#ContentPlaceHolder1_grv1').hide();

        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('ByTime'));

        var meallist_arry = [];
        var mealname_arry = [];
        var mealtime_arry = [];

        //找整間店的菜單
        $(".grv1>tbody>tr>td").each(function () {
                meallist = $(this).text();
                meallist_arry.push(meallist);
        });

        
        //取得訂餐時間
        $(".grv2>tbody>tr>td").each(function (i) {
            if (i % 2 == 0) {
                mealname = $(this).text();
            }
            if (i % 2 == 1) {
                mealtime = $(this).text();
                mealname_arry.push(mealname);
                mealtime_arry.push(mealtime);
            }
        });


        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '未来一周气温变化',
                subtext: '纯属虚构'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['最高气温', '最低气温']
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
            },
            yAxis: {
                type: 'value',
                axisLabel: {
                    formatter: '{value} °C'
                }
            },
            series: [
                {
                    name: '最高气温',
                    type: 'line',
                    data: [11, 11, 15, 13, 12, 13, 10],
                    markPoint: {
                        data: [
                            { type: 'max', name: '最大值' },
                            { type: 'min', name: '最小值' }
                        ]
                    },
                },
                {
                    name: '最低气温',
                    type: 'line',
                    data: [1, -2, 2, 5, 3, 2, 0]
                }
            ]
        };



        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>




</asp:Content>


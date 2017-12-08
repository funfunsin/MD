<%@ Page Title="" Language="C#" MasterPageFile="~/SMasterPage.master" AutoEventWireup="true" CodeFile="SByMeal.aspx.cs" Inherits="SByMeal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>"
        SelectCommand="select meal.mealName,sum(orderContains.quantity) as quantity from orderContains inner join meal on orderContains.mealNo=meal.mealNo inner join orderList on orderContains.orderNo=orderList.orderNo where taxID=@taxID group by meal.mealName">
        <SelectParameters>
            <asp:SessionParameter SessionField="taxID" Name="taxID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="grvBymeal" runat="server" DataSourceID="SqlDataSource1" CssClass="grvBymeal"></asp:GridView>

    <div id="bymeal" style="width: 600px; height: 400px;">
    </div>

    <script src="Scripts/jquery-3.2.1.min.js"></script>
    <script src="Scripts/echarts.min.js"></script>
    <script>
        $('#ContentPlaceHolder1_grvBymeal').hide();

        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('bymeal'));

        var mealname_arry = [];
        var quantity_arry = [];

        $(".grvBymeal>tbody>tr>td").each(function (i) {
            if (i % 2 == 0) {
                mealname = $(this).text();
            }
            if (i % 2 == 1) {
                quantity = Number($(this).text());
                mealname_arry.push(mealname);
                quantity_arry.push(quantity);
            }
        });

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '各品項銷售一覽',
                //subtext: ''
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {type: 'shadow'}
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
                type: 'value',
                boundaryGap: [0,'20%']
            },
            yAxis: {
                type: 'category',
                data: mealname_arry,
                boundaryGap: [0, '20%']
            },
            series: {
                name: '數量',
                type: 'bar',
                barWidth: '30px',
                data: quantity_arry
            }
        };



        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>




</asp:Content>


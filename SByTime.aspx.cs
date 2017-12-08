using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SByTime : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString);
        //SqlDataAdapter da = new SqlDataAdapter("select mealName from meal where taxID = '01010101'", conn); //列出該店家所有餐點
        //DataSet ds = new DataSet();
        //da.Fill(ds, "mealList");  //使用Fill 將資料填入DataSet ds

        //for (int i = 0; i <= ds.Tables["mealList"].Rows.Count - 1; i++)
        //{
        //    Table meal = new Table();
        //    TableCell dr1 = new TableCell();
        //    TableRow tr = new TableRow();
        //    dr1.Text = ds.Tables["mealList"].Rows[i][0].ToString();
        //    tr.Cells.Add(dr1);
        //    ds.Tables["mealList"].Rows.Add(tr);
        //    //Response.Write("aa");

        //}






    }
}
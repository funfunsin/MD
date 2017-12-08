using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Smenu : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        txtMealNo.Text = getMealNo();
    }
    protected string getMealNo()
    {
        string MealNo = "";
        SqlCommand cmd = new SqlCommand("select [dbo].[fnGetMealNo]()", conn);

        SqlDataReader rd;
        conn.Open();
        rd = cmd.ExecuteReader();
        rd.Read();
        MealNo = rd[0].ToString();
        conn.Close();

        return MealNo;
    }




    protected void btnAddmeal_Click(object sender, EventArgs e)
    {
        try
        {
            fulImg.SaveAs(Server.MapPath("~/images/meal/" + txtMealNo.Text + ".jpg"));

            SqlCommand comm = new SqlCommand("insert into meal values(@mealNo, @mealName,@price,@mealTime,@taxID,@img,1)", conn);

            comm.Parameters.AddWithValue("@mealNo", txtMealNo.Text);
            comm.Parameters.AddWithValue("@mealName", txtMealName.Text);
            comm.Parameters.AddWithValue("@price", txtPrice.Text);
            comm.Parameters.AddWithValue("@mealTime", txtMealTime.Text);
            comm.Parameters.AddWithValue("@taxID", Session["taxID"]);
            comm.Parameters.AddWithValue("@img", txtMealNo.Text);

            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();


            grvMenu.DataBind();
            txtMealName.Text = "";
            txtPrice.Text = "";
            txtMealTime.Text = "";
            txtMealNo.Text = getMealNo();

        }
        catch (Exception ex)
        {
            Response.Write("上傳沒有成功!原因是:" + ex.Message);
        }
    }

    protected void grvMenu_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int index = e.Row.Cells.Count - 1;
        if (e.Row.RowIndex != -1)
        {
            if (((Button)e.Row.Cells[index].Controls[0]).CommandName == "Delete")
                ((Button)e.Row.Cells[index].Controls[0]).Attributes["onclick"] = "if(!confirm('此動作無法復原 您確定要下架【" + e.Row.Cells[1].Text + "】嗎?')) return;";
        }
    }
}
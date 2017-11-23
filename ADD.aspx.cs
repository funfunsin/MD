using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ADD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //只有第一次載入時才執行
        if (!IsPostBack)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter("select * from foodcourt", conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "foodcourt");

            ddlfoodcourtName.DataTextField = "foodcourtName";
            ddlfoodcourtName.DataValueField = "foodcourtNo";
            ddlfoodcourtName.DataSource = ds.Tables["foodcourt"];

            DataBind();

            ListItem item = new ListItem("請選擇美食街");
            ddlfoodcourtName.Items.Insert(0, item);  //若用add會加在陣列最後方,因此用insert
        }

    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataSource1.Insert();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    protected void ddlfoodcourtName_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtFoodcourtNo.Text = ddlfoodcourtName.SelectedItem.Value;
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("SLogin.aspx");
    }

    //protected void txtTaxID_TextChanged(object sender, EventArgs e)
    //{
    //    //強制先完成CustomValidator1驗證
    //  CustomValidator1.Validate();

    //    //判斷IsValid的值
    //    if (CustomValidator1.IsValid)
    //    {
    //        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString);
    //        SqlCommand cmd = new SqlCommand("select dbo.fnCheckCourseID('" + txtTaxID.Text + "')", conn);

    //        SqlDataReader dr;
    //        conn.Open();
    //        dr = cmd.ExecuteReader();
    //        dr.Read();

    //        if (dr[0].ToString() == "1")
    //        {
    //            lbInfo.Text = "統一編號可用";
    //            lbInfo.ForeColor = System.Drawing.Color.Green;
    //        }
    //        else
    //        {
    //            lbInfo.Text = "統一編號重複";
    //            lbInfo.ForeColor = System.Drawing.Color.Red;
    //        }
    //        conn.Close();

    //    }
    //    else
    //        lbInfo.Text = "";

    //}
}
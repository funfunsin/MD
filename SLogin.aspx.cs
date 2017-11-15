using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select * from store inner join foodcourt on store.foodcourtNo=foodcourt.foodcourtNo where taxID=@taxID and password=@password", conn);
        cmd.Parameters.AddWithValue("@taxID", txtTaxID.Text);
        cmd.Parameters.AddWithValue("@password", txtPassword.Text);
        SqlDataReader dr;

        conn.Open();
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            //ViewState["aa"] = 1;  生命週期是在該網頁,換頁就會不見了
            Session["taxID"] = dr["taxID"].ToString();   //生命週期是在該網站,把瀏覽器關了才會不見(才能知道該帳號是否有登入)
            Session["storeName"] = dr["storeName"].ToString();
            Session["foodcourtNo"] = dr["foodcourtNo"].ToString();
            Session["foodcourtName"] = dr["foodcourtName"].ToString();

            Response.Redirect("SBulletin.aspx"); //登入成功後進入的頁面!
        }
        else
        {
            lblInfo.Text = "您的統一編號或密碼有誤!!";
        }
        conn.Close();

    }

}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SBulletin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["taxID"] == null)
            Response.Redirect("SLogin.aspx");

        lblWelcome.Text = Session["storeName"].ToString() + "歡迎進入後台管理系統!!";
    }
}
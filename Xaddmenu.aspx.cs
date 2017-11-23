using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Saddmenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        lbFoodcourtName.Text = (string)Session["foodcourtName"];
        lbStoreName.Text = (string)Session["storeName"];
        lbTaxID.Text = (string)Session["taxID"];

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
}
﻿using System;
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
        if (Session["taxID"] == null)
            Response.Redirect("SLogin.aspx");
        else
        {
            lbFoodcourtName.Text = Session["foodcourtName"].ToString();
            lbStoreName.Text = Session["storeName"].ToString();
            lbTaxID.Text= Session["taxID"].ToString();
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
}
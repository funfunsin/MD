﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class STodayOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbtaxID.Text = (String)Session["taxID"];
    }

    protected void grvFinish_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete") {
            grvFinished.DataBind();
        }
    }
}
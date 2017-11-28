using System;
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

    protected void grvWaite_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            //grvFinish.DataBind(); //不知道為什麼不能用
            grvFinish.DataSourceID = "SqlDataSource2";
        }
    }


    protected void grvFinish_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            grvWaite.DataSourceID = "SqlDataSource1";
        }
    }

}
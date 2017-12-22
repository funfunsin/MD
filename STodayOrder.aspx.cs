using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class STodayOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["today"] = DateTime.UtcNow.AddHours(8).ToString("yyyy/MM/dd");
        if (this.IsPostBack)
        {
            TabName.Value = Request.Form[TabName.UniqueID];
        }
        if (Session["QR"] == null)
        {

        }
        else
        {
            TabName.Value = "take";
            Session["QR"] = null;
        }
    }

    protected void grvWaite_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            //grvFinish.DataBind();  //不知道為什麼不能用
            grvFinish.DataSourceID = "SqlFinish";
        }
    }


    protected void grvFinish_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            grvWaite.DataSourceID = "SqlWaite";
        }
    }



    protected void grTaken_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "select")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$('#detailtaken').modal()", true);
        }
    }
    protected void grTake_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "select")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$('#detailtake').modal()", true);
        }
    }
}
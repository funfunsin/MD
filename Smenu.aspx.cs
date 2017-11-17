using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Smenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbtaxID.Text = (String)Session["taxID"];
    }



    protected void grvMenu_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
    }
}
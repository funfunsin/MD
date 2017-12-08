using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void StoreData_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        string subfilename = "";
        try
        {
            if (e.CommandName == "Update")
            {
                FileUpload fulImg = ((FileUpload)StoreData.FindControl("fulImg"));
                //判斷檔案類型是否正確
                subfilename = fulImg.FileName.Substring(fulImg.FileName.IndexOf(".") + 1, 3).ToLower();
                if (subfilename == "jpg" || subfilename == "png")
                {
                    fulImg.SaveAs(Server.MapPath("/images/store/" + Session["taxID"] + ".jpg"));
                }
                else
                {
                    Response.Write("<script>alert('請檢查圖片檔案正確性!')</script>");
                }
            }
        }
        catch(Exception ex)
        {
            Response.Write(ex.Message);
        }

    }
}
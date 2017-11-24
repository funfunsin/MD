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
        lbtaxID.Text = (string)Session["taxID"];
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
                subfilename = fulImg.FileName.Substring(fulImg.FileName.IndexOf(".") + 1, 3);
                if (subfilename == "jpg" || subfilename == "png")
                {
                    fulImg.SaveAs(Server.MapPath("/images/store/" + lbtaxID.Text + ".jpg"));
                }
                else
                {
                    //Label1.Text = "請檢查圖片檔案正確性!";
                }
            }
        }
        catch(Exception ex)
        {
            Response.Write("檔案上傳失敗!" + ex.Message);
        }

    }
}
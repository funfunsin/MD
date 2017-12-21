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
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString);
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
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("update store set img='" + Session["taxID"] + "' where taxID=@taxID", conn);
                    cmd.Parameters.AddWithValue("@taxID", Session["taxID"]);
                    cmd.ExecuteNonQuery();
                    conn.Close();

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

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (txtNewPassword.Text == txtPasswordconfirm.Text)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("update store set password='"+ txtPasswordconfirm.Text+ "' where taxID=@taxID", conn);
            cmd.Parameters.AddWithValue("@taxID", Session["taxID"]);
            cmd.ExecuteNonQuery();
            conn.Close();
            lbPasswordInfo.Text = "密碼更新成功!";
            lbPasswordInfo.ForeColor = System.Drawing.Color.Green;
        }
        else
        {
            lbPasswordInfo.Text = "密碼確認與新密碼不符!";
            lbPasswordInfo.ForeColor = System.Drawing.Color.Red;
        }

    }
}
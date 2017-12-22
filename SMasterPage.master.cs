using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["taxID"] == null)
        {
            Response.Redirect("LOGIN.aspx");
        }
        else
        {

        }
    }

    protected void btnupdatetaken_Click(object sender, EventArgs e)
    {
        SqlDataSource1.UpdateCommand = "update orderList set taken = 1 where orderNo = '" + txtorderno.Value + "'";
        SqlDataSource1.Update();
        Session["QR"] = "1";
        Response.Redirect("STodayOrder.aspx");
    }

    protected void btnMail_Click(object sender, EventArgs e)
    {
        //聯絡我們
        SmtpClient myMail = new SmtpClient("msa.hinet.net");  //用hinet寄

        TextBox txtEmail = (TextBox)FindControl("txtEmail");
        string userMail = txtEmail.Text;

        TextBox txtName = (TextBox)FindControl("txtName");
        string userName = txtName.Text;

        TextBox txtContent = (TextBox)FindControl("txtContent");
        string mailContent = txtContent.Text;

        MailAddress from = new MailAddress(userMail, userName + "使用者來信");
        MailAddress to = new MailAddress("esinfang@gmail.com");

        MailMessage MyMsg = new MailMessage(from, to);
        MyMsg.IsBodyHtml = true;
        MyMsg.Body = mailContent;
        MyMsg.Subject = "聯絡我們-使用者來信E-mail測試";

        try
        {
            myMail.Send(MyMsg);
            txtEmail.Text = "";
            txtName.Text = "";
            txtContent.Text = "";
            Response.Write("<script>alert('信件已寄出!\\n感謝您的來信')</script>");
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LOGIN : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["guest"] = "guest";
        Session["taxID"] = null;

        //只有第一次載入時才執行
        if (!IsPostBack)
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from foodcourt", conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "foodcourt");

            ddlfoodcourtName.DataTextField = "foodcourtName";
            ddlfoodcourtName.DataValueField = "foodcourtNo";
            ddlfoodcourtName.DataSource = ds.Tables["foodcourt"];

            DataBind();

            ListItem item = new ListItem("請選擇美食街");
            ddlfoodcourtName.Items.Insert(0, item);  //若用add會加在陣列最後方,因此用insert

        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("select * from store inner join foodcourt on store.foodcourtNo=foodcourt.foodcourtNo where taxID=@taxID and password=@password", conn);
        cmd.Parameters.AddWithValue("@taxID", txtTaxID.Text);
        cmd.Parameters.AddWithValue("@password", txtPassword.Text);
        SqlDataReader dr;

        conn.Open();
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Session["taxID"] = dr["taxID"].ToString();   //生命週期是在該網站,把瀏覽器關了才會不見(才能知道該帳號是否有登入)
            Session["storeName"] = dr["storeName"].ToString();
            Session["foodcourtNo"] = dr["foodcourtNo"].ToString();
            Session["foodcourtName"] = dr["foodcourtName"].ToString();

            Response.Redirect("SBulletin.aspx"); //登入成功後進入的頁面!

        }
        else
        {
            lblInfo.Text = "您的統一編號或密碼有誤!!";
        }
        conn.Close();
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        string subfilename = "";
        try
        {
            FileUpload fulImg = (FileUpload)FindControl("fulImg");
            //判斷檔案類型是否正確
            subfilename = fulImg.FileName.Substring(fulImg.FileName.IndexOf(".") + 1, 3).ToLower();
            if (subfilename == "jpg" || subfilename == "png")
            {
                TextBox txtAddTaxID = (TextBox)FindControl("txtAddTaxID");
                string taxID = txtAddTaxID.Text;
                fulImg.SaveAs(Server.MapPath("/images/store/" + taxID + ".jpg"));
                SqlDataSource1.Insert();
                Response.Write("<script>alert('註冊成功!')</script>");

                //清空註冊欄位
                ddlfoodcourtName.SelectedIndex = 0;
                txtAddTaxID.Text = "";
                txtStoreName.Text = "";
                txtTel.Text = "";
                txtMoneyAccount.Text = "";
            }
            else
            {
                Response.Write("<script>alert('請檢查圖片檔案正確性!')</script>");
            }

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);  //txtTaxID.Text = ex.Message;
        }
    }

    protected void ddlfoodcourtName_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtFoodcourtNo.Text = ddlfoodcourtName.SelectedItem.Value;
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

    protected void txtAddTaxID_TextChanged(object sender, EventArgs e)
    {
        //強制先完成RegularExpression驗證
        RegularExpressionValidator1.Validate();

        //判斷IsValid的值
        if (RegularExpressionValidator1.IsValid)
        {
            SqlCommand cmd = new SqlCommand("select dbo.fnChecktaxID('" + txtAddTaxID.Text + "')", conn);
            SqlDataReader dr;
            conn.Open();
            dr = cmd.ExecuteReader();
            dr.Read();

            if (dr[0].ToString() == "1")
            {
                lbInfo.Text = "統一編號可用";
                lbInfo.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lbInfo.Text = "統一編號重複";
                lbInfo.ForeColor = System.Drawing.Color.Red;
            }
            conn.Close();
        }
    }

    protected void Reset1_Click(object sender, EventArgs e)
    {
        //清空註冊欄位
        ddlfoodcourtName.SelectedIndex = 0;
        txtAddTaxID.Text = "";
        txtStoreName.Text = "";
        txtTel.Text = "";
        txtMoneyAccount.Text = "";
        lbInfo.Text = "";
    }
}
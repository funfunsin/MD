using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SOrder : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        //只有第一次載入時才執行
        if (!IsPostBack)
        {
            //http://demo.tc/post/91
            txtEndTime.Text = DateTime.UtcNow.AddHours(8).ToString("yyyy/MM/dd");
            txtBeginTime.Text = DateTime.UtcNow.AddHours(8).AddMonths(-3).ToString("yyyy/MM/dd"); //預設三個月前
        }
    }

    protected void lkBeginTime_Click(object sender, EventArgs e)
    {
        if (CalendarBegin.Visible == false) CalendarBegin.Visible = true;
        else CalendarBegin.Visible = false;
    }

    protected void lkEndTime_Click(object sender, EventArgs e)
    {
        if (CalendarEnd.Visible == false) CalendarEnd.Visible = true;
        else CalendarEnd.Visible = false;
    }

    protected void CalendarBegin_SelectionChanged(object sender, EventArgs e)
    {
        txtBeginTime.Text = CalendarBegin.SelectedDate.Date.Year.ToString();
        txtBeginTime.Text += "/" + CalendarBegin.SelectedDate.Date.Month.ToString();
        txtBeginTime.Text += "/" + CalendarBegin.SelectedDate.Date.Day.ToString();
        CalendarBegin.Visible = false;
    }

    protected void CalendarEnd_SelectionChanged(object sender, EventArgs e)
    {
        txtEndTime.Text = CalendarEnd.SelectedDate.Date.Year.ToString();
        txtEndTime.Text += "/" + CalendarEnd.SelectedDate.Date.Month.ToString();
        txtEndTime.Text += "/" + CalendarEnd.SelectedDate.Date.Day.ToString();
        CalendarEnd.Visible = false;
    }


    protected void txtBeginTime_TextChanged(object sender, EventArgs e)
    {

    }

    protected void txtEndTime_TextChanged(object sender, EventArgs e)
    {

    }
}
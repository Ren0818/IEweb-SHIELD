using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;


public partial class adminManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    public void SendEmail(object sender, EventArgs e)
    {
        MailMessage newMsg = new MailMessage();

        foreach (GridViewRow gvRow in GridView4.Rows)
        {
            CheckBox cb = (CheckBox)gvRow.FindControl("chkEmail");

            if (cb != null && cb.Checked)
            {
                newMsg.To.Add(new MailAddress(gvRow.Cells[3].Text,
                 gvRow.Cells[2].Text));
            }
        }

        newMsg.From = new MailAddress("Shield@Shiled.com", "Do not relpy this mail!");
        newMsg.Subject = txtSubject.Text;
        newMsg.Body = txtMsg.Text;
      
        try
        {
            SmtpClient smtp = new SmtpClient("smtp.monash.edu.au",25);
          
            smtp.Send(newMsg);
            Response.Write("<script>alert('Email has been successfully sent！')</script>");
        }
        catch (Exception eggg)
        {
            txtMsg.Text += eggg.ToString();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    public string URL = "signin.aspx";
    public string URL1;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!this.IsPostBack)
        {
            if (Session["userName"] == null)
            {

            }

            else
            {
                if (Session["userName"].ToString() == "admin1")
                {
                    UserSigned.Text = "Log Out";
                    user.Visible = true;
                    user.Text = "admin";
                    URL1 = "adminManager.aspx";
                  
                }
                else
                {
                    UserSigned.Text = "Log Out";
                    user.Visible = true;
                    user.Text = "Welcome " + Session["userName"];
                    URL1 = "useradmin.aspx";
           
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        Random ran = new Random();
        int RandKey = ran.Next(0, 99999);
        SqlConnection conn = new SqlConnection("Data Source=op9ehzlwfo.database.windows.net;Initial Catalog=FIT5120-StarTech-Database;Persist Security Info=True;User ID=fit5120startech@op9ehzlwfo;Password=Password123");
        conn.Open();
        var insert = "insert into contact values('" + RandKey.ToString() + "','" + name.Text + "','" + email.Text + "','" + mnum.Text + "','" + mag.Text + "')";
        
        SqlCommand cmd = new SqlCommand(insert, conn);
          
               
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('We will try to reply you as soon as possible, thanks for your support!')</script>");

                clear();
    }
    protected void clear()
    {
        name.Text = email.Text = mnum.Text = mag.Text = "";
    }
}
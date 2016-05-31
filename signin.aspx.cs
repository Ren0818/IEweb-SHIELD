/*
 * File name:signin.aspx.cs
 * Function: log in
 * Created time: 01/Aug/2015
 * Team: StarTech-703
 * Copyright (c) 2015 All Right Reserved, http://shieldforchild.tk
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class signin : System.Web.UI.Page
{
    // the URL/URL1 is for the front page Navigation
    public string URL = "signin.aspx";
    public string URL1;
    protected void Page_Load(object sender, EventArgs e)
    {

        Session["userName"] = null;
    }

    protected void Button_login_Click(object sender, EventArgs e)
    {
        // connection to databse 
        SqlConnection conn = new SqlConnection("Data Source=op9ehzlwfo.database.windows.net;Initial Catalog=FIT5120-StarTech-Database;Persist Security Info=True;User ID=fit5120startech@op9ehzlwfo;Password=Password123");
        conn.Open();
        string checkuser = "select count (*) from RegisteredUsers where UserName = '" + TextBoxUserName.Text + "'";
        SqlCommand com = new SqlCommand(checkuser, conn);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        conn.Close();

        // check the user is exist in database or not
        if (temp>0)
        {
           
            conn.Open();
            string checkPasswordQuery = "select Password from RegisteredUsers where UserName = '" + TextBoxUserName.Text + "'";
            
            SqlCommand passComm = new SqlCommand(checkPasswordQuery, conn);
            
            string password = passComm.ExecuteScalar().ToString().Replace(" ", "");
            
            if (password == TextBoxPassword.Text)
            {
               
           
                    Response.Write("<script>alert('Password is correct')</script>");

                    Session["userName"] = this.TextBoxUserName.Text.Replace(" ", "");
          

                    Response.Redirect("index.aspx");
               
            }
            else
            {
                Response.Write("<script>alert('Password is not correct')</script>");
            }

        }
        else
        {
            Response.Write("<script>alert('Username is not existed')</script>");
        }
        conn.Close();
    }
}
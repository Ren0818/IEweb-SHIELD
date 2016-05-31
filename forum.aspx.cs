/*
 * File name:forum.aspx.cs
 * Function: disscussion forum based on Gridview Control
 * Created time: 15/Sep/2015
 * Team: StarTech-703
 * Copyright (c) 2015 All Right Reserved, http://shieldforchild.tk
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
public partial class _Default : System.Web.UI.Page
{
    public string URL = "signin.aspx";
    public string URL1;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!this.IsPostBack)
        {
            // USER Validation check
            //if the user is havent signed, the system would ask him to sign in 
            if (Session["userName"] == null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script language=javascript>alert('Please Sign in first');location.href='signin.aspx';</script>");
            }

            else
            {
                //if the user is admin1 *Note that admin1 is the only admin account for now
                if (Session["userName"].ToString() == "admin1")
                {
                    UserSigned.Text = "Log Out";
                    user.Visible = true;
                    user.Text = "admin";
                    URL1 = "adminManager.aspx";
              
                }
                else
                { // if the user is normal user
                    UserSigned.Text = "Log Out";
                    user.Visible = true;
                    user.Text = "Welcome " + Session["userName"];
                    URL1 = "useradmin.aspx";
             
                }
            }
        }
    }
    protected void ButtonPost_Click(object sender, EventArgs e)
    {
        // insert user's fourm into the database
        try
        {
            string city = DropDownListCities.Text;
            string question = TextBoxForumArea.Text;
            string posterName = Session["userName"].ToString();
            DateTime dateTime = DateTime.Now;
            string hide = "no";
            string selectSQL = "select activated from RegisteredUsers where UserName='" + Session["userName"].ToString() + "'";
            SqlConnection con = new SqlConnection("Data Source=op9ehzlwfo.database.windows.net;Initial Catalog=FIT5120-StarTech-Database;Persist Security Info=True;User ID=fit5120startech@op9ehzlwfo;Password=Password123");
            SqlCommand cmd = new SqlCommand(selectSQL, con);
            con.Open();
            string activate = cmd.ExecuteScalar().ToString().Replace(" ", "");
            con.Close();
            if (activate == "true") 
            {
                PostForum.insertForum(city, question, posterName, dateTime, hide);
                GridView1.DataBind();
                Response.Redirect("forum.aspx");
            }
            else
            {
                Response.Write("<script>alert('According to relevant terms you have been muted!')</script>");
            }
            
        }
        catch 
        {
            Response.Write("<script>alert('please sign in!')</script>");
        }
    }

    // navigate user to the thread page
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Int64 ForumId = (Int64)GridView1.SelectedValue;
        Session["forumId"] = ForumId;
        Response.Redirect("thread.aspx");
    }
}

/*
 * File name:signup.aspx.cs
 * Function: register
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
using System.Net.Mail;

public partial class signup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            userNameDublicationChecker();
        }

   
    }

    private void userNameDublicationChecker()
    {
        // conection to databse
        SqlConnection conn = new SqlConnection("Data Source=op9ehzlwfo.database.windows.net;Initial Catalog=FIT5120-StarTech-Database;Persist Security Info=True;User ID=fit5120startech@op9ehzlwfo;Password=Password123");
        conn.Open();
        string checkuser = "select count(*) from RegisteredUsers where UserName = '" + TextBoxUN.Text + "'";
        SqlCommand com = new SqlCommand(checkuser, conn);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        if (temp == 1)
        {
            Response.Write("<script>alert('Username already existed!')</script>");

        }
        conn.Close();
    }

    // on button click save to user into database
    protected void Button1_Click(object sender, EventArgs e)
    {
        //have to read terms and condition before register
        if (readterms.Checked == true)
        {
            saveToDB();
        }
        else {
            Response.Write("<script>alert('Please read terms first.')</script>");
        }

    }
    // insert information into registration table
    public void saveToDB()
    {
        try
        {
            SqlConnection conn = new SqlConnection("Data Source=op9ehzlwfo.database.windows.net;Initial Catalog=FIT5120-StarTech-Database;Persist Security Info=True;User ID=fit5120startech@op9ehzlwfo;Password=Password123");
            conn.Open();
            string insertQuery = "insert into RegisteredUsers (UserName,Password,Email,Gender,activated) values (@Uname,@password,@email,@gender,@activated)";
            SqlCommand com = new SqlCommand(insertQuery, conn);
            com.Parameters.AddWithValue("@Uname", TextBoxUN.Text);
            com.Parameters.AddWithValue("@password", TextBoxPassword.Text);
            com.Parameters.AddWithValue("@email", TextBoxEM.Text);
            com.Parameters.AddWithValue("@gender", DropDownListGender.SelectedItem.ToString());
            com.Parameters.AddWithValue("@activated", "true");
            com.ExecuteNonQuery();
            conn.Close();
            
            Response.Write(@"<script>alert('Registration succuessful！');</script>");
            Response.Redirect("signin.aspx");
        }
        catch
        {
            Response.Write(@"<script>alert('Sorry, for some reason you cannot register with these info, please change！');</script>"); 
        }
    }

 
}
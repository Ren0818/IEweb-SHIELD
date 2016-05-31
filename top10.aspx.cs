/*
 * File name:top10.aspx.cs
 * Function: generate top10/bottom10 city table based on sepcific criteria 
 * Created time: 10/Aug/2015
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
using System.Text;
using System.Data;
using System.Web.UI.DataVisualization.Charting;

public partial class _Default : System.Web.UI.Page
{
    // the URL/URL1 is for the front page Navigation
    public string URL = "signin.aspx";
    public string URL1;
    // these string are the query for the top10 and bot10 
    public string bot10 = "select cityname,[Total Effect], [Safety Rank] from(select cityname as [City Name],sum(effect) as [Total Effect] , row_number() OVER (ORDER BY sum(effect) asc) as [Safety Rank] from fact where year = '2012' group by cityname) as tables1 where [Safety Rank] between 69 and 100  order by [safety rank] desc;";
    public string con_bot10 = "select cityname,rate, Ranks from(select cityname,effect as rate, row_number() OVER (ORDER BY effect asc) as Ranks from fact where  year = '2012' and safetyid=";
    public string con_foll = ") as tables1 where ranks between 69 and 100 order by ranks desc";
    protected void Page_Load(object sender, EventArgs e)
    {
        // USER Validation check
        if (!this.IsPostBack)
        {
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
                {
                    // if the user is normal user
                    UserSigned.Text = "Log Out";
                    user.Visible = true;
                    user.Text = "Welcome " + Session["userName"];
                    URL1 = "useradmin.aspx";
                   
                }
            }
            Label1.Text = "Top 10 for all factors";
            top10();
        }
    }

    // function generate top10 city table
    private void top10()
    {
        string selectall = "select top(10) cityname as [City Name], sum(effect) as [Total Effect], rank() OVER (ORDER BY sum(effect) asc) as [Safety Rank] from fact where year = '2012' group by cityname ;";
        string conditionfac = "select TOP(10) cityname as [City Name], effect as [Total Effect], rank() OVER (ORDER BY effect asc) as [Safety Rank] from fact where year = '2012' and groupid =";

        // situation for all checklist checked or all checklist havent checked
        if (tpSA.Checked|(!tp10f1.Checked&&!tp10f2.Checked&&!tp10f3.Checked&&!tp10f4.Checked))
        {
            SqlConnection conn = new SqlConnection("Data Source=op9ehzlwfo.database.windows.net;Initial Catalog=FIT5120-StarTech-Database;Persist Security Info=True;User ID=fit5120startech@op9ehzlwfo;Password=Password123");
            conn.Open();
            SqlCommand cmd = new SqlCommand(selectall, conn);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.Connection = conn;
            sda.SelectCommand = cmd;
            DataTable dt = new DataTable();
            sda.Fill(dt);
            conn.Close();
            StringBuilder html = new StringBuilder();

            //Table start from here
            html.Append("<table class=" + "table" + ">");

            //Building the Header row.
            html.Append("<tr>");

            foreach (DataColumn column in dt.Columns)
            {
                html.Append("<th>");
                html.Append(column.ColumnName);
                html.Append("</th>");
            }
            html.Append("</tr>");

            //Building the Data rows.
            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }
                html.Append("</tr>");
            }
            //Table end.
            html.Append("</table>");
            PlaceHolder4.Controls.Add(new Literal { Text = html.ToString() });


        }
        // situation for vaccination
        if (tp10f1.Checked)
        {
            int a = 1;
            conditionfac += a.ToString();
            SqlConnection conn = new SqlConnection("Data Source=op9ehzlwfo.database.windows.net;Initial Catalog=FIT5120-StarTech-Database;Persist Security Info=True;User ID=fit5120startech@op9ehzlwfo;Password=Password123");
            conn.Open();
            SqlCommand cmd = new SqlCommand(conditionfac, conn);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.Connection = conn;
            sda.SelectCommand = cmd;
            DataTable dt = new DataTable();
            sda.Fill(dt);
            conn.Close();

            StringBuilder html = new StringBuilder();

            //Table start.
            html.Append("<table class=" + "table" + ">");

            //Building the Header row.
            html.Append("<tr>");

            foreach (DataColumn column in dt.Columns)
            {
                html.Append("<th>");
                html.Append(column.ColumnName);
                html.Append("</th>");
            }
            html.Append("</tr>");

            //Building the Data rows.
            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }
                html.Append("</tr>");
            }
            //Table end.
            html.Append("</table>");
            PlaceHolder4.Controls.Add(new Literal { Text = html.ToString() });

        }
        // situation for bullying
        if (tp10f2.Checked)
        {
            int a = 2;
            conditionfac += a.ToString();
            SqlConnection conn = new SqlConnection("Data Source=op9ehzlwfo.database.windows.net;Initial Catalog=FIT5120-StarTech-Database;Persist Security Info=True;User ID=fit5120startech@op9ehzlwfo;Password=Password123");
            conn.Open();
            SqlCommand cmd = new SqlCommand(conditionfac, conn);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.Connection = conn;
            sda.SelectCommand = cmd;
            DataTable dt = new DataTable();
            sda.Fill(dt);

            StringBuilder html = new StringBuilder();

            //Table start.
            html.Append("<table class=" + "table" + ">");

            //Building the Header row.
            html.Append("<tr>");

            foreach (DataColumn column in dt.Columns)
            {
                html.Append("<th>");
                html.Append(column.ColumnName);
                html.Append("</th>");
            }
            html.Append("</tr>");

            //Building the Data rows.
            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }
                html.Append("</tr>");
            }
            //Table end.
            html.Append("</table>");
            PlaceHolder4.Controls.Add(new Literal { Text = html.ToString() });
            conn.Close();

        }

        // situation for crime on young
        if (tp10f3.Checked)
        {
            int a = 3;
            conditionfac += a.ToString();
            SqlConnection conn = new SqlConnection("Data Source=op9ehzlwfo.database.windows.net;Initial Catalog=FIT5120-StarTech-Database;Persist Security Info=True;User ID=fit5120startech@op9ehzlwfo;Password=Password123");
            conn.Open();
            SqlCommand cmd = new SqlCommand(conditionfac, conn);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.Connection = conn;
            sda.SelectCommand = cmd;
            DataTable dt = new DataTable();
            sda.Fill(dt);

            StringBuilder html = new StringBuilder();

            //Table start.
            html.Append("<table class=" + "table" + ">");

            //Building the Header row.
            html.Append("<tr>");

            foreach (DataColumn column in dt.Columns)
            {
                html.Append("<th>");
                html.Append(column.ColumnName);
                html.Append("</th>");
            }
            html.Append("</tr>");

            //Building the Data rows.
            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }
                html.Append("</tr>");
            }
            //Table end.
            html.Append("</table>");
            PlaceHolder4.Controls.Add(new Literal { Text = html.ToString() });
            conn.Close();

        }

        //situation for child abuse
        if (tp10f4.Checked)
        {
            int a = 4;
            conditionfac += a.ToString();
            SqlConnection conn = new SqlConnection("Data Source=op9ehzlwfo.database.windows.net;Initial Catalog=FIT5120-StarTech-Database;Persist Security Info=True;User ID=fit5120startech@op9ehzlwfo;Password=Password123");
            conn.Open();
            SqlCommand cmd = new SqlCommand(conditionfac, conn);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.Connection = conn;
            sda.SelectCommand = cmd;
            DataTable dt = new DataTable();
            sda.Fill(dt);

            StringBuilder html = new StringBuilder();

            //Table start.
            html.Append("<table class=" + "table" + ">");

            //Building the Header row.
            html.Append("<tr>");

            foreach (DataColumn column in dt.Columns)
            {
                html.Append("<th>");
                html.Append(column.ColumnName);
                html.Append("</th>");
            }
            html.Append("</tr>");

            //Building the Data rows.
            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }
                html.Append("</tr>");
            }
            //Table end.
            html.Append("</table>");
            PlaceHolder4.Controls.Add(new Literal { Text = html.ToString() });
            conn.Close();

        }



    }

    // click for top ten button
    protected void tpbtn_Click(object sender, EventArgs e)
    {
        //select TOP(10) cityname as "City Name", effect as "Total Effect", rank() OVER (ORDER BY effect desc) as "Safety Rank" from fact where groupid = '2' and year = '2012
        top10();
        Label1.Text = "Top 10";

    }

    /**this is the full query for the bot 10, if you can change it based on your requirement 
     * select cityname,[Total Effect], [Safety Rank] from(select cityname,sum(effect) as [Total Effect] , row_number() OVER (ORDER BY sum(effect) asc) as [Safety Rank] from fact where year = '2012' group by cityname) as tables1 where [Safety Rank] between 69 and 100  order by [safety rank] desc;
     * */
    protected void bot10_Click(object sender, EventArgs e)
    {
        Label1.Text = "Bottom 10";

        if (tpSA.Checked | (!tp10f1.Checked && !tp10f2.Checked && !tp10f3.Checked && !tp10f4.Checked))
        {
            SqlConnection conn = new SqlConnection("Data Source=op9ehzlwfo.database.windows.net;Initial Catalog=FIT5120-StarTech-Database;Persist Security Info=True;User ID=fit5120startech@op9ehzlwfo;Password=Password123");
            conn.Open();
            SqlCommand cmd = new SqlCommand(bot10, conn);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.Connection = conn;
            sda.SelectCommand = cmd;
            DataTable dt = new DataTable();
            sda.Fill(dt);
            conn.Close();
            StringBuilder html = new StringBuilder();

            //Table start.
            html.Append("<table class=" + "table" + ">");

            //Building the Header row.
            html.Append("<tr>");

            foreach (DataColumn column in dt.Columns)
            {
                html.Append("<th>");
                html.Append(column.ColumnName);
                html.Append("</th>");
            }
            html.Append("</tr>");

            //Building the Data rows.
            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }
                html.Append("</tr>");
            }
            //Table end.
            html.Append("</table>");
            PlaceHolder4.Controls.Add(new Literal { Text = html.ToString() });


        }
        if (tp10f1.Checked)
        {
            int a = 1;
            tablegener(a);

        }
        if (tp10f2.Checked)
        {
            int a = 2;
            tablegener(a);

        }

        if (tp10f3.Checked)
        {
            int a = 3;
            tablegener(a);

        }

        if (tp10f4.Checked)
        {
            int a = 4;
            tablegener(a);
        }



    }

    private void tablegener(int a)
    {
       
        con_bot10 += a.ToString() + con_foll;
        SqlConnection conn = new SqlConnection("Data Source=op9ehzlwfo.database.windows.net;Initial Catalog=FIT5120-StarTech-Database;Persist Security Info=True;User ID=fit5120startech@op9ehzlwfo;Password=Password123");
        conn.Open();
        SqlCommand cmd = new SqlCommand(con_bot10, conn);
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.Connection = conn;
        sda.SelectCommand = cmd;
        DataTable dt = new DataTable();
        sda.Fill(dt);
        conn.Close();

        StringBuilder html = new StringBuilder();

        //Table start.
        html.Append("<table class=" + "table" + ">");

        //Building the Header row.
        html.Append("<tr>");

        foreach (DataColumn column in dt.Columns)
        {
            html.Append("<th>");
            html.Append(column.ColumnName);
            html.Append("</th>");
        }
        html.Append("</tr>");

        //Building the Data rows.
        foreach (DataRow row in dt.Rows)
        {
            html.Append("<tr>");
            foreach (DataColumn column in dt.Columns)
            {
                html.Append("<td>");
                html.Append(row[column.ColumnName]);
                html.Append("</td>");
            }
            html.Append("</tr>");
        }
        //Table end.
        html.Append("</table>");
        PlaceHolder4.Controls.Add(new Literal { Text = html.ToString() });
    }
}
/*
 * File name:Search.aspx.cs
 * Function: generate information table/data visualization based on sepcific criteria 
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
                    fillsuburb();
                }
                else
                {
                    // if the user is normal user
                    UserSigned.Text = "Log Out";
                    user.Visible = true;
                    user.Text = "Welcome " + Session["userName"];
                    URL1 = "useradmin.aspx";
                    fillsuburb();
                }
            }
            default_table();
        }

       
    }

    private void default_table()
    {
        SqlConnection conn = new SqlConnection("Data Source=op9ehzlwfo.database.windows.net;Initial Catalog=FIT5120-StarTech-Database;Persist Security Info=True;User ID=fit5120startech@op9ehzlwfo;Password=Password123");
        conn.Open();
        SqlCommand cmd = new SqlCommand("select b.year,a.SafetyFactor,  c.AgeGroup as [Age Group],  b.AffectedChildren as [Number], b.TotalofChildren as [Total #], b.effect as [Rate %], d.Average from fact b,FactorDim a, AgeDim c, average d where b.GroupId=c.GroupId and b.SafetyId=a.SafetyId and b.Safetyid=d.safetyid and b.year=d.year and b.year=2012 and b.CityName='Alpine' ", conn);
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.Connection = conn;
        sda.SelectCommand = cmd;
        DataTable dt = new DataTable();
        sda.Fill(dt);

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
        PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
        conn.Close();
    }
    // function for fill the dropdowlist with the location name from database
    private void fillsuburb()
    {
        //clear the dropdown list first 
        suburb.Items.Clear();
       
        //sql command for select city name from data base
        string selectSQL = "select Distinct(CityName) from fact order by CityName";

        //connect to database
        SqlConnection con = new SqlConnection("Data Source=op9ehzlwfo.database.windows.net;Initial Catalog=FIT5120-StarTech-Database;Persist Security Info=True;User ID=fit5120startech@op9ehzlwfo;Password=Password123");
        SqlCommand cmd = new SqlCommand(selectSQL, con);
        SqlDataReader reader;

        //try to fill dropdown list 'suburb' using city name from database
        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                ListItem newItem = new ListItem();
                newItem.Text = reader["CityName"].ToString();
                newItem.Value = reader["CityName"].ToString();
                suburb.Items.Add(newItem);
            
            }
            reader.Close();
        }
            // catch exception if fail
        catch (Exception err)
        {
            suburb.Text = "Error reading list of names. ";
            suburb.Text += err.Message;
        }
            //close database connection
        finally

        {
            con.Close();
        }
    }

    // this is a function for checking how many checkboxes are checked
    int chkFactor()
    {
        int counter = 0;
        foreach (Control c in div_chk.Controls)
        {
            if (c is CheckBox)
                if (((CheckBox)c).Checked)
                    counter++;
        }
        return counter;
    }
    

    protected void Search_Click(object sender, EventArgs e)
    {
        // hide the chart first, then there would be enough place for tables
        Panel1.Visible = false;
        Image1.Visible = false;
       
        //select command 
        string ranking = "select a.safetyrank from (select cityname,rank() over(order by sum(effect) asc) as safetyrank from fact where year="+year.Text+" group by cityname) a where cityname=" + "'" + suburb.Text + "'";
        
       
        //show the search ranking information area 
        search_panel.Visible = true;

        //new sql connection 
        SqlConnection conn = new SqlConnection("Data Source=op9ehzlwfo.database.windows.net;Initial Catalog=FIT5120-StarTech-Database;Persist Security Info=True;User ID=fit5120startech@op9ehzlwfo;Password=Password123");
        conn.Open();
        SqlCommand cmd = new SqlCommand(ranking, conn);

        //read the data from table
        SqlDataReader rd;
        rd = cmd.ExecuteReader();
        
        //if there is data, show the summary information
        if (rd.Read())
        {
            string orank= rd[0].ToString();
            cityName2.Text = suburb.Text;
            //overall ranking
            cityInfo.Text = cityName2.Text + " <b style='color:navy'>overall</b> ranking is<b> " + orank + " out of 78 cities </b>.";
        }
        conn.Close();
        rank1(1);
        rank1(2);
        rank1(3);
        rank1(4);
        search();
    }

    // rank generator for different parameters
    private void rank1(int a)
    {
        string ranking = "select a.safetyrank from (select cityname,rank() over(order by sum(effect) asc) as safetyrank from fact where year=" + year.Text + " and SafetyId="+a+" group by cityname) a where cityname=" + "'" + suburb.Text + "'";
        search_panel.Visible = true;
        SqlConnection conn = new SqlConnection("Data Source=op9ehzlwfo.database.windows.net;Initial Catalog=FIT5120-StarTech-Database;Persist Security Info=True;User ID=fit5120startech@op9ehzlwfo;Password=Password123");
        conn.Open();
        SqlCommand cmd = new SqlCommand(ranking, conn);

        SqlDataReader rd;
        rd = cmd.ExecuteReader();

        if (rd.Read())
        {
            string orank = rd[0].ToString();
            if (a == 1)
            {
                cityInfo0.Text = cityName2.Text + "'s <b class='bbb'>Not vaccinated</b> rate is ranked:  <b>" + orank + " / 78</b>.";
            }
            if (a == 2)
            {
                cityInfo1.Text = cityName2.Text + "'s <b class='bbb'>Bullying</b> rate is ranked <b>" + orank + " / 78</b>.";
            }
            if (a == 3)
            {
                cityInfo2.Text = cityName2.Text + "'s <b class='bbb'>Crime on young</b> rate is ranked <b>" + orank + " / 78</b>.";
            }
            if (a == 4)
            {
                cityInfo3.Text = cityName2.Text + "'s <b class='bbb'>Child abusing</b> rate is ranked <b>" + orank + " / 78</b>.";
            }
        }
        conn.Close();        
    }
   
   
    // search function starts from here
    private void search()
    {
        string sql = "select b.year,a.SafetyFactor,  c.AgeGroup as [Age Group],  b.AffectedChildren as [Number], b.TotalofChildren as [Total #], b.effect as [Rate %], d.Average from fact b,FactorDim a, AgeDim c, average d where b.GroupId=c.GroupId and b.SafetyId=a.SafetyId and b.Safetyid=d.safetyid and b.year=d.year";
        string chkValue1, chkValue2, chkValue3, chkValue4, yearvalue, location;
        string selectqurey = null;
        string temp = null;
        // the following statements are for getting the sql query from the website

        //get the year from website
        if (year.Text != "Select Year")
        {
            yearvalue = " and b.year=" + year.Text;
        }
        else
        {
            yearvalue = null;
        }

        //suburb value
        if (suburb.Text != null)
        {
            location = " and b.CityName=" + "'" + suburb.Text + "'";
        }
        else location = null;

        if (factor1.Checked == false && factor2.Checked == false && factor3.Checked == false && factor4.Checked == false)
        {
            selectqurey = sql + yearvalue + location + " order by b.year desc, c.groupid, a.safetyid";

        }
        else
        {
            // from here the sql query will changed， and there would be different situation based on the checkboxes


            if (factor1.Checked)
            {
                chkValue1 = " b.SafetyId=1";
                temp += chkValue1;
            }
            if (factor2.Checked)
            {
                if (chkFactor() == 1)
                {
                    chkValue2 = " b.SafetyId=2";
                    temp += chkValue2;
                }
                else
                {
                    if (factor1.Checked)
                    {
                        chkValue2 = " or b.SafetyId=2";
                        temp += chkValue2;
                    }
                    else
                    {
                        chkValue2 = " b.SafetyId=2";
                        temp += chkValue2;
                    }
                }

            }
            if (factor3.Checked)
            {
                if (chkFactor() == 1)
                {
                    chkValue3 = " b.SafetyId=3";
                    temp += chkValue3;
                }
                else
                {
                    if (factor1.Checked || factor2.Checked)
                    {
                        chkValue3 = " or b.SafetyId=3";
                        temp += chkValue3;
                    }
                    else
                    {
                        chkValue3 = " b.SafetyId=3";
                        temp += chkValue3;
                    }
                }

            }
            if (factor4.Checked)
            {
                if (chkFactor() == 1)
                {
                    chkValue4 = " b.SafetyId=4";
                    temp += chkValue4;
                }
                else
                {
                    if (factor1.Checked || factor2.Checked || factor3.Checked)
                    {
                        chkValue4 = " or b.SafetyId=4";
                        temp += chkValue4;
                    }
                    else
                    {
                        chkValue4 = " b.SafetyId=4";
                        temp += chkValue4;
                    }
                }

            }
            selectqurey = sql + yearvalue + location + "and" + " (" + temp + ")" + " order by b.year desc, c.groupid, a.safetyid";
        }

        try
        {
           // new query and conncetion starts from here
            SqlConnection conn = new SqlConnection("Data Source=op9ehzlwfo.database.windows.net;Initial Catalog=FIT5120-StarTech-Database;Persist Security Info=True;User ID=fit5120startech@op9ehzlwfo;Password=Password123");
            conn.Open();
            SqlCommand cmd = new SqlCommand(selectqurey, conn);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.Connection = conn;
            sda.SelectCommand = cmd;
            DataTable dt = new DataTable();
            sda.Fill(dt);

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
            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
            conn.Close();

        }
        catch (Exception eg)
        {
            Response.Write(eg);


        }

    }


    // build chart for search function
    protected void chart_Click(object sender, EventArgs e)
    {
        //same query and methodology as the search function
        string sql = "select b.year,a.SafetyFactor,  c.AgeGroup as [Age Group],  b.AffectedChildren as [Number], b.TotalofChildren as [Total #], b.effect as Rate, d.Average from fact b,FactorDim a, AgeDim c, average d where b.GroupId=c.GroupId and b.SafetyId=a.SafetyId and b.Safetyid=d.safetyid and b.year=d.year";
        string location;
        string selectqurey = null;
       
        // the following statements are for getting the sql query from the website

        if (suburb.Text != null)
        {
            location = " and b.CityName=" + "'" + suburb.Text + "'";
        }
        else location = null;

        selectqurey = sql + location+" order by year";
        

        SqlConnection conn = new SqlConnection("Data Source=op9ehzlwfo.database.windows.net;Initial Catalog=FIT5120-StarTech-Database;Persist Security Info=True;User ID=fit5120startech@op9ehzlwfo;Password=Password123");
        conn.Open();
        SqlCommand cmd = new SqlCommand(selectqurey, conn);
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.Connection = conn;
        sda.SelectCommand = cmd;
        DataTable dt = new DataTable();
        sda.Fill(dt);
        
        //chart start from here
        foreach (DataRow row in dt.Rows)
        {

            //VaccChart
            if (row["safetyfactor"].ToString().Equals("Not Vaccinated"))
            {
                
                //VaccChart set
                Series Vacc1 = Chart1.Series["Not Vaccinated"];
       
               Vacc1.Points.AddXY(Convert.ToInt32(row["year"]), Convert.ToDecimal(row["Rate"]));
               Chart1.Series["Not Vaccinated"].BorderWidth = 2;
            }
            if (row["safetyfactor"].ToString().Equals("Bullying"))
            {

                //VaccChart set
                Series bullying = Chart1.Series["Bullying"];

                bullying.Points.AddXY(Convert.ToInt32(row["year"]), Convert.ToDecimal(row["Rate"]));
                Chart1.Series["Bullying"].BorderWidth = 2;
            }
            if (row["safetyfactor"].ToString().Equals("Crime on young "))
            {

                //VaccChart set
                Series coy = Chart1.Series["Crime on young"];

                coy.Points.AddXY(Convert.ToInt32(row["year"]), Convert.ToDecimal(row["Rate"]));
                Chart1.Series["Crime on young"].BorderWidth = 2;
            }
            if (row["safetyfactor"].ToString().Equals("Child Abuse"))
            {

                //VaccChart set
                Series ca = Chart1.Series["Child abuse"];

                ca.Points.AddXY(Convert.ToInt32(row["year"]), Convert.ToDecimal(row["Rate"]));
                Chart1.Series["Child abuse"].BorderWidth = 2;
            }

            Image1.Visible = true;
            Panel1.Visible = true;
        }



    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        factor1.Checked = true;
    }
}

    


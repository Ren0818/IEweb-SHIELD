/*
 * File name:compare.aspx.cs
 * Function: generate data visualization for 2 cities based on sepcific criteria 
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

public partial class compare : System.Web.UI.Page
{
    // the URL/URL1 is for the front page Navigation
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
            visible();
            string selectqurey = "select c.AgeGroup as[Age Group], a.SafetyFactor, b.year, b.CityName as [City Name], b.AffectedChildren as [Affected Children], b.TotalofChildren as [Denumeric], b.effect as rate from fact b,FactorDim a, AgeDim c where b.GroupId=c.GroupId and b.SafetyId=a.SafetyId and b.CityName='Alpine' ";
      
            default_chart(selectqurey);
        }
    }

    // function for fill the two dropdowlists with the location name from database
    private void fillsuburb()
    {
        //clear the dropdown list first 
        city1.Items.Clear();
        city2.Items.Clear();
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

                city1.Items.Add(newItem);
                city2.Items.Add(newItem);
            }
            reader.Close();
        }
        // catch exception if fail
        catch (Exception err)
        {

        }
        finally
        {
            con.Close();
        }
    }


    int chkFactor1()
    {
        int counter = 0;
        foreach (Control c in div_chk1.Controls)
        {
            if (c is CheckBox)
                if (((CheckBox)c).Checked)
                    counter++;
        }
        return counter;
    }

    protected void compare_btn_Click(object sender, EventArgs e)
    {
        comparefun();
        cpfun_position();
    }

    // show the pannel contain charts based on the check box checked
    private void cpfun_position()
    {
        if (cpf1.Checked)
        {
            Panel1.Visible = true;
        }
        if (cpf2.Checked)
        {
            Panel2.Visible = true;
        }
        if (cpf3.Checked)
        {
            Panel3.Visible = true;
        }
        if (cpf4.Checked)
        {
            Panel4.Visible = true;
        }
    }
    private void visible()
    {
        Panel1.Visible = true;
        Panel2.Visible = true;
        Panel3.Visible = true;
        Panel4.Visible = true;
    }

    // compare function starts from here
    private void comparefun()
    {
        string sql = "select c.AgeGroup as[Age Group], a.SafetyFactor, b.year, b.CityName as [City Name], b.AffectedChildren as [Affected Children], b.TotalofChildren as [Denumeric], b.effect as rate from fact b,FactorDim a, AgeDim c where b.GroupId=c.GroupId and b.SafetyId=a.SafetyId";
        string chkValue1, chkValue2, chkValue3, chkValue4, location;
        string selectqurey = null;
        string temp = null;
        // the following statements are for getting the sql query from the website


        //suburb value
        if (city1.Text != null && city2.Text != null)
        {
            location = " and (b.CityName=" + "'" + city1.Text + "'" + " or b.CityName=" + "'" + city2.Text + "')";
        }
        else location = null;




        if (cpf1.Checked == false && cpf2.Checked == false && cpf3.Checked == false && cpf4.Checked == false)
        {

            selectqurey = sql  + location + " order by b.year desc, c.AgeGroup";

        }
        else
        {
            // from here the sql query will changed 


            if (cpf1.Checked)
            {
                chkValue1 = " b.SafetyId=1";
                temp += chkValue1;
            }
            if (cpf2.Checked)
            {
                if (chkFactor1() == 1)
                {
                    chkValue2 = " b.SafetyId=2";
                    temp += chkValue2;
                }
                else
                {
                    if (cpf1.Checked)
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
            if (cpf3.Checked)
            {
                if (chkFactor1() == 1)
                {
                    chkValue3 = " b.SafetyId=3";
                    temp += chkValue3;
                }
                else
                {
                    if (cpf1.Checked || cpf2.Checked)
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
            if (cpf4.Checked)
            {
                if (chkFactor1() == 1)
                {
                    chkValue4 = " b.SafetyId=4";
                    temp += chkValue4;
                }
                else
                {
                    if (cpf1.Checked || cpf2.Checked || cpf3.Checked)
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
            selectqurey = sql /*+ yearvalue*/ + location + "and" + " (" + temp + ")" + " order by b.year desc, c.AgeGroup";
        }




        // need try catch, catch an exception!
        try
        {
            default_chart(selectqurey);
        }
        catch
        {

        }
    }

    private void default_chart(string selectqurey)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["FIT5120-StarTech-DatabaseConnectionString"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand(selectqurey, conn);
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.Connection = conn;
        sda.SelectCommand = cmd;
        DataTable dt = new DataTable();
        sda.Fill(dt);

        /*Chart Part*/
        foreach (var series in ChartVacc.Series)
        {
            series.Points.Clear();
        }
        foreach (var series in ChartBully.Series)
        {
            series.Points.Clear();
        }
        foreach (var series in ChartAbuse.Series)
        {
            series.Points.Clear();
        }
        foreach (var series in ChartCrime.Series)
        {
            series.Points.Clear();
        }



        foreach (DataRow row in dt.Rows)
        {

            //VaccChart
            if (row["SafetyFactor"].ToString().Equals("Not Vaccinated"))
            {
                ChartVacc.Visible = true;
                //  VaccChart set
                Series Vacc1 = ChartVacc.Series["City1"];
                Series Vacc2 = ChartVacc.Series["City2"];
                if (row["City Name"].ToString().Equals(city1.Text.ToString()))
                {
                    Vacc1.Points.AddXY(Convert.ToInt32(row["year"]), Convert.ToDecimal(row["Rate"]));
                }
                else if (row["City Name"].ToString().Equals(city2.Text.ToString()))
                {
                    Vacc2.Points.AddXY(Convert.ToInt32(row["year"]), Convert.ToDecimal(row["Rate"]));
                }
            }

            //BullyChart
            else if (row["SafetyFactor"].ToString().Equals("Bullying"))
            {
                ChartBully.Visible = true;
                //BullyChart set
                Series Bully1 = ChartBully.Series["City1"];
                Series Bully2 = ChartBully.Series["City2"];
                if (row["City Name"].ToString().Equals(city1.Text.ToString()))
                {
                    Bully1.Points.AddXY(Convert.ToInt32(row["year"]), Convert.ToDecimal(row["Rate"]));
                }

                else if (row["City Name"].ToString().Equals(city2.Text.ToString()))
                {
                    Bully2.Points.AddXY(Convert.ToInt32(row["year"]), Convert.ToDecimal(row["Rate"]));
                }
            }
            //CrimeChart
            else if (row["SafetyFactor"].ToString().Trim().Equals("Crime on young"))
            {
                ChartCrime.Visible = true;
                //CrimeChart set
                Series Crime1 = ChartCrime.Series["City1"];
                Series Crime2 = ChartCrime.Series["City2"];

                if (row["City Name"].ToString().Equals(city1.Text.ToString()))
                {
                    Crime1.Points.AddXY(Convert.ToInt32(row["year"]), Convert.ToDecimal(row["Rate"]));
                }

                else if (row["City Name"].ToString().Equals(city2.Text.ToString()))
                {
                    Crime2.Points.AddXY(Convert.ToInt32(row["year"]), Convert.ToDecimal(row["Rate"]));
                }
            }
            //AbuseChart
            else if (row["SafetyFactor"].ToString().Equals("Child Abuse"))
            {
                ChartAbuse.Visible = true;
                //AbuseChart set
                Series Abuse1 = ChartAbuse.Series["City1"];
                Series Abuse2 = ChartAbuse.Series["City2"];
                if (row["City Name"].ToString().Equals(city1.Text.ToString()))
                {
                    Abuse1.Points.AddXY(Convert.ToInt32(row["year"]), Convert.ToDecimal(row["Rate"]));
                }

                else if (row["City Name"].ToString().Equals(city2.Text.ToString()))
                {
                    Abuse2.Points.AddXY(Convert.ToInt32(row["year"]), Convert.ToDecimal(row["Rate"]));
                }
            }

        }
    }
}
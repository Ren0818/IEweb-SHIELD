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
    public double[] la = new double[350]; //public array
    public double[] ln = new double[350];
    public double[] hosla = new double[60];
    public double[] hosln = new double[60];
    public double test1;
    public int k1 = 0;  //public int for loop
    public static class JavaScript
    {
        public static string Serialize(object o)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Serialize(o);
        }
    }
    public string URL = "signin.aspx";
    public string URL1;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!this.IsPostBack)
        {
            if (Session["userName"] == null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script language=javascript>alert('Please Sign in first');location.href='signin.aspx';</script>");
            }

            else
            {
                if (Session["userName"].ToString() == "admin1")
                {
                    UserSigned.Text = "Log Out";
                    user.Visible = true;
                    user.Text = "admin";
                    URL1 = "adminManager.aspx";
                    map();
                }
                else
                {
                    UserSigned.Text = "Log Out";
                    user.Visible = true;
                    user.Text = "Welcome " + Session["userName"];
                    URL1 = "useradmin.aspx";
                    map();
                }
            }
        }
    }

    private void map()
    {

        string query1 = "select * from police";
        string query2 = "select * from hospital";
        SqlConnection conn = new SqlConnection("Data Source=op9ehzlwfo.database.windows.net;Initial Catalog=FIT5120-StarTech-Database;Persist Security Info=True;User ID=fit5120startech@op9ehzlwfo;Password=Password123");

        SqlCommand cmd = new SqlCommand(query1, conn);
        conn.Open();
        SqlDataReader dr1 = cmd.ExecuteReader();

        int k2 = 0;
        int k3 = 0;
        int k4 = 0;
        int k5 = 0;
        double buf4 = 0;
        double buf5 = 0;
        double buf2 = 0;
        double buf3 = 0;

        while (dr1.Read())
        {
            //lat
            buf2 = Convert.ToDouble(dr1["Latitude"]);

            la[k2] = buf2;
            k2++;
            //lng
            buf3 = Convert.ToDouble(dr1["Longitude"]);///in sql float is double
            ln[k3] = buf3;
            k3++;

        }

        dr1.Close();

        SqlCommand cmd1 = new SqlCommand(query2, conn);
        SqlDataReader dr2 = cmd1.ExecuteReader();
        while (dr2.Read())
        {
            //hospital lat
            buf4 = Convert.ToDouble(dr2["latitude"]);
            hosla[k4] = buf4;
            k4++;
            //hospital long
            buf5 = Convert.ToDouble(dr2["longotide"]);

            hosln[k5] = buf5;
            k5++;

        }
        dr2.Close();
        conn.Close();
        double hosaddd = hosla[0];
    }
        

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write(hosln[22].ToString());
    }
}
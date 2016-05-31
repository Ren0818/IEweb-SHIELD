using System;

using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.Data.SqlClient;

/// <summary>
/// PostForum 的摘要说明
/// </summary>
public class PostForum
{
    public static int insertForum(string city, string question, string posterName, DateTime datetim,string hide)
    {
        int rowsAffected = 0;
        
        using (SqlConnection connection = ConnectionManager.GetDatabaseConnection())
        {
            SqlCommand command = new SqlCommand("insertForum", connection);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("@city", SqlDbType.VarChar).Value = city;
            command.Parameters.Add("@question", SqlDbType.VarChar).Value = question;
            command.Parameters.Add("@posterName", SqlDbType.VarChar).Value = posterName;
            command.Parameters.Add("@datetim", SqlDbType.DateTime).Value = datetim;
            command.Parameters.Add("@hide", SqlDbType.VarChar).Value = hide;

            rowsAffected = command.ExecuteNonQuery();
        }
        return rowsAffected;
    }
}
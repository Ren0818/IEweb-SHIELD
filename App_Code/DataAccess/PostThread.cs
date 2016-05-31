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

public class PostThread
{
    public static int insertThread(int forumId, string answer, string posterName, DateTime datetim)
    {
        int rowsAffected = 0;
        using (SqlConnection connection = ConnectionManager.GetDatabaseConnection())
        {
            SqlCommand command = new SqlCommand("insertThread",connection);
            command.CommandType = CommandType.StoredProcedure;
           
            command.Parameters.Add("@forumId", SqlDbType.Int).Value = forumId;
            command.Parameters.Add("@answer", SqlDbType.VarChar).Value = answer;
            command.Parameters.Add("@posterName", SqlDbType.VarChar).Value = posterName;
            command.Parameters.Add("@datetim", SqlDbType.DateTime).Value = datetim;

            rowsAffected = command.ExecuteNonQuery();
        }
            return rowsAffected;
    }
}
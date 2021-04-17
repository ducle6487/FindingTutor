using System.Configuration;
using System.Data.SqlClient;

namespace FindingTutor.Models
{
    public class DBConnection
    {
        private string strCon;

        public DBConnection()   
        {
            strCon = ConfigurationManager.ConnectionStrings["FindingTutorConnectionString2"].ConnectionString;
        }

        public SqlConnection GetConnection()
        {
            return new SqlConnection(strCon);
        }
    }
}
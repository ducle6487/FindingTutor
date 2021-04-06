using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FindingTutor.Models
{
    public class DBConnection
    {
        private string strCon;

        public DBConnection()
        {
            strCon = ConfigurationManager.ConnectionStrings["FindingTutorConnectionString"].ConnectionString;
        }

        public SqlConnection GetConnection()
        {
            return new SqlConnection(strCon);
        }
    }
}
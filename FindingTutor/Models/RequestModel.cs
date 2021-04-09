using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FindingTutor.Models
{
    public class RequestModel
    {
        public int IdRequest { get; set; }
        public int IdStudent { get; set; }
        public int IdCourse { get; set; }
        public string Message { get; set; }
        public string DateRequest { get; set; }
    }

    public class RequestUtils
    {
        private DBConnection db;

        public RequestUtils()
        {
            db = new DBConnection();
        }

        public bool CreateNewRequest(RequestModel model)
        {
            string sql = "insert into Request(IdStudent,IdCourse,DateRequest, Message) values (" + model.IdStudent + "," + model.IdCourse + ",'" + model.DateRequest + "',N'" + model.Message + "')";

            SqlConnection con = db.GetConnection();
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            int r = cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();

            if (r <= 0)
            {
                return false;
            }

            return true;
        }
    }
}
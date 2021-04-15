using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FindingTutor.Models
{
    public class GradeModel
    {
        public int IdGrade { get; set; }
        public string Grade { get; set; }
    }

    public class GradeUtils
    {
        private DBConnection db;

        public GradeUtils()
        {
            db = new DBConnection();
        }

        public List<GradeModel> getAllGrade()
        {
            List<GradeModel> list = new List<GradeModel>();

            string sql = "select * from Grades";

            SqlConnection con = db.GetConnection();
            SqlDataAdapter cmd = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();

            con.Open();
            cmd.Fill(dt);
            cmd.Dispose();
            con.Close();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                GradeModel g = new GradeModel();
                g.Grade = dt.Rows[i]["Grade"].ToString();
                g.IdGrade = Convert.ToInt32(dt.Rows[i]["IdGrade"].ToString());
                list.Add(g);
            }

            return list;
        }
    }
}
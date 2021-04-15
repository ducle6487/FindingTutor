using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FindingTutor.Models
{
    public class CourseModel
    {
        public int IdCourse { get; set; }
        public int IdSubject { get; set; }
        public int IdGrade { get; set; }
        public string NameSubject { get; set; }
        public string NameGrade { get; set; }
    }

    public class CourseUtils
    {
        private DBConnection db;

        public CourseUtils()
        {
            db = new DBConnection();
        }

        public List<CourseModel> getAllCourse()
        {
            List<CourseModel> list = new List<CourseModel>();

            string sql =
                "select a.IdCourse, a.IdSubject, a.IdGrade, b.Name, c.Grade from Courses a, Subjects b, Grades c where a.IdGrade = c.IdGrade and b.IdSubject = a.IdSubject order by a.IdSubject, a.IdGrade asc";

            SqlConnection con = db.GetConnection();
            SqlDataAdapter cmd = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();

            con.Open();
            cmd.Fill(dt);
            cmd.Dispose();
            con.Close();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                CourseModel c = new CourseModel();
                c.IdCourse = Convert.ToInt32(dt.Rows[i]["IdCourse"].ToString());
                c.IdSubject = Convert.ToInt32(dt.Rows[i]["IdSubject"].ToString());
                c.IdGrade = Convert.ToInt32(dt.Rows[i]["IdGrade"].ToString());
                c.NameSubject = dt.Rows[i]["Name"].ToString();
                c.NameGrade = dt.Rows[i]["Grade"].ToString();
                list.Add(c);
            }

            return list;
        }
    }
}
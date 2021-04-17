using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FindingTutor.Models
{
    public class ProfileModel
    {
        public int IdProfile { get; set; }
        public int IdTeacher { get; set; }
        public int IdCourse { get; set; }
        public string NameCourse { get; set; }

        public string NameSubject { get; set; }
        public string NameGrade { get; set; }
    }

    public class ProfileUtils
    {
        private DBConnection db;

        public ProfileUtils()
        {
            db = new DBConnection();
        }

        public List<ProfileModel> getProfileOf(int idTeacher)
        {
            string sql =
                "select b.*, c.Name, d.Grade from Courses a, Profile b, Subjects c, Grades d where b.IdTeacher = "+idTeacher+" and a.IdCourse = b.IdCourse and a.IdGrade = d.IdGrade and a.IdSubject = c.IdSubject";
            List<ProfileModel> list = new List<ProfileModel>();

            SqlConnection con = db.GetConnection();
            SqlDataAdapter cmd = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();

            con.Open();
            cmd.Fill(dt);
            cmd.Dispose();
            con.Close();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ProfileModel p = new ProfileModel();
                p.IdProfile = Convert.ToInt32(dt.Rows[i]["IdProfile"].ToString());
                p.IdTeacher = Convert.ToInt32(dt.Rows[i]["IdTeacher"].ToString());
                p.IdCourse = Convert.ToInt32(dt.Rows[i]["IdCourse"].ToString());
                p.NameSubject = dt.Rows[i]["Name"].ToString();
                p.NameGrade = dt.Rows[i]["Grade"].ToString();
                p.NameCourse = p.NameSubject + "-" + p.NameGrade;
                list.Add(p);
            }

            return list;
        }
    }
}
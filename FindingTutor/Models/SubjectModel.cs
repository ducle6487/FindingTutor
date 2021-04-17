using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace FindingTutor.Models
{
    public class SubjectModel
    {
        public int IdSubject { get; set; }
        public string Name { get; set; }
        public string Image { get; set; }
    }

    public class SubjectUtils
    {
        private DBConnection db;

        public SubjectUtils()
        {
            db = new DBConnection();
        }

        public List<SubjectModel> getAllSubject()
        {
            string sql = "select * from Subjects ";

            List<SubjectModel> list = new List<SubjectModel>();

            SqlConnection con = db.GetConnection();
            SqlDataAdapter cmd = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();

            con.Open();
            cmd.Fill(dt);
            cmd.Dispose();
            con.Close();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                SubjectModel s = new SubjectModel();
                s.IdSubject = Convert.ToInt32(dt.Rows[i]["IdSubject"].ToString());
                s.Name = dt.Rows[i]["Name"].ToString();
                s.Image = dt.Rows[i]["Image"].ToString();
                list.Add(s);
            }

            return list;
        }
    }
}
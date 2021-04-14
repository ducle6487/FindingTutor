using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace FindingTutor.Models
{
    public class TeacherModel
    {
        public int IdTeacher { get; set; }
        public String Email { get; set; }
        public String Password { get; set; }
        public String Name { get; set; }
        public string Phone { get; set; }
        public double Price { get; set; }
        public string Avatar { get; set; }
        public string Bio { get; set; }
    }

    public class TeacherUtils
    {
        private DBConnection db;

        public TeacherUtils()
        {
            db = new DBConnection();
        }

        public List<TeacherModel> getAllTeacher()
        {
            string sql = "select * from Teacher";

            SqlConnection con = db.GetConnection();
            SqlDataAdapter cmd = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();

            con.Open();
            cmd.Fill(dt);
            cmd.Dispose();
            con.Close();
            List<TeacherModel> list = new List<TeacherModel>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                TeacherModel t = new TeacherModel();
                t.IdTeacher = Convert.ToInt32(dt.Rows[i]["IdTeacher"].ToString());
                t.Email = dt.Rows[i]["Email"].ToString();
                t.Password = dt.Rows[i]["Password"].ToString();
                t.Name = dt.Rows[i]["Name"].ToString();
                t.Phone = dt.Rows[i]["Phone"].ToString();
                t.Price = Convert.ToDouble(dt.Rows[i]["Price"].ToString());
                t.Avatar = dt.Rows[i]["Avatar"].ToString();
                t.Bio = dt.Rows[i]["Bio"].ToString();
                list.Add(t);
            }

            return list;
        }
    }

}
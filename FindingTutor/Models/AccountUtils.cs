using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace FindingTutor.Models
{
    public class AccountUtils
    {
        private DBConnection db;

        //khởi tạo chuẩn
        public AccountUtils()
        {
            db = new DBConnection();
        }

        //ham ma hoa password
        private string hashPassword(string pass)
        {
            using (SHA1 sha1Hash = SHA1.Create())
            {
                byte[] sourceBytes = Encoding.UTF8.GetBytes(pass);
                byte[] hashBytes = sha1Hash.ComputeHash(sourceBytes);
                return BitConverter.ToString(hashBytes).Replace("-", String.Empty);
            }
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

        //kiem tra dang nhap
        public StudentModel checkStudentLogin(string email, string pass)
        {
            string hash = hashPassword(pass);

            string sql = "select top 1 * from Student where Email = '" + email + "' and Password = '" + hash + "'";

            SqlConnection con = db.GetConnection();
            SqlDataAdapter cmd = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();

            con.Open();
            cmd.Fill(dt);
            cmd.Dispose();
            con.Close();

            StudentModel s = null;

            if (dt.Rows.Count > 0)
            {
                s = new StudentModel();
                s.IdStudent = Convert.ToInt32(dt.Rows[0]["IdStudent"].ToString());
                s.Email = dt.Rows[0]["Email"].ToString();
                s.Password = dt.Rows[0]["Password"].ToString();
                s.Name = dt.Rows[0]["Name"].ToString();
                s.Phone = dt.Rows[0]["Phone"].ToString();
                s.Avatar = dt.Rows[0]["Avatar"].ToString();
            }

            return s;
        }

        public TeacherModel checkTeacherLogin(string email, string pass)
        {
            string hash = hashPassword(pass);

            string sql = "select top 1 * from Teacher where Email = '" + email + "' and Password = '" + hash + "'";

            SqlConnection con = db.GetConnection();
            SqlDataAdapter cmd = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();

            con.Open();
            cmd.Fill(dt);
            cmd.Dispose();
            con.Close();

            TeacherModel s = null;

            if (dt.Rows.Count > 0)
            {
                s = new TeacherModel();
                s.IdTeacher = Convert.ToInt32(dt.Rows[0]["IdTeacher"].ToString());
                s.Email = dt.Rows[0]["Email"].ToString();
                s.Password = dt.Rows[0]["Password"].ToString();
                s.Name = dt.Rows[0]["Name"].ToString();
                s.Phone = dt.Rows[0]["Phone"].ToString();
                s.Avatar = dt.Rows[0]["Avatar"].ToString();
                s.Price = Convert.ToDouble(dt.Rows[0]["Price"].ToString());
                s.Bio = dt.Rows[0]["Bio"].ToString();
            }

            return s;
        }

        //kiem tra xem account ton tai hay chua
        public bool UnexistEmail(string email)
        {
            string sql = "select * from Student where Email = '" + email + "'";

            SqlConnection con = db.GetConnection();
            SqlDataAdapter cmd = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();

            con.Open();
            cmd.Fill(dt);
            cmd.Dispose();
            con.Close();
            if (dt.Rows.Count > 0)
            {
                return false;
            }

            sql = "select * from Teacher where Email = '" + email + "'";
            cmd = new SqlDataAdapter(sql, con);

            con.Open();
            cmd.Fill(dt);
            cmd.Dispose();
            con.Close();

            if (dt.Rows.Count > 0)
            {
                return false;
            }

            return true;
        }

        //Them 1 tai khoan , 1 email chi danh cho 1 tai khoản
        public bool CreateAccount(StudentModel m, bool isTeacher)
        {
            try
            {
                string hash = hashPassword(m.Password);
                string sql = "If not Exists (Select * from Student where Email = '" + m.Email +
                             "' ) begin insert into Student(Email,Password,Name,Phone,Avatar) values ('" + m.Email + "','" +
                             hash + "','" + m.Name + "'," + m.Phone + ",'Avatar.png') end";

                if (isTeacher)
                {
                    sql = "If not Exists (Select * from Teacher where Email = '" + m.Email +
                             "' ) begin insert into Teacher(Email,Password,Name,Phone,Avatar,Price) values ('" + m.Email + "','" +
                             hash + "','" + m.Name + "'," + m.Phone + ",'Avatar.png',100000) end";
                }

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
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return false;
            }

            return true;
        }

        public TeacherModel UpdateTeacherAccount(string email, string pass)
        {
            string hash = hashPassword(pass);
            string sql = "update Teacher set Password = '" + hash + "' where Email = '" + email + "'";

            TeacherModel s = null;
            SqlConnection con = db.GetConnection();
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            int r = cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();

            if (r > 0)
            {
                sql = "select * from Teacher where Email = '" + email + "'";
                SqlDataAdapter cmdx = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable();

                con.Open();
                cmdx.Fill(dt);
                cmdx.Dispose();
                con.Close();

                if (dt.Rows.Count > 0)
                {
                    s = new TeacherModel();
                    s.IdTeacher = Convert.ToInt32(dt.Rows[0]["IdTeacher"].ToString());
                    s.Email = dt.Rows[0]["Email"].ToString();
                    s.Password = dt.Rows[0]["Password"].ToString();
                    s.Name = dt.Rows[0]["Name"].ToString();
                    s.Phone = dt.Rows[0]["Phone"].ToString();
                    s.Avatar = dt.Rows[0]["Avatar"].ToString();
                    s.Price = Convert.ToDouble(dt.Rows[0]["Price"].ToString());
                    s.Bio = dt.Rows[0]["Bio"].ToString();
                }
            }

            return s;
        }

        public StudentModel getStudentById(string id)
        {
            string sql = "select * from Student where IdStudent = " + id;

            SqlConnection con = db.GetConnection();
            SqlDataAdapter cmd = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();

            con.Open();
            cmd.Fill(dt);
            cmd.Dispose();
            con.Close();

            StudentModel s = null;

            if (dt.Rows.Count > 0)
            {
                s = new StudentModel();
                s.IdStudent = Convert.ToInt32(dt.Rows[0]["IdStudent"].ToString());
                s.Email = dt.Rows[0]["Email"].ToString();
                s.Password = dt.Rows[0]["Password"].ToString();
                s.Name = dt.Rows[0]["Name"].ToString();
                s.Phone = dt.Rows[0]["Phone"].ToString();
                s.Avatar = dt.Rows[0]["Avatar"].ToString();
            }

            return s;
        }

        public bool updateProfile(StudentModel tutor)
        {
            string sql = "Update Student set Name = N'" + tutor.Name + "',Phone = '" + tutor.Phone +
                         "' , Avatar = '" + tutor.Avatar + "' where IdStudent = " + tutor.IdStudent;
            SqlConnection con = db.GetConnection();
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            var result = cmd.ExecuteNonQuery();

            cmd.Dispose();
            con.Close();

            return result > 0;
        }

        public bool updatePassword(string email, string pass)
        {
            string hash = hashPassword(pass);
            string sql = "update Student set Password = '" + hash + "' where Email = '" + email + "'";

            TeacherModel s = null;
            SqlConnection con = db.GetConnection();
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            int r = cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();

            return r > 0;
        }
    }
}
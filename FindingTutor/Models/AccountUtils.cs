using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

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
                s.Name = dt.Rows[0]["Password"].ToString();
                s.Phone = dt.Rows[0]["Phone"].ToString();
                s.Avatar = dt.Rows[0]["Avatar"].ToString();
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
        public bool CreateAccount(StudentModel m)
        {
            try
            {
                string hash = hashPassword(m.Password);
                string sql = "If not Exists (Select * from Student where Email = '" + m.Email +
                             "' ) begin insert into Student(Email,Password,Name,Phone,Avatar) values ('" + m.Email + "','" +
                             hash + "','" + m.Name + "'," + m.Phone + ",'Avatar.png') end";

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
                throw;
                return false;
            }

            return true;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FindingTutor.Models
{
    public class DbContext
    {
        private DBConnection db;
        public DbContext()
        {
            db = new DBConnection();
        }
        public List<TeacherModel> GetListTutor()
        {
            string sql = "select * from Teacher";

            List<TeacherModel> listAcc = new List<TeacherModel>();
            SqlConnection con = db.GetConnection();
            SqlDataAdapter cmd = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();

            con.Open();
            cmd.Fill(dt);
            cmd.Dispose();
            con.Close();

            TeacherModel acc;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                acc = new TeacherModel();
                acc.IdTeacher = Convert.ToInt32(dt.Rows[i]["IdTeacher"].ToString());
                acc.Email = dt.Rows[i]["Email"].ToString();
                acc.Password = dt.Rows[i]["Password"].ToString();
                acc.Name = dt.Rows[i]["Name"].ToString();
                acc.Phone = Convert.ToDecimal(dt.Rows[i]["Phone"].ToString());
                acc.Price = Convert.ToDecimal(dt.Rows[i]["Price"].ToString());
                acc.Avatar = dt.Rows[i]["Avatar"].ToString();
                acc.Bio = dt.Rows[i]["Bio"].ToString();

                listAcc.Add(acc);
            }
            return listAcc;
        }
        public TeacherModel GetTutorById(int ID)
        {
            string sql = "select * from Teacher where IdTeacher = "+ID;

            
            SqlConnection con = db.GetConnection();
            SqlDataAdapter cmd = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();

            con.Open();
            cmd.Fill(dt);
            cmd.Dispose();
            con.Close();

            TeacherModel acc= new TeacherModel();;
            if (dt.Rows[0]["IdTeacher"] == null)
            {
                return acc;
            }
                acc.IdTeacher = Convert.ToInt32(dt.Rows[0]["IdTeacher"].ToString());
                acc.Email = dt.Rows[0]["Email"].ToString();
                acc.Password = dt.Rows[0]["Password"].ToString();
                acc.Name = dt.Rows[0]["Name"].ToString();
                acc.Phone = Convert.ToDecimal(dt.Rows[0]["Phone"].ToString());
                acc.Price = Convert.ToDecimal(dt.Rows[0]["Price"].ToString());
                acc.Avatar = dt.Rows[0]["Avatar"].ToString();
                acc.Bio = dt.Rows[0]["Bio"].ToString();

            return acc;
        }
        public bool EditProfile(TeacherModel tutor)
        {
            string sql = "Update Teacher set Name = N'" + tutor.Name + "',Phone = '" + tutor.Phone +
                "' ,Price = '" + tutor.Price + "',Bio = N'" + tutor.Bio + "' where IdTeacher = " + tutor.IdTeacher;
            SqlConnection con = db.GetConnection();
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            var result = cmd.ExecuteNonQuery();

            cmd.Dispose();
            con.Close();

            return result > 0;
        }
        public bool EditPassword(TeacherModel tutor)
        {
            string sql = "Update Teacher set Password = '" + tutor.Password+ "'  where IdTeacher = " + tutor.IdTeacher ;
            SqlConnection con = db.GetConnection();
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            var result = cmd.ExecuteNonQuery();

            cmd.Dispose();
            con.Close();

            return result > 0;
        }
        // Đăng ký tài khoản gia sư
        public bool CreateNewAccount(TeacherModel tutor)
        {
            string sql = "insert into Teacher (Email,Password,Name,Phone,Price,Avatar,Bio) " +
                "Values(N'" + tutor.Email + "',N'" +tutor.Password + "',N'"+ tutor.Name + "' , '" + tutor.Phone+ "' ,'"
                + tutor.Price + "','" +tutor.Avatar+ "',N'"+ tutor.Bio + "');";
            SqlConnection con = db.GetConnection();
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            var result = cmd.ExecuteNonQuery();

            cmd.Dispose();
            con.Close();

            return result > 0;
        }
        // Get list FreeTime
        public List<FreeTimeModel> getFreeTimeOf(int IdTeacher)
        {

            string sql = "select * from FreeTime where IdTeacher = " + IdTeacher;

            SqlConnection con = db.GetConnection();
            SqlDataAdapter cmd = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();

            con.Open();
            cmd.Fill(dt);
            cmd.Dispose();
            con.Close();

            List<FreeTimeModel> list = new List<FreeTimeModel>();

            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    FreeTimeModel f = new FreeTimeModel();
                    f.IdFreeTime = Convert.ToInt32(dt.Rows[i]["Id"].ToString());
                    f.IdTeacher = Convert.ToInt32(dt.Rows[i]["IdTeacher"].ToString());
                    f.Index = Convert.ToInt32(dt.Rows[i]["TableIndex"].ToString());
                    /*if (Convert.ToBoolean(dt.Rows[i]["Status"].ToString()))
                    {
                        f.Status = 1;
                    }
                    else
                    {
                        f.Status = 0;
                    }*/

                    list.Add(f);
                }
            }

            return list;
        }
        public bool DeleteFreeTimeTo(int ID)
        {
            string sql = "Delete from FreeTime where IdTeacher = " + ID;
            SqlConnection con = db.GetConnection();
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            var result = cmd.ExecuteNonQuery();

            cmd.Dispose();
            con.Close();

            return result > 0;
        }
        // Tạo FreeTime
        public bool CreateFreeTime(int id , int index)
        {
            string sql = "insert into FreeTime (IdTeacher,TableIndex) " +
                "Values('" + id + "','" + index + "');";
            SqlConnection con = db.GetConnection();
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            var result = cmd.ExecuteNonQuery();

            cmd.Dispose();
            con.Close();

            return result > 0;
        }
        // update status
        public void UpdateStatusFreeTime(int IdTeacher, List<TimeBookingModel> b, int status)
        {
            string sql = "";

            if (b.Count > 0)
            {
                foreach (TimeBookingModel i in b)
                {
                    sql = "update FreeTime set Status = " + status + " where IdTeacher = " + IdTeacher +
                          " and TableIndex = " + i.Index;
                    SqlConnection con = db.GetConnection();
                    SqlCommand cmd = new SqlCommand(sql, con);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    con.Close();
                }
            }
            else
            {
                return;
            }

        }
        // Get list khóa dạy
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
        // profile
        public List<ProfileModel> getProfileOf(int idTeacher)
        {
            string sql =
                "select b.*, c.Name, d.Grade from Courses a, Profile b, Subjects c, Grades d where b.IdTeacher = " + idTeacher + " and a.IdCourse = b.IdCourse and a.IdGrade = d.IdGrade and a.IdSubject = c.IdSubject";
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
        public bool DeleteProfileTo(int ID)
        {
            string sql = "Delete from Profile where IdTeacher = " + ID;
            SqlConnection con = db.GetConnection();
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            var result = cmd.ExecuteNonQuery();

            cmd.Dispose();
            con.Close();

            return result > 0;
        }
        public bool CreateProfileTo(int id,int courseID)
        {
            string sql = "insert into Profile (IdTeacher,IdCourse) " +
                "Values('" + id + "','" + courseID + "');";
            SqlConnection con = db.GetConnection();
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            var result = cmd.ExecuteNonQuery();

            cmd.Dispose();
            con.Close();

            return result > 0;
        }
        // booking
        public List<BookingModel> GetListBookingByIdTeacher(int id)
        {
            string sql ="select * from Booking where IdTeacher = "+id;
            List<BookingModel> list = new List<BookingModel>();

            SqlConnection con = db.GetConnection();
            SqlDataAdapter cmd = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();

            con.Open();
            cmd.Fill(dt);
            cmd.Dispose();
            con.Close();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                BookingModel p = new BookingModel();
                p.Id = Convert.ToInt32(dt.Rows[i]["Id"].ToString());
                p.IdStudent = Convert.ToInt32(dt.Rows[i]["IdStudent"].ToString());
                p.IdTeacher = Convert.ToInt32(dt.Rows[i]["IdTeacher"].ToString());                
                p.DateStart = Convert.ToDateTime(dt.Rows[i]["DateStart"].ToString());
                p.Status= Convert.ToInt32(dt.Rows[i]["Status"].ToString());
                p.IdCourse = Convert.ToInt32(dt.Rows[i]["IdCourse"].ToString());
                list.Add(p);
            }

            return list;
        }
        public List<BookingModel> GetListBookingByStatus(int status)
        {
            string sql = "select * from Booking where Status = " + status;
            List<BookingModel> list = new List<BookingModel>();

            SqlConnection con = db.GetConnection();
            SqlDataAdapter cmd = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();

            con.Open();
            cmd.Fill(dt);
            cmd.Dispose();
            con.Close();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                BookingModel p = new BookingModel();
                p.Id = Convert.ToInt32(dt.Rows[i]["Id"].ToString());
                p.IdStudent = Convert.ToInt32(dt.Rows[i]["IdStudent"].ToString());
                p.IdTeacher = Convert.ToInt32(dt.Rows[i]["IdTeacher"].ToString());
                p.DateStart = Convert.ToDateTime(dt.Rows[i]["DateStart"].ToString());
                p.Status = Convert.ToInt32(dt.Rows[i]["Status"].ToString());
                p.IdCourse = Convert.ToInt32(dt.Rows[i]["IdCourse"].ToString());
                list.Add(p);
            }

            return list;
        }
        public BookingModel GetListBookingById(int id)
        {
            string sql = "select * from Booking where Id = " + id;
            List<BookingModel> list = new List<BookingModel>();

            SqlConnection con = db.GetConnection();
            SqlDataAdapter cmd = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();

            con.Open();
            cmd.Fill(dt);
            cmd.Dispose();
            con.Close();
            BookingModel p = new BookingModel();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                
                p.Id = Convert.ToInt32(dt.Rows[i]["Id"].ToString());
                p.IdStudent = Convert.ToInt32(dt.Rows[i]["IdStudent"].ToString());
                p.IdTeacher = Convert.ToInt32(dt.Rows[i]["IdTeacher"].ToString());
                p.DateStart = Convert.ToDateTime(dt.Rows[i]["DateStart"].ToString());
                p.Status = Convert.ToInt32(dt.Rows[i]["Status"].ToString());
                p.IdCourse = Convert.ToInt32(dt.Rows[i]["IdCourse"].ToString());
                list.Add(p);
            }

            return p;
        }
        // cập nhập status cho booking
        public bool UpdateStatusOfBooking(int id,int status, List<TimeBookingModel> listTimeBooking)
        {
            string sql = "Update Booking set Status = '" + status + "'  where Id = " + id;
            SqlConnection con = db.GetConnection();
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            var result = cmd.ExecuteNonQuery();

            cmd.Dispose();
            con.Close();
            

            return result > 0;
        }
        // 
        // Student
        //
        public StudentModel GetStudentByID(int id)
        {
            string sql = "select * from Student where IdStudent = " + id;

            SqlConnection con = db.GetConnection();
            SqlDataAdapter cmd = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();

            con.Open();
            cmd.Fill(dt);
            cmd.Dispose();
            con.Close();

            StudentModel p = new StudentModel();
            p.IdStudent = Convert.ToInt32(dt.Rows[0]["IdStudent"].ToString());
            p.Email = dt.Rows[0]["Email"].ToString();
            p.Name = dt.Rows[0]["Name"].ToString();
            p.Phone = Convert.ToDecimal(dt.Rows[0]["Phone"].ToString());
            p.Avatar = dt.Rows[0]["Avatar"].ToString();

            return p;
        }
        // TimeBooking
        //  lấy list timebooking theo id student và id tutor
        public List<TimeBookingModel> GetListTimeBookingById(int idTutor, int idStudent)
        {
            string sql = "select tb.* from TimeBooking tb,Booking b" +
                "  where tb.IdBooking = b.Id and b.IdTeacher = "+idTutor+" and b.IdStudent = "+ idStudent;
            List<TimeBookingModel> list = new List<TimeBookingModel>();

            SqlConnection con = db.GetConnection();
            SqlDataAdapter cmd = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();

            con.Open();
            cmd.Fill(dt);
            cmd.Dispose();
            con.Close();
            TimeBookingModel p;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                p = new TimeBookingModel();
                p.IdTime = Convert.ToInt32(dt.Rows[i]["IdTime"].ToString());
                p.Index = Convert.ToInt32(dt.Rows[i]["IndexTable"].ToString());
                p.IdBooking = Convert.ToInt32(dt.Rows[i]["IdBooking"].ToString());
                list.Add(p);
            }

            return list;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FindingTutor.Models
{
    public class BookingModel
    {

        public int Id { get; set; }
        public int IdTeacher { get; set; }
        public int IdStudent { get; set; }
        public string DateStart { get; set; }
        public int Status { get; set; }
        public int IdCourse  { get; set; }

    }

    public class BookingTimeModel
    {
        public int IdTime { get; set; }
        public int Index { get; set; }
        public int IdBooking { get; set; }

    }

    public class BookingUtils
    {
        private DBConnection db;

        public BookingUtils()
        {
            db = new DBConnection();
        }

        public bool AddBookingRequest(BookingModel a, List<BookingTimeModel> b)
        {

            string sql = "insert into Booking(IdStudent,IdTeacher,DateStart,Status,IdCourse) output inserted.Id values (" + a.IdStudent +
                         "," + a.IdTeacher + ",'" + a.DateStart + "',0," + a.IdCourse + ")";

            SqlConnection con = db.GetConnection();
            SqlDataAdapter cmd = new SqlDataAdapter(sql,con);
            DataTable dt = new DataTable();

            con.Open();
            cmd.Fill(dt);
            cmd.Dispose();
            con.Close();

            int r = -1;
            if (dt.Rows.Count > 0)
            {
                r = Convert.ToInt32(dt.Rows[0]["Id"].ToString());
            }
            else
            {
                return false;
            }

            if (r > 0)
            {

                foreach (BookingTimeModel item in b)
                {
                    sql = "insert into TimeBooking(IndexTable,IdBooking) values ("+item.Index+","+r+")";
                    SqlCommand cmd2 = new SqlCommand(sql, con);
                    con.Open();
                    cmd2.ExecuteNonQuery();
                    cmd.Dispose();
                    con.Close();
                }

            }
            else
            {
                return false;
            }

            return true;
        }

    }

}
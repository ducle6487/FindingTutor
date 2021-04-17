using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FindingTutor.Models
{
    public class FreeTimeModel
    {
        public int IdFreeTime { get; set; }
        public int IdTeacher { get; set; }
        public int Index { get; set; }
        public int Status { get; set; }

    }

    public class FreeTimeUtils
    {
        private DBConnection db;

        public FreeTimeUtils()
        {
            db = new DBConnection();
        }

        public void UpdateStatus(int IdTeacher, List<BookingTimeModel> b, int status)
        {
            string sql = "";

            if (b.Count > 0)
            {
                foreach (BookingTimeModel i in b)
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
                    if (Convert.ToBoolean(dt.Rows[i]["Status"].ToString()))
                    {
                        f.Status = 1;
                    }
                    else
                    {
                        f.Status = 0;
                    }
                    
                    list.Add(f);
                }
            }

            return list;

        }
    }
}
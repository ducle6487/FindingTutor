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
    public class StudentModel
    {
        public int IdStudent { get; set; }
        public String Email { get; set; }
        public String Password { get; set; }
        public String Name { get; set; }
        public string Phone { get; set; }

        public string Avatar { get; set; }
    }
}
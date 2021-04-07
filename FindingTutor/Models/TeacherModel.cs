using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
}
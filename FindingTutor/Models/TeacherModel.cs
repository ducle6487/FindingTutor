using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FindingTutor.Models
{
    public class TeacherModel
    {
        public int IdTeacher { set; get; }
        public string Email { set; get; }
        public string Password{ set; get; }
        public string Name { set; get; }
        public decimal Phone { set; get; }
        public decimal Price { set; get; }
        public string Avatar { set; get; }
        public string Bio { set; get; }
    }
}
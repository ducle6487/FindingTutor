using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FindingTutor.Models
{
    public class ProfileModel
    {
        public int IdProfile { get; set; }
        public int IdTeacher { get; set; }
        public int IdCourse { get; set; }
        public string NameCourse { get; set; }

        public string NameSubject { get; set; }
        public string NameGrade { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FindingTutor.Models
{
    public class CourseModel
    {
        public int IdCourse { get; set; }
        public int IdSubject { get; set; }
        public int IdGrade { get; set; }
        public string NameSubject { get; set; }
        public string NameGrade { get; set; }
    }
}
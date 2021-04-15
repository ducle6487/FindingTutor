using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FindingTutor.Models
{
    public class BookingModel
    {
        public int Id { get; set; }
        public int IdTeacher { get; set; }
        public int IdStudent { get; set; }
        public DateTime DateStart { get; set; }
        public int Status { get; set; }
        public int IdCourse { get; set; }
    }
}
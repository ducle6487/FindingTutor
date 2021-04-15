using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FindingTutor.Models
{
    public class MessageModel
    {
        public int IdMessage { get; set; }
        public int IdOwner { get; set; }
        public string ContentMessage { get; set; }
        public string DateChat { get; set; }
        public int IdConservation { get; set; }
    }
}
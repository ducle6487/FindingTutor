using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FindingTutor.Controllers
{
    public class TutorController : Controller
    {
        // GET: Tutor
        //Profile
        public ActionResult Profile()
        {
            return View();
        }
        //
        // Edit
        public ActionResult EditProfile()
        {
            return View();
        }
    }
}
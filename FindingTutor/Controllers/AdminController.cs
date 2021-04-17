using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FindingTutor.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Index()
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("UserLogin", "Authenticate");
            }
            return View();
        }

        /*public ActionResult Login()
        {
            return View();
        }*/
    }
}
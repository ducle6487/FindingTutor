using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FindingTutor.Models;

namespace FindingTutor.Controllers
{
    public class AuthenticateController : Controller
    {
        private AccountUtils accUtils = new AccountUtils();

        public ActionResult UserLogin()
        {
            return View();
        }

        [HttpPost, ActionName("Register")]
        public ActionResult Register()
        {
            StudentModel s = new StudentModel();
            s.Email = string.Format("{0}", Request.Form["email"]);
            s.Password = String.Format("{0}", Request.Form["password"]);
            s.Name = String.Format("{0}", Request.Form["name"]);
            s.Phone = String.Format("{0}", Request.Form["phone"]);

            if (accUtils.UnexistEmail(s.Email))
            {
                if (accUtils.CreateAccount(s))
                {
                    ViewBag.Success = "Đăng ký thành công.";
                }
                else
                {
                    ViewBag.Danger = "Đăng ký thất bại, thử lại.";
                }
            }
            else
            {
                ViewBag.Danger = "Email đã tồn tại.";
            }

            return View("UserLogin");
        }

        [HttpPost, ActionName("Login")]
        public ActionResult LoginBack()
        {
            string email = string.Format("{0}", Request.Form["email"]);
            string password = String.Format("{0}", Request.Form["password"]);
            if (accUtils.checkStudentLogin(email, password) == null)
            {
                ViewBag.Danger = "Đăng nhập thất bại, thử lại.";
            }
            else
            {
                ViewBag.Success = "Đăng nhập thành công";
            }

            return View("UserLogin");
        }
    }
}
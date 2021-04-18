using FindingTutor.Models;
using System;
using System.Web.Mvc;

namespace FindingTutor.Controllers
{
    public class AuthenticateController : Controller
    {
        private AccountUtils accUtils = new AccountUtils();

        public ActionResult Logout()
        {
            Session["Teacher"] = null;
            Session["Student"] = null;
            Session["Admin"] = null;

            return RedirectToAction("Index", "Home");
        }

        public ActionResult UserLogin()
        {
            if (Session["Teacher"] != null)
            {
                return RedirectToAction("TutorManagement", "Tutor");
            }

            if (Session["Student"] != null)
            {
                return RedirectToAction("Index", "Home");
            }

            if (Session["Admin"] != null)
            {
                return RedirectToAction("Index", "Admin");
            }

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

            string valueSelect = String.Format("{0}", Request.Form["type"].ToString());
            bool r = false;
            if (valueSelect == "teacher")
            {
                r = true;
            }

            if (accUtils.UnexistEmail(s.Email))
            {
                if (accUtils.CreateAccount(s, r))
                {
                    ViewBag.Success = "Đăng ký thành công, Đăng nhập ngay.";
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

            if (email == "admin@duc.com" && password == "admin123")
            {
                Session["Admin"] = "loged";
                return RedirectToAction("Index", "Admin");
            }

            if (accUtils.checkStudentLogin(email, password) == null)
            {
                if (accUtils.checkTeacherLogin(email, password) == null)
                {
                    ViewBag.Danger = "Đăng nhập thất bại, thử lại.";
                }
                else
                {
                    Session["Teacher"] = accUtils.checkTeacherLogin(email, password);
                    return RedirectToAction("TutorManagement", "Tutor");
                }
            }
            else
            {
                Session["Student"] = accUtils.checkStudentLogin(email, password);
                return RedirectToAction("Index", "Home");
            }

            return View("UserLogin");
        }
    }
}
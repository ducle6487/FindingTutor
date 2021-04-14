using FindingTutor.Models;
using System;
using System.Web.Mvc;

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

            string valueSelect = String.Format("{0}", Request.Form["type"].ToString());
            bool r=false;
            if (valueSelect == "teacher")
            {
                r = true;
            }

            if (accUtils.UnexistEmail(s.Email))
            {
                if (accUtils.CreateAccount(s,r))
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
                if(accUtils.checkTeacherLogin(email, password) == null)
                {
                    
                    ViewBag.Danger = "Đăng nhập thất bại, thử lại.";
                }
                else
                {
                    Session["Teacher"] = accUtils.checkTeacherLogin(email, password);
                    ViewBag.Success = "Đăng nhập thành công t";
                }
            }
            else
            {
                Session["Student"] = accUtils.checkStudentLogin(email, password);
                ViewBag.Success = "Đăng nhập thành công s";
            }

            return View("UserLogin");
        }
    }
}
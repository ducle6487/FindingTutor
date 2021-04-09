using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FindingTutor.Models;

namespace FindingTutor.Controllers
{
    public class HomeController : Controller
    {
        private AccountUtils accUtils = new AccountUtils();

        public ActionResult RequestTutor()
        {
            CourseUtils courseUtils = new CourseUtils();

            List<CourseModel> listCourse = courseUtils.getAllCourse();

            ViewBag.ListAllCourse = listCourse;

            return View();
        }

        [HttpPost]
        public ActionResult LoginSubmit()
        {
            CourseUtils courseUtils = new CourseUtils();
            RequestModel r = new RequestModel();
            DateTime c = DateTime.Now;
            r.DateRequest = c.ToString("yyyy-MM-dd HH:mm");
            r.IdCourse = Convert.ToInt32(String.Format("{0}", Request.Form["khoahoc"]));
            r.Message = String.Format("{0}", Request.Form["message"].ToString());

            string email = String.Format("{0}", Request.Form["email2"]);
            string password = String.Format("{0}", Request.Form["password2"]);

            StudentModel s = accUtils.checkStudentLogin(email, password);

            if (s != null)
            {
                r.IdStudent = s.IdStudent;
                RequestUtils requestUtils = new RequestUtils();
                requestUtils.CreateNewRequest(r);
                return Content("addded request");
            }
            ViewBag.khoahoc = r.IdCourse;
            ViewBag.lotrinh = String.Format("{0}", Request.Form["lotrinh"].ToString());
            ViewBag.message = r.Message;
            ViewBag.Danger = "Đăng nhập tài khoản thất bại, thử lại.";
            ViewBag.ListAllCourse = courseUtils.getAllCourse();
            return View("RequestTutor");
        }

        [HttpPost]
        public ActionResult RegisterSubmit()
        {
            CourseUtils courseUtils = new CourseUtils();
            RequestModel r = new RequestModel();
            DateTime c = DateTime.Now;
            r.DateRequest = c.ToString("yyyy-MM-dd HH:mm");
            r.IdCourse = Convert.ToInt32(String.Format("{0}", Request.Form["khoahoc"]));
            r.Message = String.Format("{0}", Request.Form["message"].ToString());

            StudentModel m = new StudentModel();
            m.Name = String.Format("{0}", Request.Form["name1"]);
            m.Phone = String.Format("{0}", Request.Form["phone1"]);
            m.Email = String.Format("{0}", Request.Form["email1"]);
            m.Password = String.Format("{0}", Request.Form["password1"]);

            if (accUtils.UnexistEmail(m.Email))
            {
                if (accUtils.CreateAccount(m))
                {
                    StudentModel s = accUtils.checkStudentLogin(m.Email, m.Password);

                    if (s != null)
                    {
                        r.IdStudent = s.IdStudent;
                        RequestUtils requestUtils = new RequestUtils();
                        requestUtils.CreateNewRequest(r);
                        return Content("addded request");
                    }
                }
                else
                {
                    ViewBag.khoahoc = r.IdCourse;
                    ViewBag.lotrinh = String.Format("{0}", Request.Form["lotrinh"].ToString());
                    ViewBag.Danger = "Đăng ký tài khoản thất bại, thử lại.";
                }
            }
            else
            {
                ViewBag.khoahoc = r.IdCourse;
                ViewBag.lotrinh = String.Format("{0}", Request.Form["lotrinh"].ToString());
                ViewBag.message = r.Message;
                ViewBag.Danger = "Email đã tồn tại!";
            }
            ViewBag.ListAllCourse = courseUtils.getAllCourse();
            return View("RequestTutor");
        }
    }
}
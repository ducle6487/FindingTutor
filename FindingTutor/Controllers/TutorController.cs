using FindingTutor.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FindingTutor.Controllers
{
    public class TutorController : Controller
    {
        private DbContext dbC = new DbContext();

        /* // GET: Tutor
         //login
         public ActionResult Login()
         {
             return View();
         }

         [HttpPost]
         public ActionResult Login(FormCollection f)
         {
             TeacherModel tutor = new TeacherModel();
             var email = f["Email"];
             var password = f["Password"];

             tutor = dbC.GetListTutor().SingleOrDefault(n => n.Email == email && n.Password == password);
             if (tutor != null)
             {
                 Session["Account"] = tutor;
                 return RedirectToAction("TutorManagement");
             }
             ViewBag.Mess = "Check lại tên đang nhập hoặc mật khẩu đi bro, có gì đó không ổn";
             return View();
         }

         // Dăng ký
         public ActionResult Register()
         {
             return View();
         }

         [HttpPost]
         public ActionResult Register(FormCollection f)
         {
             TeacherModel tutor = new TeacherModel();
             tutor.Email = f["Email"];
             tutor.Password = f["Password"];
             tutor.Name = f["Name"];
             tutor.Phone = Convert.ToString(f["Phone"]);
             tutor.Price = Convert.ToDouble(f["Price"]);
             tutor.Bio = f["Bio"];
             if (tutor.Password != f["CheckPassword"])
             {
                 return View();
             }
             if (dbC.CreateNewAccount(tutor))
             {
                 return RedirectToAction("Login");
             }
             else
             {
                 return HttpNotFound();
             }
         }*/

        // cập nhật thời gian rảnh
        [HttpPost]
        public ActionResult SetFreeTime(FormCollection f)
        {
            TeacherModel tutor = Session["Teacher"] as TeacherModel;

            dbC.DeleteFreeTimeTo(tutor.IdTeacher);
            for (int i = 1; i <= 119; i++)
            {
                var checkbox = Request.Form[i.ToString()];
                if (checkbox != null)
                {
                    dbC.CreateFreeTime(tutor.IdTeacher, i);
                }
            }
            return RedirectToAction("TutorManagement");
        }

        // Chập nhật subject
        [HttpPost]
        public ActionResult SubjectManage()
        {
            TeacherModel tutor = Session["Teacher"] as TeacherModel;
            List<CourseModel> listCourse = dbC.getAllCourse();
            dbC.DeleteProfileTo(tutor.IdTeacher);

            foreach (var course in listCourse)
            {
                var checkbox = Request.Form[course.IdCourse.ToString()];
                if (checkbox != null)
                {
                    dbC.CreateProfileTo(tutor.IdTeacher, course.IdCourse);
                }
            }
            return RedirectToAction("TutorManagement");
        }

        //Profile
        public ActionResult Profile(string id)
        {
            TeacherModel tutor = dbC.GetListTutor().SingleOrDefault(n => n.IdTeacher.ToString() == id);
            if (tutor == null)
            {
                return RedirectToAction("Index", "Home");
            }

            ViewBag.idteacher = tutor.IdTeacher;
            return View(tutor);
        }

        //
        // Edit
        public ActionResult EditProfile()
        {
            if (Session["Teacher"] != null)
            {
                TeacherModel tutor = Session["Teacher"] as TeacherModel;
                return View(tutor);
            }
            return RedirectToAction("UserLogin", "Authenticate");
        }

        [HttpPost]
        public ActionResult EditProfile(FormCollection f, HttpPostedFileBase file)
        {
            TeacherModel tutor = Session["Teacher"] as TeacherModel;
            if (file.ContentLength > 0)
            {
                var fileName = Path.GetFileName(file.FileName);
                var path = Path.Combine(Server.MapPath("~/Content/image"), fileName);
                tutor.Avatar = fileName;
                file.SaveAs(path);
            }
            tutor.Name = f["Name"];
            tutor.Phone = Convert.ToString(f["Phone"]);
            tutor.Price = Convert.ToDouble(f["Price"]);
            tutor.Bio = f["Bio"];

            if (dbC.EditProfile(tutor))
            {
                return RedirectToAction("TutorManagement");
            }
            ViewBag.Mess = "Sửa không thành công!";
            return View();
        }

        // đổi password
        public ActionResult EditPassword()
        {
            if (Session["Teacher"] != null)
            {
                return View();
            }
            return RedirectToAction("UserLogin", "Authenticate");
        }

        [HttpPost]
        public ActionResult EditPassword(FormCollection f)
        {
            TeacherModel s = (TeacherModel)Session["Teacher"];
            AccountUtils accountUtils = new AccountUtils();
            var password = f["Password"];
            var newPassword = f["NewPassword"];
            var check = f["CheckNewPass"];

            if (check != newPassword)
            {
                ViewBag.Mess = "Xác nhận mật khẩu sai!";
                return View();
            }

            if (accountUtils.checkTeacherLogin(s.Email, password) == null)
            {
                ViewBag.Mess = "mật khẩu sai!";
                return View();
            }
            else
            {
                s = accountUtils.UpdateTeacherAccount(s.Email, newPassword);
                if (s != null)
                {
                    Session["Teacher"] = s;
                    return RedirectToAction("TutorManagement", "Tutor");
                }
            }
            return HttpNotFound();
        }

        public ActionResult TutorManagement()
        {
            if (Session["Teacher"] != null)
            {
                TeacherModel tutor = Session["Teacher"] as TeacherModel;
                return View(tutor);
            }
            return RedirectToAction("UserLogin", "Authenticate");
        }

        //[HttpPost]
        public ActionResult AcceptRequest(int id)
        {
            List<TimeBookingModel> ltb = new List<TimeBookingModel>(); // khong dungf
            if (dbC.UpdateStatusOfBooking(id, 1, ltb))
            {
                return RedirectToAction("TutorManagement");
            }
            else
            {
                return HttpNotFound();
            }
        }

        //[HttpPost]
        public ActionResult RefuseRequest(int id, int idTutor, int idStudent)
        {
            List<TimeBookingModel> ltb = dbC.GetListTimeBookingById(idTutor, idStudent); ;
            if (dbC.UpdateStatusOfBooking(id, -1, ltb))
            {
                dbC.UpdateStatusFreeTime(idTutor, ltb, 0);
                return RedirectToAction("TutorManagement");
            }
            else
            {
                return HttpNotFound();
            }
        }
    }
}
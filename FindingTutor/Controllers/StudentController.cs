using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FindingTutor.Models;

namespace FindingTutor.Controllers
{
    public class StudentController : Controller
    {
        public ActionResult UpdateProfile()
        {
            if (Session["Student"] != null)
            {
                StudentModel s = (StudentModel)Session["Student"];
                return View(s);
            }

            return RedirectToAction("MainPage", "Home");
        }

        [HttpPost, ActionName("UpdateProfile")]
        public ActionResult UpdateProfileResult(FormCollection f, HttpPostedFileBase file)
        {
            StudentModel tutor = (StudentModel)Session["Student"];
            if (file.ContentLength > 0)
            {
                var fileName = Path.GetFileName(file.FileName);
                var path = Path.Combine(Server.MapPath("~/Content/image"), fileName);
                tutor.Avatar = fileName;
                file.SaveAs(path);
            }
            tutor.Name = f["Name"];
            tutor.Phone = Convert.ToString(f["Phone"]);
            AccountUtils s = new AccountUtils();
            if (s.updateProfile(tutor))
            {
                Session["Student"] = s.getStudentById(tutor.IdStudent.ToString());
                Session["message"] = "Cập nhật thành công";
                return RedirectToAction("MainPage", "Home");
            }
            ViewBag.Mess = "Cập nhật không thành công!";
            return View();
        }

        public ActionResult UpdatePassword()
        {
            if (Session["Student"] != null)
            {
                return View();
            }
            return RedirectToAction("MainPage", "Home");
        }

        [HttpPost, ActionName("UpdatePassword")]
        public ActionResult UpdatePasswordResult(FormCollection f)
        {
            StudentModel s = (StudentModel)Session["Student"];
            AccountUtils accountUtils = new AccountUtils();
            var password = f["Password"];
            var newPassword = f["NewPassword"];
            var check = f["CheckNewPass"];

            if (check != newPassword)
            {
                ViewBag.Mess = "Xác nhận mật khẩu sai!";
                return View();
            }

            if (accountUtils.checkStudentLogin(s.Email, password) == null)
            {
                ViewBag.Mess = "mật khẩu sai!";
                return View();
            }
            else
            {
                if (accountUtils.updatePassword(s.Email, newPassword))
                {
                    Session["Student"] = s;
                    Session["message"] = "Cập nhật thành công";
                    return RedirectToAction("MainPage", "Home");
                }
            }
            return HttpNotFound();
        }
    }
}
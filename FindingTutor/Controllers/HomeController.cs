using FindingTutor.Models;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace FindingTutor.Controllers
{
    public class HomeController : Controller
    {
        private AccountUtils accUtils = new AccountUtils();

        public ActionResult Booking(int idTeacher)
        {
            ProfileUtils profileUtils = new ProfileUtils();

            List<ProfileModel> listCourse = profileUtils.getProfileOf(idTeacher);

            FreeTimeUtils f = new FreeTimeUtils();

            List<FreeTimeModel> list = f.getFreeTimeOf(idTeacher);

            ViewBag.ListAllCourse = listCourse;
            ViewBag.ListFreeTime = list;
            ViewBag.IdTeacher = idTeacher;
            return View();
        }

        [HttpPost]
        public ActionResult LoginSubmit(int IdTeacher)
        {
            ProfileUtils profileUtils = new ProfileUtils();
            FreeTimeUtils f = new FreeTimeUtils();
            List<ProfileModel> listCourse = profileUtils.getProfileOf(IdTeacher);
            List<FreeTimeModel> list = f.getFreeTimeOf(IdTeacher);
            string email = String.Format("{0}", Request.Form["email2"]);
            string password = String.Format("{0}", Request.Form["password2"]);
            ViewBag.doituong = String.Format("{0}", Request.Form["doituong"].ToString());
            ViewBag.khoahoc = string.Format("{0}", Request.Form["khoahoc"].ToString());
            ViewBag.message = string.Format("{0}", Request.Form["message"].ToString());
            ViewBag.datestart = string.Format("{0}", Request.Form["datestart"].ToString());

            StudentModel s = accUtils.checkStudentLogin(email, password);

            if (s != null)
            {
                List<BookingTimeModel> btList = new List<BookingTimeModel>();
                for (int i = 1; i <= 119; i++)
                {
                    bool changed = false;
                    string value = String.Format("{0}", Request.Form[i.ToString()]);
                    foreach (FreeTimeModel item in list)
                    {
                        if (item.Index.ToString() == value)
                        {
                            if (item.Status == 0)
                            {
                                BookingTimeModel bkm = new BookingTimeModel();
                                bkm.Index = i;
                                btList.Add(bkm);
                                break;
                            }
                        }
                    }
                }

                if (btList.Count > 0)
                {
                    f.UpdateStatus(IdTeacher, btList, 1);
                    BookingUtils bku = new BookingUtils();
                    BookingModel bookingModel = new BookingModel();
                    bookingModel.IdStudent = s.IdStudent;
                    bookingModel.IdTeacher = IdTeacher;
                    bookingModel.DateStart = ViewBag.datestart;
                    bookingModel.IdCourse = Convert.ToInt32(ViewBag.khoahoc);
                    bool r = bku.AddBookingRequest(bookingModel, btList);

                    Session["Student"] = s;
                    ViewBag.message = "Yêu cầu của bạn đã được gửi đi";
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ViewBag.Danger = "Phải chọn ít nhất 1 giờ học";
                    Session["Student"] = s;
                    ViewBag.ListAllCourse = listCourse;
                    ViewBag.ListFreeTime = list;
                    return View("Booking");
                }
            }

            ViewBag.Danger = "Đăng nhập tài khoản thất bại, thử lại.";

            ViewBag.ListAllCourse = listCourse;
            ViewBag.ListFreeTime = list;
            return View("Booking");
        }

        [HttpPost]
        public ActionResult RegisterSubmit(int IdTeacher)
        {
            StudentModel m = new StudentModel();
            m.Name = String.Format("{0}", Request.Form["name1"]);
            m.Phone = String.Format("{0}", Request.Form["phone1"]);
            m.Email = String.Format("{0}", Request.Form["email1"]);
            m.Password = String.Format("{0}", Request.Form["password1"]);

            ViewBag.doituong = String.Format("{0}", Request.Form["doituong"].ToString());
            ViewBag.khoahoc = string.Format("{0}", Request.Form["khoahoc"].ToString());
            ViewBag.message = string.Format("{0}", Request.Form["message"].ToString());
            ViewBag.datestart = string.Format("{0}", Request.Form["datestart"].ToString());

            ProfileUtils profileUtils = new ProfileUtils();
            FreeTimeUtils f = new FreeTimeUtils();
            List<ProfileModel> listCourse = profileUtils.getProfileOf(IdTeacher);
            List<FreeTimeModel> list = f.getFreeTimeOf(IdTeacher);

            if (accUtils.UnexistEmail(m.Email))
            {
                if (accUtils.CreateAccount(m, false))
                {
                    StudentModel s = accUtils.checkStudentLogin(m.Email, m.Password);

                    if (s != null)
                    {
                        List<BookingTimeModel> btList = new List<BookingTimeModel>();
                        for (int i = 1; i <= 119; i++)
                        {
                            bool changed = false;
                            string value = String.Format("{0}", Request.Form[i.ToString()]);
                            foreach (FreeTimeModel item in list)
                            {
                                if (item.Index.ToString() == value)
                                {
                                    if (item.Status == 0)
                                    {
                                        BookingTimeModel bkm = new BookingTimeModel();
                                        bkm.Index = i;
                                        btList.Add(bkm);
                                        break;
                                    }
                                }
                            }
                        }

                        if (btList.Count > 0)
                        {
                            f.UpdateStatus(IdTeacher, btList, 1);
                            BookingUtils bku = new BookingUtils();
                            BookingModel bookingModel = new BookingModel();
                            bookingModel.IdStudent = s.IdStudent;
                            bookingModel.IdTeacher = IdTeacher;
                            bookingModel.DateStart = ViewBag.datestart;
                            bookingModel.IdCourse = Convert.ToInt32(ViewBag.khoahoc);
                            bool r = bku.AddBookingRequest(bookingModel, btList);

                            Session["Student"] = s;
                            ViewBag.message = "Yêu cầu của bạn đã được gửi đi";
                            return RedirectToAction("Index", "Home");
                        }
                        else
                        {
                            Session["Student"] = s;
                            ViewBag.ListAllCourse = listCourse;
                            ViewBag.ListFreeTime = list;
                            ViewBag.message = "Phải chọn ít nhất 1 giờ học";
                            return View("Booking");
                        }
                    }
                }
                else
                {
                    ViewBag.Danger = "Đăng ký tài khoản thất bại, thử lại.";
                }
            }
            else
            {
                ViewBag.Danger = "Email đã tồn tại!";
            }

            ViewBag.ListAllCourse = listCourse;
            ViewBag.ListFreeTime = list;
            return View("Booking");
        }

        public ActionResult Submit(int IdTeacher)
        {
            StudentModel s = (StudentModel)Session["Student"];

            ViewBag.doituong = String.Format("{0}", Request.Form["doituong"].ToString());
            ViewBag.khoahoc = string.Format("{0}", Request.Form["khoahoc"].ToString());
            ViewBag.message = string.Format("{0}", Request.Form["message"].ToString());
            ViewBag.datestart = string.Format("{0}", Request.Form["datestart"].ToString());

            ProfileUtils profileUtils = new ProfileUtils();
            FreeTimeUtils f = new FreeTimeUtils();
            List<ProfileModel> listCourse = profileUtils.getProfileOf(IdTeacher);
            List<FreeTimeModel> list = f.getFreeTimeOf(IdTeacher);

            if (s != null)
            {
                List<BookingTimeModel> btList = new List<BookingTimeModel>();
                for (int i = 1; i <= 119; i++)
                {
                    bool changed = false;
                    string value = String.Format("{0}", Request.Form[i.ToString()]);
                    foreach (FreeTimeModel item in list)
                    {
                        if (item.Index.ToString() == value)
                        {
                            if (item.Status == 0)
                            {
                                BookingTimeModel bkm = new BookingTimeModel();
                                bkm.Index = i;
                                btList.Add(bkm);
                                break;
                            }
                        }
                    }
                }

                if (btList.Count > 0)
                {
                    f.UpdateStatus(IdTeacher, btList, 1);
                    BookingUtils bku = new BookingUtils();
                    BookingModel bookingModel = new BookingModel();
                    bookingModel.IdStudent = s.IdStudent;
                    bookingModel.IdTeacher = IdTeacher;
                    bookingModel.DateStart = ViewBag.datestart;
                    bookingModel.IdCourse = Convert.ToInt32(ViewBag.khoahoc);
                    bool r = bku.AddBookingRequest(bookingModel, btList);
                    ViewBag.message = "Yêu cầu của bạn đã được gửi đi";
                    Session["Student"] = s;
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    Session["Student"] = s;
                    ViewBag.ListAllCourse = listCourse;
                    ViewBag.ListFreeTime = list;
                    ViewBag.message = "Phải chọn ít nhất 1 giờ học";
                    return View("Booking");
                }
            }
            ViewBag.ListAllCourse = listCourse;
            ViewBag.ListFreeTime = list;
            return View("Booking");
        }

        public ActionResult Message()
        {
            ViewBag.id = "1";
            ViewBag.message = "1";
            return View();
        }

        public ActionResult ChatList(string s)
        {
            ViewBag.id = s;
            return PartialView("ListChat");
        }

        [HttpPost, ActionName("Message")]
        public ActionResult ChatListResult()
        {
            int result = Convert.ToInt32(String.Format("{0}", Request.Form["chatlist"]));
            ViewBag.message = result;
            ViewBag.id = result;
            return View("Message");
        }

        public ActionResult ChatContent(string s)
        {
            ViewBag.message = s;
            return PartialView("ChatContent");
        }

        public ActionResult FindTutor()
        {
            CourseUtils courseUtils = new CourseUtils();

            ViewBag.ListCourse = courseUtils.getAllCourse();

            TeacherInfoUtils teacherInfoUtils = new TeacherInfoUtils();
            List<TeacherInfoModel> list = teacherInfoUtils.getAllTeacherInfo();
            ViewBag.CountTeacher = list.Count;
            ViewBag.ListInfo = list;
            return View();
        }

        [HttpPost, ActionName("FindTutor")]
        public ActionResult FindTutorResult()
        {
            CourseUtils courseUtils = new CourseUtils();

            ViewBag.ListCourse = courseUtils.getAllCourse();

            string idCourse = string.Format("{0}", Request.Form["khoahoc"].ToString());

            foreach (CourseModel c in ViewBag.ListCourse)
            {
                if (c.IdCourse.ToString() == idCourse)
                {
                    ViewBag.NameCourse = c.NameSubject + "-" + c.NameGrade;
                    break;
                }
            }

            TeacherInfoUtils teacherInfoUtils = new TeacherInfoUtils();

            List<TeacherInfoModel> list = teacherInfoUtils.getAllTeacherInfo();
            if (idCourse != "0")
            {
                list = teacherInfoUtils.getTeacherInfoFor(Convert.ToInt32(idCourse));
            }
            ViewBag.CountTeacher = list.Count;
            ViewBag.ListInfo = list;
            ViewBag.IdCourse = idCourse;
            return View();
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
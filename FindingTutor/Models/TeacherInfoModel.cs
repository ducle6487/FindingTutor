using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FindingTutor.Models
{
    public class TeacherInfoModel
    {
        public TeacherModel teacherModel = new TeacherModel();
        public List<ProfileModel> listProfile = new List<ProfileModel>();
    }

    public class TeacherInfoUtils
    {
        private DBConnection db;

        public TeacherInfoUtils()
        {
            db = new DBConnection();
        }

        public List<TeacherInfoModel> getAllTeacherInfo()
        {

            TeacherUtils teacherUtils = new TeacherUtils();
            List<TeacherModel> listTeacher = teacherUtils.getAllTeacher();

            List<TeacherInfoModel> list = new List<TeacherInfoModel>();

            foreach (TeacherModel teacherModel in listTeacher)
            {
                ProfileUtils profileUtils = new ProfileUtils();
                List<ProfileModel> listProfile = profileUtils.getProfileOf(teacherModel.IdTeacher);
                TeacherInfoModel t = new TeacherInfoModel();
                t.listProfile = listProfile;
                t.teacherModel = teacherModel;
                list.Add(t);
            }

            return list;
        }

        public List<TeacherInfoModel> getTeacherInfoFor(int IdCourse)
        {
            TeacherUtils teacherUtils = new TeacherUtils();
            List<TeacherModel> listTeacher = teacherUtils.getAllTeacher();

            List<TeacherInfoModel> list = new List<TeacherInfoModel>();

            foreach (TeacherModel teacherModel in listTeacher)
            {
                ProfileUtils profileUtils = new ProfileUtils();
                List<ProfileModel> listProfile = profileUtils.getProfileOf(teacherModel.IdTeacher);
                TeacherInfoModel t = new TeacherInfoModel();
                t.listProfile = listProfile;
                t.teacherModel = teacherModel;
                foreach (ProfileModel item in t.listProfile)
                {
                    if (item.IdCourse == IdCourse)
                    {
                        list.Add(t);
                        break;
                    }
                }
                
            }

            return list;
        }
    }
}
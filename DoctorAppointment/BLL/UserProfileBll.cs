using DoctorAppointment.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DoctorAppointment.BLL
{
    public class UserProfileBll
    {
/****** Getting User Information  ========>  *****/
        public DataTable GetUserInfo(string appointId, string userId)
        {
            DAL.UserProfileDal dal = new DAL.UserProfileDal();
            DataTable userInfoDt = dal.GetUserInfo(appointId,userId);
            return userInfoDt;
        }
 /***** User Profile Update Information ******/
        public bool UserInfoUpdate(UserProfile oUserProfile)
        {
            DAL.UserProfileDal dal = new DAL.UserProfileDal();
            bool userUpdateConfirm = dal.UserInfoUpdate(oUserProfile);
            return userUpdateConfirm;
        }
    }
}
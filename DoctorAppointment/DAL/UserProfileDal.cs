using DoctorAppointment.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DoctorAppointment.DAL
{
    public class UserProfileDal
    {
//Getting User Information From DB Using DataAdapter-------->>>
        public DataTable GetUserInfo(string appointId, string userId)
        {
            DataTable userInfoDt = new DataTable();
            //string appointId = oPatientAppointment.Id.ToString();
            string query;
            if (string.IsNullOrEmpty(appointId))
            {
                query = "SELECT user_id, name, father_name, address, cell_phone, gender, birth_date FROM UserProfile_T WHERE user_id  = '" + userId + "'";
            }
            else if(string.IsNullOrEmpty(userId))
            {
                query = "SELECT user_id, name, father_name, address, cell_phone, gender, birth_date FROM UserProfile_T, Appointment_T WHERE user_id = patient_user_id AND appointment_id = '" + appointId + "'";
            }
            else
            {
                query = null;
            }
                //string query = "SELECT user_id, name, father_name, address, cell_phone, gender, birth_date FROM UserProfile_T, Appointment_T WHERE user_id = patient_user_id AND appointment_id = '" + appointId + "'";
            DatabaseConnection con = new DatabaseConnection();
            try
            {
                SqlDataAdapter userInfoDa = new SqlDataAdapter(query, con.GetSqlConnection());
                userInfoDa.Fill(userInfoDt);
            }
            catch (Exception r)
            {
                userInfoDt = null;
            }
            finally
            {
                con.CloseConnection();
            }
            return userInfoDt;
        }
        /****** Update User Information*******/
        public bool UserInfoUpdate(UserProfile oUserProfile)
        {
            bool isSuccess = false;
            string query = "UPDATE UserProfile_T SET name='" + oUserProfile.Name + "', father_name = '"+oUserProfile.FatherName+"', address='"+oUserProfile.Address+"', cell_phone = '"+oUserProfile.PhoneNo+"', gender='"+oUserProfile.Gender+"',birth_date='"+oUserProfile.BirthDate+"' WHERE user_id = '"+oUserProfile.Id+"'";
            DatabaseConnection con = new DatabaseConnection();
            try
            {
                SqlCommand cmd = new SqlCommand(query, con.GetSqlConnection());
                cmd.ExecuteNonQuery();
                isSuccess = true;
            }
            catch(Exception r)
            {
                isSuccess = false;
            }
            finally
            {
                con.CloseConnection();
            }
            return isSuccess;
        }
        
    }
}
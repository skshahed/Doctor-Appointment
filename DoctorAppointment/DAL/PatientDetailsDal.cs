using DoctorAppointment.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DoctorAppointment.DAL
{
    public class PatientDetailsDal
    {
//Getting User Information From DB Using DataAdapter-------->>>
        public DataTable GetUserInfo(UserProfile oUserProfile)
        {
            DataTable userInfoDt = new DataTable();
            string userId = oUserProfile.Id.ToString();
            string query = "SELECT user_id, name, father_name, address, cell_phone, gender, birth_date FROM UserProfile_T WHERE user_id = '" + userId + "'";
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
    }
}

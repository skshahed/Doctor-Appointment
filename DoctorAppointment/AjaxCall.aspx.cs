using DoctorAppointment.DAO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoctorAppointment
{
    public partial class AjaxCall : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
// Ajax call to get Patient Name by Mobile Number  
        [WebMethod]
        public static UserProfile GetPatientName(string mobileNo)
        {
            UserProfile oUserProfile = new UserProfile();
            //string patientName = "";
            //List<UserProfile> lstUserInfo = new List<UserProfile>();
            //UserProfile oUserProfile;
            DatabaseConnection con = new DatabaseConnection();
            string sql = @"SELECT user_id, name from UserProfile_T WHERE cell_phone='" + mobileNo + "'";
            try
            {
                SqlCommand cmd = new SqlCommand(sql, con.GetSqlConnection());
                //patientName = Convert.ToString(cmd.ExecuteScalar());
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                   // oUserProfile = new UserProfile();
                    oUserProfile.Id = Convert.ToInt32(dr["user_id"]);
                    oUserProfile.Name = Convert.ToString(dr["name"]);
                   // lstUserInfo.Add(oUserProfile);
                }
            }
            catch (Exception r)
            {
                oUserProfile = null;
            }
            finally
            {
                con.CloseConnection();
            }
            return oUserProfile;
        }
// Getting Doctor Category List
        [WebMethod]
        public static List<DoctorCategory> GetDoctorCategory()
        {

            List<DoctorCategory> lstDocCat = new List<DoctorCategory>();
            DoctorCategory oDoctorCategory;
            DatabaseConnection con = new DatabaseConnection();
            string sql = @"SELECT * FROM DoctorCategory_T";
            try
            {
                SqlCommand cmd = new SqlCommand(sql, con.GetSqlConnection());
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    oDoctorCategory = new DoctorCategory();
                    oDoctorCategory.Id = Convert.ToInt32(dr["doctor_cat_id"]);
                    oDoctorCategory.DocCatName = Convert.ToString(dr["doc_cat_name"]);
                    lstDocCat.Add(oDoctorCategory);
                }
            }
            catch (Exception r)
            {
                lstDocCat = null;
            }
            finally
            {
                con.CloseConnection();
            }
            return lstDocCat;
        }
// Getting Doctor Name List according to Doctor category
        [WebMethod]
        public static List<UserProfile> GetDoctorName(string catId)
        {

            List<UserProfile> lstUserData = new List<UserProfile>();
            UserProfile oUserProfile;
            DatabaseConnection con = new DatabaseConnection();
            string sql = @"SELECT user_id, name FROM UserProfile_T, DoctorInfo_T WHERE user_id = doctor_user_id AND doc_cat_id = '" + catId + "'";
            try
            {
                SqlCommand cmd = new SqlCommand(sql, con.GetSqlConnection());
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    oUserProfile = new UserProfile();
                    oUserProfile.Id = Convert.ToInt32(dr["user_id"]);
                    oUserProfile.Name = Convert.ToString(dr["name"]);
                    lstUserData.Add(oUserProfile);
                }
            }
            catch (Exception r)
            {
                lstUserData = null;
            }
            finally
            {
                con.CloseConnection();
            }
            return lstUserData;
        }
// Getting Appointment List in User Deatails according to single User
        [WebMethod]
        public static List<PatientAppointment> GetUserAppointHistory(string userId)
        {

            List<PatientAppointment> lstAppointmentData = new List<PatientAppointment>();
            PatientAppointment oPatientAppointment;
            DatabaseConnection con = new DatabaseConnection();
            string sql = @"SELECT UserProfile_T.name, Appointment_T.* FROM UserProfile_T, Appointment_T WHERE user_id = patient_user_id AND patient_user_id = '" + userId + "' ORDER BY appointment_id DESC";
            try
            {
                SqlCommand cmd = new SqlCommand(sql, con.GetSqlConnection());
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    oPatientAppointment = new PatientAppointment();
                    oPatientAppointment.Id = Convert.ToInt32(dr["appointment_id"]);
                    oPatientAppointment.DoctorName = Convert.ToString(dr["name"]);
                    oPatientAppointment.AppointDate = Convert.ToString(dr["appoint_date"]);
                    oPatientAppointment.ReserveDate = Convert.ToString(dr["reserve_date"]);
                    oPatientAppointment.VisitTime = Convert.ToDecimal(dr["visit_time"]);
                    oPatientAppointment.AppointSuccess = Convert.ToInt32(dr["appoint_success"]);
                    lstAppointmentData.Add(oPatientAppointment);
                }
            }
            catch (Exception r)
            {
                lstAppointmentData = null;
            }
            finally
            {
                con.CloseConnection();
            }
            return lstAppointmentData;
        }

// Getting All Medicine In ASP DropdownList
        [WebMethod]
        public static List<Medicine> GetAllMedicine()
        {

            List<Medicine> lstMedicine = new List<Medicine>();
            Medicine oMedicine;
            DatabaseConnection con = new DatabaseConnection();
            string sql = @"SELECT * FROM Medicine_T ORDER BY medicine_name ASC";
            try
            {
                SqlCommand cmd = new SqlCommand(sql, con.GetSqlConnection());
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    oMedicine = new Medicine();
                    oMedicine.Id = Convert.ToInt32(dr["medicine_id"]);
                    oMedicine.MedicineName = Convert.ToString(dr["medicine_name"]);
                    lstMedicine.Add(oMedicine);
                }
            }
            catch (Exception r)
            {
                lstMedicine = null;
            }
            finally
            {
                con.CloseConnection();
            }
            return lstMedicine;
        }
  // Getting All Test List In ASP DropdownList
        [WebMethod]
        public static List<Test> GetAllTest()
        {

            List<Test> lstTest = new List<Test>();
            Test oTest;
            DatabaseConnection con = new DatabaseConnection();
            string sql = @"SELECT * FROM Test_T ORDER BY test_name ASC ";
            try
            {
                SqlCommand cmd = new SqlCommand(sql, con.GetSqlConnection());
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    oTest = new Test();
                    oTest.Id = Convert.ToInt32(dr["test_id"]);
                    oTest.TestName = Convert.ToString(dr["test_name"]);
                    oTest.TestRequirement = Convert.ToString(dr["test_requirement"]);
                    lstTest.Add(oTest);
                }
            }
            catch (Exception r)
            {
                lstTest = null;
            }
            finally
            {
                con.CloseConnection();
            }
            return lstTest;
        }
 // Get Appointment Serial No 
        [WebMethod]
        public static string GetSerialNo(string appointDate, string doctorId)
        {

            string serial = "";
            DatabaseConnection con = new DatabaseConnection();
            //string appointDate = oPatientAppointment.AppointDate;
            //string doctorId = oPatientAppointment.DoctorUserId.ToString();
            string sql = @"SELECT COUNT(appointment_id) from Appointment_T where doctor_user_id='" + doctorId + "' AND appoint_date ='" + appointDate + "'";
            
            try
            {
                SqlCommand cmd = new SqlCommand(sql, con.GetSqlConnection());
                int count = (Int32)cmd.ExecuteScalar();
                serial = count.ToString();
                string sql2 = @"SELECT patient_per_slot from DoctorInfo_T where doctor_user_id='" + doctorId + "'";
                try { 
                    SqlCommand cmd2 = new SqlCommand(sql2, con.GetSqlConnection());
                    int patientNumber = (Int32)cmd2.ExecuteScalar();
                    if(Convert.ToInt32(serial) >= patientNumber)
                    {
                        serial = "0";
                    }
                    else
                    {
                        if (serial == null)
                        {
                            serial = "Appointment Available. Your Serial No: 01";
                        }
                        else
                        {
                            int temp = Convert.ToInt32(serial) + 1;
                            if (temp.ToString().Length == 1)
                            {
                                serial = "Appointment Available. Your Serial No: 0" + temp;
                            }
                            else
                            {
                                serial = "Appointment Available.Your Serial No: "+temp.ToString();
                            }
                        }
                    }
                }
                catch (Exception r)
                {
                    serial = "Error";
                }
                
            }
            catch (Exception r)
            {
                serial = "Error";
            }
            finally
            {
                con.CloseConnection();
            }
            return serial;
        }
    }
}
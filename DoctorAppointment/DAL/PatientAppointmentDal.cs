using DoctorAppointment.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DoctorAppointment.DAL
{
    public class PatientAppointmentDal
    {

        /****** Save User Information and Appointment*******/
        public bool saveAppointment(UserProfile oUserProfile, PatientAppointment oPatientAppointment)
        {
            bool isSuccess = false;
            string isPatientId = Convert.ToString(oPatientAppointment.PatientUserId);
            string query = "";
            DatabaseConnection con = new DatabaseConnection();
            if (string.IsNullOrEmpty(isPatientId))
            {
                query = "INSERT INTO UserProfile_T(name, cell_phone) VALUES ('" + oUserProfile.Name + "', '" + oUserProfile.PhoneNo + "');SELECT @@IDENTITY";
                try
                {
                    SqlCommand cmd = new SqlCommand(query, con.GetSqlConnection());
                    isPatientId = Convert.ToString(cmd.ExecuteScalar());
                    string query2 = "INSERT INTO Appointment_T(patient_user_id, doctor_user_id, appoint_date, visit_time) VALUES ('" + isPatientId + "', '" + oPatientAppointment.DoctorUserId + "', '" + oPatientAppointment.AppointDate + "', '" + oPatientAppointment.VisitTime + "')";
                    try
                    {
                        SqlCommand cmd2 = new SqlCommand(query2, con.GetSqlConnection());
                        //cmd.ExecuteNonQuery();
                        cmd2.ExecuteNonQuery();
                        isSuccess = true;
                    }
                    catch
                    {
                        isSuccess = false;
                    }
                }
                catch (Exception r)
                {
                    isSuccess = false;
                }
            }
            else
            {
                string query2 = "INSERT INTO Appointment_T(patient_user_id, doctor_user_id, appoint_date, visit_time) VALUES ('" + isPatientId + "', '" + oPatientAppointment.DoctorUserId + "', '" + oPatientAppointment.AppointDate + "', '" + oPatientAppointment.VisitTime + "')";
                try
                {
                    SqlCommand cmd2 = new SqlCommand(query2, con.GetSqlConnection());
                    //cmd.ExecuteNonQuery();
                    cmd2.ExecuteNonQuery();
                    isSuccess = true;
                }
                catch
                {
                    isSuccess = false;
                }
            }

            // string identity =  SCOPE_IDENTITY();
            //string query2 = "INSERT INTO Appointment_T(patient_user_id, doctor_user_id, appoint_date, visit_time) VALUES ('" + oPatientAppointment.PatientUserId + "', '" + oPatientAppointment.DoctorUserId + "', '" + oPatientAppointment.AppointDate + "', '" + oPatientAppointment.VisitTime + "')";

            con.CloseConnection();

            return isSuccess;
        }
        //Getting Doctor Category From DB Using DataAdapter-------->>>
        //public DataTable selectDoctorCategory()
        //{
        //    DataTable DocCatDt = new DataTable();
        //    string query = "SELECT * FROM DoctorCategory_T";
        //    DatabaseConnection con = new DatabaseConnection();
        //    try
        //    {
        //        SqlDataAdapter DocCatDa = new SqlDataAdapter(query, con.GetSqlConnection());
        //        DocCatDa.Fill(DocCatDt);
        //    }
        //    catch(Exception r)
        //    {
        //        DocCatDt = null;
        //    }
        //    finally
        //    {
        //        con.CloseConnection();
        //    }
        //    return DocCatDt;
        //}

        //Getting Doctor Name From DB Using DataAdapter-------->>>
        //public DataTable selectDoctorName(DoctorCategory oDoctorCategory)
        //{
        //    //string docCatId = Ddl
        //    //DoctorCategory oDoctorCategory = new DoctorCategory();
        //    string catId = oDoctorCategory.Id.ToString();
        //    DataTable DocNameDt = new DataTable();
        //    string query = "SELECT user_id, name FROM UserProfile_T, DoctorInfo_T WHERE user_id = doctor_user_id AND doc_cat_id = '"+catId+"'";
        //    DatabaseConnection con = new DatabaseConnection();
        //    try
        //    {
        //        SqlDataAdapter DocNameDa = new SqlDataAdapter(query, con.GetSqlConnection());
        //        DocNameDa.Fill(DocNameDt);
        //    }
        //    catch (Exception r)
        //    {
        //        DocNameDt = null;
        //    }
        //    finally
        //    {
        //        con.CloseConnection();
        //    }
        //    return DocNameDt;
        //}
        //// Get Appointment Serial No 
        //        public string GetSerialNo(PatientAppointment oPatientAppointment)
        //        {
        //            string serial = "";
        //            DatabaseConnection con = new DatabaseConnection();
        //            string appointDate = oPatientAppointment.AppointDate;
        //            string doctorId = oPatientAppointment.DoctorUserId.ToString();
        //            string sql = "SELECT COUNT(appointment_id) from Appointment_T where doctor_user_id='" + doctorId + "' AND appoint_date ='" + appointDate + "'";
        //            try
        //            {
        //                SqlCommand cmd = new SqlCommand(sql, con.GetSqlConnection());
        //                int count = (Int32) cmd.ExecuteScalar();
        //                serial = count.ToString();
        //            }
        //            catch (Exception r)
        //            {
        //                serial = "0";
        //            }
        //            finally
        //            {
        //                con.CloseConnection();
        //            }
        //            return serial;
        //        }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoctorAppointment.DAO
{
    public class GenderConverter
    {
        public string GetGender(int genderDB)
        {
            string gender = "";
            if (genderDB == 1)
                gender = "Male";
            else if (genderDB == 2)
                gender = "Female";
            else if (genderDB == 3)
                gender = "Others";
            else gender = "No Record Found";
            return gender;
                
        }
    }
}
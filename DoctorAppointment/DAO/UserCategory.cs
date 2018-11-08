using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoctorAppointment.DAO
{
    public class UserCategory
    {
        public int Id { get; set; }
        public string CategoryName { get; set; }
        public int  UserLevel { get; set; }
    }
}
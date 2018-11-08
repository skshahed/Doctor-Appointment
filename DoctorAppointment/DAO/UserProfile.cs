using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoctorAppointment.DAO
{
    public class UserProfile
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string FatherName { get; set; }
        public string Address { get; set; }
        public string PhoneNo { get; set; }
        public int Gender { get; set; }
        public string BirthDate { get; set; }
        public int PersonCatId { get; set; }
    }
}
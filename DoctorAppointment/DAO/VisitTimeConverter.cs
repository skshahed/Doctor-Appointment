using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoctorAppointment.DAO
{
    public class VisitTimeConverter
    {
        public TimeSpan? AddTime(string time1, string time2)
        {
            TimeSpan ts1;
            TimeSpan ts2;

            if (TimeSpan.TryParse(time1, out ts1) &&
                TimeSpan.TryParse(time2, out ts2))
            {
                return ts1.Add(ts2);
            }
            //TimeSpan a = new TimeSpan(2, 0, 0);
           // TimeSpan b = new TimeSpan(3, 0, 0);
           // TimeSpan c = a + b;
            return null;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MusicWeb.Models
{
    public class MusicList
    {
        int lid;
        string lname;
        DateTime ltime;
        int lclick;
        string lpic;

        public int Lid
        {
            get
            {
                return lid;
            }

            set
            {
                lid = value;
            }
        }

        public string Lname
        {
            get
            {
                return lname;
            }

            set
            {
                lname = value;
            }
        }

        public DateTime Ltime
        {
            get
            {
                return ltime;
            }

            set
            {
                ltime = value;
            }
        }

        public int Lclick
        {
            get
            {
                return lclick;
            }

            set
            {
                lclick = value;
            }
        }

        public string Lpic
        {
            get
            {
                return lpic;
            }

            set
            {
                lpic = value;
            }
        }
    }
}
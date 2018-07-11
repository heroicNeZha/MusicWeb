using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MusicWeb.Models
{
    public class User
    {
        int uid;
        string uname;
        string upic;

        public int Uid
        {
            get
            {
                return uid;
            }

            set
            {
                uid = value;
            }
        }

        public string Uname
        {
            get
            {
                return uname;
            }

            set
            {
                uname = value;
            }
        }

        public string Upic
        {
            get
            {
                return upic;
            }

            set
            {
                upic = value;
            }
        }

        public override string ToString()
        {
            return Uname;
        }
    }
}
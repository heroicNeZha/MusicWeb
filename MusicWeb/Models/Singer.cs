using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MusicWeb.Models
{
    public class Singer
    {
        int sid;
        string sname;
        string sintroduce;
        string spic;

        public int Sid
        {
            get
            {
                return sid;
            }

            set
            {
                sid = value;
            }
        }

        public string Sname
        {
            get
            {
                return sname;
            }

            set
            {
                sname = value;
            }
        }

        public string Sintroduce
        {
            get
            {
                return sintroduce;
            }

            set
            {
                sintroduce = value;
            }
        }

        public string Spic
        {
            get
            {
                return spic;
            }

            set
            {
                spic = value;
            }
        }
    }
}
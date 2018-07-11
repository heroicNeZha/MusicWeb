using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MusicWeb.Models
{
    public class Music
    {
        int mid;
        string mname;
        Singer msinger;
        string malbum;
        string mresource;
        string mlength;
        int mclick;

        public int Mid
        {
            get
            {
                return mid;
            }

            set
            {
                mid = value;
            }
        }

        public string Mname
        {
            get
            {
                return mname;
            }

            set
            {
                mname = value;
            }
        }

        public Singer Msinger
        {
            get
            {
                return msinger;
            }

            set
            {
                msinger = value;
            }
        }

        public string Malbum
        {
            get
            {
                return malbum;
            }

            set
            {
                malbum = value;
            }
        }

        public string Mresource
        {
            get
            {
                return mresource;
            }

            set
            {
                mresource = value;
            }
        }

        public string Mlength
        {
            get
            {
                return mlength;
            }

            set
            {
                mlength = value;
            }
        }

        public int Mclick
        {
            get
            {
                return mclick;
            }

            set
            {
                mclick = value;
            }
        }
    }
}
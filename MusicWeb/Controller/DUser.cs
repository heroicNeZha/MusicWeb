using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MusicWeb.Models;
using System.Data.SqlClient;
using System.Data;

namespace MusicWeb.Controller
{
    public class DUser
    {
        public static bool Exist(string name)
        {
            string sql = "SELECT COUNT(UID) FROM user_ WHERE Uusername = @name";
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter("@name",name)
            };
            int isExist = Convert.ToInt32(DBHelper.ExecuteScalar(sql, parm));
            DBHelper.SqlClose();
            return isExist > 0;
        }

        public static User UserLogin(string name, string pwd)
        {
            if (Exist(name))
            {
                string sql = "SELECT * FROM user_ WHERE Uusername = @name AND Uadmin = 0";
                SqlParameter[] parm = new SqlParameter[]
                {
                    new SqlParameter("@name",name)
                };
                DataTable dt = DBHelper.GetDataTable(sql, parm);
                DBHelper.SqlClose();
                if (dt.Rows.Count > 0 && dt.Rows[0].ItemArray[5].ToString() == pwd)
                {
                    User user = new User();
                    user.Uid = (int)dt.Rows[0].ItemArray[0];
                    user.Uname = dt.Rows[0].ItemArray[1].ToString();
                    user.Upic = dt.Rows[0].ItemArray[3].ToString();
                    return user;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
        }

        public static User AdminLogin(string name, string pwd)
        {
            if (Exist(name))
            {
                string sql = "SELECT * FROM user_ WHERE Uusername = @name AND Uadmin = 1";
                SqlParameter[] parm = new SqlParameter[]
                {
                    new SqlParameter("@name",name)
                };
                DataTable dt = DBHelper.GetDataTable(sql, parm);
                DBHelper.SqlClose();
                if (dt.Rows.Count>0&&dt.Rows[0].ItemArray[5].ToString() == pwd)
                {
                    User user = new User();
                    user.Uid = (int)dt.Rows[0].ItemArray[0];
                    user.Uname = dt.Rows[0].ItemArray[1].ToString();
                    user.Upic = dt.Rows[0].ItemArray[3].ToString();
                    return user;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
        }
    }

}
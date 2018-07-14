using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MusicWeb.Models;
using System.Data.SqlClient;
using System.Data;

namespace MusicWeb.Controller
{
    public class DSinger
    {
        public static bool InsertSinger(Singer singer)
        {
            string sql = "INSERT INTO [singer] ([Sname], [Sintroduce], [Spic]) VALUES (@Sname, @Sintroduce, @Spic)";
            SqlParameter[] parm = new SqlParameter[]
                {
                    new SqlParameter("@Sname",singer.Sname),
                    new SqlParameter("@Sintroduce",singer.Sintroduce),
                    new SqlParameter("@Spic",singer.Spic),
                };
            int line = DBHelper.ExecuteNonQuery(sql, parm);
            DBHelper.SqlClose();
            return line > 0;
        }

        public static Singer getSingerByID(int sid)
        {
            string sql = "SELECT * FROM singer Where singer.SID = @sid";
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter("@sid",sid)
            };
            DataTable dt = DBHelper.GetDataTable(sql, parm);
            DBHelper.SqlClose();
            foreach (DataRow row in dt.Rows)
            {
                Singer singer = new Singer();
                singer.Sid = (int)row.ItemArray[8];
                singer.Sname = row.ItemArray[9].ToString();
                singer.Sintroduce = row.ItemArray[10].ToString();
                singer.Spic = row.ItemArray[11].ToString();
                return singer;
            }
            return null;
        }

        public static List<Singer> getSingers()
        {
            string sql = "SELECT * FROM singer";
            SqlParameter[] parm = new SqlParameter[]
            {
            };
            DataTable dt = DBHelper.GetDataTable(sql, parm);
            DBHelper.SqlClose();
            List<Singer> singers = new List<Singer>();
            foreach (DataRow row in dt.Rows)
            {
                Singer singer = new Singer();
                singer.Sid = (int)row.ItemArray[0];
                singer.Sname = row.ItemArray[1].ToString();
                singers.Add(singer);
            }
            return singers;
        }
    }
}
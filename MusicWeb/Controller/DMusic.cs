using MusicWeb.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MusicWeb.Controller
{
    public class DMusic
    {
        public static Music getSongByID(int mid)
        {
            string sql = "SELECT * FROM music LEFT JOIN singer ON MUSIC.Msinger=SINGER.SID Where music.MID = @mid";
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter("@mid",mid)
            };
            DataTable dt = DBHelper.GetDataTable(sql, parm);
            DBHelper.SqlClose();
            foreach (DataRow row in dt.Rows)
            {
                Music song = new Music();
                song.Mid = (int)row.ItemArray[0];
                song.Mname = row.ItemArray[1].ToString();
                Singer singer = new Singer();
                singer.Sid = (int)row.ItemArray[8];
                singer.Sname = row.ItemArray[9].ToString();
                singer.Sintroduce = row.ItemArray[10].ToString();
                singer.Spic = row.ItemArray[11].ToString();
                song.Msinger = singer;
                song.Malbum = row.ItemArray[3].ToString();
                song.Mresource = row.ItemArray[4].ToString();
                song.Mlength = row.ItemArray[5].ToString();
                song.Mclick = (int)row.ItemArray[6];
                song.Mpic = row.ItemArray[7].ToString();
                return song;
            }
            return null;
        }

        public static bool InsertSong(Music song)
        {
            string sql = "INSERT INTO [music] ([Mname], [Msinger], [Malbum], [Mresource], [Mclick], [Mpic]) VALUES (@Mname, @Msinger, @Malbum, @Mresource, @Mclick, @Mpic)";
            SqlParameter[] parm = new SqlParameter[]
                {
                    new SqlParameter("@Mname",song.Mname),
                    new SqlParameter("@Msinger",song.Msinger.Sid),
                    new SqlParameter("@Malbum",song.Malbum),
                    new SqlParameter("@Mresource",song.Mresource),
                    new SqlParameter("@Mclick",song.Mclick),
                    new SqlParameter("@Mpic",song.Mpic)
                };
            int line = DBHelper.ExecuteNonQuery(sql, parm);
            DBHelper.SqlClose();
            return line > 0;
        }

        public static List<Music> getSongs()
        {
            string sql = "SELECT * FROM music LEFT JOIN singer ON (MUSIC.Msinger=SINGER.SID)";
            SqlParameter[] parm = new SqlParameter[]
            {
            };
            DataTable dt = DBHelper.GetDataTable(sql, parm);
            DBHelper.SqlClose();
            List<Music> songs = new List<Music>();
            foreach (DataRow row in dt.Rows)
            {
                Music song = new Music();
                song.Mid = (int)row.ItemArray[0];
                song.Mname = row.ItemArray[1].ToString();
                Singer singer = new Singer();
                singer.Sid= (int)row.ItemArray[8];
                singer.Sname= row.ItemArray[9].ToString();
                singer.Sintroduce = row.ItemArray[10].ToString();
                singer.Spic = row.ItemArray[11].ToString();
                song.Msinger = singer;
                song.Malbum = row.ItemArray[3].ToString();
                song.Mresource = row.ItemArray[4].ToString();
                song.Mlength = row.ItemArray[5].ToString();
                song.Mclick = (int)row.ItemArray[6];
                song.Mpic = row.ItemArray[7].ToString();
                songs.Add(song);
            }
            return songs;
        }

        public static List<Music> getSongsByRank()
        {
            string sql = "SELECT * FROM music LEFT JOIN singer ON (MUSIC.Msinger=SINGER.SID) ORDER BY Mclick DESC";
            SqlParameter[] parm = new SqlParameter[]
            {
            };
            DataTable dt = DBHelper.GetDataTable(sql, parm);
            DBHelper.SqlClose();
            List<Music> songs = new List<Music>();
            foreach (DataRow row in dt.Rows)
            {
                Music song = new Music();
                song.Mid = (int)row.ItemArray[0];
                song.Mname = row.ItemArray[1].ToString();
                Singer singer = new Singer();
                singer.Sid = (int)row.ItemArray[8];
                singer.Sname = row.ItemArray[9].ToString();
                singer.Sintroduce = row.ItemArray[10].ToString();
                singer.Spic = row.ItemArray[11].ToString();
                song.Msinger = singer;
                song.Malbum = row.ItemArray[3].ToString();
                song.Mresource = row.ItemArray[4].ToString();
                song.Mlength = row.ItemArray[5].ToString();
                song.Mclick = (int)row.ItemArray[6];
                song.Mpic = row.ItemArray[7].ToString();
                songs.Add(song);
            }
            return songs;
        }

        public static List<Music> getSongsBySinger(int sid)
        {
            string sql = "SELECT * FROM music LEFT JOIN singer ON (MUSIC.Msinger=SINGER.SID) WHERE Msinger = @sid";
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter("@sid",sid)
            };
            DataTable dt = DBHelper.GetDataTable(sql, parm);
            DBHelper.SqlClose();
            List<Music> songs = new List<Music>();
            foreach (DataRow row in dt.Rows)
            {
                Music song = new Music();
                song.Mid = (int)row.ItemArray[0];
                song.Mname = row.ItemArray[1].ToString();
                Singer singer = new Singer();
                singer.Sid = (int)row.ItemArray[8];
                singer.Sname = row.ItemArray[9].ToString();
                singer.Sintroduce = row.ItemArray[10].ToString();
                song.Msinger = singer;
                song.Malbum = row.ItemArray[3].ToString();
                song.Mresource = row.ItemArray[4].ToString();
                song.Mlength = row.ItemArray[5].ToString().Equals("")?"--:--":row.ItemArray[5].ToString();
                song.Mclick = (int)row.ItemArray[6];
                song.Mpic = row.ItemArray[7].ToString();
                songs.Add(song);
            }
            return songs;
        }
    }
}
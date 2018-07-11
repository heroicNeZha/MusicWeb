using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MusicWeb
{
    public class DBHelper
    {
        static string connectioString = "Data Source=(Local);Initial Catalog=musicDB;Integrated Security=True";
        static SqlConnection connection = new SqlConnection(connectioString);

        public static void SqlOpen()
        {
            if (connection.State != ConnectionState.Open)
            {
                connection.Open();
            }
        }

        public static void SqlClose()
        {
            if (connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
        }

        public static int ExecuteNonQuery(string commandText, params SqlParameter[] parm)
        {
            SqlOpen();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connection;
            cmd.CommandText = commandText;
            foreach (SqlParameter sp in parm)
            {
                cmd.Parameters.Add(sp);
            }
            return cmd.ExecuteNonQuery();
        }

        public static string ExecuteScalar(string commandText, params SqlParameter[] parm)
        {
            SqlOpen();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connection;
            cmd.CommandText = commandText;
            foreach (SqlParameter sp in parm)
            {
                cmd.Parameters.Add(sp);
            }
            return cmd.ExecuteScalar().ToString();
        }

        public static DataSet GetDataSet(string commandText, params SqlParameter[] parm)
        {
            SqlOpen();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand();
            da.SelectCommand.Connection = connection;
            da.SelectCommand.CommandText = commandText;
            foreach (SqlParameter sp in parm)
            {
                da.SelectCommand.Parameters.Add(sp);
            }
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public static DataTable GetDataTable(string commandText, params SqlParameter[] parm)
        {
            DataTable dt = new DataTable();
            dt = GetDataSet(commandText, parm).Tables[0];
            return dt;
        }
    }
}
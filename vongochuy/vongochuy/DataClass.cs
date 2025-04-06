using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace WebApplication1
{
	public class DataClass
	{
		public static DataTable tbGioHang = new DataTable();
		public static SqlConnection conn;
		private static void OpenDB()
		{
			string conStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
			conn = new SqlConnection(conStr);
			conn.Open();

		}
        public static SqlDataReader GetRecord(string sql)
		{
			OpenDB();
			SqlDataReader r = null;
			try
			{
				SqlCommand cmd = new SqlCommand(sql, conn);
				{
					cmd.CommandType = CommandType.Text;
				}
				;
				r = cmd.ExecuteReader();
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.Message);
				CloseDB();
			}
			return r;
		}
		private static void CloseDB()
		{
			if (conn.State == ConnectionState.Open)
				conn.Close();
		}

      
    }
}
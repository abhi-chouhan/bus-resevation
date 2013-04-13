//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;

//namespace BusInfo
//{
//    public class Junk
//    {
//        public void PullData(string query, DataTable dt)
//        {
//            string connString =  ConfigurationManager.ConnectionStrings["tccypConnectionString"].ConnectionString;

//            SqlConnection conn = new SqlConnection(connString);
//            SqlCommand cmd = new SqlCommand(query, conn);
//            conn.Open();

//            // create data adapter
//            SqlDataAdapter da = new SqlDataAdapter(cmd);
//            // this will query your database and return the result to your datatable
//            da.Fill(dt);
//            conn.Close();
//            da.Dispose();
//        }
//    }
//}
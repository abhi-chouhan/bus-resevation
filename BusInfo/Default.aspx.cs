using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.Linq;
using System.Data.Objects.SqlClient;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BusInfo
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connString =  ConfigurationManager.ConnectionStrings["tccypConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connString);
            DataContext db = new DataContext(conn);
            Table<BusTimeTable> busTimeTable = db.GetTable<BusTimeTable>();

            GetRecentBus(busTimeTable, "New York", ToNYGV);
            GetRecentBus(busTimeTable, "Allwood", ToAllwoodGV);
        }

        private void GetRecentBus( Table<BusTimeTable> busTimeTable,string toStop, GridView gv)
        {
            var est = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
            var targetTime = TimeZoneInfo.ConvertTime(DateTime.Now, est);
            var resultRecent = (from bi in busTimeTable
                          where bi.ToStop == toStop && SqlFunctions.DateDiff("second", bi.StartTime, targetTime) > 0
                          select new
                                     {
                                         bi.BusNo,
                                         StartTime = GetTimeStr(bi.StartTime.ToString()),
                                         EndTime = GetTimeStr(bi.EndTime.ToString())
                                     }).Take(5);

            gv.DataSource = resultRecent;
            gv.DataBind();
        }

        protected string GetTimeStr(string str)
        {
            DateTime dt = DateTime.Parse(str);
           return dt.ToString("HH:mm");

        }
     
    }
}

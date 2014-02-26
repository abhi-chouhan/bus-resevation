using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Linq;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace BusInfo
{
    public partial class _Default : System.Web.UI.Page
    {
        public class BusDisplayInfo
        {
            public string BusNo {get;set;}
            public string StartTime { get; set; }
            public string EndTime { get; set; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string connString =  ConfigurationManager.ConnectionStrings["tccypConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connString);
            DataContext db = new DataContext(conn);
            Table<BusTimeTable> busTimeTable = db.GetTable<BusTimeTable>();


            var BusNYAllList = GetDetailsBus(busTimeTable, "New York", ToNYAllGV);
            var BusAllwoodAllList = GetDetailsBus(busTimeTable, "Allwood", TOAllwoodAllGV);
            GetRecentBus(BusNYAllList, ToNYGV);
            GetRecentBus(BusAllwoodAllList, ToAllwoodGV);
            GetNextBus(BusNYAllList, toNYlbl);
            GetNextBus(BusAllwoodAllList, toAllwoodlbl);

        }

        private void GetNextBus(List<BusDisplayInfo> busTimeTable, Label lbl)
        {
            var est = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
            var targetTime = TimeZoneInfo.ConvertTime(DateTime.Now, est);
            var result = busTimeTable.FirstOrDefault(t => CompareTime(t.StartTime, targetTime, 0));
            if (result != null)
            {
                lbl.Text = result.StartTime;
            }
            
        }

        private List<BusDisplayInfo> GetDetailsBus(Table<BusTimeTable> busTimeTable, string direction, GridView gv)
        {

            var resultAll = from bi in busTimeTable
                            where bi.ToStop == direction
                            orderby bi.StartTime
                            select new BusDisplayInfo
                            {
                                BusNo = bi.BusNo,
                                StartTime = GetTimeStr(bi.StartTime.ToString()),
                                EndTime = GetTimeStr(bi.EndTime.ToString())
                            };
                            
            
            gv.DataSource = resultAll;
            gv.DataBind();
            return resultAll.ToList();

        }

        private void GetRecentBus(List<BusDisplayInfo> busTimeTable, GridView gv)
        {
            var est = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
            var targetTime = TimeZoneInfo.ConvertTime(DateTime.Now, est);

            var resultList = busTimeTable.Where(t => CompareTime(t.StartTime, targetTime, 5)).Take(5).ToList();

            gv.DataSource = resultList;
            gv.DataBind();
        }

        protected string GetTimeStr(string str)
        {
           DateTime dt = DateTime.Parse(str);
           return dt.ToString("HH:mm");
        }
        protected bool CompareTime(string ts, DateTime time, int diff)
        {
            DateTime dt = DateTime.Parse(ts);

            if (time.TimeOfDay.CompareTo(dt.AddMinutes(diff).TimeOfDay) < 0)
                return true;
            return false;
        }
     
    }
}

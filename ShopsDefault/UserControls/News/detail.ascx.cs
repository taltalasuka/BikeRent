using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopsDefault.UserControls.News
{
    public partial class detail : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ds_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            //string sql = "SELECT *, tbNews.LinkSEO as linkSEO, tbNewsCatalogs.LinkSEO as linkSEOCatalog FROM tbNews, tbNewsCatalogs where tbNewsCatalogs.ID_Catalog = tbNews.ID_Catalog and tbNews.Hidden = 1 order by tbNews.AddTime";
            //e.InputParameters["sSQL"] = sql;
            int id = Convert.ToInt32(Request["idNews"].ToString());
            //
            //string sql = "SELECT * FROM tbShopsProducts, tbShopsCatalogs WHERE tbShopsCatalogs.ID_Catalog = tbShopsProducts.ID_Catalog and ID_Product = " + id;
            string sql = "SELECT * FROM tbNews, tbNewsCatalogs where tbNewsCatalogs.ID_Catalog = tbNews.ID_Catalog and ID_News = " + id;
            e.InputParameters["sSQL"] = sql;
        }

        protected string GetDate(object date)
        {
            string th = Convert.ToDateTime(date).ToString("R").Substring(0, 3).ToUpper();
            string thu = "";
            if (th.Substring(0, 3) == "MON")
            {
                thu = "Monday";
            }
            else if (th.Substring(0, 3) == "TUE")
            {
                thu = "Tuesday";
            }
            else if (th.Substring(0, 3) == "WED")
            {
                thu = "Wednesday";
            }
            else if (th.Substring(0, 3) == "THU")
            {
                thu = "Thursday";
            }
            else if (th.Substring(0, 3) == "FRI")
            {
                thu = "Friday";
            }
            else if (th.Substring(0, 3) == "SAT")
            {
                thu = "Saturday";
            }
            else if (th.Substring(0, 3) == "SUN")
            {
                thu = "Sunday";
            }
            return thu + ", " + Convert.ToDateTime(date).ToString("dd/MM/yyyy") + ", " + Convert.ToDateTime(date).ToString("HH:mm");
        }
    }
}
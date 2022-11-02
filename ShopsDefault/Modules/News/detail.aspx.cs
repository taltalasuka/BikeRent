using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopsDefault.Modules.News
{
    public partial class detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            News_Detail_Load();
            News_related_Load();
        }

        private void News_Detail_Load()
        {
            string linkFile = "/UserControls/News/detail.ascx";
            if (File.Exists(Server.MapPath(linkFile)))
            {
                Control main = LoadControl(linkFile);
                news_detail_w.Controls.Add(main);
            }

        }

        private void News_related_Load()
        {
            string linkFile = "/UserControls/News/related.ascx";
            if (File.Exists(Server.MapPath(linkFile)))
            {
                Control main = LoadControl(linkFile);
                news_related_w.Controls.Add(main);
            }

        }
    }
}
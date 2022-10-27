﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopsDefault.AdminTools.Modules.Products.Catalogs
{
    public partial class main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Pr_Catalogs_Main_Load();
        }

        private void Pr_Catalogs_Main_Load()
        {
            string linkFile = "~/AdminTools/UserControls/Products/Catalogs/main.ascx";
            if (File.Exists(Server.MapPath(linkFile)))
            {
                Control ctl_main = LoadControl(linkFile);
                catalogs_ww.Controls.Add(ctl_main);
            }

        }
    }
}
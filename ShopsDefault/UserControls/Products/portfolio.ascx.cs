using Librari;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopsDefault.UserControls.Products
{
    public partial class portfolio : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ds_Catalogs_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            string sql = "SELECT * FROM tbShopsCatalogs WHERE ID_Catalog <> 1 and Hidden = 1";
            e.InputParameters["sSQL"] = sql;
        }

        protected void ds_Prd_All_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            string sql = "SELECT *, tbShopsCatalogs.LinkSEO as linkSEOCatalog FROM tbShopsProducts, tbShopsCatalogs WHERE tbShopsCatalogs.ID_Catalog = tbShopsProducts.ID_Catalog and tbShopsProducts.Hidden = 1";
            e.InputParameters["sSQL"] = sql;
        }

        public DataTable getPrdSelecting(object idCata)
        {
            string sql = "SELECT *, tbShopsCatalogs.LinkSEO as linkSEOCatalog FROM tbShopsProducts, tbShopsCatalogs WHERE tbShopsCatalogs.ID_Catalog = tbShopsProducts.ID_Catalog and tbShopsProducts.Hidden = 1 and tbShopsProducts.ID_Catalog = " + idCata.ToString();
            return Cls_ShopsProducts.getDataTable_SQL_pro(sql);
        }
    }
}
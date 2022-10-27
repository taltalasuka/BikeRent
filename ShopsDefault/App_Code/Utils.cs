using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

public class Utils
{
    public Utils()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static string getAHrefURL(object module, object LinkSEOCatalog, object linkSEO, object ID)
    {
        string link = "";
        if (LinkSEOCatalog.ToString() != "")
        {
            link = module + "/" + LinkSEOCatalog + "/" + linkSEO + "-" + ID + ".html";
        }
        else
        {
            link = module + "/" + linkSEO + "-" + ID + ".html";

        }
        return link;
    }

    public static string subString(string str, int maxLength)
    {
        return str.Substring(0, Math.Min(str.Length, maxLength));
    }

    public static string getPrice(object price)
    {
        CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");
        string pr = double.Parse(price.ToString()).ToString("#,###", cul.NumberFormat);
        return pr;
    }
}
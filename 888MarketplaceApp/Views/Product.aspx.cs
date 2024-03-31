using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void imgBtnPdt_Click(object sender, ImageClickEventArgs e)
        {
            string imgUrl = sender.GetType().GetProperty("ImageUrl").GetValue(sender).ToString();
            imgPdt.ImageUrl = imgUrl;
        }
    }
}
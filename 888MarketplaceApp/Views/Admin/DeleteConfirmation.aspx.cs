﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views.Admin
{
    public partial class DeleteConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void back(object sender, EventArgs e)
        {
            String path = "/Views/Admin/AdminTable";
            Response.Redirect(path);
        }
    }
}
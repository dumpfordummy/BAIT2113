using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load countries on initial page load
                LoadExpMonth();
                LoadExpYear();
            }
        }

        protected void LoadExpMonth()
        {
            // Option 1: Use a static list (not ideal for a large number of countries)
            ddlExpMonth.Items.Add(new ListItem("01", "01"));
            ddlExpMonth.Items.Add(new ListItem("02", "02"));
            ddlExpMonth.Items.Add(new ListItem("03", "03"));
            ddlExpMonth.Items.Add(new ListItem("04", "04"));
            ddlExpMonth.Items.Add(new ListItem("05", "05"));
            ddlExpMonth.Items.Add(new ListItem("06", "06"));
            ddlExpMonth.Items.Add(new ListItem("07", "07"));
            ddlExpMonth.Items.Add(new ListItem("08", "08"));
            ddlExpMonth.Items.Add(new ListItem("09", "09"));
            ddlExpMonth.Items.Add(new ListItem("10", "10"));
            ddlExpMonth.Items.Add(new ListItem("11", "11"));
            ddlExpMonth.Items.Add(new ListItem("12", "12"));
            // ... add all countries

            // Option 2: Use a web service or external data source (recommended)
            // Your code to retrieve country data and populate the dropdown
        }

        protected void LoadExpYear()
        {
            // Option 1: Use a static list (not ideal for a large number of countries)
            ddlExpYear.Items.Add(new ListItem("2025", "2025"));
            ddlExpYear.Items.Add(new ListItem("2026", "2026"));
            ddlExpYear.Items.Add(new ListItem("2027", "2027"));
            ddlExpYear.Items.Add(new ListItem("2028", "2028"));
            ddlExpYear.Items.Add(new ListItem("2029", "2029"));
            ddlExpYear.Items.Add(new ListItem("2030", "2030"));
            // ... add all countries

            // Option 2: Use a web service or external data source (recommended)
            // Your code to retrieve country data and populate the dropdown
        }
    }
}
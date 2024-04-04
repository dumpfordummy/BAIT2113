using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load countries on initial page load
                LoadCountries();
                LoadState();
            }
        }

        protected void LoadCountries()
        {
            // Option 1: Use a static list (not ideal for a large number of countries)
            ddlCountries.Items.Add(new ListItem("Malaysia", "MY"));
            ddlCountries.Items.Add(new ListItem("Singapore", "SG"));
            // ... add all countries

            // Option 2: Use a web service or external data source (recommended)
            // Your code to retrieve country data and populate the dropdown
        }

        protected void DdlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Handle selection change event (optional)
        }

        protected void LoadState()
        {
            // Option 1: Use a static list (not ideal for a large number of countries)
            ddlState.Items.Add(new ListItem("Kuala Lumpur", "KL"));
            ddlState.Items.Add(new ListItem("Selangor", "SEL"));
            ddlState.Items.Add(new ListItem("Pahang", "PH"));
            ddlState.Items.Add(new ListItem("Perak", "PRK"));
            // ... add all countries

            // Option 2: Use a web service or external data source (recommended)
            // Your code to retrieve country data and populate the dropdown
        }
    }
}
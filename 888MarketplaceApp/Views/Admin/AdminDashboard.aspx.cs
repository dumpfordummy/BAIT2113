using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] colors = { "red", "green", "blue", "yellow" };

            // Register the array declaration
            ClientScript.RegisterArrayDeclaration("colorArray", ConvertStringArrayToString(colors));
        }

        private string ConvertStringArrayToString(string[] arr)
        {
            string result = "";
            for(int i = 0; i < arr.Length; i++)
            {
                result += $"\"{arr[i]}\"";
                if(i != arr.Length - 1)
                {
                    result += ", ";
                }
            }

            return result;
        }
    }
}
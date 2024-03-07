using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace _888_Marketplace
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute(
            "ProductDetails",
            "products/{id}",
            "~/ProductDetails.aspx"
            );
        }
    }
}

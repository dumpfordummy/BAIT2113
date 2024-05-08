using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Helper;
using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebGrease.Css.Extensions;

namespace _888MarketplaceApp.Views
{
    public partial class MyPurchases : System.Web.UI.Page
    {
        private User user;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SessionManager sessionManager = SessionManager.Instance;

                user = sessionManager.GetLoggedInUser(Request.Cookies);
                UserData dataAccess = new UserData();
                user = dataAccess.GetUser(user.Id);
                List<Order> userOrder = user.Orders.ToList();
                OrderRepeater.DataSource = userOrder;
                OrderRepeater.DataBind();
            }
                        
        }

        protected void OrderRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Order order = (Order)e.Item.DataItem;
                Repeater OrderProductRepeater = (Repeater)e.Item.FindControl("OrderProductRepeater");

                var customOrderProductsDataSource = order.Product_Order.Select(po => new
                {
                    po.Product,
                    OrderProductImage = po.Product.GetImagePathList()[0],
                    OrderProductQuantity = "x" + po.Quantity.ToString(),
                    OrderProductAmount = po.Quantity * po.Product.Price
                }).ToList();

                OrderProductRepeater.DataSource = customOrderProductsDataSource;
                OrderProductRepeater.DataBind();
            }
        }

        protected void RefundOrder(object sender, EventArgs e)
        {
            Button cancelBtn = (Button)sender;
            int orderId = Convert.ToInt32(cancelBtn.CommandArgument);

            OrderData dataAccess = new OrderData();
            Order order = dataAccess.GetOrder(orderId);

            order.Status = Order.Refunded;
            order.Note = Order.RefundedNote;
            dataAccess.UpdateOrder(order);
            Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
        }

        protected void OrderReceive(object sender, EventArgs e)
        {
            Button cancelBtn = (Button)sender;
            int orderId = Convert.ToInt32(cancelBtn.CommandArgument);

            OrderData dataAccess = new OrderData(); 
            Order order = dataAccess.GetOrder(orderId);

            order.Status = Order.Completed;
            order.Note = Order.CompletedNote;
            dataAccess.UpdateOrder(order);
            Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
        }

        protected void CancelOrder(object sender, EventArgs e)
        {
            Button cancelBtn = (Button)sender;
            int orderId = Convert.ToInt32(cancelBtn.CommandArgument);

            OrderData dataAccess = new OrderData();
            Order order = dataAccess.GetOrder(orderId);

            order.Status = Order.Canceled;
            order.Note = Order.CanceledNote;
            dataAccess.UpdateOrder(order);
            Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
        }

    }

}
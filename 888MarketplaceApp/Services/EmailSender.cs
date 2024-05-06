using _888MarketplaceApp.Models;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _888MarketplaceApp.Services
{
    public class EmailSender
    {
        public static async Task SendForgotVerificationAsync(User user, string url)
        {
            var options = new RestClientOptions("https://43n43n.api.infobip.com")
            {
                MaxTimeout = -1,
            };
            var client = new RestClient(options);
            var request = new RestRequest("/email/3/send", Method.Post);
            request.AddHeader("Authorization", "App 99594cf6a7c1c8b24d90b27d9070d9d7-404e2916-95d4-4fb3-bd41-66522c3a39c9");
            request.AddHeader("Accept", "application/json");
            request.AlwaysMultipartFormData = true;
            request.AddParameter("from", "888 Marketplace <hoocy-wm21@student.tarc.edu.my>");
            request.AddParameter("subject", "Forgot password");
            request.AddParameter("to", $"{{\"to\":\"{user.Email}\",\"placeholders\":{{\"fullName\":\"{user.FirstName + user.LastName}\"}}}}");
            request.AddParameter("text", "Hi {{fullName}}, your 888 Marketplace account password reset link:" + url + " . It will expire in " + VerificationTokenManager.VerificationExpireMinute + " minutes.");
            RestResponse response = await client.ExecuteAsync(request);
        }
    }
}

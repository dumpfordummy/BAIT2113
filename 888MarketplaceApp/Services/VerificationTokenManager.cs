using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.NetworkInformation;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace _888MarketplaceApp.Services
{
    public class VerificationTokenManager
    {
        public static int VerificationExpireMinute = 10;

        public static string GenerateToken(int length = 32)
        {
            using (var rng = new RNGCryptoServiceProvider())
            {
                byte[] tokenData = new byte[length];
                rng.GetBytes(tokenData);
                return Convert.ToBase64String(tokenData);
            }
        }

        public static bool VerifyToken(string a, string b)
        {
            return string.Equals(a, b, StringComparison.Ordinal);
        }
    }
}
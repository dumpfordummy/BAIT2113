using _888MarketplaceApp.Models;
using _888MarketplaceApp.Views;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace _888MarketplaceApp.DataAccess
{
    public class VoucherRedemptionData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<Voucher_Redemption> _voucherRedemptions;

        public VoucherRedemptionData()
        {
            _db = new MarketplaceDb();
            _voucherRedemptions = _db.Voucher_Redemption;
        }

        public List<Voucher_Redemption> GetVoucherRedemptions()
        {
            return _voucherRedemptions.ToList();
        }

        public Voucher_Redemption GetVoucherRedemption(int id)
        {
            return _voucherRedemptions.Find(id);
        }

        public Voucher_Redemption GetVoucherRedemptionByVoucherUser(int voucherId, int userId)
        {
            return _voucherRedemptions.Where(vd => vd.VoucherId == voucherId && vd.Id == userId).FirstOrDefault();
        } 

        public Voucher_Redemption CreateVoucherRedemption(Voucher_Redemption voucher)
        {
            var result = _voucherRedemptions.Add(voucher);
            _db.SaveChanges();
            return result;
        }
    }
}
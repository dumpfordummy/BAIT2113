using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace _888MarketplaceApp.DataAccess
{
    public class VoucherData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<Voucher> _vouchers;
        public VoucherData()
        {
            _db = new MarketplaceDb();
            _vouchers = _db.Vouchers;
        }

        public List<Voucher> GetVouchers()
        {
            var result = _vouchers.ToList();
            return result;
        }

        public Voucher GetVoucher(int id)
        {
            var result = _vouchers.Find(id);
            return result;
        }

        public Voucher GetVoucherByCode(string code)
        {
            var result = _vouchers.FirstOrDefault(c => c.Code == code);
            return result;
        }

        public Voucher CreateVoucher(Voucher voucher)
        {
            var result = _vouchers.Add(voucher);
            _db.SaveChanges();
            return result;
        }

        public void UpdateVoucher(Voucher voucher)
        {
            var target = _vouchers.Find(voucher.Id);

            if (target != null)
            {
                target.Code = voucher.Code;
                target.Amount = voucher.Amount;
                _db.SaveChanges();
            }
        }
    }
}
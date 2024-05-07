using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace _888MarketplaceApp.DataAccess
{
    public class VoucherData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<Voucher> _vouchers;
        public bool hasExistingData;

        public VoucherData()
        {
            _db = new MarketplaceDb();
            hasExistingData = _db.Vouchers.Any();
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
            try
            {
                _db.SaveChanges();
            }
            catch (DbEntityValidationException ex)
            {
                foreach (var entityValidationErrors in ex.EntityValidationErrors)
                {
                    foreach (var validationError in entityValidationErrors.ValidationErrors)
                    {
                        Debug.WriteLine("Property: " + validationError.PropertyName + " Error: " + validationError.ErrorMessage);
                        throw ex;
                    }
                }
            }
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
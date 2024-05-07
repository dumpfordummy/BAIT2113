using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _888MarketplaceApp.DataAccess
{
    public class UserData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<User> _users;

        public UserData()
        {
            _db = new MarketplaceDb();
            _users = _db.Users;
        }

        public List<User> GetUsers()
        {
            var result = _users.ToList();
            return result;
        }

        /// <summary>
        /// Get user by user id
        /// </summary>
        /// <param name="id"></param>
        /// <returns>return User object if found, otherwise return null</returns>
        public User GetUser(int id)
        {
            var result = _users.Find(id);
            return result;
        }

        public User GetUserByUsername(string username)
        {
            return _users.FirstOrDefault(u => u.Username == username);
        }

        public User GetUserByEmail(string email)
        {
            return _users.FirstOrDefault(u => u.Email == email);
        }

        public bool IsUsernameExist(string username)
        {
            return _users.Any(u => u.Username == username);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="user"></param>
        /// <returns>return User object if created successfully, otherwise null </returns>
        public User CreateUser(User user)
        {
            var duplicate = GetUserByUsername(user.Username);
            if (duplicate != null)
            {
                return null;
            }

            //User last = _users.OrderByDescending(u => u.Id).FirstOrDefault();
            //if (last != null)
            //{
            //    user.Id = last.Id + 1;
            //} else
            //{
            //    user.Id = 1;
            //}

            var result = _users.Add(user);
            try
            {
                _db.SaveChanges();
            } catch (DbEntityValidationException ex)
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

        public void UpdateUser(User user)
        {
            var target = _users.Find(user.Id);

            if (target != null)
            {
                target.Username = user.Username;
                target.Email = user.Email;
                target.PasswordHash = user.PasswordHash;
                target.FirstName = user.FirstName;
                target.LastName = user.LastName;
                target.Phone = user.Phone;
                target.Address = user.Address;
                if(user.VerificationToken != null)
                {
                    target.VerificationToken = user.VerificationToken;
                    target.VerificationExpire = user.VerificationExpire;
                }
                _db.SaveChanges();
            } else
            {
                
                throw new Exception("Invalid User");
            }
        }
    }
}

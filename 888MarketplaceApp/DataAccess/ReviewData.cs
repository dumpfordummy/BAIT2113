using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace _888MarketplaceApp.DataAccess
{
    public class ReviewData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<Review> _reviews;
        public bool hasExistingData;

        public ReviewData()
        {
            _db = new MarketplaceDb();
            hasExistingData = _db.Reviews.Any();
            _reviews = _db.Reviews;
        }

        public List<Review> GetReviews()
        {
            var result = _reviews.ToList();
            return result;
        }

        public Review GetReview(int id)
        {
            var result = _reviews.Find(id);
            return result;
        }

        public Review CreateReview(Review review)
        {
            var result = _reviews.Add(review);
            _db.SaveChanges();
            return result;
        }

        public void UpdateReview(Review review)
        {
            var target = _reviews.Find(review.Id);

            if (target != null)
            {
                target.Rating = review.Rating;
                target.Content = review.Content;
                _db.SaveChanges();
            }
        }

        public Review DeleteReview(Review review)
        {
            var result = _reviews.Remove(review);
            _db.SaveChanges();
            return result;
        }
    }
}
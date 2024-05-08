//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace _888MarketplaceApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            this.Product_Order = new HashSet<Product_Order>();
            this.Cart_Product = new HashSet<Cart_Product>();
            this.Wishlist_Product = new HashSet<Wishlist_Product>();
        }
    
        public int Id { get; set; }
        public System.DateTime DateCreated { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; }
        public int SellerId { get; set; }
        public int CategoryId { get; set; }
        public string ImagePaths { get; set; }
    
        public virtual User User { get; set; }
        public virtual Category Category { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Product_Order> Product_Order { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cart_Product> Cart_Product { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Wishlist_Product> Wishlist_Product { get; set; }

        public List<string> GetImagePathList()
        {
            List<string> imagePaths = new List<string>();

            if (!string.IsNullOrEmpty(ImagePaths))
            {
                string[] paths = ImagePaths.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);

                foreach (string path in paths)
                {
                    string trimmedPath = path.Trim();

                    imagePaths.Add(trimmedPath);
                }
            }

            return imagePaths;
        }

    }
}

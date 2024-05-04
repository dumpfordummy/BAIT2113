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
    
    public partial class Delivery
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Delivery()
        {
            this.Orders = new HashSet<Order>();
        }
    
        public int Id { get; set; }
        public string Address { get; set; }
        public byte Status { get; set; }
        public System.DateTime Date { get; set; }
        public byte ShippingMethodId { get; set; }
        public System.DateTime EstimatedDeliveryDate { get; set; }
    
        public virtual ShippingMethod ShippingMethod { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Orders { get; set; }
    }
}

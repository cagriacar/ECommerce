using System;
using System.Collections.Generic;

namespace ETicaret.WebUI.Models
{
    public partial class Product
    {
        public Product()
        {
            this.Photos = new List<Photo>();
            this.ProductFeatures = new List<ProductFeature>();
            this.SaleDetails = new List<SaleDetail>();
        }

        public int Id { get; set; }
        public string Adi { get; set; }
        public string Aciklama { get; set; }
        public decimal AlisFiyati { get; set; }
        public decimal SatisFiyati { get; set; }
        public System.DateTime EklenmeTarihi { get; set; }
        public Nullable<System.DateTime> SonKullanmaTarihi { get; set; }
        public int CategoryId { get; set; }
        public int MarkId { get; set; }
        public virtual Category Category { get; set; }
        public virtual Mark Mark { get; set; }
        public virtual ICollection<Photo> Photos { get; set; }
        public virtual ICollection<ProductFeature> ProductFeatures { get; set; }
        public virtual ICollection<SaleDetail> SaleDetails { get; set; }
    }
}

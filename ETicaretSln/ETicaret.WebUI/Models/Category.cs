using System;
using System.Collections.Generic;

namespace ETicaret.WebUI.Models
{
    public partial class Category
    {
        public Category()
        {
            this.FeatureTypes = new List<FeatureType>();
            this.Products = new List<Product>();
        }

        public int Id { get; set; }
        public string Adi { get; set; }
        public string Aciklama { get; set; }
        public Nullable<int> PhotoId { get; set; }
        public virtual Photo Photo { get; set; }
        public virtual ICollection<FeatureType> FeatureTypes { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}

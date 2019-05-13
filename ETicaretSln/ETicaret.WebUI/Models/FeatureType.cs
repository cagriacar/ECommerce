using System;
using System.Collections.Generic;

namespace ETicaret.WebUI.Models
{
    public partial class FeatureType
    {
        public FeatureType()
        {
            this.FeatureValues = new List<FeatureValue>();
            this.ProductFeatures = new List<ProductFeature>();
        }

        public int Id { get; set; }
        public string Adi { get; set; }
        public string Aciklama { get; set; }
        public int CategoryId { get; set; }
        public virtual Category Category { get; set; }
        public virtual ICollection<FeatureValue> FeatureValues { get; set; }
        public virtual ICollection<ProductFeature> ProductFeatures { get; set; }
    }
}

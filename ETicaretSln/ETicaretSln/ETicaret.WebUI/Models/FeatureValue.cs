using System;
using System.Collections.Generic;

namespace ETicaret.WebUI.Models
{
    public partial class FeatureValue
    {
        public FeatureValue()
        {
            this.ProductFeatures = new List<ProductFeature>();
        }

        public int Id { get; set; }
        public string Adi { get; set; }
        public string Aciklama { get; set; }
        public int FeatureTypeId { get; set; }
        public virtual FeatureType FeatureType { get; set; }
        public virtual ICollection<ProductFeature> ProductFeatures { get; set; }
    }
}

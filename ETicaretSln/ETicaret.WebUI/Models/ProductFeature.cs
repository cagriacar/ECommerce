using System;
using System.Collections.Generic;

namespace ETicaret.WebUI.Models
{
    public partial class ProductFeature
    {
        public int ProductId { get; set; }
        public int FeatureTypeId { get; set; }
        public int FeatureValueId { get; set; }
        public virtual FeatureType FeatureType { get; set; }
        public virtual FeatureValue FeatureValue { get; set; }
        public virtual Product Product { get; set; }
    }
}

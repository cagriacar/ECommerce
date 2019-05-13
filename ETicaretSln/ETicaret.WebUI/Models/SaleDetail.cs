using System;
using System.Collections.Generic;

namespace ETicaret.WebUI.Models
{
    public partial class SaleDetail
    {
        public int SaleId { get; set; }
        public int ProductId { get; set; }
        public double Adet { get; set; }
        public decimal Fiyat { get; set; }
        public Nullable<double> Indirim { get; set; }
        public virtual Product Product { get; set; }
        public virtual Sale Sale { get; set; }
    }
}

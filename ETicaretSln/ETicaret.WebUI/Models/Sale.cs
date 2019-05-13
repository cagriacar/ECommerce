using System;
using System.Collections.Generic;

namespace ETicaret.WebUI.Models
{
    public partial class Sale
    {
        public Sale()
        {
            this.SaleDetails = new List<SaleDetail>();
        }

        public int Id { get; set; }
        public System.Guid CustomerId { get; set; }
        public System.DateTime SatisTarihi { get; set; }
        public decimal ToplamTutar { get; set; }
        public bool SepetteMi { get; set; }
        public Nullable<int> ShipmentId { get; set; }
        public Nullable<int> OrderStateId { get; set; }
        public string KargoTakipNo { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual OrderState OrderState { get; set; }
        public virtual ICollection<SaleDetail> SaleDetails { get; set; }
        public virtual Shipment Shipment { get; set; }
    }
}

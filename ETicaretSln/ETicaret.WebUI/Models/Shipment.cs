using System;
using System.Collections.Generic;

namespace ETicaret.WebUI.Models
{
    public partial class Shipment
    {
        public Shipment()
        {
            this.Sales = new List<Sale>();
        }

        public int Id { get; set; }
        public string SirketAdi { get; set; }
        public string Adres { get; set; }
        public string Telefon { get; set; }
        public string WebSite { get; set; }
        public string EMail { get; set; }
        public virtual ICollection<Sale> Sales { get; set; }
    }
}

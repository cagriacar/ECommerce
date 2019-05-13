using System;
using System.Collections.Generic;

namespace ETicaret.WebUI.Models
{
    public partial class Customer
    {
        public Customer()
        {
            this.Addresses = new List<Address>();
            this.Sales = new List<Sale>();
        }

        public System.Guid Id { get; set; }
        public string Adi { get; set; }
        public string Soyadi { get; set; }
        public string KullaniciAdi { get; set; }
        public string EMail { get; set; }
        public string Telefon { get; set; }
        public virtual ICollection<Address> Addresses { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<Sale> Sales { get; set; }
    }
}

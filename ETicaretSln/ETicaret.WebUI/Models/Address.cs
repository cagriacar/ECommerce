using System;
using System.Collections.Generic;

namespace ETicaret.WebUI.Models
{
    public partial class Address
    {
        public int Id { get; set; }
        public System.Guid CustomerId { get; set; }
        public string Adres { get; set; }
        public string Adi { get; set; }
        public virtual Customer Customer { get; set; }
    }
}

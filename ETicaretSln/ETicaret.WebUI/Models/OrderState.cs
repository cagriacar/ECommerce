using System;
using System.Collections.Generic;

namespace ETicaret.WebUI.Models
{
    public partial class OrderState
    {
        public OrderState()
        {
            this.Sales = new List<Sale>();
        }

        public int Id { get; set; }
        public string Adi { get; set; }
        public string Aciklama { get; set; }
        public virtual ICollection<Sale> Sales { get; set; }
    }
}
